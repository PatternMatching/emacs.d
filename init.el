;; -------------------------------------
;; Platform stuff
;; -------------------------------------

(cond
 ((string-equal system-type "windows-nt")
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
  )
 ((string-equal system-type "darwin")
  ;; Darwin .emacs script goes here
  )
 ((string-equal system-type "gnu/linux")
  ;; Linux .emacs script goes here
  )
)

;; -------------------------------------
;; Stuff that isn't platform-dependent
;; -------------------------------------

;; Jedi.el settings
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
