(progn
  (setq el-get-sources (append el-get-sources
                               '((:name dockerfile-mode :type :elpa
                                        :after (progn
                                                 (put 'virtualenv-workon 'safe-local-variable 'stringp)
                                                 (put 'virtualenv-default-directory 'safe-local-variable 'stringp)))
                                 ))))
(provide 'settings-docker) 
