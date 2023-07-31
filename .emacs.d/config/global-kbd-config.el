(use-package which-key
  :straight t
  :defer t
  :init
  (require 'which-key)
  (which-key-mode))

(use-package discover
  :straight t
  :defer t
  :config
  (global-discover-mode 1))

(use-package discover-my-major
  :straight t
  :defer t
  :config
  (global-set-key (kbd "C-h C-m") 'discover-my-major))

(global-set-key     (kbd "M-h")               'fzf)
(global-set-key     (kbd "C-i")               'completion-at-point)
(global-set-key     (kbd "C-x C-r")               'counsel-register)
(global-set-key     (kbd "C-c C-x r")         'eval-region)
(global-set-key     (kbd "C-c C-x b")         'eval-buffer)
(global-set-key     (kbd "RET")               'newline-and-indent)
(global-set-key     (kbd "C-j")               'newline-and-indent)
(global-set-key     (kbd "C-l")               'goto-line)
(global-set-key     (kbd "M-;")               'comment-dwim)
(global-set-key     (kbd "C-c a")               'beginning-of-buffer)
(global-set-key (kbd "C-t") 'forward-paragraph)
(global-set-key (kbd "C-r") 'backward-paragraph)
(global-set-key     (kbd "C-c e")               'end-of-buffer)
(global-set-key     (kbd "C-h C-f")           'find-function)
(global-set-key     (kbd "C-h C-k")           'find-function-on-key)
(global-set-key     (kbd "C-h C-v")           'find-variable)
(global-set-key     (kbd "C-h C-l")           'find-library)
(global-set-key     (kbd "C-SPC")             'set-mark-command)
(global-set-key (kbd "C-x |")                 'toggle-window-split)
(global-set-key (kbd "C-c w")                 'rotate-windows)
(global-set-key [remap move-beginning-of-line]
                'smarter-move-beginning-of-line)
(global-set-key (kbd "C-c C-w")               'kill-ring-save)
(global-set-key (kbd "C-c C-p")               'ace-window)
(global-set-key (kbd "S-C-<right>")           'paredit-forward-slurp-sexp)
(global-set-key (kbd "S-C-<left>")            'paredit-backward-slurp-sexp)
(global-set-key (kbd "S-C-<up>")              'paredit-backward)
(global-set-key (kbd "S-C-<down>")            'paredit-forward)
(global-set-key (kbd "C-c C-j")               'jump-to-register)
(global-set-key (kbd "C-c C-x C-k")           'browse-kill-ring)
(global-set-key (kbd "M-x")                   'counsel-M-x)
;(global-set-key (kbd "C-c g")                 'counsel-git)
(global-set-key (kbd "C-c G")                 'counsel-git-grep)
(global-set-key (kbd "C-x b") 'ivy-switch-buffer)
(global-set-key (kbd "C-x f") 'projectile-find-file)
;; YASNIPPETS
(global-set-key (kbd "C-x C-f") 'find-file)
(global-set-key (kbd "C-c C-f") 'projectile-find-file-dwim)
(global-set-key (kbd "C-c u") 'swiper-all)
(global-set-key (kbd "C-x C-d") 'dirvish-dired)
(global-set-key (kbd "C-c C-f") 'counsel-projectile-find-file)
(global-set-key (kbd "C-x <") 'previous-buffer)
(global-set-key (kbd "C-x >") 'next-buffer)
(global-set-key (kbd "C-c r") 'cider-eval-last-sexp-in-buffer-as-current-region)
(global-set-key (kbd "C-c s") 'cider-eval-sexp-at-point)
(global-set-key (kbd "C-c t") 'cider-tap-last-expression)
(global-set-key (kbd "C-c <") 'lsp-ui-find-prev-reference)
(global-set-key (kbd "C-c d") 'lsp-find-definition)
(global-set-key (kbd "C-c C-c r") 'lsp-find-references)
(global-set-key (kbd "C-<up>") 'windmove-up)
(global-set-key (kbd "C-<down>") 'windmove-down)
(global-set-key (kbd "C-c v") 'indent-sexp)
(global-set-key (kbd "M-u") 'delete-indentation)
(global-set-key (kbd "M-U") 'indent-region)
(global-set-key (kbd "C-v") 'backward-char)


(provide 'global-kbd-config)
