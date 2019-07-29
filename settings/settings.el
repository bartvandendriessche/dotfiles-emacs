(progn
  (setq el-get-sources '()) ;; make sure el-get-sources is defined
  (require 'settings-elpa) ;; load this before el-get (el-get uses elpa for some packages)
  (require 'settings-defaults) ;; set up some defaults
  (require 'settings-bindings) ;; default keybindings
  (require 'settings-programming) ;; base configuration for 'prog-mode
  (require 'settings-python) ;; python specific packages and configuration
  (require 'settings-ruby) ;; ruby specific packages and configuration
  (require 'settings-lisp) ;; lisp schwag
  (require 'settings-docker) ;; docker plugins
  (require 'settings-graphviz) ;; graphviz
  (require 'settings-el-get) ;; make sure el-get is available
  )

(provide 'settings)
