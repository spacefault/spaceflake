{
  config,
  pkgs,
  self,
  user,
  lib,
  ...
}: {
  home = {
    username = "lily";
    homeDirectory = lib.mkDefault "/home/lily";
    stateVersion = "23.05";
  };

  programs = {
    home-manager = {
      enable = true;
    };
  };

  imports = [
    ./waybar.nix
    ./zsh.nix
    ./emacs.nix
    ./neovim.nix
  ];
}
