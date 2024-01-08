{
  config,
  pkgs,
  anyrun,
  watershot,
  input,
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
    gnome.nautilus

    # Internet
    firefox
    google-chrome
    thunderbird
    wget

    # Text Editors
    # obsidian
    vscode
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
    davinci-resolve

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
    anyrun.packages.${pkgs.system}.anyrun-with-all-plugins
    watershot.packages.${pkgs.system}.default
    element-desktop
    gnome.gnome-terminal
    anki-bin
    libimobiledevice
    ifuse
    libreoffice-fresh

    # Programming
    (python3.withPackages (ps: with ps; [pandas matplotlib requests rich pyqt5 pygame]))
    newt
    gcc
    nixpkgs-review
    qjackctl
    libsForQt5.ksshaskpass
    pinentry
    gh
  ];

  programs = {
    zsh = {
      enable = true;
    };
    seahorse = {
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
