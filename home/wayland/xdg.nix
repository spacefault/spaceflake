{
  pkgs,
  config,
  ...
}: {
  xdg = {
    enable = true;
    cacheHome = config.home.homeDirectory + "/.cache";
    configHome = config.home.homeDirectory + "/.config";
    stateHome = config.home.homeDirectory + "/.local/state";
    dataHome = config.home.homeDirectory + "/.local/share";
    portal = {
      enable = true;
      extraPortals = [pkgs.xdg-desktop-portal-hyprland pkgs.xdg-desktop-portal-gtk];
      config.common.default = "*";
    };
    userDirs = {
      enable = true;
      publicShare = null;
      templates = null;
      desktop = "${config.home.homeDirectory}/.local/share/Desktop";
      download = "${config.home.homeDirectory}/internet/downloads";
      documents = "${config.home.homeDirectory}/documents";
      music = "${config.home.homeDirectory}/media/music";
      pictures = "${config.home.homeDirectory}/media/pictures";
      videos = "${config.home.homeDirectory}/media/videos";
      extraConfig = {
        XDG_SCREENSHOTS_DIR = "${config.home.homeDirectory}/media/pictures/images/screenshots";
        XDG_DEVEL_DIR = "${config.home.homeDirectory}/devel";
      };
    };
  };
}
