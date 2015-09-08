(require 'platform)

(defun no-word ()
  "Run antiword on the entire buffer."
  (shell-command-on-region (point-min) (point-max) "antiword - " t t))

(if (or (system-is-linux)
	(system-is-mac))
    (progn
      (require 'no-word)
      (add-to-list 'auto-mode-alist '("\\.doc\\'" . no-word))))

(provide 'init-no-word)
