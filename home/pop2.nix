{lib, ...}: {
  home = {
    username = "devin";
    homeDirectory = lib.mkDefault "/Users/devin";
    stateVersion = "24.05";
    sessionVariables = {EDITOR = "nvim";};
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };

  imports = [
    ./terminal
  ];

  programs.home-manager.enable = true;
}
