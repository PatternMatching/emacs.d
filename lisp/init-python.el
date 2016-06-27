;; init-python.el
(setq py-install-directory "~/.emacs.d/lisp/python-mode/")
(add-to-list 'load-path py-install-directory)
(require 'python-mode)

;; Minor modes to use in python-mode
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)
(add-hook 'comint-output-filter 'python-pdbtrack-comint-output-filter-function)
(eval-after-load "company"
  '(progn
     (add-to-list 'company-backends 'company-anaconda)))
     
;; Platform dependent python-mode settings
(cond
 ((system-is-windows)
  (setq py-shell-name "python")
  (setq py-python-command "python")
  )
 ((system-is-mac)
  (setq py-shell-name "ipython")
  (setq py-python-command "python")
  (setq py-ipython-command "ipython")
  (setq py-ipython-command-args '("--matplotlib"))
  )
 ((system-is-linux)
  (setq py-shell-name "ipython2")
  (setq py-python-command "python2")
  (setq py-ipython-command "ipython2")
  (setq py-ipython-command-args "--matplotlib=qt --automagic")
  ))

;; Want python-mode to set fill-column
(setq py-auto-fill-mode t)

;; Toggle flycheck to 'on'
(add-hook 'python-mode-hook 'py-flycheck-mode)
(setq flycheck-highlighting-mode 'lines)

(if (system-is-windows)
    (progn
      ;; Python mapped prod by default
      (defvar map-py-stat "prod")

      (defconst init-py-user-path "H:/user/python")

      (defconst init-py-dev-path "Y:/bld/dev/python")

      (defconst init-py-prod-path
	(concat "V:/CoreApps/ja/prod/offtrain/python" ";"
		"V:/CoreApps/ja/prod/python"))))

;; Declare functions to toggle environments
(defun map-py-user ()
  (interactive)
  (if (system-is-windows)
      (progn
	(setenv "PYTHONPATH" init-py-user-path)
	(setq map-py-stat "user")
	(message "Mapped to USER!"))))

(defun map-py-dev ()
  (interactive)
  (if (system-is-windows)
      (progn
	(setenv "PYTHONPATH" init-py-dev-path)
	(setq map-py-stat "dev")
	(message "Mapped to DEV!"))))

(defun map-py-prod ()
  (interactive)
  (if (system-is-windows)
      (progn
	(setenv "PYTHONPATH" init-py-prod-path)
	(setq map-py-stat "prod")
	(message "Mapped to PROD!"))))

(defun map-py-stat ()
  (interactive)
  (message map-py-stat))

(provide 'init-python)
;;; init-python.el ends here
