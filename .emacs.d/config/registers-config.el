;;;;  REGISTERS **
(defvar refile-map (make-sparse-keymap))
(setq find-file-visit-truename t)
(defmacro defregister (key file)
  `(progn
     (set-register ,key (cons 'file ,file))
     (define-key refile-map
       (char-to-string ,key)
       (lambda (prefix)
         (interactive "p")
         (let ((org-refile-targets '(((,file) :maxlevel . 6)))
               (current-prefix-arg (or current-prefix-arg '(4))))
           (call-interactively 'org-refile))))))


(defregister ?I "~/.emacs.d/init.el")
(defregister ?E "~/.emacs.d")
(defregister ?R "~/.emacs.d/config/registers-config.el")
(defregister ?C "~/.config")
(defregister ?Z "~/.zshrc")
(defregister ?N "~/.config/nixpkgs/home.nix")

(defregister ?j "~/d23m/resources/registers")
(defregister ?h "~/d23m/resources/registers")
(defregister ?f "~/d23m/resources/registers/fns")
(defregister ?t "~/d23m/test/tools/drilling")
(defregister ?d "~/d23m/deps.edn")
(defregister ?b "~/d23m/bb.edn")
(defregister ?p "~/d23m/package.json")
(defregister ?s "~/d23m/shadow-cljs.edn")
(defregister ?n "~/d23m/dev/nb")

(global-set-key     (kbd "C-c C-c a") 'append-to-register)
(global-set-key     (kbd "C-c C-c i") 'insert-register)
(global-set-key     (kbd "C-c C-c w") 'window-configuration-to-register)
(global-set-key     (kbd "C-c C-c y") 'copy-to-register)
(global-set-key     (kbd "C-x r l")   'list-register)

(provide 'registers-config)
