{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  imports = [
    inputs.lanzaboote.nixosModules.lanzaboote
    inputs.hyprland.nixosModules.default
  ];
  # users
  users.users.devin = {
    isNormalUser = true;
    description = "devin";
    extraGroups = ["networkmanager" "wheel" "audio" "video" "input" "libvirtd" "docker" "scanner" "lp" "seat"];
    packages = [];
    shell = pkgs.zsh;
    uid = 1000;
  };

  # i18n
  time.timeZone = "America/Edmonton";
  i18n.defaultLocale = "en_CA.UTF-8";

  # system packages
  nixpkgs.config.allowUnfree = true;
  environment = {
    systemPackages = with pkgs; [
      ffmpeg
      pavucontrol
      adwaita-icon-theme
      apple-cursor
      htop
      sbctl
      killall
      networkmanagerapplet
      cups-filters
      libimobiledevice
      ifuse
      gcc
      gnumake
      smartmontools
      nautilus-python
      gst_all_1.gstreamer
      gst_all_1.gst-plugins-base
      gst_all_1.gst-plugins-good
      gst_all_1.gst-plugins-bad
      gst_all_1.gst-plugins-ugly
      gst_all_1.gst-libav
      gst_all_1.gst-vaapi
      waybar
    ];
    gnome.excludePackages = with pkgs; [
      gnome-console
    ];
  };

  # moved xdg thing and make sure to use hyprland portal
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config = {
      common.default = ["gtk"];
      hyprland.default = ["hyprland" "gtk"];
    };
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };

  programs = {
    # portal polkit and system things
    hyprland = {
      enable = false;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
    };
    seahorse.enable = false;
    zsh.enable = true;
    dconf.enable = true;
    nix-ld.enable = true;
    virt-manager.enable = true;
    gnupg.agent.enable = true;
  };

  # services
  services = {
    devmon.enable = true;
    pulseaudio.enable = false;
    desktopManager.plasma6.enable = true;
    displayManager.sddm.enable = true;
    seatd.enable = true;
    gvfs.enable = true;
    dbus.enable = true;
    flatpak.enable = true;
    ratbagd.enable = true;
    blueman.enable = false;
    usbmuxd.enable = true;
    fwupd.enable = true;
    fstrim.enable = true;
    gnome.gnome-keyring.enable = true;
    gnome.gnome-online-accounts.enable = true;
    greetd = {
      enable = false;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
          user = "greeter";
        };
      };
    };
    printing = {
      enable = true;
      logLevel = "debug";
      drivers = [
        pkgs.cups-kyodialog
        pkgs.foomatic-db-ppds-withNonfreeDb
        # pkgs.cnijfilter2
        pkgs.gutenprint
      ];
    };
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    xserver = {
      enable = true;
      xkb.layout = "";
      xkb.variant = "";
      excludePackages = [
        pkgs.xterm
      ];
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;
    };
  };

  #fonts
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      font-awesome
      source-han-sans
      source-han-sans-japanese
      source-han-serif-japanese
      monaspace
      corefonts
      nerd-fonts.monaspace
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = ["Monaspace Radon"];
        serif = ["Noto Serif" "Source Han Serif"];
        sansSerif = ["Noto Sans" "Source Han Sans"];
      };
    };
  };

  # nix settings
  nix = {
    package = pkgs.lix;
    settings = {
      experimental-features = ["nix-command" "flakes"];
      trusted-users = ["@wheel"];
      accept-flake-config = true;
      auto-optimise-store = true;
      builders-use-substitutes = true;
      use-xdg-base-directories = true;
      substituters = [
        "https://cache.nixos.org?priority=10"
        "https://nix-community.cachix.org"
        "https://nix-gaming.cachix.org"
        "https://hyprland.cachix.org"
        "https://anyrun.cachix.org"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
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

  # env
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    XCURSOR_SIZE = "24";
    SSH_AUTH_SOCK = "/run/user/1000/keyring/ssh";
    XCURSORPATH = "$XDG_DATA_HOME/icons";
    XCOMPOSECACHE = "$XDG_CACHE_HOME/X11/xcompose";
    ZDOTDIR = "$HOME/.config/zsh";
    CUDA_CACHE_PATH = "$XDG_CACHE_HOME/nv";
    HISTFILE = "$XDG_STATE_HOME/bash/history";
  };

  # hardware
  hardware = {
    opentabletdriver = {
      enable = true;
      daemon.enable = true;
    };
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        vaapiVdpau
        libvdpau-va-gl
        vulkan-validation-layers
      ];
    };
    sane = {
      enable = true;
      extraBackends = [pkgs.sane-airscan];
      disabledDefaultBackends = ["escl"];
    };
  };

  # security configs
  security = {
    rtkit.enable = true;
    polkit.enable = true;
    protectKernelImage = true;
    pam = {
      services.swaylock = {};
      services.swaylock.text = ''
        auth include login
      '';
      services.gnome-keyring = {
        gnupg.enable = true;
        sshAgentAuth = true;
        enableGnomeKeyring = true;
      };
    };
  };

  # boot settings
  boot = {
    bootspec.enable = true;
    plymouth.enable = true;
    lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
    };
    kernelPackages = pkgs.linuxPackages_6_12;
    kernelModules = ["kvm-intel" "vfio-pci" "tcp_bbr"];
    kernelParams = ["intel_iommu=on"];
    extraModulePackages = with config.boot.kernelPackages; [];
    extraModprobeConfig = ''options iwlwifi 11n_disable=8'';
    supportedFilesystems = ["ntfs" "btrfs"];
    loader = {
      systemd-boot.enable = lib.mkForce false;
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
      "hfs"
      "hfsplus"
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
