(add-to-list 'load-path
	     "~/workset/emacs/pkgs/elscreen-1.4.6")
(add-to-list 'load-path
	     "~/workset/emacs/pkgs/multiple-cursors")
(add-to-list 'load-path
	     "~/workset/emacs/pkgs/bookmarkp/")

;; load chm reader
(autoload 'chm-view-file "chm-view" "chm reader" t)

;; Cscope support on emacs
(require 'xcscope)
;;(autoload 'cscope-set-initial-directory "xcscope" "cscope plugin" t)
(setq cscope-do-not-update-database t)

;; look in anything.el for "defvar anything-sources"
;; for customizing. 
(autoload 'anything "anything" "quicksilver for emacs" t)
(require 'anything-cscope)

;;(add-to-list 'load-path "~/workset/emacs/helm/")
;;(require 'helm-config)

;; load the highlight library
(autoload 'highlight-symbol-at-point "highlight-symbol" "highlight a symbol" t)
(autoload 'highlight-symbol-next "highlight-symbol" "highlight a symbol" t)
(autoload 'highlight-symbol-prev "highlight-symbol" "highlight a symbol" t)

;; load the peforce library
(autoload 'p4-info "p4" "perforce library" t)
;;(load-file "~/workset/emacs/p4conf.el")

;; Browsing url within emacs (install w3m.el)
(autoload 'w3m-browse-url "w3m-load" "emacs browser" t)
(setq w3m-use-cookies t)
(setq browse-url-browser-function 'w3m-browse-url)

;; change whenever you get a new library for bookmarkp
;; bmkp-this-buffer-cycle-sort-comparer  to bmkp-bookmark-creation-cp
;; begin
(require 'bookmark+)
;;(autoload 'bmkp-toggle-autonamed-bookmark-set/delete "bookmark+" "emacs bookmarks" t)

(setq bookmark-default-file "~/.emacs.d/bookmarks" 
       bookmark-save-flag nil)   ;; don't autosave each change
(setq custom-file "~/.emacs.d/.emacs-custom.el")
(load custom-file)
(custom-set-variables
 '(bmkp-auto-light-when-jump (quote autonamed-bookmark))
 '(bmkp-auto-light-when-set (quote autonamed-bookmark))
 '(bmkp-last-as-first-bookmark-file 'nil)
 '(bmkp-this-buffer-cycle-sort-comparer(quote bmkp-bookmark-creation-cp))
 '(bmkp-sort-comparer nil)
)
;;(add-hook 'kill-buffer-hook 'bmkp-delete-autonamed-this-buffer-no-confirm)
;;(add-hook 'kill-emacs-hook 'bmkp-delete-autonamed-this-buffer-no-confirm)
;; end

;; swap buffer positions in emacs using buf-move-left/right
(load-file "~/workset/emacs/pkgs/buffer-move.el")

;; browse kill-ring
(require 'browse-kill-ring)
(require 'browse-kill-ring+)

(autoload 'deft "deft" "simplenote for emacs" t)
;;(setq deft-extension "txt")
(setq deft-extension "org")
(setq deft-text-mode 'org-mode)
(setq deft-directory "~/workset/notes")
(setq deft-use-filename-as-title t)

(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-ci" 'org-insert-link)
(define-key global-map "\C-cs" 'org-show-entry)
(setq org-log-done t)


