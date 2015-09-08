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

;; -------------------------------------
;; no-word
;; -------------------------------------
(require 'init-no-word)
