(require 'platform)
(require 'init-auctex)

(cond
 ((system-is-windows)
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
		(output-html "xdg-open")))))
 ((system-is-mac)
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
		(output-html "xdg-open")))))
 ((system-is-linux)
  ))

(provide 'init-latex)
