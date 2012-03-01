(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/")
             '("tromey" . "http://tromey.com/elpa/"))
(package-initialize)

(when (not package-archive-contents) (package-refresh-contents))

(defvar my-packages '(
                      auto-complete
                      coffee-mode
                      csv-mode
                      ctags
                      ctags-update
                      marmalade
                      starter-kit
                      starter-kit-bindings
                      starter-kit-eshell
                      starter-kit-js
                      starter-kit-ruby
                      flymake
                      flymake-coffee
                      flymake-cursor
                      flymake-ruby
                      flymake-sass
                      yasnippet-bundle
                      yas-jit
                      yaml-mode
                      ))
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; automatically update TAGS on save
(ctags-update-minor-mode 1)

;; load default auto-complete settings
(require 'auto-complete-config)
(ac-config-default)
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

;; don't use pretty lambdas cause we can't render them properly
(remove-hook 'prog-mode-hook 'esk-pretty-lambdas)

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
