{
  lib,
  pkgs,
  config,
  ...
}: let
  wallpaper = builtins.path {
    path = ./wallpaper.png;
    name = "wallpaper.png";
  };
in {
  home = {
    username = "devin";
    homeDirectory = lib.mkDefault "/home/devin";
    stateVersion = "24.05";
    sessionVariables = {EDITOR = "nvim";};
    packages = [
      pkgs.firefox
      pkgs.obsidian
      pkgs.google-chrome
      pkgs.webcord
      pkgs.loupe
      pkgs.vlc
      pkgs.mpv
      pkgs.git
      pkgs.baobab
      pkgs.obs-studio
      pkgs.keepassxc
      pkgs.anki-bin
      pkgs.gradience
      pkgs.adw-gtk3
      pkgs.libreoffice-fresh
      pkgs.nixpkgs-review
      pkgs.ncmpcpp
      pkgs.discord
      pkgs.networkmanagerapplet
      ### gnome extensions ###
      pkgs.gnomeExtensions.blur-my-shell
      pkgs.gnomeExtensions.dash-to-dock
      pkgs.gnomeExtensions.caffeine
      pkgs.gnomeExtensions.appindicator
    ];
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      enable-hot-corners = true;
      clock-format = "12h";
    };
    "org/gnome/desktop/background" = {
      picture-uri = wallpaper;
    };
    "org/gnome/mutter" = {
      edge-tiling = true;
      dynamic-workspaces = true;
    };
    "org/gnome/desktop/peripherals/mouse" = {
      natural-scroll = true;
    };
    "org/gtk/settings/file-chooser" = {
      clock-format = "12h";
    };
    "org/gnome/shell" = {
      disable-user-extensions = false;
      favorite-apps = [
        "firefox.desktop"
        "org.gnome.Geary.desktop"
        "org.gnome.Calendar.desktop"
        "org.gnome.Nautilus.desktop"
        "spotify.desktop"
        "org.keepassxc.KeePassXC.desktop"
        "Alacritty.desktop"
        "anki.desktop"
        "obsidian.desktop"
      ];
      enabled-extensions = [
        "blur-my-shell@aunetx"
        "dash-to-dock@micxgx.gmail.com"
        "caffeine@patapon.info"
        "appindicatorsupport@rgcjonas.gmail.com"
        "gsconnect@andyholmes.github.io"
      ];
    };
  };

  xdg = {
    enable = true;
    cacheHome = config.home.homeDirectory + "/.cache";
    configHome = config.home.homeDirectory + "/.config";
    stateHome = config.home.homeDirectory + "/.local/state";
    dataHome = config.home.homeDirectory + "/.local/share";
    portal = {
      enable = true;
      extraPortals = [pkgs.xdg-desktop-portal-hyprland pkgs.xdg-desktop-portal-gnome pkgs.xdg-desktop-portal-gtk];
      config.common.default = "*";
    };
    userDirs = {
      publicShare = null;
      templates = null;
      desktop = null;
    };
  };

  imports = [
    ./terminal/zsh.nix
    ./terminal/neovim.nix
    ./terminal/alacritty.nix
    ./terminal/tmux.nix
    ./linuxPrograms/vscode.nix
    ./linuxPrograms/spicetify.nix
    ./terminal/emacs.nix
    ./wayland
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = true;
    };
  };

  programs.home-manager.enable = true;
}
