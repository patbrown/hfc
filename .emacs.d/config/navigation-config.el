(use-package disable-mouse
  :straight t
  :ensure t
  :init
  (global-disable-mouse-mode))

(use-package hydra
  :straight t
  :defer t)

;; (use-package edwina
;;   :straight t
;;   :ensure t
;;   :config
;;   (edwina-mode 1))

(use-package avy
  :straight t
  :defer t)

;; Tab line mode
(global-tab-line-mode t)
(setq tab-line-new-button-show nil)
(setq tab-line-separator "  ")
(setq tab-line-close-button-show nil)

;; (use-package centaur-tabs
;;   :demand
;;   :straight t
;;   :config
;;   (centaur-tabs-mode t)
;;   (setq centaur-tabs--buffer-show-groups nil)
;;   :bind
;;   ("C-c v" . centaur-tabs-backward)
;;   ("C-c b" . centaur-tabs-forward)
;;   ("C-c m" . centaur-tabs--groups-menu))

(use-package key-chord
  :straight t
  :defer t
  :init
  (key-chord-mode 1)
  (key-chord-define-global "fj" 'hack/body))

(use-package frog-jump-buffer
  :straight t
  :defer t)
(use-package ace-mc
  :straight t
  :defer t)
(use-package npm
  :straight t
  :defer t)
(use-package expand-region
  :straight t
  :defer t)
(use-package zzz-to-char
  :straight t
  :defer t)
(use-package goto-last-change
  :straight t
  :defer t)
(use-package crux
  :straight t
  :defer t)
(use-package ace-window
  :straight t
  :defer t)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
(defhydra hack (global-map "C-c '")
  ("c" avy-goto-char :exit t)
  ("x" er/expand-region)
  ("z" zzz-to-char)
  ("u" goto-last-change)
  ("i" crux-find-user-init-file)
  ("r" crux-rename-file-and-buffer)
  ("d" crux-delete-file-and-buffer)
  ("t" crux-transpose-windows)
  ("f" crux-recentf-find-file)
  (">" insert-register)
  ("<" append-to-register)
  ("o" view-register)
  ("m" ace-mc-add-multiple-cursors :exit t)
  ("n" npm)
  ("w" avy-goto-word-1 :exit t)
  ("l" avygoto-line :exit t)
  ;; ("f" paredit-forward-down)
  ;; ("b" paredit-backward-up)
  ;; ("F" paredit-forward-up)
  ;; ("B" paredit-backward-down)
  ;; ("s" paredit-splice-sexp)
  ;; ("S" paredit-split-sexp)
  ;; ("(" paredit-wrap-round)
  ;; ("[" paredit-wrap-square)
  ;; ("{" paredit-wrap-curly)
  ("y" copy-to-buffer)
  ("g" magit-status)
  )

(defhydra hydra-find (global-map "C-c +")
  ("f" counsel-projectile-find-file))


(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
             (next-win-buffer (window-buffer (next-window)))
             (this-win-edges (window-edges (selected-window)))
             (next-win-edges (window-edges (next-window)))
             (this-win-2nd (not (and (<= (car this-win-edges)
                                         (car next-win-edges))
                                     (<= (cadr this-win-edges)
                                         (cadr next-win-edges)))))
             (splitter
              (if (= (car this-win-edges)
                     (car (window-edges (next-window))))
                  'split-window-horizontally
                'split-window-vertically)))
        (delete-other-windows)
        (let ((first-win (selected-window)))
          (funcall splitter)
          (if this-win-2nd (other-window 1))
          (set-window-buffer (selected-window) this-win-buffer)
          (set-window-buffer (next-window) next-win-buffer)
          (select-window first-win)
          (if this-win-2nd (other-window 1))))))

(defun vertically-split-last-buffer (prefix)
  "Split the window vertically and display the previous buffer."
  (interactive "p")
  (split-window-vertically)
  (other-window 1 nil)
  (if (= prefix 1)
      (switch-to-next-buffer)))

(defun horizontally-split-last-buffer (prefix)
  "Split the window horizontally and display the previous buffer."
  (interactive "p")
  (split-window-horizontally)
  (other-window 1 nil)
  (if (= prefix 1) (switch-to-next-buffer)))

(use-package ace-jump-mode
  :straight t
  :init
  (autoload 'ace-jump-mode "ace-jump-mode" "Emacs quick move minor mode" t)
  ;(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
  (setq ace-jump-mode-gray-background nil)
  (setq ace-jump-mode-move-keys
        '(?j ?f ?k ?d ?l ?s ?\; ?a ?h ?g ?u ?r ?i ?e ?o ?w ?p ?q ?y ?t ?m ?v ?, ?c ?. ?x ?/ ?z ?n ?b ?7 ?4 ?8 ?3 ?9 ?2 ?0 ?1 ?6 ?5)))


(use-package dirvish
  :straight t
  :config
  (global-set-key (kbd "C-c C-d") 'dirvish)
  )

(winner-mode 1)

(use-package windmove
  :straight t
  :config
  (defun ignore-error-wrapper (fn)
    "Funtion return new function that ignore errors.
   The function wraps a function with `ignore-errors' macro."
    (lexical-let ((fn fn))
      (lambda ()
        (interactive)
        (ignore-errors
          (funcall fn)))))
)
  (global-set-key (kbd "C-c <left>") 'windmove-left)
  (global-set-key (kbd "C-c <right>") 'windmove-right)
  (global-set-key (kbd "C-c <up>")   'windmove-up)
  (global-set-key (kbd "C-c <down>") 'windmove-down)

(use-package buffer-move
  :straight t
  :ensure t
  :config
  ;(setq buffer-move-stay-after-swap t)
  ;(setq buffer-move-behavior 'move)
  )

(defun rotate-windows ()
  "Rotate your windows"
  (interactive)
  (cond ((not (> (count-windows)1))
         (message "You can't rotate a single window!"))
        (t
         (setq i 1)
         (setq numWindows (count-windows))
         (while  (< i numWindows)
           (let* (
                  (w1 (elt (window-list) i))
                  (w2 (elt (window-list) (+ (% i numWindows) 1)))

                  (b1 (window-buffer w1))
                  (b2 (window-buffer w2))

                  (s1 (window-start w1))
                  (s2 (window-start w2)))
             (set-window-buffer w1  b2)
             (set-window-buffer w2 b1)
             (set-window-start w1 s2)
             (set-window-start w2 s1)
             (setq i (1+ i)))))))

(defun smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.

Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

(use-package multiple-cursors
  :straight t
  :defer t
  :bind (("C-C M->" . mc/mark-next-like-this)
         ("C-c M-<" . mc/mark-previous-like-this)
         ("C-c M-!" . mc/mark-all-like-this)
         ("C-c C-c M-!" . mc/edit-lines)
	 ))

(use-package undo-tree
  :straight t
  :defer t
  :ensure t
  :diminish undo-tree-mode
  :init
  (progn
    (require 'undo-tree)
    (global-undo-tree-mode)
    (setq undo-tree-visualizer-timestamps t)
    (setq undo-tree-auto-save-history nil)
    (setq undo-tree-visualizer-diff t)))

;; (use-package switch-window
;;   :ensure t
;;   :config
;;   (global-set-key (kbd "C-x o") 'switch-window)
;;   (global-set-key (kbd "C-x 1") 'switch-window-then-maximize)
;;   (global-set-key (kbd "C-x 2") 'switch-window-then-split-below)
;;   (global-set-key (kbd "C-x 3") 'switch-window-then-split-right)
;;   (global-set-key (kbd "C-x 0") 'switch-window-then-delete)
;;   (global-set-key (kbd "C-x 4 d") 'switch-window-then-dired)
;;   (global-set-key (kbd "C-x 4 f") 'switch-window-then-find-file)
;;   (global-set-key (kbd "C-x 4 C-f") 'switch-window-then-find-file)
;;   (global-set-key (kbd "C-x 4 C-o") 'switch-window-then-display-buffer)
;;   (global-set-key (kbd "C-x 4 0") 'switch-window-then-kill-buffer)
;;   (setq switch-window-threshold 2)
;;   (setq switch-window-shortcut-style 'qwerty)
;;   (setq switch-window-auto-resize-window t)
;;   (setq switch-window-default-window-size 0.66))

(use-package zoom
  :straight t
  :ensure t
  :init
  (progn
    (custom-set-variables
     '(zoom-mode t))
    (custom-set-variables
     '(zoom-size '(0.618 . 0.618)))    
    (global-set-key (kbd "C-x +") 'zoom)
    ))

(provide 'navigation-config)
