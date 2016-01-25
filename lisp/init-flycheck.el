;;; init-flycheck -- Summary
;;; Commentary:
;;; Code:
(add-hook 'after-init-hook #'global-flycheck-mode)
(setq flycheck-check-syntax-automatically '(mode-enabled save))

(provide 'init-flycheck)
;;; init-flycheck.el ends here
