;; init-path.el

;;; Code:
(if (system-is-windows)
    (let ((msys-bin-dir-esc "C:\\msys64\\usr\\bin")
	  (msys-bin-dir '("c:/msys64/usr/bin"))
	  (msys-local-bin-dir-esc "C:\\msys64\\usr\\local\\bin")
	  (msys-local-bin-dir '("c:/msys64/usr/local/bin")))
      (progn
	;; Prepend current execution path with GNU tools
	(setenv "PATH"
		(concat
	         msys-bin-dir-esc ";"
		 msys-local-bin-dir-esc ";"
		 (getenv "PATH")))
	(setq exec-path
	      (append
	       (append exec-path msys-bin-dir)
	       msys-local-bin-dir)))))

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(provide 'init-path)
