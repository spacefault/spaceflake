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
    ./programs/nh.nix
    ./programs/spicetify.nix
    ./programs/vscode.nix
  ];

  programs.home-manager.enable = true;
}
