(add-to-list 'load-path
 	     "~/workset/emacs/pkgs/color-theme-6.6.0/")

;; do not show the start-up message
(setq inhibit-startup-message t)
(setq-default transient-mark-mode t)

;; Don't want any backup files
(setq make-backup-files  nil)

;; Don't want any auto saving
(setq auto-save-default         nil)

;; set the title bar of emacs to the file name
(setq frame-title-format "%f")

;; don't punish my ears when I do something illegal
;;(setq visible-bell t)
(setq visible-bell nil)

;; select the region, replacing text will replace the selected region.
(delete-selection-mode t)
(put 'viper-Put-back 'delete-selection t)

;; truncate long lines
(setq-default truncate-lines t)

;; do not show the menu-bar and toolbar
(menu-bar-mode -1)
(tooltip-mode -1)
(tool-bar-mode -1)

;; set the scroll-bar to the right
(set-scroll-bar-mode 'right)

;; display line number
;; Also try linum-mode
(line-number-mode 1)

;; display column number
(column-number-mode 1)

;; show parenthesis matches
(setq show-paren-delay 0) 
(show-paren-mode 1)
(setq show-paren-style 'parenthesis)

;; Stop at the end of the file, don't add any lines.
(setq next-line-add-newlines nil)

;; Always end a file with a newline
(setq require-final-newline t)
;;
(global-font-lock-mode t)
(setq font-lock-maximum-size nil)

;; Prevent lisp debugger from popping up when mistakes are made.
(setq eval-expression-debug-on-error nil)
(setq debug-on-error nil)

;; Auto-fill-mode the the automatic wrapping of lines and insertion of
;; newlines when the cursor goes over the column limit.
(setq auto-fill-mode 1 )
(which-function-mode)

;; replace all yes or no by y or n
(fset 'yes-or-no-p 'y-or-n-p)

;; line-by-line scrolling
(setq scroll-step 1)

;; support mouse wheel scrolling
(mouse-wheel-mode t)

;; want the cursor to blink ?
;; or pass in -1/1 to turn it off/on
(blink-cursor-mode -1)      

;; switch buffers using substrings C-x b
(iswitchb-mode 1)

;; find files using substrings C-x C-f
(ido-mode 1)

;; indentation for all c-mode derived offset
(setq-default c-basic-offset 8)

;; set the tab width
(setq default-tab-width 8) 
(setq tab-width 8)

;; use only tabs for indentation instead of spaces
(setq-default indent-tabs-mode t)

;; indent as soon as you hit enter
(defun set-newline-and-indent ()
  (local-set-key (kbd "RET") 'newline-and-indent))
(add-hook 'c-mode 'set-newline-and-indent)

;; move the mouse when the cursor gets too close
(mouse-avoidance-mode 'jump)

;; track highlight changes mode
(global-highlight-changes-mode t)
(setq highlight-changes-visibility-initial-state nil); initially hide

;; Hide the mode-line, call hide-mode-line
;;(load-file "~/workset/emacs/hide-mode-line.el")
;;(setq hide-mode-line t)

;; scroll smoothly
(require 'smooth-scrolling)
(setq smooth-scroll-margin 7)

;; specify color theme 
(autoload 'color-theme-zenburn "color-theme-zenburn" "zenburn theme" t)
(require 'color-theme)
(color-theme-initialize)
(color-theme-aalto-light)
;;(color-theme-hober)
;;(color-theme-fischmeister)
;;(color-theme-gnome2)
;;(load-file "~/workset/emacs/cycle.el")
;;(set-background-color "DarkSlateGray")

;; ace jump mode
(autoload 'ace-jump-char-mode "ace-jump-mode" "Jumping to a point quickly" t)
(setq ace-jump-mode-scope 'window)
(setq ace-jump-mode-gray-background nil)
(setq ace-jump-mode-move-keys
      (loop for i from ?a to ?z collect i))

;; set the scroll bar width
(if window-system
    (progn
      (setq default-frame-alist
            (append
             '((cursor-color . "red")
               (vertical-scroll-bars . 'right)
               (horizontal-scroll-bars . nil)
               (right-fringe . 2)
               (left-fringe  . 5)
               (scroll-bar-width . 7)
               (width . 80 ) (height . 40))
             default-frame-alist))))

