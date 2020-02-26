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
      (setq elpy-rpc-python-command "python.exe")))

(if (system-is-linux)
    (progn
      (setq elpy-rpc-python-command "python3")
      (setq python-shell-interpreter "python3")))

(provide 'init-python)
;;; init-python.el ends here
