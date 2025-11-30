{pkgs, ...}: {
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-gtk;
    extraPackages = epkgs: [
      epkgs.magit
      epkgs.catppuccin-theme
      epkgs.nix-mode
      epkgs.org-roam
      epkgs.evil
      epkgs.org-roam-ui
    ];
    extraConfig = ''
            (tool-bar-mode -1)
            (scroll-bar-mode -1)
            (setq org-startup-indented t)
            (column-number-mode)
            (display-time-mode)
            (require 'evil)
            ;(evil-mode 1)
            (display-battery-mode)
            ;(setq catppuccin-flavor 'mocha)
            ;(load-theme 'catppuccin :no-confirm)
          (require 'nix-mode)
      (add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode))
      (require 'org-roam)
      (org-roam-db-autosync-mode)
      ;(setq org-roam-directory (expand-file-name "/home/devin/docs/schoolnotes2/notebin"))
    '';
  };
}
