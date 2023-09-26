{ config, pkgs, self, user, ... }:

{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-gtk;
    extraConfig = ''
      (tool-bar-mode -1)
      (scroll-bar-mode -1)
    '';
  };
}
