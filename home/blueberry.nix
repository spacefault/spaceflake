{lib, ...}: {
  home = {
    username = "devin";
    homeDirectory = lib.mkDefault "/home/devin";
    stateVersion = "24.05";
    sessionVariables = {EDITOR = "nvim";};
  };

  monitors = {
    "HDMI-A-1" = {
      width = 1920;
      height = 1080;
      refreshRate = 100;
      x = 0;
      y = 0;
      scale = "1";
    };
  };

  imports = [
    ./programs
    ./wayland
    ./terminal
  ];

  programs.home-manager.enable = true;
}
