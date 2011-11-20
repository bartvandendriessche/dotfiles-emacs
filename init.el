(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/")
             '("tromey" . "http://tromey.com/elpa/"))
(package-initialize)

(when (not package-archive-contents) (package-refresh-contents))

(defvar my-packages '(
                      auto-complete
                      marmalade
                      starter-kit
                      starter-kit-bindings
                      starter-kit-eshell
                      starter-kit-js
                      starter-kit-ruby
                      yasnippet-bundle
                      yaml-mode
                      ))
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(add-to-list 'auto-mode-alist '("\\.fish$" . shell-script-mode))
(add-to-list 'auto-mode-alist '("\\.ejs$" . html-mode))

(defun coffee-custom ()
  "coffee-mode-hook"
  (define-key coffee-mode-map [remap newline-and-indent] 'coffee-newline-and-indent) ;; rebind newline-and-indent key to coffee-mode version
  (define-key coffee-mode-map "\C-xr" 'coffee-compile-buffer)
  )

(add-hook 'coffee-mode-hook 'coffee-custom)

(load-theme 'tango-dark)

;; make S-up work in iTerm2 (likely a bug with xterm-256 mode
(define-key global-map [select] 'windmove-up)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(reb-re-syntax (quote string)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
