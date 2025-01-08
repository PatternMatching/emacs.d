;;; init-python --- init-python

;;; Commentary:

;;; Code:
(require 'platform)

(setenv "WORKON_HOME" "~/miniforge3/envs/")

;;; (require 'init-elpy)
;;; (require 'init-eglot-python)
(require 'init-lsp-mode-python)


(provide 'init-python)
;;; init-python.el ends here
