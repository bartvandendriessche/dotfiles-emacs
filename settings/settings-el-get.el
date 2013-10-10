(progn
  (add-to-list 'load-path "~/.emacs.d/el-get/el-get"))

(defun settings-el-get-require ()
  "Require el-get. If el-get isn't found, download and eval it."
  (unless (require 'el-get nil t)
    (with-current-buffer
	(url-retrieve-synchronously
	 "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
      (let (el-get-master-branch)
	(goto-char (point-max))
	(eval-print-last-sexp)))))

(defun settings-el-get-sync ()
  (settings-el-get-require)
  (let ((my-packages (append '()
			     (mapcar 'el-get-source-name el-get-sources))))
    (el-get-cleanup my-packages) ;; delete unlisted packages
    (el-get 'sync my-packages))) ;; install and require listed packages

(provide 'settings-el-get)
