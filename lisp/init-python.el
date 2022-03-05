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

(defun get-current-buffer-flake8 ()
  (interactive)
  (concat
   (file-name-as-directory
    (concat pyvenv-virtual-env "Scripts")) "flake8.exe"))

(defun get-current-buffer-pylint ()
  (interactive)
  (concat
   (file-name-as-directory
    (concat pyvenv-virtual-env "Scripts")) "pylint.exe"))

(defvar windows-default-venv-dir
  "c:/miniconda/envs/ts-venv-prod-emacs"
  "Default Windows python virtual environment to activate")

(if (system-is-windows)
    (progn
      (setenv "PYTHONUNBUFFERED" "1")
      (setq elpy-rpc-python-command "C:/python/python-3.9.1/python.exe")
      (setq elpy-rpc-virtualenv-path 'current)
      (pyvenv-activate windows-default-venv-dir)))

(if (system-is-linux)
    (progn
      (setq elpy-rpc-python-command "python3")
      (setq python-shell-interpreter "python3")))

(if (system-is-mac)
    (progn
      (setq elpy-rpc-python-command "python3")
      (setq python-shell-interpreter "python3")))

(provide 'init-python)
;;; init-python.el ends here
