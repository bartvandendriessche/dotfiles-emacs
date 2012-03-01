;; install el-get unless it is already installed
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

;; Fetch packages through el-get
(setq el-get-sources
      '(
        (:name auto-complete)
        (:name auto-complete-css)
        (:name auto-complete-emacs-lisp)
        (:name auto-complete-etags)
        (:name auto-complete-ruby)
        (:name auto-complete-yasnippet)        
        (:name coffee-mode)
        (:name csv-mode)
        ;;(:name ctags :type elpa)
        ;;(:name ctags-update :type elpa)
        (:name starter-kit :type elpa)
        (:name starter-kit-bindings :type elpa)
        (:name starter-kit-eshell :type elpa)
        (:name starter-kit-js :type elpa)
        (:name starter-kit-ruby :type elpa)
        (:name flymake :type elpa)
        (:name flymake-coffee :type elpa)
        (:name flymake-cursor :type elpa)
        (:name flymake-ruby :type elpa)
        (:name flymake-sass :type elpa)
        (:name yasnippet-bundle :type elpa)
        (:name yas-jit :type elpa)
        (:name yaml-mode)
        ))

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

(defun coffee-custom ()
  "coffee-mode-hook"
  (define-key coffee-mode-map [remap newline-and-indent] 'coffee-newline-and-indent) ;; rebind newline-and-indent key to coffee-mode version
  (define-key coffee-mode-map "\C-xr" 'coffee-compile-buffer)
  )

(add-hook 'coffee-mode-hook 'coffee-custom)

;; use flymake for coffeescript
(add-hook 'coffee-mode-hook 'flymake-coffee-load)

;; use flymake for ruby
(add-hook 'ruby-mode-hook 'flymake-ruby-load)

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
 '(coffee-tab-width 2)
 '(custom-safe-themes (quote ("7fe1e3de3e04afc43f9a3d3a8d38cd0a0efd9d4c" "d14db41612953d22506af16ef7a23c4d112150e5" default)))
 '(reb-re-syntax (quote string))
 '(safe-local-variable-values (quote ((encoding . utf-8) (whitespace-line-column . 80) (lexical-binding . t))))
 '(scss-compile-at-save nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; utf-8 all the things !
;;(set-terminal-coding-system 'utf-8)
