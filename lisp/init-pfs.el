;; init-pfs --- Provides emacs abstractions for use with the PFS wrapper
;;; Commentary:

;;; Code:

(require 'eshell)

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
  (interactive "DActivate PFS distro: ")
  (let* ((py-ver-to-dir '(("2.7.10" . "Python-2.7.10-x86_64")
			  ("2.7.14" . "Python-2.7.14-x86_64")
			  ("2.7.15" . "Python-2.7.15-x86_64")
			  ("3.6.1" . "Python-3.6.1-x86_64")))
	 (py-dir (cdr (assoc py-ver-to-dir py-version)))
	 (pfs-exe (concat "C:\\" py-dir "\\Scripts\\pfs.exe")))
    (shell-command-to-string (concat pfs-exe " whichpy " venv-name))))

(provide init-pfs)
;;; init-pfs.el ends here
