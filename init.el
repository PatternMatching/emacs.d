;;
;; init.el
;;
;; Author: Peter Hennings
;; 

(tool-bar-mode -1)

(server-start)

(require 'platform)

(require 'init-loadpath)

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
