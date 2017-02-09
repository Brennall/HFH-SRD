#!/usr/bin/emacs -script

(defun insert-chapter-header ()
  (interactive)
  (goto-char (point-min))
  (if (search-forward-regexp "^Chapter ")
      (replace-match "## \\&"))
  )

(defun insert-headers ()
  (interactive)
  (goto-char (point-min))
  (while (search-forward-regexp "\n\n" nil t)
    (replace-match "\\&### "))
  )

(defun make-lists ()
  (interactive)
  (goto-char (point-min))
  (while (search-forward-regexp "^[a-zA-Z0-9]+ - " nil t)
    (replace-match "* \\&"))
  )

(defun separate-paragraphs ()
  (interactive)
  (goto-char (point-min))
  (while (search-forward-regexp "\n\\([^\\*]\\)" nil t)
    (replace-match "\n\n\\1"))
  )

(defun convert-to-md ()
  (interactive)
  (insert-chapter-header)
  (insert-headers)
  (make-lists)
  (separate-paragraphs)
  )

(defun process-file (f)
  (save-excursion 
    (find-file f)
    (convert-to-md)
    (write-file f)
    (kill-buffer (current-buffer))))

(defun process-files (dir) 
  (mapc 'process-file
        (directory-files dir t ".md$")))
