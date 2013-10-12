(progn
  (setq el-get-sources (append el-get-sources
			       '((:name jedi :after (progn
						      (add-hook 'python-mode-hook 'jedi:setup)
						      (setq jedi:complete-on-dot t)))
				 (:name pony-mode :after (require 'pony-mode))
				 (:name virtualenv)))))

(provide 'settings-python)
