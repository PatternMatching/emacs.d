
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
 ((or (system-is-mac) (system-is-linux))
  ;; Set frame to fixed size to avoid popping
  ;; up new windows every time a buffer is
  ;; opened
  (progn
    (setq initial-frame-alist
	  '((top . 100) (left . 40)
	    (width . 220) (height . 70)))
    (split-window-right)
    (other-window 1)
    (split-window-below))))

(provide 'init-gui-frames)
