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
    stateVersion = "24.05";
    sessionVariables = {EDITOR = "nvim";};
    packages = [
      pkgs.firefox
      pkgs.google-chrome
      pkgs.loupe
      pkgs.vlc
      pkgs.mpv
      pkgs.spotify
      pkgs.git
      pkgs.baobab
      pkgs.obs-studio
      pkgs.keepassxc
      pkgs.anki-bin
      pkgs.gradience
      pkgs.adw-gtk3
      pkgs.libreoffice-fresh
      pkgs.nixpkgs-review
    ];
  };

  imports = [
    ./terminal/zsh.nix
    ./terminal/neovim.nix
    ./terminal/alacritty.nix
    ./terminal/tmux.nix
    ./programs/vscode.nix
  ];

  nixpkgs = {
    config.allowUnfree = true;
    config.allowUnfreePredicate = true;
  };

  programs.home-manager.enable = true;

}

