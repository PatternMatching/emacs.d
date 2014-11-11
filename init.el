(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("3c9d994e18db86ae397d077b6324bfdc445ecc7dc81bb9d528cd9bba08c1dac1" "c41402a24055fff3829d580a05384f3d147a5a4c12cc1a89668ab6bcda80078f" default)))
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(server-start)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(add-to-list 'custom-theme-load-path (expand-file-name "themes" user-emacs-directory))

(load-theme 'zenburn t)

(require 'platform)
(require 'python)

;; ELPA
(require 'package)
(package-initialize)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))

;; -----------------------------------
;; Org-Mode
;; -----------------------------------

;; Load org-journal.el
(require 'org-journal)

;; -----------------------------------
;; Auto Complete Mode
;; -----------------------------------
(require 'auto-complete)

;; -----------------------------------
;; LaTeX
;; -----------------------------------

;; AucTex
(require 'tex)
(require 'tex-site)
(require 'font-latex)
(require 'preview)
(require 'auto-complete-auctex)

(add-hook 'LaTeX-mode-hook (lambda ()
			     (TeX-global-PDF-mode t)))


;; Emacs IPython Notebook currently not working with IPython > 0.13
;;
;; (require 'ein)

;; -------------------------------------
;; Platform stuff
;; -------------------------------------

(cond
 ((system-is-windows)
  ;; Maximize the emacs window upon startup
  (if (and (>= emacs-major-version 24)
	   (>= emacs-minor-version 4))
      (toggle-frame-maximized)
    (w32-send-sys-command 61488))

  ;; El-Get Installation
  (unless (require 'el-get nil 'noerror)
    (with-current-buffer
	(find-file
	 "~/.emacs.d/el-get-install/el-get-install.el")
      (goto-char (point-max))
      (eval-print-last-sexp)))

  ;; -------------------------------------
  ;; Magit
  ;; -------------------------------------

  ;; Starts up the msys ssh-agent to avoid prompting
  ;; for RSA passphrase
  (load-file "~/.ssh/agent.env.el")

  ;; -------------------------------------
  ;; LaTeX
  ;; -------------------------------------

  (setq TeX-view-program-list
	'(("Sumatra PDF"
	   (concat "\"C:/Program Files (x86)/SumatraPDF/SumatraPDF.exe\""
		   " -reuse-instance"
		   (mode-io-correlate " -forward-search %b %n ")
		   " %o"))))
  (setq TeX-view-program-selection
	(quote (((output-dvi style-pstricks) "dvips and gv")
		(output-dvi "xdvi")
		(output-pdf "Sumatra PDF")
		(output-html "xdg-open"))))

  ;; Reset org-journal home directory
  (setq org-journal-dir "~/journal/")
  )
 ((system-is-mac)
  ;; Darwin .emacs script goes here

  (unless (require 'el-get nil 'noerror)
    (with-current-buffer
	(url-retrieve-synchronously
	 "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
      (goto-char (point-max))
      (eval-print-last-sexp)))

  ;; Set initial window size
  (setq default-frame-alist
	'(
	  (width . 180) ; characters
	  (height . 60) ; lines
	  ))

  (split-window-horizontally)

  ;; -------------------------------------
  ;; LaTeX
  ;; -------------------------------------

  (setq TeX-view-program-list
	(quote 
	 (("Skim"
	   (concat "/Applications/Skim.app"
		   "/Contents/SharedSupport/displayline"
		   " %n %o %b")))))
  (setq TeX-view-program-selection
	(quote (((output-dvi style-pstricks) "dvips and gv")
		(output-dvi "xdvi")
		(output-pdf "Skim")
		(output-html "xdg-open"))))

  )
 ((system-is-linux)
  ;; Linux .emacs script goes here
  )
 ((system-is-cygwin)
  ;; Cygwin stuff goes here
  )
)

;; -------------------------------------
;; Stuff that isn't platform-dependent
;; -------------------------------------

;; Jedi.el settings
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;; el-get sync
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

;; Load MATLAB source files in Octave mode instead of Obj-C
(add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))

;; Set Python interpreter for use with python.el
(setq
 python-shell-interpreter "ipython"
 python-shell-interpreter-args "--pylab"
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code "';'.join(get_ipython().Completer.all_completions('''%s''''))\n")

