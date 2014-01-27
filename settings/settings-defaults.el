;;; settings-defaults.el --- Default Emacs configuration
;;
;; Copyright (c) 2013 Bart Vandendriessche
;;
;; Author: Bart Vandendriessche <bart.vandendriessche@gmail.com>
;; URL:
;; Version: 0.1
;; Created: 2013-10-10
;; Keywords: convenience
;;
;; This file is NOT part of GNU Emacs.

;;; Commentary:
;;

(progn
  (ido-mode t) ;; auto-completes file-names etc
  (setq ido-enable-flex-matching t) ;; fuzzy matches file-names

  (menu-bar-mode -1) ;; always hide the menu bar

  (global-auto-revert-mode t) ;; auto-reload files that have been changed outside emacs

  (show-paren-mode 1) ;; highlight matched parenthesis

  (setq-default save-place t) ;; save place of the cursor in buffers
  (setq save-place-file (concat user-emacs-directory "places")) ;; save cursor locations in the places file

  (setq backup-directory-alist `(("." . ,(concat user-emacs-directory "backups")))) ;; store emacs file backups in backups

  (windmove-default-keybindings) ;; use Shift-Arrow keys to navigate windows
  (define-key global-map [select] 'windmove-up) ;; make S-up work in iTerm2 (likely a bug with xterm-256 mode

  (defalias 'yes-or-no-p 'y-or-n-p) ;; allow y or n as valid inputs to yes or no questions
  (setq el-get-sources '((:name color-theme-solarized :after (load-theme 'solarized-dark t))
                         (:name magit :after (progn
                                               (global-set-key (kbd "C-c g") 'magit-status)))
                         (:name markdown-mode))))

(provide 'settings-defaults)
