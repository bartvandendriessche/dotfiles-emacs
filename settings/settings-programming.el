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


(add-hook 'prog-mode-hook 'settings-pretty-lambdas)
(add-hook 'prog-mode-hook 'settings-local-comment-auto-fill)
(add-hook 'prog-mode-hook 'settings-hl-line-mode)
(add-hook 'prog-mode-hook 'settings-local-column-number-mode)

(provide 'settings-programming)
