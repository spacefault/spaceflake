{lib, ...}: {
  home = {
    username = "devin";
    homeDirectory = lib.mkDefault "/home/devin";
    stateVersion = "24.05";
    sessionVariables = {EDITOR = "nvim";};
  };

  monitors = {
    "HDMI-A-1" = {
      width = 1920;
      height = 1080;
      refreshRate = 75;
      x = 0;
      y = 0;
    };
  };

  imports = [
    ./terminal/zsh.nix
    ./terminal/neovim.nix
    ./terminal/alacritty.nix
    ./terminal/tmux.nix
    ./programs/vscode.nix
    ./programs/spicetify.nix
    ./terminal/emacs.nix
    ./wayland
  ];

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      enable-hot-corners = true;
      clock-format = "12h";
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

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = true;
    };
  };

  programs.home-manager.enable = true;
}
