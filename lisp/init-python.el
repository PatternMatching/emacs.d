;;; init-python --- init-python

;;; Commentary:

;;; Code:
(require 'platform)

(elpy-enable)

;; Minor modes to use in python-mode
(add-hook 'comint-output-filter 'python-pdbtrack-comint-output-filter-function)

;;; Use Flycheck instead of Flymake
(when (load "flycheck" t t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(if (system-is-windows)
    (progn
      (setenv "PYTHONUNBUFFERED" "1")
      (setq elpy-rpc-python-command "C:/python/python-3.9.1/python.exe")
      (setq elpy-rpc-virtualenv-path 'current)
      (pyvenv-activate windows-default-venv-dir)))

(if (system-is-linux)
    (progn
      (setq elpy-rpc-python-command "/usr/bin/python3")
      (setq elpy-syntax-check-command "~/.local/bin/flake8")
      (elpy-set-test-runner "py.test")
      (setenv "WORKON_HOME" "~/miniconda3/envs")))

(if (system-is-mac)
    (progn
      (setq elpy-rpc-python-command "python3")
      (setq python-shell-interpreter "python3")))

(provide 'init-python)
;;; init-python.el ends here
