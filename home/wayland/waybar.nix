{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = ./extra/config.jsonc;
    style = ./extra/style.css;
  };
}

