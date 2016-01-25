(require 'platform)

(if (system-is-windows)
    (setq package-check-signature nil))

(if (and (gnutls-available-p)
	 (system-is-windows))
    (setq gnutls-trustfiles '("C:/ssl/certs/cacert.pem")))

(provide 'init-ssl)
