;; Remember the place in the file 
(setq save-place-file "~/.emacs.d/saveplace") 
(setq-default save-place t)                   
(require 'saveplace)                          

;; uniquely identify buffer names
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator "|")
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*")

;; Setup winner mode to bring back window configurations
(when (fboundp 'winner-mode)
  (winner-mode 1))

;; test savehist mode
(setq savehist-additional-variables ;; also save...
'(search-ring regexp-search-ring kill-ring) ;; ... my search entries
savehist-file "~/.emacs.d/savehist") ;; keep my home clean
(savehist-mode nil) ;; do customization before activate

;; Enable hideshow mode, shrinks conditional satements.
(hs-minor-mode t) 

;; list buffers
(autoload 'bs-show "bs" "buffer show" t)
(global-set-key "\C-x\C-b" 'bs-show)


