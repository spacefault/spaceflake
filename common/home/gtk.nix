{
  pkgs,
  ...
}: {

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Pink-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "pink" ];
        #size = "compact";
        tweaks = [ "rimless" ];
        variant = "mocha";
      };
    };
  };
}
