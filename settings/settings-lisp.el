(progn
  (setq el-get-sources (append el-get-sources
                               '((:name auto-complete-emacs-lisp)
                                 (:name elisp-slime-nav :after (progn
                                                                 (add-hook 'emacs-lisp-mode-hook 'elisp-slime-nav-mode)
                                                                 )))))
  (when (require 'projectile nil 'noerror)
    (add-hook 'lisp-mode-hook 'projectile-mode)
    (add-hook 'emacs-lisp-mode-hook 'projectile-mode)))

(provide 'settings-lisp)
