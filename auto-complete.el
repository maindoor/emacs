(add-to-list 'load-path "~/workset/emacs/pkgs/autocomplete/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/workset/emacs/pkgs/autocomplete//ac-dict")
(ac-config-default)

;; (defcustom mycustom-system-include-paths '("./include/" "/opt/local/include" "/usr/include" )
;;   "This is a list of include paths that are used by the clang auto completion."
;;   :group 'mycustom
;;   :type '(repeat directory)
;;   )
 
;; (add-to-list 'load-path "~/workset/emacs/pkgs/autocomplete/")
;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/workset/emacs/pkgs/autocomplete/ac-dict")
;; (ac-config-default)
;; (require 'auto-complete-clang)
;; (setq clang-completion-suppress-error 't)

;; echo "" | g++ -v -x c++ -E -
;; (setq ac-clang-flags
;;       (mapcar (lambda (item)(concat "-I" item))
;;               (split-string
;; " 
;;  /usr/include/c++/4.7
;;  /usr/include/c++/4.7/x86_64-linux-gnu
;;  /usr/include/c++/4.7/backward
;;  /usr/lib/gcc/x86_64-linux-gnu/4.7/include
;;  /usr/local/include
;;  /usr/lib/gcc/x86_64-linux-gnu/4.7/include-fixed
;;  /usr/include/x86_64-linux-gnu
;;  /usr/include
;; "
;;                )))
 
;; (defun my-ac-clang-mode-common-hook()
;;   (define-key c-mode-base-map (kbd "M-/") 'ac-complete-clang)
;; )
 
;; (add-hook 'c-mode-common-hook 'my-ac-clang-mode-common-hook)

(require 'auto-complete-clang-async)

(defun my-c-mode-cedet-hook ()
  (add-to-list 'ac-sources 'ac-source-gtags)
  (add-to-list 'ac-sources 'ac-source-semantic)
)


(defun ac-cc-mode-setup ()
  (setq ac-clang-complete-executable "~/workset/emacs/pkgs/clang-complete")
  (setq ac-sources '(ac-source-clang-async))
  (ac-clang-launch-completion-process)
)

(defun my-ac-config ()
  (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))

(my-ac-config)

