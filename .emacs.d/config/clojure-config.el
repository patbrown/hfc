(use-package cider
  :straight t
  :ensure t)

(add-hook 'clojure-mode-hook 'lsp)
(add-hook 'clojurescript-mode-hook 'lsp)
(add-hook 'clojurec-mode-hook 'lsp)
(setq clojure-toplevel-inside-comment-form t)
(setq clojure-align-forms-automatically t)
(add-to-list 'auto-mode-alist '("\\.selmer\\'" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.repl\\'" . clojure-mode))
(add-hook 'clojure-mode-hook 'lsp)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-minimum-prefix-length 1)

(provide 'clojure-config)
