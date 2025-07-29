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
    ./terminal/htop.nix
    ./terminal/neovim.nix
    ./terminal/zsh.nix
    ./terminal/tmux.nix
  ];

  programs.home-manager.enable = true;
}
