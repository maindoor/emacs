;; Create keymap for global key binding
(defvar my-keys-minor-mode-map (make-keymap) "my-keys-minor-mode keymap.")

(define-key my-keys-minor-mode-map [end] 'ido-switch-buffer)
(define-key my-keys-minor-mode-map [S-end] 'ido-find-file)
(define-key my-keys-minor-mode-map [M-end] 'deft)
(define-key my-keys-minor-mode-map [C-prior] 'elscreen-previous)
(define-key my-keys-minor-mode-map [C-next] 'elscreen-next)
(define-key my-keys-minor-mode-map "\M-j" 'scroll-up-mline)
(define-key my-keys-minor-mode-map "\M-k" 'scroll-down-mline)
(define-key my-keys-minor-mode-map "\M-q" 'delete-other-windows)
(define-key my-keys-minor-mode-map "\M-o" 'other-window)
(define-key my-keys-minor-mode-map [delete] 'evil-normal-state)
(define-key my-keys-minor-mode-map "\C-xb" 'anything)
;; prior and next here are page-up and page-down
(define-key my-keys-minor-mode-map [S-prior] 'winner-undo)
(define-key my-keys-minor-mode-map [S-next] 'winner-redo)

(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " my-keys" 'my-keys-minor-mode-map)

(my-keys-minor-mode 1)

(defun my-minibuffer-setup-hook ()
  (my-keys-minor-mode 0))
(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup-hook)

;; Maintain the above keymap even after loading a new library
(defadvice load (after give-my-keybindings-priority)
  "Try to ensure that my keybindings always have priority."
  (if (not (eq (car (car minor-mode-map-alist)) 'my-keys-minor-mode))
      (let ((mykeys (assq 'my-keys-minor-mode minor-mode-map-alist)))
        (assq-delete-all 'my-keys-minor-mode minor-mode-map-alist)
        (add-to-list 'minor-mode-map-alist mykeys))))
(ad-activate 'load)

;;(global-set-key [home] '[?\C-x ?b return])
;;(global-set-key [home] 'toggle-buffer)

;;(load-file "~/workset/emacs/tabbar.el")
;;(tabbar-mode 1)

;(load-file "~/isearchb.el")
;(define-key global-map [(control ?z)] 'isearchb-activate)

;; (global-set-key (kbd "C-S-n") 'scroll-up-keep-cursor)
;; (global-set-key (kbd "C-S-p") 'scroll-down-keep-cursor)

;(global-set-key [C-down-mouse-1] 'cscope-find-functions-calling-this-function-no-prompting) 
;(global-set-key [M-down-mouse-1] 'cscope-find-this-symbol-no-prompting) 
;(global-set-key [double-mouse-1] 'cscope-find-global-definition-no-prompting) 
;(global-set-key [mouse-3] 'delete-other-windows) 
;(global-set-key [double-mouse-3] 'cscope-pop-mark) 

(global-set-key "\M-h" 'hs-toggle-hiding)
(global-set-key "\C-\M-a" 'beginning-of-defun)
(global-set-key "\C-\M-e" 'c-end-of-defun)
(global-set-key "\C-xf" 'ff-find-other-file)
(global-set-key "\C-cf" 'find-file-at-point)
;; (global-set-key "\M-o" 'delete-window)
(global-set-key "\M-s" 'eshell)
(global-set-key "\M-g" 'goto-line)
;; (global-set-key "\C-cu" 'uncomment-region)
(global-set-key "\M-\\" 'indent-region)

(global-set-key "\C-cp" 'backward-ifdef)
(global-set-key "\C-cn" 'forward-ifdef)
(global-set-key "\C-cb" 'down-ifdef)
(global-set-key "\C-cr" 'toggle-read-only)

(global-set-key [f1] 'cscope-set-initial-directory) 
(global-set-key [f2] 'cscope-find-global-definition) 
(global-set-key [f3] 'cscope-prev-symbol)
(global-set-key [(meta f3)] 'cscope-prev-file)
(global-set-key [f4] 'cscope-next-symbol)
(global-set-key [(meta f4)] 'cscope-next-file)
(global-set-key [f5] 'cscope-find-functions-calling-this-function-no-prompting)
(global-set-key [(meta f5)] 'cscope-find-functions-calling-this-function)
(global-set-key [f6] 'cscope-find-this-symbol)
(global-set-key [f7] 'cscope-find-this-text-string)
;;(global-set-key [f8] 'cscope-find-called-functions-no-prompting)
(global-set-key [f9] 'toggle-selective-display)
;; remove the change-highlight in region
(global-set-key (kbd "<f10>")   'highlight-changes-visible-mode) ;; changes
;(global-set-key (kbd "S-<f10>") 'highlight-changes-remove-highlight)
(set-face-foreground 'highlight-changes nil)
(set-face-background 'highlight-changes "#B2D281")
(set-face-foreground 'highlight-changes-delete nil)
(set-face-background 'highlight-changes-delete "#A12A2A")
(global-set-key [f12] 'kill-this-buffer)

