;;; init-company --- Setup for company-mode
;;; Commentary:
;;; Code:
(require 'company)

(setq company-global-modes '(not jabber-chat jabber-roster))
(add-hook 'after-init-hook 'global-company-mode)

(global-set-key (kbd "M-C-/") 'company-complete)

(provide 'init-company)
;;; init-company.el ends here
