;;; init-python --- init-python

;;; Commentary:

;;; Code:
(require 'elpy)
;; (require 'flycheck)

(elpy-enable)
(setq elpy-rpc-backend "jedi")

;; Minor modes to use in python-mode
(add-hook 'comint-output-filter 'python-pdbtrack-comint-output-filter-function)

(if (system-is-windows)
    (progn
      (setenv "PYTHONUNBUFFERED" "1")))

;; Toggle flycheck to 'on'
;; (setq flycheck-highlighting-mode 'lines)

(provide 'init-python)
;;; init-python.el ends here
