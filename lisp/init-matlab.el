;; init-matlab.el
;; -----------------------------------------------------
;; Sets up MATLAB support for emacs using matlab-mode

(add-to-list 'load-path "~/.emacs.d/lisp/matlab-emacs")
(load-library "matlab-load")
(add-hook 'matlab-mode
	  (lambda ()
	    (auto-complete-mode 1)))

(provide 'init-matlab)
