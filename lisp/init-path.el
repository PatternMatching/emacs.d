;; init-path.el
(if (system-is-windows)
    (progn
      ;; Prepend current execution path with GNU tools
      (setenv "PATH"
	      (concat
	       "C:/gnuwin32/bin" ";"
	       (getenv "PATH")))))

(provide 'init-path)
