(progn
  (setq el-get-sources (append el-get-sources
                               '((:name auto-complete)
                                 (:name flycheck :type :elpa)
                                 (:name markdown-mode)
                                 (:name projectile)
                                 (:name git-gutter
                                        :after (progn
                                                 (global-git-gutter-mode +1)
                                                 (set-face-foreground 'git-gutter:modified "purple")
                                                 (set-face-foreground 'git-gutter:added "green")
                                                 (set-face-foreground 'git-gutter:deleted "red")))
                                 (:name web-mode :type :elpa
                                        :after (progn
                                                 (setq web-mode-markup-indent-offset 4)
                                                 (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode)))))))
  ;; ugh, screw yasnippet on windows
  (if (not (eq system-type 'windows-nt))
      (setq el-get-sources (append el-get-sources
                                   '((:name auto-complete-yasnippet)))))
  (add-to-list 'auto-mode-alist '("\\.zsh$" . shell-script-mode))
  (add-to-list 'auto-mode-alist '("\\.zsh-theme$" . shell-script-mode)))

(defun settings-pretty-lambdas ()
  "Replace occurrences of lambda with the greek lambda"
  (font-lock-add-keywords nil `(("(?\\(lambda\\>\\)"
                                 (0 (progn (compose-region (match-beginning 1) (match-end 1)
                                                           ,(make-char 'greek-iso8859-7 107))
                                           nil))))))

(defun settings-local-comment-auto-fill ()
  "Turn on auto-fill for comment blocks"
  (set (make-local-variable 'comment-auto-fill-only-comments) t)
  (auto-fill-mode t))

(defun settings-hl-line-mode ()
  "Turn on hl-line-mode if we support more than 8 bits of color"
  (when (> (display-color-cells) 8)
    (hl-line-mode t)))

(defun settings-local-column-number-mode ()
  "Show column numbers"
  (make-local-variable 'column-number-mode)
  (column-number-mode t))

(defun settings-cleanup-buffer-safe ()
  "Perform a bunch of safe operations on the whitespace content of a buffer.
Does not indent buffer, because it is used for a before-save-hook, and that might be bad"
  (interactive)
  (untabify (point-min) (point-max))
  (delete-trailing-whitespace)
  (set-buffer-file-coding-system 'utf-8))

(add-hook 'before-save-hook 'settings-cleanup-buffer-safe)

(defun settings-cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer.
Includes indent-buffer, which should not be called automatically on save"
  (interactive)
  (settings-cleanup-buffer-safe)
  (indent-region (point-min) (point-max)))

(global-set-key (kbd "C-c n") 'settings-cleanup-buffer)

(add-hook 'prog-mode-hook 'settings-pretty-lambdas)
(add-hook 'prog-mode-hook 'settings-local-comment-auto-fill)
(add-hook 'prog-mode-hook 'settings-hl-line-mode)
(add-hook 'prog-mode-hook 'settings-local-column-number-mode)

(provide 'settings-programming)
