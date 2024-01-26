{
  config,
  pkgs,
  anyrun,
  watershot,
  input,
  shadower,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    # Hyprland Requirements
    grim
    gvfs
    libnotify
    playerctl
    polkit
    slurp
    swww
    udiskie
    udisks
    wireplumber
    wlogout
    wlsunset
    wl-clipboard
    xdg-user-dirs
    eww-wayland
    gnome.nautilus
    swaylock-effects

    # Internet
    firefox
    google-chrome
    thunderbird
    wget

    # Text Editors
    # obsidian
    qownnotes

    # Entertainment
    ffmpeg
    mpv
    vlc
    loupe

    # Creative
    gimp-with-plugins
    obs-studio
    blender
    # davinci-resolve

    # Customization
    adw-gtk3
    gnome.adwaita-icon-theme
    gradience

    # Disks and Storage
    baobab

    # Misc
    git
    htop
    keepassxc
    killall
    networkmanagerapplet
    virt-manager
    cups-filters
    watershot.packages.${pkgs.system}.default
    shadower.packages.${pkgs.system}.shadower
    element-desktop
    gnome.gnome-terminal
    anki-bin
    libimobiledevice
    ifuse
    libreoffice-fresh
    bootstrap-studio

    # Programming
    (python311.withPackages (ps: with ps; [requests]))
    newt
    gcc
    nixpkgs-review
    qjackctl
    libsForQt5.ksshaskpass
    pinentry
    gh
    gnumake
  ];

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
