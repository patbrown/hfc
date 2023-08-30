;;; jest-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:


;;;### (autoloads nil "jest" "jest.el" (0 0 0 0))
;;; Generated autoloads from jest.el
 (autoload 'jest-popup "jest" nil t)

(autoload 'jest "jest" "\
Run jest with ARGS.

With a prefix argument, allow editing.

\(fn &optional ARGS)" t nil)

(autoload 'jest-file "jest" "\
Run jest on FILE, using ARGS.

Additional ARGS are passed along to jest.
With a prefix argument, allow editing.

\(fn FILE &optional ARGS)" t nil)

(autoload 'jest-file-dwim "jest" "\
Run jest on FILE, intelligently finding associated test modules.

When run interactively, this tries to work sensibly using
the current file.

Additional ARGS are passed along to jest.
With a prefix argument, allow editing.

\(fn FILE &optional ARGS)" t nil)

(autoload 'jest-function "jest" "\
Run jest on the test function where pointer is located.

When pointer is not inside a test function jest is run on the whole file.

\(fn FILE TESTNAME &optional ARGS)" t nil)

(autoload 'jest-last-failed "jest" "\
Run jest, only executing previous test failures.

Additional ARGS are passed along to jest.
With a prefix argument, allow editing.

\(fn &optional ARGS)" t nil)

(autoload 'jest-repeat "jest" "\
Run jest with the same argument as the most recent invocation.

With a prefix ARG, allow editing." t nil)

(autoload 'jest-minor-mode "jest" "\
Minor mode to run jest-mode commands for compile and friends.

This is a minor mode.  If called interactively, toggle the `Jest
minor mode' mode.  If the prefix argument is positive, enable the
mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `jest-minor-mode'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t nil)

(register-definition-prefixes "jest" '("jest-"))

;;;***

;;;### (autoloads nil "jest-traversal" "jest-traversal.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from jest-traversal.el

(register-definition-prefixes "jest-traversal" '("jest--"))

;;;***

(provide 'jest-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; jest-autoloads.el ends here
