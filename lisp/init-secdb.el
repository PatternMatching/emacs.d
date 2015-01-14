(require 'platform)

;; Emacs/SecDB integration
(if (and (system-is-windows)
	 (system-is-work-pc))
    (progn
      (add-to-list 'load-path "i:/Ja/prod/python/ceg/util/emacs")
      (require 'secdb)
      (secdb-start-server)))

(provide 'init-secdb)
