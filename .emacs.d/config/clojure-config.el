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
(add-to-list 'auto-mode-alist '("\\.map\\'" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.set\\'" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.vector\\'" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.repl\\'" . clojure-mode))
(setq cider-repl-pop-to-buffer-on-connect nil)
(setq cider-session-name-template "%j-----%r-----%p")
(setq cider-repl-wrap-history t)
(setq cider-repl-history-size 1000)
(setq cider-repl-history-file "~/.emacs.d/cider-history")
(setq cider-prompt-save-file-on-load nil)
(setq cider-auto-select-error-buffer nil)
(setq cider-repl-use-clojure-font-lock t)
(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-minimum-prefix-length 1)


(defun cider-eval-last-sexp-in-buffer-as-current-region ()
  "Evaluate the expression preceding point and replace it with its result."
  (interactive)
  (let ((last-sexp (cider-last-sexp)))
    (cider-nrepl-sync-request:eval last-sexp)
    (region-beginning)
    (cider-interactive-eval last-sexp
                            (cider-eval-print-handler)
                            nil
                            (cider--nrepl-pr-request-map))
    (region-end)))


(defun cider-tap-last-expression ()
       (interactive)
       (cider-interactive-eval
         (format "(tap> %s)"
                 (cider-last-sexp))))


(defun clerk-show ()
  (interactive)
  (when-let
      ((filename
        (buffer-file-name)))
    (save-buffer)
    (cider-interactive-eval
     (concat "(nextjournal.clerk/show! \"" filename "\")"))))

(provide 'clojure-config)
