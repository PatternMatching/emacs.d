;; -------------------------------------
;; Platform Stuff
;; -------------------------------------

(defun system-is-windows ()
  (interactive)
  (string-equal system-type "windows-nt"))

(defun system-is-mac ()
  (interactive)
  (string-equal system-type "darwin"))

(defun system-is-linux ()
  (interactive)
  (string-equal system-type "gnu/linux"))

(defun system-is-cygwin ()
  (interactive)
  (string-equal system-type "cygwin"))

(provide 'platform)
