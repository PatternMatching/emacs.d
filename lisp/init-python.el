;;; init-python --- init-python

;;; Commentary:

;;; Code:
(require 'elpy)
(require 'flycheck)

(elpy-enable)
(setq elpy-rpc-backend "jedi")

;; Minor modes to use in python-mode
(add-hook 'comint-output-filter 'python-pdbtrack-comint-output-filter-function)

(defcustom py-version "2.7.15"
  "The Python version to use.

This just denotes what version of Python to use in seeking out
a PFS executable to use for identifying the location of the
virtualenv."
  :type 'py-version
  :safe #'stringp
  :group 'pfs)

(defun pfs-activate (venv-name)
  "Abstracts the process of"
  (interactive "sActivate PFS distro: ")
  (pyvenv-deactivate)
  (let* ((py-ver-to-dir '(("2.7.10" . "Python-2.7.10-x86_64")
			  ("2.7.14" . "Python-2.7.14-x86_64")
			  ("2.7.15" . "Python-2.7.15-x86_64")
			  ("3.6.1" . "Python-3.6.1-x86_64")))
	 (py-dir (cdr (assoc py-version py-ver-to-dir)))
	 (pfs-exe (concat "C:\\" py-dir "\\Scripts\\pfs.exe"))
	 (venv-dir
	  (car (split-string
		(shell-command-to-string
		 (concat pfs-exe " whichvenv " venv-name)) "\n"))))
    (pyvenv-activate venv-dir)))

(defun pfs-deactivate ()
  (interactive)
  (pyvenv-deactivate))

(if (system-is-windows)
    (progn
      (setenv "PYTHONUNBUFFERED" "1")))

;; Toggle flycheck to 'on'
(setq flycheck-highlighting-mode 'lines)

(provide 'init-python)
;;; init-python.el ends here
