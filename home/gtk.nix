{pkgs, ...}: {
  home.packages = with pkgs; [
    dconf
    qt5.qttools
    qt6Packages.qtstyleplugin-kvantum
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    breeze-icons
  ];

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };
  home.pointerCursor = {
    name = "macOS-Monterey";
    size = 22;
    package = pkgs.apple-cursor;
    gtk.enable = true;
  }; 
  gtk = {
    enable = true;
    font = {
      name = "Torus";
    };
    theme = {
      name = "Catppuccin-Mocha-Compact-Pink-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = ["pink"];
        tweaks = ["rimless"];
        size = "compact";
        variant = "mocha";
      };
    };
  };
  qt = {
    enable = true;
    platformTheme = "qtct";
    style = {
      name = "Catppuccin-Mocha-Dark";
      package = pkgs.catppuccin-kde.override {
        flavour = ["mocha"];
        accents = ["pink"];
        size = "compact";
      };
    };
  };
  home.sessionVariables = {
    GTK_THEME = "Catppuccin-Mocha-Compact-Pink-Dark";
    QT_QPA_PLATFORMTHEME = "qt5ct";
  };
  xdg.configFile = {
    "Kvantum/catppuccin/catppuccin.kvconfig".source = builtins.fetchurl {
      url = "https://raw.githubusercontent.com/catppuccin/Kvantum/main/src/Catppuccin-Mocha-Pink/Catppuccin-Mocha-Pink.kvconfig";
      sha256 = "13ci6bzi41pazvpbylwqxhwjv4w8af50g26qqfh3xbaxjwfgdk1d";
    };
    "Kvantum/catppuccin/catppuccin.svg".source = builtins.fetchurl {
      url = "https://raw.githubusercontent.com/catppuccin/Kvantum/main/src/Catppuccin-Mocha-Pink/Catppuccin-Mocha-Pink.svg";
      sha256 = "1rlxd9w2ifddc62rdyddzdbglc64wf7k6w7hlxfy85hwmn35m683";
    };
    "Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=catppuccin

      [Applications]
      catppuccin=qt5ct, org.qbittorrent.qBittorrent, hyprland-share-picker
    '';
  };
}
