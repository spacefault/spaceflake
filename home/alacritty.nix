{ config, lib, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
    	window = {
          opacity = 0.9;
        };
      shell.program = "/run/current-system/sw/bin/zsh";
    };
  };
}
