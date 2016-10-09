;;
;; init.el
;;
;; Author: Peter Hennings
;; 

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(server-start)

;; Show Emacs where to find all of the initialization elisp
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'platform)

;; -----------------------------------
;; Execution Path Adjustments
;; -----------------------------------
(require 'init-path)

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
;; Org-Mode
;; -----------------------------------
(require 'init-org)

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

;; -------------------------------------
;; SecDB
;; -------------------------------------
(require 'init-secdb)

;; SSL Cert for GNU TLS
(require 'init-ssl)

;; -----------------------------------
;; Jabber
;; -----------------------------------
(require 'init-jabber)
