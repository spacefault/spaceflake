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
    wget

    # Entertainment
    ffmpeg
    mpv
    vlc
    loupe
    spotify

    # Creative
    obs-studio

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
    # inputs.watershot.packages.${pkgs.system}.default
    anki-bin
    libimobiledevice
    ifuse
    libreoffice-fresh
    veracrypt
    mdbook

    # Programming
    (python311.withPackages (ps: with ps; [requests]))
    gcc
    nixpkgs-review
    libsForQt5.ksshaskpass
    pinentry
    gh
    gnumake
    vscode
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
}
