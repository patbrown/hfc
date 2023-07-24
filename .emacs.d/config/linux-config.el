;;; Linux stuff


(defun hosts ()
  "Open /etc/hosts as root."
  (interactive)
  (find-file "/sudo::/etc/hosts"))

(provide 'linux-config)
