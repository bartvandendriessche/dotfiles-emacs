(progn
  (setq el-get-sources (append el-get-sources
                               '((:name jedi :after (progn
                                                      (add-hook 'python-mode-hook 'jedi:setup)
                                                      (setq jedi:install-imenu)
                                                      (setq jedi:use-shortcuts t)
                                                      (setq jedi:complete-on-dot t)))
                                 (:name pony-mode :after (progn
                                                           (put 'pony-settings 'safe-local-variable (lambda (variable) t))))
                                 (:name virtualenv :after (progn
                                                            (put 'virtualenv-workon 'safe-local-variable 'stringp)
                                                            (put 'virtualenv-default-directory 'safe-local-variable 'stringp)))))))

(provide 'settings-python)
