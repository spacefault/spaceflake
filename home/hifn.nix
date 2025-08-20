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

  imports = [
    ./terminal
    ./wayland
    ./programs
  ];

  programs.home-manager.enable = true;
}
