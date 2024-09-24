{
  lib,
  pkgs,
  ...
}: {
  home = {
    username = "lily";
    homeDirectory = lib.mkDefault "/home/lily";
    stateVersion = "24.05";
    sessionVariables = {EDITOR = "nvim";};
    packages = [
      pkgs.firefox
      pkgs.google-chrome
      pkgs.webcord
      pkgs.loupe
      pkgs.vlc
      pkgs.mpv
      pkgs.spotify
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
      ### gnome extensions ###
      pkgs.gnomeExtensions.blur-my-shell
      pkgs.gnomeExtensions.dash-to-dock
      pkgs.gnomeExtensions.caffeine
      pkgs.gnomeExtensions.appindicator
    ];
  };

  services = {
    mpd = {
      enable = true;
      musicDirectory = "/home/lily/Music";
    };
  };

  programs = {
    ncmpcpp = {
      enable = true;
    };
  };


  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      favorite-apps = [
        "firefox.desktop"
        "thunderbird.desktop"
        "org.gnome.Nautilus.desktop"
        "Alacritty.desktop"
        "org.keepassxc.KeePassXC.desktop"
        "org.gnome.Music.desktop"
        "google-chrome.desktop"
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


  imports = [
    ./terminal/zsh.nix
    ./terminal/neovim
    ./terminal/alacritty.nix
    ./terminal/tmux.nix
    ./programs/vscode.nix
  ];

  nixpkgs = {
    config.allowUnfree = true;
    config.allowUnfreePredicate = true;
  };

  programs.home-manager.enable = true;
}
