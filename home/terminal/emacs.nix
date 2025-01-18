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
            (setq catppuccin-flavor 'mocha)
            (load-theme 'catppuccin :no-confirm)
      (setq org-capture-templates
            '(("j" "Journal entry" plain
               (file+olp+datetree "~/journal.org")
               "**** %i%?\n"
               :time-prompt t
               :unnarrowed t)))
            (defun org-journal-on-this-day ()
        "Show entries for this day on all previous years."
        (interactive)
        (with-temp-buffer-window "*On this day*" nil nil
          (with-temp-buffer
            (insert-file-contents "~/journal.org")
            (goto-char (point-min))
            (let ((regex (format-time-string "^\\*\\*\\* [0-9]\\{4\\}-%m-%d")))
      	(while (re-search-forward regex nil t)
      	  (let* ((elt (org-element-at-point))
      		 (begin (org-element-property :begin elt))
      		 (end (org-element-property :contents-end elt))
      		 (contents (buffer-substring begin end)))
      	    (princ contents))))))
        (with-current-buffer "*On this day*"
          (org-mode)))
          (require 'nix-mode)
      (add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode))
      (setq org-agenda-files '("~/TODO.org"
                               "~/work/clones/schoolnotes/grade9/school.org"))
    '';
  };
}
