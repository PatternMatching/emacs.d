;;; init-lsp-mode-python --- Initialize lsp-mode

;;; Commentary:

;;; Code:

(use-package lsp-mode
  :hook (python-mode . lsp-deferred)
  :commands lsp
  :config
  (setq lsp-restart 'auto-restart)
  (setq read-process-output-max (* 1024 1024))

(use-package lsp-pyright
  :hook (python-mode . (lambda()
			 (require 'lsp-pyright)
			 (lsp)))) ; or lsp-deferred

(use-package lsp-ui
  :commands lsp-ui-mode)

(provide 'init-lsp-mode-python)
;;; init-lsp-mode-python.el ends here
