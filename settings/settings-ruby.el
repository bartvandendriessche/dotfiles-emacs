(progn
  (add-to-list 'auto-mode-alist '("Podfile$" . ruby-mode))
  ;; Ruby config files uses by fastlane (http://fastlane.tools)
  (add-to-list 'auto-mode-alist '("Appfile$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Deliverfile$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Fastfile$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Snapfile$" . ruby-mode)))

(provide 'settings-ruby)
