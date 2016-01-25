;;
;; init.el
;;
;; Author: Peter Hennings
;; 
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

(require 'auto-complete)
(require 'autopair)
(require 'yasnippet)

(require 'init-auto-complete)

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

;; -----------------------------------
;; MATLAB
;; -----------------------------------
(require 'init-matlab)

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

;; -------------------------------------
;; no-word
;; -------------------------------------
(require 'init-no-word)

