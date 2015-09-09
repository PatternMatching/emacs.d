(require 'platform)
(require 'magit)

(if (system-is-windows)
    ;; Starts up the msys ssh-agent to avoid prompting
    ;; for RSA passphrase
    (load-file "~/.ssh/agent.env.el"))

(setq magit-last-seen-setup-instructions "1.4.0")

(provide 'init-git)
