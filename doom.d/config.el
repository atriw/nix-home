;;; .doom.d/config.el --- config
;;; Commentary:

;;; Code:
;; Setting the font.
(setq doom-font (font-spec :family "FiraCode Nerd Font Mono" :size 16))

;; Setting the theme.
(setq doom-theme 'doom-one)

(after! lsp-mode
  (advice-remove #'lsp #'+lsp-dont-prompt-to-install-servers-maybe-a))

(provide 'config)
;;; config.el ends here
