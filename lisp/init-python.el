
  ;; Python-Mode.el
(setq py-install-directory "~/.emacs.d/lisp/python-mode/")
(add-to-list 'load-path py-install-directory)
(require 'python-mode)

;; Minor modes to use in python-mode
(add-hook 'python-mode-hook 'autopair-mode)
(add-hook 'python-mode-hook 'yas-minor-mode)

;; Platform dependent settings
(cond
 ((system-is-windows)
  (setq py-shell-name "python")
  (setq py-python-command "python")
  (setq py-ipython-command "ipython")
  (setq py-ipython-command-args '("--matplotlib"))
  )
 ((system-is-mac)
  (setq py-shell-name "ipython")
  (setq py-python-command "python")
  (setq py-ipython-command "ipython")
  (setq py-ipython-command-args '("--matplotlib"))
  )
 ((system-is-linux)
  (setq py-shell-name "ipython")
  (setq py-python-command "python")
  (setq py-ipython-command "ipython")
  (setq py-ipython-command-args '("--matplotlib"))
  ))

;; Jedi.el settings
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(provide 'init-python)
