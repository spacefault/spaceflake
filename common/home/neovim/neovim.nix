{ config, pkgs, self, user, ... }:

{
  programs.neovim = {
    enable = true;
    extraConfig = ''
      set number
    '';
  };
}
