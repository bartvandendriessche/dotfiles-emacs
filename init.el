(add-to-list 'load-path "~/.emacs.d/settings")

(require 'settings) ;; load default settings

;; List of packages to install using el-get
(setq el-get-sources
      '((:name auto-complete)
        (:name auto-complete-emacs-lisp)
        (:name auto-complete-yasnippet)
        (:name color-theme-solarized :after (load-theme 'solarized-dark t))
        (:name flymake)
        (:name flymake-cursor)
        (:name jedi :after (progn
                             (add-hook 'python-mode-hook 'jedi:setup)
                             (setq jedi:complete-on-dot t)))
        (:name magit :after (progn
			      (global-set-key (kbd "C-c g") 'magit-status)))
        (:name markdown-mode)
        (:name pony-mode)
        (:name virtualenv)
        ))

(settings-el-get-sync)

;; (defun pdb-django-test ()
;;   (interactive
;;    (pdb (concat gud-pdb-command-name " " virtualenv-default-directory "/manage.py test " default-directory))))

;; (defadvice pdb (before gud-query-cmdline activate)
;;   "Fix command line with some Django knowledge"
;;   (interactive
;;    (list (gud-query-cmdline 'pdb (concat (or virtualenv-default-directory
;;                                              default-directory)
;;                                          "manage.py test")))))
  
