
;; AucTeX
(require 'tex)
(require 'tex-site)
(require 'font-latex)
(require 'preview)

;; Auto-Complete for AucTeX
(require 'auto-complete-auctex)

;; Hooks
;; ---------
;; Want to auto fill the document and auto-compile to PDF
(add-hook 'LaTeX-mode-hook (lambda ()
			     (turn-on-auto-fill)
			     (TeX-global-PDF-mode t)))

(provide 'init-auctex)
