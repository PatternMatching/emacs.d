
(require 'platform)

;; Supress GUI features
(setq use-file-dialog nil)
(setq use-dialog-box nil)
(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message t)
(tool-bar-mode -1)

;; Window size and features
(cond
 ((system-is-windows)
  ;; Maximize the emacs window upon startup
  (if (and (>= emacs-major-version 24)
	   (>= emacs-minor-version 4)
	   (fboundp 'toggle-frame-maximized))
      (toggle-frame-maximized)
    (w32-send-sys-command 61488)))
 ((system-is-mac)
  ;; Set initial window size
  (setq default-frame-alist
	'(
	  (width . 100) ; characters
	  (height . 60) ; lines
	  ))
  )
 ((system-is-linux)
  (toggle-frame-maximized)
  (split-window-right)
  (other-window 1)
  (split-window-below)))

(provide 'init-gui-frames)
