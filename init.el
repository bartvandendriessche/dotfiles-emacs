;; require el-get or download if it's missing
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil t)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))

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
        (:name magit)
        (:name markdown-mode)
        (:name pony-mode)
        (:name virtualenv)
        ))

;; use melpa
;;(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(defun sync-packages ()
  (let ((my-packages (append '()
                           (mapcar 'el-get-source-name el-get-sources))))
  (el-get-cleanup my-packages) ;; delete unlisted packages
  (el-get 'sync my-packages))) ;; install and require listed packages

(sync-packages)

;; auto-reload files that have been changed outside emacs
(global-auto-revert-mode t)

;; make S-up work in iTerm2 (likely a bug with xterm-256 mode
(define-key global-map [select] 'windmove-up)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(gud-pdb-command-name "~/.emacs.d/pdb")
 '(safe-local-variable-values (quote ((pony-settings make-pony-project :python "/Users/bart/.virtualenvs/caldai/bin/python" :settings "settings.local") (pony-settings make-pony-project :settings "settings.local") (pony-settings make-pony-project :settings "local") (whitespace-line-column . 80) (lexical-binding . t))))
 '(scss-compile-at-save nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; (defun pdb-django-test ()
;;   (interactive
;;    (pdb (concat gud-pdb-command-name " " virtualenv-default-directory "/manage.py test " default-directory))))

;; (defadvice pdb (before gud-query-cmdline activate)
;;   "Fix command line with some Django knowledge"
;;   (interactive
;;    (list (gud-query-cmdline 'pdb (concat (or virtualenv-default-directory
;;                                              default-directory)
;;                                          "manage.py test")))))
  
