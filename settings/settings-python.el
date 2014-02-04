(progn
  (setq el-get-sources (append el-get-sources
                               '((:name jedi :after (progn
                                                      (add-hook 'python-mode-hook 'jedi:setup)
                                                      (setq jedi:install-imenu)
                                                      (setq jedi:use-shortcuts t)
                                                      (setq jedi:complete-on-dot t)))
                                 (:name pony-mode :after (progn
                                                           (put 'pony-settings 'safe-local-variable (lambda (variable) t))
                                                           (require 'pony-mode)))
                                 (:name virtualenv :after (progn
                                                            (put 'virtualenv-workon 'safe-local-variable 'stringp)
                                                            (put 'virtualenv-default-directory 'safe-local-variable 'stringp)))
                                 (:name virtualenvwrapper :type :elpa :after (progn
                                                                               (put 'project-venv-name 'safe-local-variable 'stringp))))))

  (defun settings-pony-ac-setup ()
    "Make sure ac-source-yasnippet is added to `ac-sources`"
    (interactive)
    (add-to-list 'ac-sources 'ac-source-yasnippet)
    (unless auto-complete-mode
      (auto-complete-mode)))

  ;; (add-hook 'pony-mode-hook 'settings-pony-ac-setup)

  (add-hook 'python-mode-hook (lambda ()
                                (if project-venv-name
                                    ((hack-local-variables)
                                     (venv-workon project-venv-name)))))

  (setq gud-pdb-command-name "python -m pdb"))

(provide 'settings-python)
