{pkgs, ...}: {
  home = {
    packages = with pkgs; [dconf libsForQt5.qtstyleplugin-kvantum libsForQt5.qt5ct];
  };
  home.pointerCursor = {
    name = "macOS-Monterey";
    size = 22;
    package = pkgs.apple-cursor;
    gtk.enable = true;
  };
  home.file.".config/kdeglobals" = {
    text = ''
      [UiSettings]
      ColorScheme=catppuccin-mocha-pink
    '';
  };
  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "kvantum";
  };

  gtk = {
    enable = true;
    colorScheme = "dark";
    theme = {
      name = "catppuccin-mocha-pink-standard";
      package = pkgs.catppuccin-gtk.override {
        accents = ["pink"];
        variant = "mocha";
        size = "standard";
      };
    };
  };
}
