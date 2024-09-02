{
  lib,
  inputs,
  config,
  pkgs,
  ...
}: {
  home = {
    username = "lily";
    homeDirectory = lib.mkDefault "/home/lily";
    stateVersion = "23.05";
    sessionVariables = {EDITOR = "nvim";};
  };

  imports = [
    ./terminal/zsh.nix
    ./terminal/neovim.nix
    ./terminal/alacritty.nix
    ./terminal/tmux.nix
    ./programs/spicetify.nix
    ./programs/vscode.nix
  ];

  nixpkgs = {
    config.allowUnfree = true;
    config.allowUnfreePredicate = true;
  };

  programs.home-manager.enable = true;

}

