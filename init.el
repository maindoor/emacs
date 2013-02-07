;; sudo emacs-snapshot -Q -q -l /home/skumar/workset/.emacs -fn consolas-10

;; Time emacs startup: BEGIN
(require 'cl) ; a rare necessary use of REQUIRE
(defvar *emacs-load-start* (current-time))


(add-to-list 'load-path
	     "~/workset/emacs/")
(add-to-list 'load-path
	     "~/workset/emacs/pkgs")


(load "ui-setup")
(load "helper-funcs-setup")
(load "ws-buffer-setup")
(load "util-setup")
(load "evil-setup")
(load "key-setup")
;;(load "auto-complete")
(load "cedet-setup")
(load "auto-complete_test")

;; Time emacs startup: END
(message "My .emacs loaded in %ds" (destructuring-bind (hi lo ms) (current-time)
                           (- (+ hi lo) (+ (first *emacs-load-start*) (second *emacs-load-start*)))))


