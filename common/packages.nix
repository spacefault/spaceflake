{ config, pkgs, anyrun, ... }:

{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs;[
    (python3.withPackages(ps: with ps; [ pandas matplotlib requests]))
    playerctl
    swaylock-effects
    adw-gtk3
    gradience
    thunderbird
    baobab
    swaynotificationcenter
    wlsunset
    gnome.gnome-disk-utility
    wget
    firefox
    kitty
    waybar
    git
    emacs-gtk
    discord
    wireplumber
    swww
    grim
    xdg-user-dirs
    vlc
    mpv
    gvfs
    udisks
    obs-studio
    keepassxc
    polkit
    polkit_gnome
    vim
    killall
    htop
    wlogout
    gnome.nautilus
    gnome.adwaita-icon-theme
    gnome-text-editor
    udiskie
    slurp
    wl-clipboard
    libnotify
    ffmpeg
    vscode
    gnome.eog
    osu-lazer-bin
    piper
    obsidian
    gimp-with-plugins
    networkmanagerapplet
    anyrun.packages.${pkgs.system}.anyrun-with-all-plugins
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
