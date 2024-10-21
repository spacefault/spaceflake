{pkgs, lib, inputs, config, ...}: {
  # users
  users.users.lily = {
    isNormalUser = true;
    description = "lily";
    extraGroups = ["networkmanager" "wheel" "audio" "video" "input" "libvirtd" "docker" "scanner" "lp"];
    packages = [];
    shell = pkgs.zsh;
  };

  # i18n
  time.timeZone = "America/Edmonton";
  i18n.defaultLocale = "en_CA.UTF-8";

  # system packages
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    ffmpeg
    adwaita-icon-theme
    htop
    sbctl
    killall
    networkmanagerapplet
    cups-filters
    libimobiledevice
    ifuse
    gcc
    libsForQt5.ksshaskpass
    pinentry
    gh
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
  ];

  environment.gnome.excludePackages = (with pkgs; [
    gnome-console
  ]);

  programs = {
    seahorse = {
      enable = false;
    };
    zsh = {
      enable = true;
    };
    dconf = {
      enable = true;
    };
    nix-ld = {
      enable = true;
    };
    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3";
    };
    #ssh = {
    #  startAgent = true;
    #  askPassword = pkgs.lib.mkForce "${pkgs.ksshaskpass.out}/bin/ksshaskpass";
    #};
    gnupg = {
      agent = {
        enable = true;
        #enableSSHSupport = true;
        #enableExtraSocket = true;
        #pinentryPackage = lib.mkForce pkgs.pinentry-gnome;
      };
    };
  };

  # services
  services = {
    devmon.enable = true;
    gvfs.enable = true;
    dbus.enable = true;
    flatpak.enable = true;
    ratbagd.enable = true;
    usbmuxd.enable = true;
    fwupd.enable = true;
    fstrim.enable = true;
    gnome.gnome-keyring.enable = true;
    gnome.gnome-online-accounts.enable = true;
    printing = {
      enable = true;
      logLevel = "debug";
      drivers = [
        #pkgs.cups-kyodialog
        #pkgs.foomatic-db-ppds-withNonfreeDb
        pkgs.cnijfilter2
        #pkgs.gutenprint
      ];
    };
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    xserver = {
      enable = true;
      excludePackages = [
        pkgs.xterm
      ];
      displayManager = {
        gdm = {
          enable = true;
        };
      };
      desktopManager = {
        gnome = {
          enable = true;
        };
      };
      xkb.layout = "";
      xkb.variant = "";
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

  # fonts
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      font-awesome
      source-han-sans
      source-han-sans-japanese
      source-han-serif-japanese
      corefonts
      (nerdfonts.override {fonts = ["Meslo"];})
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = ["Meslo LG M Regular Nerd Font Complete Mono"];
        serif = ["Noto Serif" "Source Han Serif"];
        sansSerif = ["Noto Sans" "Source Han Sans"];
      };
    };
  };

  # nix settings
  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
      builders-use-substitutes = true;
      substituters = [
        "https://cache.nixos.org?priority=10"
        "https://nix-community.cachix.org"
        "https://nix-gaming.cachix.org"
        "https://hyprland.cachix.org"
        "https://anyrun.cachix.org"
      ];
      trusted-public-keys = [
        "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
      ];
    };
    gc = {
      automatic = false;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  # virtualization settings
  virtualisation = {
    docker = {
      enable = false;
    };
    libvirtd = {
      enable = true;
    };
  };

  # env
  environment = {
    sessionVariables.NIXOS_OZONE_WL = "1";
    sessionVariables.QT_QPA_PLATFORMTHEME = "qt5ct";
  };

  # hardware
  hardware = {
    pulseaudio.enable = false;
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
      extraBackends = [ pkgs.sane-airscan ];
      disabledDefaultBackends = [ "escl" ];
    };
  };

  # security configs
  security = {
    rtkit.enable = true;
    polkit.enable = true;
    protectKernelImage = true;
    pam = {
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
    lanzaboote = {
      enable = false;
      pkiBundle = "/etc/secureboot";
    };
    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = ["kvm-intel" "v4l2loopback" "vfio-pci" "tcp_bbr" ];
    kernelParams = ["intel_iommu=on"];
    extraModulePackages = with config.boot.kernelPackages; [v4l2loopback];
    extraModprobeConfig = ''
      options iwlwifi 11n_disable=8
    '';
    supportedFilesystems = ["ntfs" "btrfs"];
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
      "ax25" "netrom" "rose" "adfs" "affs" "bfs" "befs" "cramfs" "efs"
      "erofs" "exofs" "freevxfs" "f2fs" "vivid" "gfs2" "ksmbd" "nfsv4"
      "nfsv3" "cifs" "nfs" "cramfs" "freevxfs" "jffs2" "hfs" "hfsplus"
      "squashfs" "udf" "hpfs" "jfs" "minix" "nilfs2" "omfs" "qnx4" 
      "qnx6" "sysv"
    ];
  };
}
