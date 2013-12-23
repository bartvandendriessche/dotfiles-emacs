(add-to-list 'load-path "~/.emacs.d/settings")

(require 'settings) ;; load default settings

(settings-el-get-sync)

;; (defun pdb-django-test ()
;;   (interactive
;;    (pdb (concat gud-pdb-command-name " " virtualenv-default-directory "/manage.py test " default-directory))))

;; (defadvice pdb (before gud-query-cmdline activate)
;;   "Fix command line with some Django knowledge"
;;   (interactive
;;    (list (gud-query-cmdline 'pdb (concat (or virtualenv-default-directory
;;                                              default-directory)
;;                                          "manage.py test")))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((virtualenv-workon . "caldai")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
