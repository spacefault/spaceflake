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
    ./terminal/git.nix
    ./terminal/htop.nix
    ./terminal/neovim.nix
    ./terminal/tmux.nix
    ./terminal/zsh.nix
    ./terminal/alacritty.nix
    ./programs/nh.nix
    #./programs/vscode.nix
  ];

  programs.home-manager.enable = true;
}
