;;; init-lsp-mode-python --- Initialize lsp-mode

;;; Commentary:

;;; Code:

(use-package lsp-mode
  :hook (python-mode . lsp-deferred)
  :commands lsp
  :config
  (setq lsp-restart 'auto-restart)
  (setq read-process-output-max (* 1024 1024)))

(setq lsp-pyright-multi-root nil)

(use-package lsp-pyright
  :hook (python-mode . (lambda()
			 (require 'lsp-pyright)
			 (lsp)))) ; or lsp-deferred

(use-package lsp-ui
  :commands lsp-ui-mode)

(use-package dap-mode
  :after lsp-mode
  :commands dap-debug
  :hook ((python-mode . dap-ui-mode) (python-mode . dap-mode))
  :config
  (require 'dap-python)
  (setq dap-python-debugger 'debugpy))

(provide 'init-lsp-mode-python)
;;; init-lsp-mode-python.el ends here
