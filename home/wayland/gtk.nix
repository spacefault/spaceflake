{
  inputs,
  pkgs,
  myPkgs,
  ...
}: {
  dconf = {
    enable = true;
  };

  home.pointerCursor = {
    name = "macOS";
    size = 24;
    package = pkgs.apple-cursor;
    gtk.enable = true;
    x11.enable = true;
  };

  stylix = {
    enable = true;
    autoEnable = false;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-latte.yaml";
    targets = {
      gtk.enable = true;
      qt.enable = true;
      gnome.enable = true;
    };
    fonts = {
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
      monospace = {
        package = pkgs.monaspace;
        name = "Monaspace Radon";
      };
      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };
      sansSerif = {
        package = myPkgs.helvetica-neue;
        name = "Helvetica Neue Light";
      };
    };
  };
}
