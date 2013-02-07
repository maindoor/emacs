(add-to-list 'load-path
	     "~/workset/emacs/pkgs/evil")

;; Setting up evil mode 
(require 'evil)
(evil-mode 1)
(evil-set-initial-state 'cscope-list-entry-mode 'insert)
(evil-set-initial-state 'grep-mode 'insert)
(evil-set-initial-state 'deft-mode 'insert)

;; evil normal state keyboard shortcuts
(define-key evil-normal-state-map "f" 'ace-jump-char-mode)
(define-key evil-normal-state-map "F" 'ace-jump-mode-pop-mark)
(define-key evil-normal-state-map "zs" 'save-buffer)
(define-key evil-normal-state-map "zq" 'kill-this-buffer) 
(define-key evil-normal-state-map "zf" 'find-file-at-point) 
(define-key evil-normal-state-map "zw" 'split-window-horizontally)
(define-key evil-normal-state-map "ze" 'split-window-vertically)
(define-key evil-normal-state-map "zp" 'toggle-window-dedicated) 
(define-key evil-normal-state-map "zd" 'dired) 
(define-key dired-mode-map "\M-o" 'other-window)

;;(define-key evil-normal-state-map " "
(define-key evil-normal-state-map (kbd "SPC") 
	    (lambda ()
            (interactive)
            (next-line 15)
            (evil-scroll-line-down 15)))
(define-key evil-normal-state-map (kbd "S-SPC") 'c-end-of-defun)

(define-key evil-normal-state-map [backspace]
	    (lambda ()
            (interactive)
            (previous-line 15)
            (evil-scroll-line-up 15)))
(define-key evil-normal-state-map [S-backspace] 'c-beginning-of-defun)

;; evil normal state keyboard shortcuts
(define-key evil-visual-state-map "aW" 'select-current-word) 
(define-key evil-visual-state-map "f" 'ace-jump-char-mode)

;; evil q key configuration
(define-key evil-normal-state-map "q" nil)
(define-key evil-motion-state-map "qu" 'universal-argument)
(define-key evil-normal-state-map "qm" 'bmkp-toggle-autonamed-bookmark-set/delete) 
(define-key evil-normal-state-map "qn" 'bmkp-previous-autonamed-bookmark-repeat) 
(define-key evil-normal-state-map "qp" 'bmkp-next-autonamed-bookmark-repeat) 
(define-key evil-normal-state-map "qh" 'highlight-symbol-at-point) 
(define-key evil-normal-state-map "qf" 'helm-find-files)
(define-key evil-normal-state-map "qr" 'helm-resume)
(define-key evil-normal-state-map "ql" 'helm-locate)

;; evil cscope key configuration
(define-key evil-normal-state-map "-1" 'cscope-set-initial-directory)
(define-key evil-normal-state-map "-s" 'cscope-find-this-symbol-no-prompting)
(define-key evil-normal-state-map "-S" 'cscope-find-this-symbol)
(define-key evil-normal-state-map "-d" 'cscope-find-global-definition-no-prompting)
(define-key evil-normal-state-map "-D" 'cscope-find-global-definition)
(define-key evil-normal-state-map "-g" 'cscope-find-this-text-string-no-prompting)
(define-key evil-normal-state-map "-G" 'cscope-find-this-text-string)
(define-key evil-normal-state-map "-f" 'cscope-find-this-file)
(define-key evil-normal-state-map "-u" 'cscope-pop-mark)
(define-key evil-normal-state-map "-c" 'cscope-find-functions-calling-this-function-no-prompting)
(define-key evil-normal-state-map "-C" 'cscope-find-functions-calling-this-function)
(define-key evil-normal-state-map "-t" 'cscope-display-buffer)
(define-key evil-normal-state-map "-j" 'my-semantic-jump)
(define-key evil-normal-state-map "-J" 'semantic-ia-fast-jump)
(define-key evil-normal-state-map "-r" 'semantic-symref)
(define-key evil-normal-state-map "-R" 'semantic-symref-symbol)

;; (define-key evil-normal-state-map "-1" 'xgtags-visit-rootdir)
;; (define-key evil-normal-state-map "-s" 'xgtags-find-symbol)
;; (define-key evil-normal-state-map "-d" 'xgtags-find-tag-from-here)
;; (define-key evil-normal-state-map "-D" 'xgtags-find-tag)
;; (define-key evil-normal-state-map "-g" 'xgtags-find-pattern)
;; (define-key evil-normal-state-map "-f" 'xgtags-find-file)
;; (define-key evil-normal-state-map "-u" 'xgtags-pop-stack)
;; (define-key evil-normal-state-map "-c" 'xgtags-find-rtag)
;; 

