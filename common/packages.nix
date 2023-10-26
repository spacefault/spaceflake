{
  config,
  pkgs,
  anyrun,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    # Hyprland Requirements
    grim
    gvfs
    kitty
    libnotify
    playerctl
    polkit
    slurp
    swaylock-effects
    swww
    udiskie
    udisks
    wireplumber
    wlogout
    wlsunset
    wl-clipboard
    xdg-user-dirs
    eww-wayland
    dunst

    # Internet
    discord
    firefox
    thunderbird
    wget

    # Text Editors
    obsidian
    vscode

    # Entertainment
    ffmpeg
    mpv
    vlc

    # Creative
    gimp-with-plugins
    obs-studio
    blender
    davinci-resolve

    # Customization
    adw-gtk3
    gnome.adwaita-icon-theme
    gradience

    # Disks and Storage
    baobab

    # Gaming
    osu-lazer-bin
    prismlauncher
    ckan

    # Misc
    git
    htop
    keepassxc
    killall
    networkmanagerapplet
    piper
    virt-manager
    cups-filters
    anyrun.packages.${pkgs.system}.anyrun-with-all-plugins
    element-desktop
    gnome.gnome-terminal

    # Programming
    (python3.withPackages (ps: with ps; [pandas matplotlib requests rich]))
    newt
    gcc
    nixpkgs-review
  ];

  programs = {
    steam = {
      enable = true;
    };
    zsh = {
      enable = true;
    };
    seahorse = {
      enable = false;
    };
    dconf = {
      enable = true;
    };
    #ssh = {
    #  startAgent = true;
    #  askPassword = pkgs.lib.mkForce "${pkgs.ksshaskpass.out}/bin/ksshaskpass";
    #};
    gnupg = {
      agent = {
        enable = true;
        enableSSHSupport = true;
        enableExtraSocket = true;
        pinentryFlavor = "gnome3";
      };
    };
  };
}
