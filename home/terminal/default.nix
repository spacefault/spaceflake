{...}: {
  imports = [
    #./neovim.nix
    ./emacs.nix
    ./tmux.nix
    ./zsh.nix
    ./htop.nix
    ./ghostty.nix
    #./alacritty.nix
    ./git.nix
  ];
}
