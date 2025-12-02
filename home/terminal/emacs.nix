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
; init
            (tool-bar-mode -1)
            (scroll-bar-mode -1)
            (setq org-startup-indented t)
            (column-number-mode)
            (display-time-mode)
            (require 'evil)
            ;(evil-mode 1)
            (display-battery-mode)
            (setq catppuccin-flavor 'mocha)
            (load-theme 'catppuccin :no-confirm)
          (require 'nix-mode)
      (add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode))

; org conf

(require 'org-roam)
      (setq org-roam-directory (expand-file-name "~/Documents/School/Notebox"))
      (org-roam-db-autosync-mode)
      (define-key global-map (kbd "C-c n l") 'org-roam-buffer-toggle)
      (define-key global-map (kbd "C-c n f") 'org-roam-node-find)
      (define-key global-map (kbd "C-c n i") 'org-roam-node-insert)
(dolist (face '((org-level-1 . 1.35)
                (org-level-2 . 1.3)
                (org-level-3 . 1.2)
                (org-level-4 . 1.1)
                (org-level-5 . 1.1)
                (org-level-6 . 1.1)
                (org-level-7 . 1.1)
                (org-level-8 . 1.1)))
  (set-face-attribute (car face) nil :font "Monaspace Radon" :weight 'bold :height (cdr face)))
(add-hook 'org-mode-hook 'variable-pitch-mode)
(custom-set-faces
 '(variable-pitch ((t (:family "Monaspace Radon")))))
    '';
  };
}
