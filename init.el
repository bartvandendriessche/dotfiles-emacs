;; TERMINAL MAPPINGS TO SUPPORT ITERM2 FOR MAC
(progn
  (let ((map (if (boundp 'input-decode-map)
                 input-decode-map
	       function-key-map)))
    (define-key map "\e[105;5u" (kbd "C-i"))
    (define-key map "\e[106;5u" (kbd "C-j"))
    (define-key map "\e[109;5u" (kbd "C-m"))
    (define-key map "\e[1;9A" (kbd "M-<up>"))
    (define-key map "\e[1;9B" (kbd "M-<down>"))
    (define-key map "\e[1;9C" (kbd "M-<right>"))
    (define-key map "\e[1;9D" (kbd "M-<left>"))
    (define-key map "\e[1;10A" (kbd "M-S-<up>"))
    (define-key map "\e[1;10B" (kbd "M-S-<down>"))
    (define-key map "\e[1;10C" (kbd "M-S-<right>"))
    (define-key map "\e[1;10D" (kbd "M-S-<left>"))
    ))

; always hide menu bar
(menu-bar-mode -1) 

; enable ido-mode, enables autocompletion of filenames etc
(ido-mode t) 

; fuzzy matches file-names
(setq ido-enable-flex-matching t)

; auto reload files that have been changed outside of emacs
(global-auto-revert-mode t) 

; use shift+arrow keys to navigate windows
(windmove-default-keybindings) 

; save place of the cursor in buffers
(setq-default save-place t)

; save cursor locations in the places file
(setq save-place-file (concat user-emacs-directory "places"))

; store emacs file backups in backups
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory "backups"))))

; where to save custom configuration
(setq custom-file (concat user-emacs-directory "custom.el"))

; highlight matched parenthesis
(show-paren-mode 1)

; allow y or n as valid inputs to yes or no questions
(defalias 'yes-or-no-p 'y-or-n-p)

; enable dired dwim
(setq dired-dwim-target t)

;; ---- PACKAGES ----

(require 'package)

;;list the repositories containing them
(setq package-archives '(("elpa" . "https://elpa.gnu.org/packages/")
			 ("tromey" . "http://tromey.com/elpa/")
			 ("melpa" . "https://melpa.org/packages/")))

;;activate all packages (load autoloads)
(package-initialize)

;;fetch the list of packages available
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(unless package-archive-contents 
  (package-refresh-contents))

; list the packages you want
(setq package-list '(use-package))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; This is only needed once, near the top of the file
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (require 'use-package))

(use-package fontify-face :ensure t)
(use-package solarized-theme 
  :ensure t
  :init
  (load-theme 'solarized-dark))

(use-package magit :ensure t)

(use-package graphviz-dot-mode 
  :ensure t
  :config
  (setq graphviz-dot-indent-width 4))

;; (use-package tree-sitter 
;;   :ensure t
;;   :init 
;;   (global-tree-sitter-mode)
;;   (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))
;; (use-package tree-sitter-langs :ensure t)
;; (use-package tree-sitter-indent :ensure t)
  
(use-package swift-mode :ensure t)
(use-package lsp-sourcekit :ensure t
  :after lsp-mode
  :config
  (setq lsp-sourcekit-executable (string-trim (shell-command-to-string "xcrun --find sourcekit-lsp"))))

(use-package d2-mode 
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.d2" . d2-mode)))

(use-package ruby-mode
  :init
  (add-to-list 'auto-mode-alist '("Appfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Deliverfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Fastfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Podfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Snapfile" . ruby-mode))
)
