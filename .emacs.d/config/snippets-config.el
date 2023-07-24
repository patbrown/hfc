(use-package yasnippet
  :straight t
  :defer t)
(require 'yasnippet)
(yas-global-mode 1)
(use-package auto-yasnippet
  :straight t
  :defer t)
(define-key yas-minor-mode-map (kbd "M-z") 'yas-expand)

;; (global-set-key (kbd "C-c C-y w")   #'aya-create)
;; (global-set-key (kbd "C-c C-y TAB") #'aya-expand)
;; (global-set-key (kbd "C-c C-y SPC") #'aya-expand-from-history)
;; (global-set-key (kbd "C-c C-y d")   #'aya-delete-from-history)
;; (global-set-key (kbd "C-c C-y c")   #'aya-clear-history)
;; (global-set-key (kbd "C-c C-y n")   #'aya-next-in-history)
;; (global-set-key (kbd "C-c C-y p")   #'aya-previous-in-history)
;; (global-set-key (kbd "C-c C-y s")   #'aya-persist-snippet)
;; (global-set-key (kbd "C-c C-y o")   #'aya-open-line)

(use-package ivy-yasnippet
  :straight t
  :defer t
  )

(provide 'snippets-config)
