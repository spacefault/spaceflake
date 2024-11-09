{pkgs, config, ...}: {
  home.packages = with pkgs; [
    dconf
    qt5.qttools
    qt6Packages.qtstyleplugin-kvantum
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
  ];

  dconf = {
    enable = true;
  };
  home.pointerCursor = {
    name = "macOS-Monterey";
    size = 24;
    package = pkgs.apple-cursor;
    gtk.enable = true;
  };
  gtk = {
    enable = true;
    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };
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
    enable = false;
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
}
