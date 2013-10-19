(progn
  (setq el-get-sources (append el-get-sources
			       '((:name auto-complete-emacs-lisp))))
  (add-hook 'emacs-lisp-mode-hook 'elisp-slime-nav-mode))

(provide 'settings-lisp)
