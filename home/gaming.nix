{lib, ...}: {
  home = {
    username = "devin";
    homeDirectory = lib.mkDefault "/home/devin";
    stateVersion = "24.05";
    sessionVariables = {EDITOR = "nvim";};
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };

  monitors = {
    "HDMI-A-1" = {
      width = 1920;
      height = 1080;
      refreshRate = 100;
      x = 0;
      y = 0;
      scale = "1";
      transformValue = 0;
    };
  };

  imports = [
    ./terminal
    ./wayland
    ./programs
  ];

  programs.home-manager.enable = true;
}
