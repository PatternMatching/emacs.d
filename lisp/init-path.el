;; init-path.el

;;; Code:
(if (system-is-windows)
    (let ((msys-bin-dir-esc "C:\\msys64\\usr\\bin")
	  (msys-bin-dir '("c:/msys64/usr/bin")))
      (progn
	;; Prepend current execution path with GNU tools
	(setenv "PATH"
		(concat
	         msys-bin-dir-esc ";"
		 (getenv "PATH")))
	(setq exec-path (append exec-path msys-bin-dir)))))

(provide 'init-path)
