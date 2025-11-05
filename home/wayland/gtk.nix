{
  pkgs,
  myPkgs,
  ...
}: {
  home = {
    sessionVariables.GTK_THEME = "MacTahoe-Light";
    packages = with pkgs; [dconf];
  };
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        gtk-theme = "MacTahoe-Light";
        color-scheme = "prefer-light";
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
      name = "MacTahoe-Light";
      package = myPkgs.mactahoe-theme;
    };
    #iconTheme = {
    #  name = "MacTahoe-light";
    #  package = myPkgs.mactahoe-icons;
    #};
    font = {
      name = "SF Pro Display";
      size = 12;
      package = myPkgs.sfpro;
    };
  };
}
