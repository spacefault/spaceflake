{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  imports = [
    inputs.lanzaboote.nixosModules.lanzaboote
  ];
  # users
  users.users.devin = {
    isNormalUser = true;
    description = "devin";
    extraGroups = [
      "networkmanager"
      "wheel"
      "avahi"
    ];
    packages = [];
    shell = pkgs.zsh;
    uid = 1000;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGYi32HBmx8HqGyoFp+xRZTy0OuEiNwLXLuAKINrFwRU devin@pop2"
    ];
  };

  users.users.timeMachine = {
    isNormalUser = true;
    description = "devin";
    extraGroups = [
      "networkmanager"
      "wheel"
      "avahi"
    ];
    packages = [];
    shell = pkgs.zsh;
    uid = 1001;
  };

  # i18n
  time.timeZone = "America/Edmonton";
  i18n.defaultLocale = "en_CA.UTF-8";

  # system packages
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    htop
    sbctl
    killall
    cups-filters
    libimobiledevice
    ifuse
    samba
  ];

  # moved xdg thing and make sure to use hyprland portal
  programs = {
    zsh.enable = true;
  };

  system.autoUpgrade = {
    enable = true;
    flake = "github:spacefault/spaceflake#homelab";
    dates = "minutely";
    flags = [
      "--option"
      "tarball-ttl"
      "0"
    ];
  };

  # services
  services = {
    openssh = {
      enable = true;
      settings.PasswordAuthentication = false;
      settings.KbdInteractiveAuthentication = false;
      settings.PermitRootLogin = "no";
    };
    devmon.enable = true;
    libinput.enable = true;
    dbus.enable = true;
    fwupd.enable = true;
    fstrim.enable = true;
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
      publish = {
        enable = true;
        addresses = true;
        domain = true;
        hinfo = true;
        userServices = true;
        workstation = true;
      };
    extraServiceFiles = {
      smb = ''
<?xml version="1.0" standalone='no'?><!--*-nxml-*-->
<!DOCTYPE service-group SYSTEM "avahi-service.dtd">
<service-group>
  <name replace-wildcards="yes">%h</name>
  <service>
    <type>_smb._tcp</type>
    <port>445</port>
  </service>
  <service>
    <type>_device-info._tcp</type>
    <port>9</port>
    <txt-record>model=Xserve1,1</txt-record>
  </service>
  <service>
    <type>_adisk._tcp</type>
    <port>9</port>
    <txt-record>dk0=adVN=Time Machine Backups,adVF=0x82</txt-record>
    <txt-record>sys=adVF=0x100</txt-record>
  </service>
</service-group>
    ''; 
  };
};
    samba = {
      openFirewall = true;
      package = pkgs.samba4Full;
      settings = {
        "Time Machine Backups" = {
          "path" = "/mnt/encdata/timeMachine";
          "valid users" = "devin";
          "public" = "no";
          "writeable" = "yes";
          "force user" = "devin";
          "fruit:aapl" = "yes";
          "fruit:time machine" = "yes";
          "vfs objects" = "catia fruit streams_xattr";
        };
      };
    };
    xserver = {
      enable = false;
      xkb.layout = "";
      xkb.variant = "";
      excludePackages = [
        pkgs.xterm
      ];
    };
  };

  # nix settings
  nix = {
    package = pkgs.lix;
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
        "repl-flake"
      ];
      trusted-users = ["@wheel"];
      accept-flake-config = true;
      auto-optimise-store = true;
      builders-use-substitutes = true;
      # use-xdg-base-directories = true;
      substituters = [
        "https://cache.nixos.org?priority=10"

        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="

        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  # virtualization settings
  virtualisation = {
    docker.enable = false;
    libvirtd.enable = true;
  };

  # security configs
  security = {
    rtkit.enable = true;
    polkit.enable = true;
    protectKernelImage = true;
    pam = {
    };
  };

  # boot settings
  boot = {
    initrd.systemd.enable = true;
    bootspec.enable = true;
    plymouth.enable = false;
    lanzaboote = {
      enable = false;
      pkiBundle = "/var/lib/sbctl";
    };
    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = [
    ];
    kernelParams = ["intel_iommu=on"];
    extraModprobeConfig = ''options iwlwifi 11n_disable=8'';
    supportedFilesystems = [
      "ntfs"
      "btrfs"
    ];
    loader = {
      systemd-boot.enable = lib.mkForce true;
      systemd-boot.editor = false;
      efi.canTouchEfiVariables = true;
    };
    tmp = {
      useTmpfs = lib.mkDefault true;
      cleanOnBoot = lib.mkDefault (!config.boot.tmp.useTmpfs);
    };
    kernel.sysctl = {
      "kernel.sysrq" = 0;
      "net.ipv4.icmp_ignore_bogus_error_responses" = 1;
      "net.ipv4.conf.default.rp_filter" = 1;
      "net.ipv4.conf.all.rp_filter" = 1;
      "net.ipv4.conf.all.accept_source_route" = 0;
      "net.ipv6.conf.all.accept_source_route" = 0;
      "net.ipv4.conf.all.send_redirects" = 0;
      "net.ipv4.conf.default.send_redirects" = 0;
      "net.ipv4.conf.all.accept_redirects" = 0;
      "net.ipv4.conf.default.accept_redirects" = 0;
      "net.ipv4.conf.all.secure_redirects" = 0;
      "net.ipv4.conf.default.secure_redirects" = 0;
      "net.ipv6.conf.all.accept_redirects" = 0;
      "net.ipv6.conf.default.accept_redirects" = 0;
      "net.ipv4.tcp_syncookies" = 1;
      "net.ipv4.tcp_rfc1337" = 1;
      "net.ipv4.tcp_fastopen" = 3;
      "net.ipv4.tcp_congestion_control" = "bbr";
      "net.core.default_qdisc" = "cake";
      "kernel.kptr_restrict" = 1;
      "kernel.printk" = "3 3 3 3";
      "dev.tty.ldisc_autoload" = 0;
      "net.ipv4.conf.all.log_martians" = true;
      "net.ipv4.conf.default.log_martians" = true;
      "net.ipv4.icmp_echo_ignore_all" = "1";
      "kernel.yama.ptrace_scope" = 2;
      "net.core.bpf_jit_enable" = false;
      "kernel.ftrace_enabled" = false;
    };
    blacklistedKernelModules = [
      "wacom"
      "ax25"
      "netrom"
      "rose"
      "adfs"
      "affs"
      "bfs"
      "befs"
      "cramfs"
      "efs"
      "erofs"
      "exofs"
      "freevxfs"
      "f2fs"
      "vivid"
      "gfs2"
      "ksmbd"
      "nfsv4"
      "nfsv3"
      "cifs"
      "nfs"
      "cramfs"
      "freevxfs"
      "jffs2"
      "squashfs"
      "udf"
      "hpfs"
      "jfs"
      "minix"
      "nilfs2"
      "omfs"
      "qnx4"
      "qnx6"
      "sysv"
    ];
  };
}
