{ config, pkgs, self, user, ... }:

{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-gtk;
    extraConfig = ''
      (toolbar-mode -1)
    '';
  };
}
