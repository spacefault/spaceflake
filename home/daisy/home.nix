{
  lib,
  inputs,
  ...
}: {
  home = {
    username = "daisyadmin";
    homeDirectory = lib.mkDefault "/home/daisy";
    stateVersion = "23.05";
  };

  programs = {
    home-manager = {
      enable = true;
    };
  };

  imports = [
    inputs.anyrun.homeManagerModules.default
    ./zsh.nix
  ];
}
