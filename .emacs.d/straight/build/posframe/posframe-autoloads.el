;;; posframe-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:


;;;### (autoloads nil "posframe" "posframe.el" (0 0 0 0))
;;; Generated autoloads from posframe.el

(autoload 'posframe-workable-p "posframe" "\
Test posframe workable status." nil nil)

(autoload 'posframe-show "posframe" "\
Pop up a posframe to show STRING at POSITION.

 (1) POSITION

POSITION can be:
1. An integer, meaning point position.
2. A cons of two integers, meaning absolute X and Y coordinates.
3. Other type, in which case the corresponding POSHANDLER should be
   provided.

 (2) POSHANDLER

POSHANDLER is a function of one argument returning an actual
position.  Its argument is a plist of the following form:

  (:position xxx
   :poshandler xxx
   :font-height xxx
   :font-width xxx
   :posframe xxx
   :posframe-width xxx
   :posframe-height xxx
   :posframe-buffer xxx
   :parent-frame xxx
   :parent-window-start xxx
   :parent-window-end xxx
   :parent-window-left xxx
   :parent-window-top xxx
   :parent-frame-width xxx
   :parent-frame-height xxx
   :parent-window xxx
   :parent-window-width  xxx
   :parent-window-height xxx
   :mouse-x xxx
   ;mouse-y xxx
   :minibuffer-height xxx
   :mode-line-height  xxx
   :header-line-height xxx
   :tab-line-height xxx
   :x-pixel-offset xxx
   :y-pixel-offset xxx)

By default, poshandler is auto-selected based on the type of POSITION,
but the selection can be overridden using the POSHANDLER argument.

The builtin poshandler functions are listed below:

1.  `posframe-poshandler-frame-center'
2.  `posframe-poshandler-frame-top-center'
3.  `posframe-poshandler-frame-top-left-corner'
4.  `posframe-poshandler-frame-top-right-corner'
5.  `posframe-poshandler-frame-top-left-or-right-other-corner'
6.  `posframe-poshandler-frame-bottom-center'
7.  `posframe-poshandler-frame-bottom-left-corner'
8.  `posframe-poshandler-frame-bottom-right-corner'
9.  `posframe-poshandler-window-center'
10.  `posframe-poshandler-window-top-center'
11. `posframe-poshandler-window-top-left-corner'
12. `posframe-poshandler-window-top-right-corner'
13. `posframe-poshandler-window-bottom-center'
14. `posframe-poshandler-window-bottom-left-corner'
15. `posframe-poshandler-window-bottom-right-corner'
16. `posframe-poshandler-point-top-left-corner'
17. `posframe-poshandler-point-bottom-left-corner'
18. `posframe-poshandler-point-bottom-left-corner-upward'
19. `posframe-poshandler-point-window-center'
20. `posframe-poshandler-point-frame-center'

 (3) POSHANDLER-EXTRA-INFO

POSHANDLER-EXTRA-INFO is a plist, which will prepend to the
argument of poshandler function: `info', it will *OVERRIDE* the
exist key in `info'.

 (4) BUFFER-OR-NAME

This posframe's buffer is BUFFER-OR-NAME, which can be a buffer
or a name of a (possibly nonexistent) buffer.

buffer name can prefix with space, for example \" *mybuffer*\", so
the buffer name will hide for ibuffer and `list-buffers'.

 (5) NO-PROPERTIES

If NO-PROPERTIES is non-nil, The STRING's properties will
be removed before being shown in posframe.

 (6) HEIGHT, MAX-HEIGHT, MIN-HEIGHT, WIDTH, MAX-WIDTH and MIN-WIDTH

These arguments are specified in the canonical character width
and height of posframe, more details can be found in docstring of
function `fit-frame-to-buffer',

 (7) LEFT-FRINGE and RIGHT-FRINGE

If LEFT-FRINGE or RIGHT-FRINGE is a number, left fringe or
right fringe with be shown with the specified width.

 (8) BORDER-WIDTH, BORDER-COLOR, INTERNAL-BORDER-WIDTH and INTERNAL-BORDER-COLOR

By default, posframe shows no borders, but users can specify
borders by setting BORDER-WIDTH to a positive number.  Border
color can be specified by BORDER-COLOR.

INTERNAL-BORDER-WIDTH and INTERNAL-BORDER-COLOR are same as
BORDER-WIDTH and BORDER-COLOR, but do not suggest to use for the
reason:

   Add distinct controls for child frames' borders (Bug#45620)
   http://git.savannah.gnu.org/cgit/emacs.git/commit/?id=ff7b1a133bfa7f2614650f8551824ffaef13fadc

 (9) FONT, FOREGROUND-COLOR and BACKGROUND-COLOR

Posframe's font as well as foreground and background colors are
derived from the current frame by default, but can be overridden
using the FONT, FOREGROUND-COLOR and BACKGROUND-COLOR arguments,
respectively.

 (10) CURSOR and WINDOW-POINT

By default, cursor is not showed in posframe, user can let cursor
showed with this argument help by set its value to a `cursor-type'.

When cursor need to be showed in posframe, user may need to set
WINDOW-POINT to the point of BUFFER, which can let cursor showed
at this point.

 (11) RESPECT-HEADER-LINE and RESPECT-MODE-LINE

By default, posframe will display no header-line, mode-line and
tab-line.  In case a header-line, mode-line or tab-line is
desired, users can set RESPECT-HEADER-LINE and RESPECT-MODE-LINE
to t.

 (12) INITIALIZE

INITIALIZE is a function with no argument.  It will run when
posframe buffer is first selected with `with-current-buffer'
in `posframe-show', and only run once (for performance reasons).

 (13) LINES-TRUNCATE

If LINES-TRUNCATE is non-nil, then lines will truncate in the
posframe instead of wrap.

 (14) OVERRIDE-PARAMETERS

OVERRIDE-PARAMETERS is very powful, *all* the valid frame parameters
used by posframe's frame can be overridden by it.

NOTE: some `posframe-show' arguments are not frame parameters, so they
can not be overrided by this argument.

 (15) TIMEOUT

TIMEOUT can specify the number of seconds after which the posframe
will auto-hide.

 (15) REFRESH

If REFRESH is a number, posframe's frame-size will be re-adjusted
every REFRESH seconds.

 (17) ACCEPT-FOCUS

When ACCEPT-FOCUS is non-nil, posframe will accept focus.
be careful, you may face some bugs when set it to non-nil.

 (18) HIDEHANDLER

HIDEHANDLER is a function, when it return t, posframe will be
hide, this function has a plist argument:

  (:posframe-buffer xxx
   :posframe-parent-buffer xxx)

The builtin hidehandler functions are listed below:

1. `posframe-hidehandler-when-buffer-switch'

 (19) REFPOSHANDLER

REFPOSHANDLER is a function, a reference position (most is
top-left of current frame) will be returned when call this
function.

when it is nil or it return nil, child-frame feature will be used
and reference position will be deal with in Emacs.

The user case I know at the moment is let ivy-posframe work well
in EXWM environment (let posframe show on the other application
window).

         DO NOT USE UNLESS NECESSARY!!!

An example parent frame poshandler function is:

1. `posframe-refposhandler-xwininfo'

 (19) Others

You can use `posframe-delete-all' to delete all posframes.

\(fn BUFFER-OR-NAME &key STRING POSITION POSHANDLER POSHANDLER-EXTRA-INFO WIDTH HEIGHT MAX-WIDTH MAX-HEIGHT MIN-WIDTH MIN-HEIGHT X-PIXEL-OFFSET Y-PIXEL-OFFSET LEFT-FRINGE RIGHT-FRINGE BORDER-WIDTH BORDER-COLOR INTERNAL-BORDER-WIDTH INTERNAL-BORDER-COLOR FONT CURSOR WINDOW-POINT FOREGROUND-COLOR BACKGROUND-COLOR RESPECT-HEADER-LINE RESPECT-MODE-LINE INITIALIZE NO-PROPERTIES KEEP-RATIO LINES-TRUNCATE OVERRIDE-PARAMETERS TIMEOUT REFRESH ACCEPT-FOCUS HIDEHANDLER REFPOSHANDLER &allow-other-keys)" nil nil)

(autoload 'posframe-hide-all "posframe" "\
Hide all posframe frames." t nil)

(autoload 'posframe-delete-all "posframe" "\
Delete all posframe frames and buffers." t nil)

(register-definition-prefixes "posframe" '("posframe-"))

;;;***

;;;### (autoloads nil "posframe-benchmark" "posframe-benchmark.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from posframe-benchmark.el

(autoload 'posframe-benchmark "posframe-benchmark" "\
Benchmark tool for posframe." t nil)

(register-definition-prefixes "posframe-benchmark" '("posframe-benchmark-alist"))

;;;***

(provide 'posframe-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; posframe-autoloads.el ends here
