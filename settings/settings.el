(progn
  (require 'settings-defaults) ;; set up some defaults
  (require 'settings-bindings) ;; default keybindings
  (require 'settings-elpa) ;; load this before el-get (el-get uses elpa for some packages)
  (require 'settings-el-get)) ;; make sure el-get is available

(provide 'settings)
