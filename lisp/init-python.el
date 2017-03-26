;; init-python.el
(elpy-enable)
(elpy-use-ipython)
(setq python-shell-interpreter-args "--simple-prompt --pprint")
(setq elpy-rpc-backend "jedi")
(require 'init-setpy)

;; Minor modes to use in python-mode
(add-hook 'comint-output-filter 'python-pdbtrack-comint-output-filter-function)

;; Toggle flycheck to 'on'
(setq flycheck-highlighting-mode 'lines)

(if (system-is-windows)
    (progn
      ;; Turn off buffering so that pdb is flushed to
      ;; stdout when a breakpoint is hit in shell-mode.
      (setenv "PYTHONUNBUFFERED" "1")
      
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

;;; ElPy fix for "native completion setup failed" -- remove
;;; when upgraded to Emacs 25.2
(defun python-shell-completion-native-try ()
  "Return non-nil if can trigger native completion"
  (with-eval-after-load 'python
    '(let ((python-shell-completion-native-enable t)
	   (python-shell-completion-native-output-timeout
	    python-shell-completion-native-try-output-timeout))
       (python-shell-completion-native-get-completions
	(get-buffer-process (current-buffer))
	nil "_")))
  )

(provide 'init-python)
;;; init-python.el ends here
