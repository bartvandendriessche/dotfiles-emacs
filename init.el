;; List of packages to install using el-get
(setq el-get-sources
      '(
        (:name auto-complete :after (lambda () (ac-config-default)))
        (:name auto-complete-css)
        (:name auto-complete-emacs-lisp)
        (:name auto-complete-etags)
        (:name auto-complete-ruby)
        (:name auto-complete-yasnippet)
        (:name coffee-mode :after (lambda ()
                                    (define-key coffee-mode-map [remap newline-and-indent] 'coffee-newline-and-indent) ;; rebind newline-and-indent key to coffee-mode version
                                    (define-key coffee-mode-map "\C-xr" 'coffee-compile-buffer)
                                    (custom-set-variables  '(coffee-tab-width 2))))
        (:name csv-mode)
        (:name ctags :type elpa)
        (:name ctags-update :type elpa)
        (:name haml-mode)
        (:name starter-kit :type elpa)
        (:name starter-kit-bindings :type elpa)
        (:name starter-kit-eshell :type elpa)
        (:name starter-kit-js :type elpa)
        (:name starter-kit-ruby :type elpa)
        (:name starter-kit-lisp :type elpa)
        (:name flymake :type elpa)
        (:name flymake-coffee :type elpa :after (lambda ()
                                                  (add-hook 'coffee-mode-hook 'flymake-coffee-load)))
        (:name flymake-cursor :type elpa)
        (:name flymake-point)
        (:name flymake-ruby :type elpa :after (lambda ()
                                                (add-hook 'ruby-mode-hook 'flymake-ruby-load)))
        (:name flymake-sass :type elpa)
        (:name sass-mode)
        (:name scss-mode :after (lambda ()
                                  (custom-set-variables '(scss-compile-at-save nil))))
        (:name yasnippet-bundle :type elpa)
        (:name yas-jit :type elpa)
        (:name yaml-mode)
        ))

;; function that sets up elpa and other sources and syncs the
;; el-get-sources list
(defun sync-packages ()
  "Synchronize packages using el-get"
  (interactive)
  (el-get 'sync '(el-get package))
  (add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/"))
  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
  (setq my-packages (mapcar 'el-get-source-name el-get-sources))
  (el-get 'sync my-packages))

;; function that syncs packages, but first installs el-get if it is
;; not present
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(if (require 'el-get nil t)
    (sync-packages)
  (url-retrieve "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
                (lambda (s)
                  (end-of-buffer)
                  (eval-print-last-sexp)
                  (setq el-get-verbose t)
                  (sync-packages))))

;; use ac-source-yasnippet in ruby-mode
(defun ac-ruby-mode-setup ()
  (setq ac-sources (append '(ac-source-yasnippet))))

;; associate fish files with shell mode
(add-to-list 'auto-mode-alist '("\\.fish$" . shell-script-mode))

;; associate ejs files with html mode
(add-to-list 'auto-mode-alist '("\\.ejs$" . html-mode))

;; default color scheme
(load-theme 'tango-dark)

;; auto-reload files that have been changed outside emacs
(global-auto-revert-mode t)

;; make S-up work in iTerm2 (likely a bug with xterm-256 mode
(define-key global-map [select] 'windmove-up)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("7fe1e3de3e04afc43f9a3d3a8d38cd0a0efd9d4c" "d14db41612953d22506af16ef7a23c4d112150e5" default)))
 '(reb-re-syntax (quote string))
 '(safe-local-variable-values (quote ((encoding . utf-8) (whitespace-line-column . 80) (lexical-binding . t))))
 )
