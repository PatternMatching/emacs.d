(require 'platform)

(if (and (gnutls-available-p)
	 (system-is-windows))
    (setq gnutls-trustfiles '("C:/ssl/certs/cacert.pem")))

(provide 'init-ssl)
