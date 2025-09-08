{
  pkgs,
  myPkgs,
  ...
}: {
  home = {
    sessionVariables.GTK_THEME = "MacTahoe-Dark";
    packages = with pkgs; [dconf];
  };
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        gtk-theme = "MacTahoe-Dark";
        color-scheme = "prefer-dark";
      };
      "org/gtk/settings/file-chooser" = {
        sort-directories-first = true;
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
    theme = {
      name = "MacTahoe-Dark";
      package = pkgs.mactahoe-theme;
    };
    iconTheme = {
      name = "MacTahoe-dark";
      package = pkgs.mactahoe-icons;
    };
    font = {
      name = "SF Pro Display";
      size = 12;
      package = myPkgs.sf-pro;
    };
  };
} 
