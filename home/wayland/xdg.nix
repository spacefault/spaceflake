{config, ...}: {
  xdg = {
    enable = true;
    cacheHome = config.home.homeDirectory + "/.cache";
    configHome = config.home.homeDirectory + "/.config";
    stateHome = config.home.homeDirectory + "/.local/state";
    dataHome = config.home.homeDirectory + "/.local/share";
    # portal = {
    #   enable = true;
    #   extraPortals = [pkgs.xdg-desktop-portal-hyprland pkgs.xdg-desktop-portal-gtk];
    #   config.common.default = "*";
    # };
    userDirs = {
      enable = true;
      publicShare = null;
      templates = null;
      desktop = "${config.home.homeDirectory}/.local/share/Desktop";
      download = "${config.home.homeDirectory}/Downloads";
      documents = "${config.home.homeDirectory}/Documents";
      music = "${config.home.homeDirectory}/Music";
      pictures = "${config.home.homeDirectory}/Pictures";
      videos = "${config.home.homeDirectory}/Movies";
      extraConfig = {
        XDG_SCREENSHOTS_DIR = "${config.home.homeDirectory}/Pictures/screenshots";
        XDG_DEVEL_DIR = "${config.home.homeDirectory}/dev";
      };
    };
  };
}
