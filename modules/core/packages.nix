{
  pkgs,
  inputs,
  config,
  lib,
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
    swaylock-effects
    cliphist
    gnome.nautilus
    gnome.adwaita-icon-theme
    swaynotificationcenter

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
    spotify

    # Creative
    # gimp-with-plugins
    obs-studio
    #    davinci-resolve

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
    inputs.watershot.packages.${pkgs.system}.default
    element-desktop
    anki-bin
    libimobiledevice
    ifuse
    libreoffice-fresh
    bootstrap-studio
    veracrypt

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
    jetbrains.idea-community-bin
  ];

  programs = {
    seahorse = {
      enable = true;
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
        pinentryPackage = lib.mkForce pkgs.pinentry-gnome3;
      };
    };
  };
}
