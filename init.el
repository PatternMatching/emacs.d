;;
;; init.el
;;
;; Author: Peter Hennings
;; 

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(server-start)

;; Show Emacs where to find all of the initialization elisp
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'platform)

(require 'init-multi-term)

(require 'init-proxy)

;; -----------------------------------
;; Appearance
;; -----------------------------------
(require 'init-themes)
(require 'init-gui-frames)

;; -----------------------------------
;; Packages
;; -----------------------------------
(require 'init-packages)

;; -----------------------------------
;; Text Editing Conveniences
;; -----------------------------------
(column-number-mode)
(setq-default fill-column 80)

;; -----------------------------------
;; LaTeX
;; -----------------------------------
(require 'init-latex)

;; -----------------------------------
;; Python
;; -----------------------------------
(require 'init-python)

(require 'init-flycheck)

(require 'init-company)

;; -----------------------------------
;; Git
;; -----------------------------------
(require 'init-git)

;; SSL Cert for GNU TLS
(require 'init-ssl)

;; -----------------------------------
;; Jabber
;; -----------------------------------
(require 'init-jabber)

;; -----------------------------------
;; Execution Path Adjustments
;; -----------------------------------
(require 'init-path)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(dap-mode lsp-ui lsp-pyright lsp-mode vterm exec-path-from-shell flycheck magit-svn pipenv json-reformat async ctable epl fsm pkg-info popup seq offlineimap jabber epc auctex)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
