;;; init-setpy --- Methods for manipulating Python-related environment variables
(require 'cl)

(defconst winpy-strs '((64 . "WinPython-2.7.10.3-64") (32 . "WinPython-2.7.10.3")))
(defconst py-strs '((64 . "python-2.7.10.amd64") (32 . "python-2.7.10")))

(defun setpy--in-stuff-to-remove(x)
  ""
  (member x stuff-to-remove))

(defun setpy--set-path (bit-arch)
  ""
  (let* ((winpy-strs '((64 . "WinPython-2.7.10.3-64")
		       (32 . "WinPython-2.7.10.3")))
	 (py-strs '((64 . "python-2.7.10.amd64")
		    (32 . "python-2.7.10")))
	 (path (remove-if #'in-stuff-to-remove
			  (split-string (getenv "PATH") ";")))
	 (winpy-str (cdr (assoc bit-arch winpy-strs)))
	 (py-str (cdr (assoc bit-arch py-strs)))
	 (new-path-entries (list
			    (concat "C:\\" winpy-str)
			    (concat "C:\\" winpy-str "\\" py-str)
			    (concat "C:\\" winpy-str "\\" py-str "\\scripts"))))
    (progn
      (if (every #'file-accessible-directory-p new-path-entries)
	  (setenv "PATH" (mapconcat 'identity
				    (append new-path-entries path) ";"))
	(error "The WinPython directories don't exist")))))

(defun setpy--set-py-path (new-py-path)
  ""
  (if (every #'file-accessible-directory-p (split-string new-py-path ";"))
      (setenv "PYTHONPATH" new-py-path)
    (error "One or more of the directories specified don't exist")))

(defun setpy (bit-arch &optional pythonpath)
  ""
  (progn
    (setpy--set-path bit-arch)
    (if (boundp 'pythonpath)
	(setpy--set-py-path pythonpath))))

(provide 'init-setpy)
