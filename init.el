(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'platform)

(require 'python)

;; -------------------------------------
;; Platform stuff
;; -------------------------------------

(cond
 ((system-is-windows)
  ;; Maximize the emacs window upon startup
  (w32-send-sys-command 61488)

  ;; El-Get Installation
  (add-to-list 'load-path "~/.emacs.d/el-get/el-get")

  (unless (require 'el-get nil 'noerror)
    (with-current-buffer
	(find-file
	 "~/.emacs.d/el-get-install/el-get-install.el")
      (goto-char (point-max))
      (eval-print-last-sexp)))
  
  (add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
  (el-get 'sync)

  ;; Python Windows integration
  (setq 
   python-shell-interpreter "ipython"
   python-shell-interpreter-args "--pylab"
   python-shell-prompt-regexp "In \\[[0-9]+\\]: "
   python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
   python-shell-completion-setup-code
   "from IPython.core.completerlib import module_completion"
   python-shell-completion-module-string-code
   "';'.join(module_completion('''%s'''))\n"
   python-shell-completion-string-code
   "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")
  )
 ((system-is-mac)
  ;; Darwin .emacs script goes here
  (custom-set-variables
   ;; custom-set-variables was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(inhibit-startup-screen t))
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   )
  
  (server-start)
  
  (add-to-list 'load-path "~/.emacs.d/el-get/el-get")
  
  (unless (require 'el-get nil 'noerror)
    (with-current-buffer
	(url-retrieve-synchronously
	 "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
      (goto-char (point-max))
      (eval-print-last-sexp)))
  
  (add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
  (el-get 'sync)
 
  (setq
   python-shell-interpreter "ipython"
   python-shell-interpreter-args "--pylab"
   python-shell-prompt-regexp "In \\[[0-9]+\\]: "
   python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
   python-shell-completion-setup-code "from IPython.core.completerlib import module_completion"
   python-shell-completion-module-string-code "';'.join(module_completion('''%s'''))\n"
   python-shell-completion-string-code "';'.join(get_ipython().Completer.all_completions('''%s''''))\n")
  )
 ((system-is-linux)
  ;; Linux .emacs script goes here
  )
)

;; -------------------------------------
;; Stuff that isn't platform-dependent
;; -------------------------------------

;; Jedi.el settings
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

