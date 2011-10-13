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
