;; init-python.el

(elpy-enable)
(setq elpy-rpc-backend "jedi")

(require 'init-setpy)

;; Minor modes to use in python-mode
(add-hook 'comint-output-filter 'python-pdbtrack-comint-output-filter-function)

(if (system-is-linux)
    (progn
      (elpy-use-ipython)))

;; Toggle flycheck to 'on'
(setq flycheck-highlighting-mode 'lines)

(provide 'init-python)
;;; init-python.el ends here
