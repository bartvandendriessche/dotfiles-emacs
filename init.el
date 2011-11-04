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

(defun coffee-custom ()
  "coffee-mode-hook"
  (define-key coffee-mode-map [remap newline-and-indent] 'coffee-newline-and-indent) ;; rebind newline-and-indent key to coffee-mode version
  )

(add-hook 'coffee-mode-hook 'coffee-custom)

(load-theme 'tango-dark)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2))
