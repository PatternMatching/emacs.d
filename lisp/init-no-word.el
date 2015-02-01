(require 'platform)

(if (system-is-linux)
    (lambda ()
      (require 'no-word)

      (defun no-word ()
	(shell-command-on-region (point-min) (point-max) "antiword - " t t))

      (add-to-list 'auto-mode-alist '("\\.doc\\'" . no-word))))
