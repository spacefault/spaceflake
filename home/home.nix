{
  config,
  pkgs,
  self,
  user,
  ...
}: {
  home = {
    username = "devin";
    homeDirectory = "/home/devin";
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
