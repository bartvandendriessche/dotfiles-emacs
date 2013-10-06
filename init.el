;; List of packages to install using el-get
(setq el-get-sources
      '(
        (:name color-theme-solarized :after (progn (load-theme 'solarized-dark t)))
        (:name auto-complete)
        (:name auto-complete-css)
        (:name auto-complete-emacs-lisp)
        (:name auto-complete-etags)
        (:name auto-complete-yasnippet)
        (:name coffee-mode :after (progn
                                    (define-key coffee-mode-map "\C-xr" 'coffee-compile-buffer)
                                    (custom-set-variables  '(coffee-tab-width 2))))
        (:name haml-mode :after (progn
                                  (add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))))
        (:name starter-kit :type :elpa)
        (:name starter-kit-bindings :type :elpa)
        (:name starter-kit-eshell :type :elpa)
        (:name starter-kit-js :type :elpa)
        (:name starter-kit-ruby :type :elpa :after (progn
                                                     (add-to-list 'auto-mode-alist '("Guardfile$" . ruby-mode)) ;; support Guardfiles
                                                     (add-to-list 'auto-mode-alist '("Podfile$" . ruby-mode)) ;; support Podfiles
                                                     (add-to-list 'auto-mode-alist '("\\.podspec$" . ruby-mode)) ;; support Podspecs
                                                     (require 'auto-complete)
                                                     (add-hook 'ruby-mode-hook 'auto-complete-mode)
                                                     (defalias 'inf-ruby-keys 'inf-ruby-setup-keybindings)))
        (:name starter-kit-lisp :type :elpa)
        (:name eproject)
        (:name feature-mode)
        (:name rvm :after (progn
                            (add-hook 'ruby-mode-hook 'rvm-activate-corresponding-ruby)
                            (add-hook 'feature-mode-hook 'rvm-activate-corresponding-ruby)))

        (:name flymake :type :elpa)
        (:name flymake-coffee :type :elpa :after (add-hook 'coffee-mode-hook 'flymake-coffee-load))
        (:name flymake-cursor :type :elpa)
        (:name flymake-css :after (add-hook 'css-mode-hook 'flymake-css-load))
        (:name flymake-haml :after (add-hook 'haml-mode-hook 'flymake-haml-load))
        (:name flymake-point)
        (:name flymake-ruby :type :elpa :after (add-hook 'ruby-mode-hook 'flymake-ruby-load))
        (:name flymake-sass :type :elpa)
        (:name magit)
        (:name sass-mode)
        (:name scss-mode :after (custom-set-variables '(scss-compile-at-save nil)))
        (:name less-css-mode :type :elpa)
        (:name markdown-mode)
        (:name jedi :after (progn
                             (add-hook 'python-mode-hook 'jedi:setup)
                             (setq jedi:complete-on-dot t)))
        (:name virtualenv :after (require 'virtualenv))
        (:name pony-mode :after (require 'pony-mode))
        (:name yasnippet-bundle :type :elpa)
        (:name yas-jit)
        (:name yaml-mode)
        ))

;; function that sets up elpa and other sources and syncs the
;; el-get-sources list
(defun sync-packages ()
  "Synchronize packages using el-get"
  (interactive)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages") t)
  (el-get 'sync '(el-get package))
  (setq my-packages (mapcar 'el-get-source-name el-get-sources))
  (package-initialize)
  (el-get 'sync my-packages))

;; function that syncs packages, but first installs el-get if it is
;; not present
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil t)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(sync-packages)

;; use ac-source-yasnippet in ruby-mode
(defun ac-ruby-mode-setup ()
  (setq ac-sources (append ac-sources '(ac-source-yasnippet))))

;; associate fish files with shell mode
(add-to-list 'auto-mode-alist '("\\.fish$" . shell-script-mode))

;; associate ejs files with html mode
(add-to-list 'auto-mode-alist '("\\.ejs$" . html-mode))

;; auto-reload files that have been changed outside emacs
(global-auto-revert-mode t)

;; make S-up work in iTerm2 (likely a bug with xterm-256 mode
(define-key global-map [select] 'windmove-up)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
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
  
