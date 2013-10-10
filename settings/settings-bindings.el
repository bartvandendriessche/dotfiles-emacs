(progn
  ;; Use regex searches by default.
  (global-set-key (kbd "C-s") 'isearch-forward-regexp)
  (global-set-key (kbd "\C-r") 'isearch-backward-regexp)
  (global-set-key (kbd "M-%") 'query-replace-regexp)
  (global-set-key (kbd "C-M-s") 'isearch-forward)
  (global-set-key (kbd "C-M-r") 'isearch-backward)
  (global-set-key (kbd "C-M-%") 'query-replace)

  ;; Font size
  (define-key global-map (kbd "C-+") 'text-scale-increase)
  (define-key global-map (kbd "C--") 'text-scale-decrease)

  ;; Completion that uses many different methods to find options.
  (global-set-key (kbd "M-/") 'hippie-expand)

   ;; Jump to a definition in the current file. (Protip: this is awesome.)
  (global-set-key (kbd "C-x C-i") 'imenu)
  )

(provide 'settings-bindings)
