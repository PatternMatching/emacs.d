;;; init-company --- Setup for company-mode
;;; Commentary:
;;; Code:
(require 'company)

(setq company-global-modes '(not jabber-chat-mode
				 jabber-roster-mode
				 magit-status-mode
				 eshell-mode
				 py-python-shell-mode
				 shell-mode))
(add-hook 'after-init-hook 'global-company-mode)

(global-set-key (kbd "M-C-/") 'company-complete)

(provide 'init-company)
;;; init-company.el ends here
