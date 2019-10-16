;;; init-python --- init-python

;;; Commentary:

;;; Code:
(require 'platform)

(use-package elpy
  :ensure t
  :init
  (elpy-enable))

;; Minor modes to use in python-mode
(add-hook 'comint-output-filter 'python-pdbtrack-comint-output-filter-function)

(if (system-is-windows)
    (progn
      (setenv "PYTHONUNBUFFERED" "1")))

(if (system-is-work-pc)
    (progn
      (setq elpy-rpc-python-command "c:/Users/phennings/AppData/Local/Programs/Python/Python37/python.exe")))

(if (system-is-linux)
    (progn
      (setq elpy-rpc-python-command "python3")
      (setq python-shell-interpreter "python3")))

(provide 'init-python)
;;; init-python.el ends here
