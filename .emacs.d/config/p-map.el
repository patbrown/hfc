(global-unset-key (kbd "C-c c"))
(define-prefix-command 'start-map)
(define-prefix-command 'clj-map)
(define-prefix-command 'lisp-map)
(define-prefix-command 'jump-map)
(define-prefix-command 'tab-map)
(define-prefix-command 'z-map)
(define-prefix-command 'o-map)
(define-prefix-command 'v-map)
(global-set-key (kbd "C-c c") 'start-map)
(define-key start-map (kbd "b") 'bufler-list)
(define-key start-map (kbd "c") 'clj-map)
(define-key start-map (kbd "e") 'eval-buffer)
(define-key start-map (kbd "a") 'winner-undo)
(define-key start-map (kbd "s") 'winner-redo)
(define-key start-map (kbd "d") 'windmove-left)
(define-key start-map (kbd "f") 'windmove-right)
(define-key start-map (kbd "j") 'jump-map)
(define-key start-map (kbd "l") 'lisp-map)
(define-key start-map (kbd "n") 'tab-line-switch-to-next-tab)
(define-key start-map (kbd "p") 'tab-line-switch-to-prev-tab)
(define-key start-map (kbd "u") 'swiper-all)
(define-key start-map (kbd "w") 'burly-open-bookmark)
(define-key start-map (kbd "x") 'delete-indentation)
(define-key start-map (kbd "z") 'z-map)

(smartrep-define-key
    global-map "C-c ;" '(("f" . 'windmove-up)
			 ("d" . 'windmove-down)
			 ("s" . 'windmove-right)
			 ("a" . 'windmove-down)
			 ("g" . 'bufler-list)
			 ("h" . 'buf-move)
			 ("j" . 'buf-move-up)
			 ("k" . 'buf-move-down)
			 ("l" . 'buf-move-left)
			 (";" . 'buf-move-right)
			 ("n" . 'winner-redo)
			 ("p" . 'winner-undo)
			 ("b" . 'ivy-switch-buffer)
			 ("x" . 'kill-buffer-and-window)
			 ("SPC" . 'jump-map)
			 ))

(smartrep-define-key
    global-map "C-c x" '(("x" . 'delete-indentation)))

;; (smartrep-define-key
;;     global-map "C-c t" '(("n" . 'tab-line-switch-to-next-tab)
;; 		       ("p" . 'tab-line-switch-to-prev-tab)
;; 		       ("x" . 'kill-buffer)
;; 		       ("f" . 'tab-next)
;; 		       ("b" . 'tab-previous)
;; 		       ("r" . 'tab-rename)
;; 		       ("X" . 'tab-close)
;; 		       ("k" . 'kill-buffer)))

;; Jump Map
(global-set-key (kbd "C-c j") 'jump-map)
(define-key jump-map (kbd "a") 'beginning-of-buffer)
(define-key jump-map (kbd "b") 'burly-open-bookmark)
(define-key jump-map (kbd "e") 'end-of-buffer)
(define-key jump-map (kbd "f") 'ace-window)
(define-key jump-map (kbd "c") 'ace-jump-char-mode)
(define-key jump-map (kbd "l") 'ace-jump-line-mode)
(define-key jump-map (kbd "n") 'tab-line-switch-to-next-tab)
(define-key jump-map (kbd "p") 'tab-line-switch-to-prev-tab)
(define-key jump-map (kbd "j") 'jump-to-register)
(define-key jump-map (kbd "w") 'ace-jump-word-mode)
(define-key jump-map (kbd "x") 'tab-line-close-tab)
(define-key jump-map (kbd "z") 'ace-jump-zap-up-to-char)

;; Lisp Map mostly paredit
(global-set-key (kbd "C-c l") 'lisp-map)
(define-key lisp-map (kbd ";") 'paredit-forward-slurp-sexp)
(define-key lisp-map (kbd "l") 'paredit-backward-slurp-sexp)
(define-key lisp-map (kbd "k") 'paredit-forward-barf-sexp)
(define-key lisp-map (kbd "j") 'paredit-backward-barf-sexp)
(define-key lisp-map (kbd "r") 'paredit-wrap-round)
(define-key lisp-map (kbd "c") 'paredit-wrap-curly)
(define-key lisp-map (kbd "s") 'paredit-wrap-square)
    (smartrep-define-key
        global-map "M-p" '((";" . 'paredit-forward-slurp-sexp)
                           ("l" . 'paredit-backward-slurp-sexp)
                           ("k" . 'paredit-forward-barf-sexp)
                           ("j" . 'paredit-backward-barf-sexp)
                           ("r" . 'paredit-wrap-round)
			   ("c" . 'paredit-wrap-curly)
			   ("s" . 'paredit-wrap-square)))


;; Z map
(global-set-key (kbd "C-c z") 'ace-jump-zap-up-to-char)
(global-set-key (kbd "C-c C-c z") 'ace-jump-zapto-char)

(provide 'pmap-config)
