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
                                                     (setq jedi:complete-on-dot t))))))))

(defun settings-ac-python-mode-setup ()
  (require 'auto-complete-config)
  (yas-global-mode 1)
  (add-to-list 'ac-sources 'ac-source-yasnippet))

(defun settings-venv-name-from-dot-venv-file (dot-venv-file)
  "Reads the virtualenv from a .venv file"
  (when (file-exists-p dot-venv-file)
    (with-temp-buffer
      (insert-file-contents dot-venv-file)
      (if (string-match "[ \t]*$" (buffer-string))
          (replace-match "" nil nil (buffer-string))
        (buffer-string)))))

(defun settings-guess-venv ()
  "Guess the correct virtualenv for current file."
  (require 'projectile)
  (let* ((dot-venv-file (concat (file-name-as-directory (projectile-project-root)) ".venv"))
         (venv-name (settings-venv-name-from-dot-venv-file dot-venv-file)))
    (when venv-name venv-name)))

(defun settings-guess-venv-and-activate ()
  "Guesses the correct virtualenv, and activates it."
  (let ((venv-name (settings-guess-venv)))
    (when venv-name
      (message "Working on virtualenv %s" venv-name)
      (venv-workon venv-name))))


;; use projectile-mode in python projects
(add-hook 'python-mode-hook 'projectile-on)
;; be sure to `pip install flake8` for python flychecking
(add-hook 'python-mode-hook 'flycheck-mode)
;; setup python yasnippet autocomplete
(add-hook 'python-mode-hook 'settings-ac-python-mode-setup)
;; try to guess the correct virtualenv
(add-hook 'python-mode-hook 'settings-guess-venv-and-activate)

;; python debugger command
(setq gud-pdb-command-name "python -m pdb")

(provide 'settings-python)
