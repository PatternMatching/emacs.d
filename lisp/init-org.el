(require 'platform)

(add-hook `org-mode-hook (lambda()
			   (visual-line-mode)
			   (org-indent-mode)))

(provide 'init-org)
