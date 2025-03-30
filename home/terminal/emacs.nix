{pkgs, ...}: {
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-gtk;
    extraPackages = epkgs: [
      epkgs.magit
      epkgs.catppuccin-theme
      epkgs.evil
      epkgs.nix-mode
      epkgs.org-roam
      epkgs.org-roam-ui
    ];
    extraConfig = ''
            (tool-bar-mode -1)
            (scroll-bar-mode -1)
            (setq org-startup-indented t)
            (column-number-mode)
            (display-time-mode)
            (display-battery-mode)
            ; (setq catppuccin-flavor 'mocha)
            ; (load-theme 'catppuccin :no-confirm)
          (require 'nix-mode)
          (require 'evil)
          (evil-mode 1)
      (add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode))
      (require 'org-roam)
      (org-roam-db-autosync-mode)
      (setq org-agenda-files '("~/dev/local/orgroam/2024-2025.org"))
      (setq org-roam-directory (expand-file-name "/home/devin/docs/schoolnotes2/notebin"))
      (define-key global-map (kbd "C-c n l") 'org-roam-buffer-toggle)
      (define-key global-map (kbd "C-c n f") 'org-roam-node-find)
      (define-key global-map (kbd "C-c n i") 'org-roam-node-insert)
    '';
  };
}
