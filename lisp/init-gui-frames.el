
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
  (if (equal system-name "roscommon-laptop")
      ;; Set frame to fixed size to avoid popping
      ;; up new windows every time a buffer is
      ;; opened
      (progn
	(set-frame-size (selected-frame) 1920 1200 t)
	(split-window-right)
	(other-window 1)
	(split-window-below))
    (progn
      (toggle-frame-maximized)
      (split-window-right)
      (other-window 1)
      (split-window-below)))))

(provide 'init-gui-frames)
