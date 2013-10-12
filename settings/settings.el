(progn
  (require 'settings-defaults) ;; set up some defaults
  (require 'settings-bindings) ;; default keybindings
  (require 'settings-programming) ;; base configuration for 'prog-mode
  (require 'settings-elpa) ;; load this before el-get (el-get uses elpa for some packages)
  (require 'settings-python) ;; python specific packages and configuration
  (require 'settings-el-get)) ;; make sure el-get is available

(provide 'settings)
