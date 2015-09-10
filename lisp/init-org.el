(require 'platform)

(setq org-journal-install-directory "~/.emacs.d/lisp/org-journal/")
(add-to-list 'load-path org-journal-install-directory)
(require 'org-journal)

(cond
 ((system-is-windows)
  (setq org-journal-dir "~/journal/"))
 ((system-is-mac)
  (setq org-journal-dir "~/Documents/journal/"))
 ((system-is-linux)
  (setq org-journal-dir "~/journal/")))

(provide 'init-org)
