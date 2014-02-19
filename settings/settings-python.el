(progn
  (setq el-get-sources (append el-get-sources
                               '((:name virtualenv :after (progn
                                                            (put 'virtualenv-workon 'safe-local-variable 'stringp)
                                                            (put 'virtualenv-default-directory 'safe-local-variable 'stringp)))
                                 (:name virtualenvwrapper :type :elpa :after (progn
                                                                               (put 'project-venv-name 'safe-local-variable 'stringp))))))

  (if (not (eq system-type 'windows-nt))
      (setq el-get-sources (append el-get-sources
                                   '((:name jedi :after (progn
                                                          (add-hook 'python-mode-hook 'jedi:setup)
                                                          (setq jedi:install-imenu)
                                                          (setq jedi:use-shortcuts t)
                                                          (setq jedi:complete-on-dot t)))))))

  (add-hook 'python-mode-hook (lambda ()
                                (if project-venv-name
                                    ((hack-local-variables)
                                     (venv-workon project-venv-name)))))

  (when (require 'projectile nil 'noerror)
    (add-hook 'python-mode-hook 'projectile-mode))

  ;; be sure to `pip install flake8` for python flychecking
  (add-hook 'python-mode-hook 'flycheck-mode)

  (setq gud-pdb-command-name "python -m pdb"))

(provide 'settings-python)
