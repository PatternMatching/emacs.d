;;; init-git.el --- Setup for use of git and magit
;;; Commentary:
(require 'magit)

;;; Code:
(when (system-is-windows) (setenv "SSH_ASKPASS" "git-gui--askpass"))

(require 'ssh-agency)

(provide 'init-git)
;;; init-git.el ends here
