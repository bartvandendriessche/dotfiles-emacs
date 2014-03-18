(progn
  (setq el-get-sources (append el-get-sources
                               '((:name virtualenv
                                        :after (progn
                                                 (put 'virtualenv-workon 'safe-local-variable 'stringp)
                                                 (put 'virtualenv-default-directory 'safe-local-variable 'stringp)))
                                 (:name virtualenvwrapper :type :elpa
                                        :after (progn
                                                 (put 'project-venv-name 'safe-local-variable 'stringp))))))

  ;; don't bother getting jedi running on windows
  (if (not (eq system-type 'windows-nt))
      (setq el-get-sources (append el-get-sources
                                   '((:name jedi
                                            :after (progn
                                                     (add-hook 'python-mode-hook 'jedi:setup)
                                                     (setq jedi:install-imenu)
                                                     (setq jedi:use-shortcuts t)
                                                     (setq jedi:complete-on-dot t)))))))
  ;; load virtual environment if possible
  (add-hook 'python-mode-hook '(lambda ()
                                 (if project-venv-name
                                     ((hack-local-variables)
                                      (venv-workon project-venv-name)))))

  ;; use projectile-mode in python projects
  (add-hook 'python-mode-hook 'projectile-on)

  ;; be sure to `pip install flake8` for python flychecking
  (add-hook 'python-mode-hook 'flycheck-mode)

  (defun ac-python-mode-setup ()
    (require 'auto-complete-config)
    (yas-global-mode 1)
    (add-to-list 'ac-sources 'ac-source-yasnippet))

  (add-hook 'python-mode-hook 'ac-python-mode-setup)

  ;; python debugger command
  (setq gud-pdb-command-name "python -m pdb"))

(provide 'settings-python)
