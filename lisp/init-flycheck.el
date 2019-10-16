;;; init-flycheck -- Summary
;;; Commentary:
;;; Code:
(add-hook 'after-init-hook #'global-flycheck-mode)

(setq flycheck-check-syntax-automatically '(mode-enabled save))

;; Toggle flycheck to 'on'
(setq flycheck-highlighting-mode 'lines)

(provide 'init-flycheck)
;;; init-flycheck.el ends here
