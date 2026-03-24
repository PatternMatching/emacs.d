;;; init-claude.el --- Initializes Claude Code integration

;;; Commentary:

;;; Code:

(use-package claude-code :ensure t
  :vc (:url "https://github.com/stevemolitor/claude-code.el" :rev :newest)
  :config (claude-code-mode)
  :bind-keymap ("C-c c" . claude-code-command-map))

(setq claude-code-never-truncate-claude-buffer t)

(provide 'init-claude)

;;; init-claude.el ends here
