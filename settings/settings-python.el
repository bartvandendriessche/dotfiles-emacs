(progn
  (setq el-get-sources (append el-get-sources
			       '((:name jedi :after (progn
						      (add-hook 'python-mode-hook 'jedi:setup)
						      (setq jedi:install-imenu)
						      (setq jedi:use-shortcuts t)
						      (setq jedi:complete-on-dot t)))
				 (:name pony-mode
					:description "A Django mode for Emacs, with a few minor tweaks."
					:type github
				 	:pkgname "bartvandendriessche/pony-mode"
					:branch "caldai"
				 	:load-path "src"
					:features pony-mode)
				 (:name virtualenv)))))

(provide 'settings-python)
