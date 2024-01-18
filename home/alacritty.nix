{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        opacity = 0.8;
      };
      shell = {
        program = "/run/current-system/sw/bin/zsh";
      };
      colors = {
        primary = {
          background = "0x000000";
        };
      };
    };
  };
}
