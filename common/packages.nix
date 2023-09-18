{ config, pkgs, anyrun, ... }:

{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs;[
    # Hyprland Requirements
    grim
    gvfs
    kitty
    libnotify
    playerctl
    polkit
    polkit_gnome
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
    gnome-text-editor
    obsidian
    vscode
    
    # Entertainment
    ffmpeg
    gnome.eog
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
    gnome.gnome-disk-utility

    # Gaming
    osu-lazer-bin
    prismlauncher

    # Misc
    git
    gnome.nautilus
    htop
    keepassxc
    killall
    networkmanagerapplet
    gnome.gnome-terminal
    piper
    virt-manager
    cups-filters
    anyrun.packages.${pkgs.system}.anyrun-with-all-plugins

    # Programming
    (python3.withPackages(ps: with ps; [ pandas matplotlib requests rich ]))
    newt
  ];

  programs = {
    steam = {
      enable = true;
    };
    zsh = {
      enable = true;
    };
    seahorse = {
      enable = true;
    };
    dconf = {
      enable = true;
    };
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
