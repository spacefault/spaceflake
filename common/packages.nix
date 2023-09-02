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
    swaynotificationcenter
    swww
    udiskie
    udisks
    waybar
    wireplumber
    wlogout
    wlsunset
    wl-clipboard
    xdg-user-dirs
    eww-wayland
    
    # Internet
    discord
    firefox
    thunderbird
    wget
    
    # Text Editors
    emacs-gtk
    gnome-text-editor
    obsidian
    vim
    vscode
    
    # Entertainment
    ffmpeg
    gnome.eog
    mpv
    vlc
    
    # Creative 
    gimp-with-plugins
    obs-studio

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
    piper
    virt-manager
    anyrun.packages.${pkgs.system}.anyrun-with-all-plugins

    # Programming
    (python3.withPackages(ps: with ps; [ pandas matplotlib requests]))
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
