;;; init-lsp-mode-python --- Initialize lsp-mode

;;; Commentary:

;;; Code:

(use-package lsp-mode
  :hook (python-mode . lsp-deferred)
  :commands lsp
  :config
  (setq lsp-restart 'auto-restart)
  (setq read-process-output-max (* 1024 1024)))

(use-package lsp-pyright
  :ensure t
  :after lsp-mode
  :config
  (setq lsp-pyright-multi-root nil))

(use-package lsp-ui
  :commands lsp-ui-mode)

(with-eval-after-load 'lsp-mode
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\.pixi\\'"))

(use-package dap-mode
  :after lsp-mode
  :commands dap-debug
  :hook ((python-mode . dap-ui-mode) (python-mode . dap-mode))
  :config
  (require 'dap-python)
  (setq dap-python-debugger 'debugpy))

(provide 'init-lsp-mode-python)
;;; init-lsp-mode-python.el ends here
