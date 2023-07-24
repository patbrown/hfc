(defun copy-from-osx ()
    "Copies the current clipboard content using the `pbcopy` command"
    (shell-command-to-string "pbpaste"))

  (defun paste-to-osx (text &optional push)
    "Copies the top of the kill ring stack to the OSX clipboard"
    (let ((process-connection-type nil))
      (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
        (process-send-string proc text)
        (process-send-eof proc))))

  ;; Override defaults to use the mac copy and paste
  (setq interprogram-cut-function 'paste-to-osx)
  (setq interprogram-paste-function 'copy-from-osx)

(use-package exec-path-from-shell
  :straight t
  :init
  (when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize)))

(provide 'macos-config)
