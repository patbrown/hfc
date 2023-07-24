(define-key emacs-lisp-mode-map (kbd "C-c C-e") 'eval-last-sexp)
(defun keymap-unset-key (key keymap)
  "Remove binding of KEY in a keymap KEY is a string or vector
representing a sequence of keystrokes."
  (interactive
   (list (call-interactively #'get-key-combo)
	 (completing-read "Which map: " minor-mode-map-alist nil t)))
  (let ((map (rest (assoc (intern keymap) minor-mode-map-alist))))
    (when map
      (define-key map key nil)
      (message  "%s unbound for %s" key keymap))))

(use-package parseedn
  :straight t)

(use-package vimish-fold
  :straight t
  :init
  (vimish-fold-global-mode 1)
  (global-set-key (kbd "C-c f s") #'vimish-fold)
  (global-set-key (kbd "C-c f d") #'vimish-fold-delete)
  (global-set-key (kbd "C-c f a") #'vimish-fold-unfold-all)
  (global-set-key (kbd "C-c f A") #'vimish-fold-refold-all)
  (global-set-key (kbd "C-c f f") #'vimish-fold-toggle)
  (global-set-key (kbd "C-c f F") #'vimish-fold-toggle-all))
(use-package markdown-mode
  :straight t
  :defer t)
(use-package project
  :straight t
  :defer t)

(use-package paredit
  :straight t
  :ensure t
  :init
  (eval-after-load "paredit"
  #'(define-key paredit-mode-map (kbd "C-j") 'newline-and-indent))
  (autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
  (add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)
  (add-hook 'prog-mode-hook #'enable-paredit-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
  (add-hook 'ielm-mode-hook #'enable-paredit-mode)
  (add-hook 'lisp-mode-hook #'enable-paredit-mode)
  (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
  (add-hook 'scheme-mode-hook #'enable-paredit-mode)
  (add-hook 'clojure-mode-hook #'enable-paredit-mode)
  (add-hook 'cider-repl-mode-hook #'enable-paredit-mode)
  :config
  (show-paren-mode t)
  (define-key paredit-mode-map (kbd "M-s") nil)
  :diminish nil)

(use-package paredit-everywhere
  :straight t
  :config
  (add-hook 'prog-mode-hook 'paredit-everywhere-mode)
  (add-hook 'css-mode-hook 'paredit-everywhere-mode))


(use-package rainbow-delimiters
  :straight t
  :init
  (progn
    (progn (add-hook 'cider-repl-mode-hook #'rainbow-delimiters-mode)
	 (add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
         (add-hook 'cider-mode-hook #'rainbow-delimiters-mode)
         (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))))

(use-package projectile
  :straight t
  :diminish projectile-mode
  :config (projectile-mode)
  :init
  (when (file-directory-p "~/")
    (setq projectile-project-search-path '("~/")))
  (setq projectile-switch-project-action #'projectile-dired))

(use-package counsel-projectile
 :straight t
 :after projectile
 :config
 (counsel-projectile-mode 1))


(use-package yaml-mode
  :straight t
  :config
  (add-hook 'yaml-mode-hook
	    (lambda () (define-key yaml-mode-map "\C-m" 'newline-and-indent))))

(use-package lsp-mode
  :straight t
  :ensure t
  :hook
  ((clojure-mode . lsp))
  :config
  (lsp-enable-which-key-integration t))

(use-package lsp-ui
  :straight t
  :commands lsp-ui-mode)

(use-package lsp-ivy
  :straight t)

(use-package aggressive-indent
  :straight t
  :ensure t)


(defun clerk-show ()
  (interactive)
  (when-let
      ((filename
        (buffer-file-name)))
    (save-buffer)
    (cider-interactive-eval
     (concat "(nextjournal.clerk/show! \"" filename "\")"))))

(provide 'programming-config)
