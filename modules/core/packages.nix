{
  pkgs,
  inputs,
  config,
  ...
}: let
  systemLabel = config.system.nixos.label;
  blender = if systemLabel == "blueberry" then
    pkgs.blender.override {
      cudaSupport = true;
    }
  else
    pkgs.blender;
in {
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
    swaylock-effects
    cliphist
    #swaynotificationcenter

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
    inputs.watershot.packages.${pkgs.system}.default
    element-desktop
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
    jetbrains.idea-community-bin
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
