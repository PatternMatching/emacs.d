
(require 'platform)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

;; ELPA
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")))
(package-initialize)

(cond
 ((system-is-windows)
  ;; El-Get Installation/Update
  (unless (require 'el-get nil 'noerror)
    (with-current-buffer
	(find-file
	 "~/.emacs.d/el-get-install/el-get-install.el")
      (goto-char (point-max))
      (eval-print-last-sexp)))
  )
 ((system-is-mac)
  ;; El-Get Installation/Update
  (unless (require 'el-get nil 'noerror)
    (with-current-buffer
	(url-retrieve-synchronously
	 "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
      (goto-char (point-max))
      (eval-print-last-sexp)))
  )
 ((system-is-linux)
  ;; El-Get Installation/Update
  (unless (require 'el-get nil 'noerror)
    (with-current-buffer
	(url-retrieve-synchronously
	 "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
      (goto-char (point-max))
      (eval-print-last-sexp)))))

;; el-get sync - needs to be here because el-get is handled
;; depending on platform
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

(provide 'init-packages)
