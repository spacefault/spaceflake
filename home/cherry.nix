{lib, ...}: {
  home = {
    username = "devin";
    homeDirectory = lib.mkDefault "/home/devin";
    stateVersion = "24.05";
    sessionVariables = {EDITOR = "nvim";};
  };

  monitors = {
    "eDP-1" = {
      width = 1920;
      height = 1080;
      refreshRate = 60;
      x = 0;
      y = 0;
      scale = "1.25";
    };
    "DP-1" = {
      width = 1920;
      height = 1080;
      refreshRate = 100;
      x = 1920;
      y = 0;
      scale = "1";
    };
  };

  imports = [
    ./terminal
    ./wayland
    ./programs
  ];

  programs.home-manager.enable = true;
}
