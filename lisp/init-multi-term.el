(require 'platform)

(if (system-is-linux)
    (progn
      (require 'multi-term)
      (setq multi-term-program "/usr/bin/zsh")))

(provide 'init-multi-term)
