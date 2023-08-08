(load-library "~/.emacs.d/config/bootstrap-config.el")
(mapc 'load (file-expand-wildcards "~/.emacs.d/config/*.el"))
(mapc 'load-library (file-expand-wildcards "~/.emacs.d/config/*.el"))

(add-to-list 'default-frame-alist '(left-fringe . 0))
(add-to-list 'default-frame-alist '(right-fringe . 0))
(global-unset-key (kbd "<left>"))
(global-unset-key (kbd "<right>"))
(global-unset-key (kbd "<up>"))
(global-unset-key (kbd "<down>"))
;(global-unset-key (kbd "C-o"))
(global-unset-key (kbd "C-v"))
(global-unset-key (kbd "M-s"))


(if (eq system-type 'darwin)
    (mapc 'load (file-expand-wildcards "~/.emacs.d/macos/*.el"))
  (mapc 'load (file-expand-wildcards "~/.emacs.d/linux/*.el")))

(if (eq system-type 'darwin)
    (mapc 'load-library (file-expand-wildcards "~/.emacs.d/macos/*.el"))
    (mapc 'load-library (file-expand-wildcards "~/.emacs.d/linux/*.el")))

(defun reload-emacs ()
  "Reload the init file."
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(defun random-element-of-list (items)
  (let* ((size (length items))
         (index (random size)))
    (nth index items)))

(use-package spacemacs-theme
  :straight t
  :ensure t
  :init (load-theme 'spacemacs-dark t))


;; (if (string= (system-name) "debian")
;;       (load-theme 'spacemacs-dark t)
;;     (load-theme 'solarized-dark t))

(defun use-theme (theme) (load-theme theme t))



 (use-package magit
   :straight t
   :init (if (not (boundp 'project-switch-commands)) 
 	    (setq project-switch-commands nil)))

(use-package transient
  :straight t)


;; (use-package yasnippet
;;   :straight t
;;   :config
;;   (yas-global-mode 1))

(use-package company
  :straight t)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(spacemacs-dark))
 '(custom-safe-themes
   '("628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" default))
 '(warning-suppress-types '((use-package) (comp) (comp) (comp) (comp) (comp)))
 '(zoom-mode t nil (zoom))
 '(zoom-size '(0.618 . 0.618)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor ((t (:background "#657b83" :foreground "#fdf6e3" :inverse-video t :weight extra-bold))))
 '(switch-window-label ((t (:box nil :underline nil :height 10.0)))))


(straight-use-package 'project)
(global-set-key (kbd "C-v") 'backward-char)
