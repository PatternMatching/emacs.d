(require 'platform)

(if (system-is-windows)
    (progn
      (setq url-proxy-services
	    '(("no_proxy" . "\\(localhost\\)")))))

(provide 'init-proxy)
