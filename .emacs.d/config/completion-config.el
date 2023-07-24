(straight-use-package 'prescient)
(straight-use-package 'ivy-prescient)
(straight-use-package 'smex)

(use-package ivy
  :straight t
  :defer 0.1
  :diminish
  :bind (("C-c C-r" . ivy-resume))
  :custom
  (ivy-count-format "(%d/%d) ")
  (ivy-use-virtual-buffers t)
  :init
  (ivy-prescient-mode)
  (defvar my-ivy-builders '(ivy--regex-ignore-order
                            ivy--regex-fuzzy
			    ivy--regex-plus)
  "Preferred values for `ivy--regex-function'.")

(defun my-ivy-matcher-descs ()
  "Return a brief description of `ivy--regex-function'."
  (pcase ivy--regex-function
    ('ivy--regex-fuzzy        "fuzzy")
    ('ivy--regex-ignore-order "order")
    ('ivy--regex-plus         "plus")
    (_                        "other")))

(advice-add 'ivy--matcher-desc :override #'my-ivy-matcher-descs)

(defun my-ivy-rotate-builders ()
  "Slide `ivy--regex-function' across `my-ivy-builders'."
  (when my-ivy-builders
    (setq ivy--old-re nil)
    (setq ivy--regex-function
          (or (cadr (memq ivy--regex-function my-ivy-builders))
              (car my-ivy-builders)))))

(advice-add 'ivy-toggle-fuzzy :override #'my-rotate-builders))

(use-package ivy-rich
  :straight t
  :after counsel
  :init (setq ivy-rich-path-style 'abbrev
              ivy-virtual-abbreviate 'full)
  :config
  (ivy-mode)
  (ivy-rich-mode))

(use-package counsel
  :straight t
  :after ivy
  :config (counsel-mode))

(use-package swiper
  :straight t
  :after ivy
  :bind (("C-s" . swiper)
         ("C-r" . swiper)))

(provide 'completion-config)
