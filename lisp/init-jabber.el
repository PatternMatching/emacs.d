(require 'platform)

(setq jabber-account-list '(("phennings@gmail.com"
			     (:password . "intlkhxptdxvmfev"))
			    ("malcolmsaint@swissjabber.org"
			     (:password . "!@qDxCfG1984"))))

(defun jabber()
  (interactive)
  (jabber-connect-all)
  (switch-to-buffer "*-jabber-roster-*"))

(provide 'init-jabber)
