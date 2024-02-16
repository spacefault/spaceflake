{
  lib,
  inputs,
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
    inputs.anyrun.homeManagerModules.default
    ./waybar.nix
    ./zsh.nix
    ./emacs.nix
    ./neovim.nix
    ./alacritty.nix
    #./dunst.nix
    ./swaylock.nix
    #./swayidle.nix
    ./hyprland.nix
    ./spicetify.nix
    ./anyrun.nix
    ./vscode.nix
    ./gtk.nix
    ./tmux.nix
  ];
}
