(setq-default mode-line-format
      (list
       ;; the buffer name; the file name as a tool tip
       '(:eval (propertize "%b " 'face 'font-lock-keyword-face
			   'help-echo (buffer-file-name)))

       ;; line and column
       "(" ;; '%02' to set to 2 chars at least; prevents flickering
       (propertize "%02l" 'face 'font-lock-type-face) ","
       (propertize "%02c" 'face 'font-lock-type-face) 
       ") "

       ;; relative position, size of file
       "["
       (propertize "%p" 'face 'font-lock-constant-face) ;; % above top
       "/"
       (propertize "%I" 'face 'font-lock-constant-face) ;; size
       "] "

       ;; which function mode for the buffer.
       '(which-func-mode ("" which-func-format))
       '(evil-mode ("" evil-mode-line-tag))

       "[" 
       ;; was this buffer modified since the last save?
       '(:eval (when (buffer-modified-p)
		 '(:eval  (propertize "Mod"
					  'face 'font-lock-warning-face
					  'help-echo "Buffer has been modified"))))
       ;; is this buffer read-only?
       '(:eval (when buffer-read-only
		 (concat ","  (propertize "RO"
					  'face 'font-lock-type-face
					  'help-echo "Buffer is read-only"))))  
       "] "

       ;; the current major mode for the buffer.
       "["

       '(:eval (propertize "%m" 'face 'font-lock-string-face
			   'help-echo buffer-file-coding-system))
       "] "

       ;; add the time, with the date and the emacs uptime in the tooltip
       '(:eval (propertize (format-time-string "%H:%M")
			   'help-echo
			   (concat (format-time-string "%c; ")
				   (emacs-uptime "Uptime:%hh"))))
       " --"
       ;; i don't want to see minor-modes; but if you want, uncomment this:
       ;; minor-mode-alist  ;; list of minor modes
       "%-" ;; fill with '-'
       ))

(defun close-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))

(defun select-current-word ()
"Select a word under cursor.
“word” here is considered any alphenumeric sequence with “_” or “-”."
(interactive)
(let (b1 b2)
   (skip-chars-forward "-_A-Za-z0-9")
   (setq b1 (point))
   (skip-chars-backward "-_A-Za-z0-9")
   (setq b2 (point))
   (set-mark b1)
   )
)

(load-file "~/workset/emacs/pkgs/hideshowvis.el")
(add-hook 'c-mode-common-hook
              (lambda ()
               (font-lock-add-keywords nil
                '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1
font-lock-warning-face t)))
               (hs-minor-mode 1)
               (hideshowvis-minor-mode t)
               ))

(defun point-to-bottom ()
  "Go to the botton of the current window."
  (interactive)
  (move-to-window-line -1))

(defun point-to-top ()
  "Go to the top of the current window."
  (interactive)
  (move-to-window-line 1))

(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
		((looking-at "\\s\)") (forward-char 1) (backward-list 1))
		(t (self-insert-command (or arg 1)))))

(defun paren-match ()
"Tries to jump to the matching parenthesis to the one currently
under the point. Useful if the matching paren is out of sight. "
(interactive)
(cond ((looking-at "[{\[\(]") (forward-sexp 1) (backward-char))
((looking-at "[]})]") (forward-char) (backward-sexp 1))
(t (message "Point not at a parenthesis."))))

(defun linux-c-mode ()
  "C mode with adjusted defaults for use with the Linux kernel."
  (interactive)
  (c-mode)
  (setq c-indent-level 4)
  (setq c-brace-imaginary-offset 0)
  (setq c-brace-offset -4)
  (setq c-argdecl-indent 4)
  (setq c-label-offset -4)
  (setq c-continued-statement-offset 4)
;;  (setq indent-tabs-mode nil)
  (setq tab-width 8))

(defun scroll-down-keep-cursor ()
  ;; Scroll the text one line down while keeping the cursor
  (interactive)
  (scroll-down 2))

(defun scroll-up-keep-cursor ()
  ;; Scroll the text one line up while keeping the cursor
  (interactive)
  (scroll-up 2))

(defun viper-search-word-backward ()
  "Find the previous occurrence of the current word."
  (interactive)
  (let ((cur (point)))
    (skip-syntax-backward "w_")
    (goto-char
     (if (re-search-backward (concat "\\_<" (current-word) "\\_>") nil t)
	 (match-beginning 0)
       cur))))

(defun viper-search-word-forward ()
  "Find the next occurrance of the current word."
  (interactive)
  (let ((cur (point)))
    (skip-syntax-forward "w_")
    (goto-char
     (if (re-search-forward (concat "\\_<" (current-word) "\\_>") nil t)
	 (match-beginning 0)
       cur))))

;; USE C-x C-+ C-+ / C-x C-- C-- C-- etc on only one buffer.
(defun increase-font-size ()
  (interactive)
  (set-face-attribute 'default
                      nil
                      :height
                      (ceiling (* 1.10
                                  (face-attribute 'default :height)))))
(defun decrease-font-size ()
  (interactive)
  (set-face-attribute 'default
                      nil
                      :height
                      (floor (* 0.9
                                  (face-attribute 'default :height)))))

(defun my-viper-search-yank-word (arg forward)
  "Search forward for ARG occurance of word under point.
If FORWARD is nil, searches backward instead."
  (let ((viper-re-search t))
    (viper-search
     (concat "\\<" (regexp-quote (current-word)) "\\>") forward arg)))

(defun my-viper-search-forward-yank-word (arg)
  "Search forward for ARG occurance of word under point.
Like the Vim command \"*\" (but not exactly)."
  (interactive "P")
  (my-viper-search-yank-word arg t))

(defun my-viper-search-backward-yank-word (arg)
  "Search backward for ARG occurance of word under point.
Like the Vim command \"#\" (but not exactly)."
  (interactive "P")
  (my-viper-search-yank-word arg nil))

;; shrink functions
(defun toggle-selective-display ()
  (interactive)
  (set-selective-display (if selective-display nil 1)))

(defun toggle-fullscreen (&optional f)
  (interactive)
  (let ((current-value (frame-parameter nil 'fullscreen)))
    (set-frame-parameter nil 'fullscreen
			 (if (equal 'fullboth current-value)
			     (if (boundp 'old-fullscreen) old-fullscreen nil)
			   (progn (setq old-fullscreen current-value)
				  'fullboth)))))
(global-set-key [f11] 'toggle-fullscreen)

;; Wrap around during search without prompting
(defadvice isearch-search (after isearch-no-fail activate)
  (unless isearch-success
    (ad-disable-advice 'isearch-search 'after 'isearch-no-fail)
    (ad-activate 'isearch-search)
    (isearch-repeat (if isearch-forward 'forward))
    (ad-enable-advice 'isearch-search 'after 'isearch-no-fail)
    (ad-activate 'isearch-search)))

(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))

;; dedicate the current window, not yet tested.
(defun toggle-window-dedicated ()
  
"Toggle whether the current active window is dedicated or not"
(interactive)
(message

 (if (let (window (get-buffer-window (current-buffer)))
      (set-window-dedicated-p window 
                           (not (window-dedicated-p window))))

"Window '%s' is dedicated"
"Window '%s' is normal")
(current-buffer)))
(global-set-key [pause] 'toggle-window-dedicated)

(defun scroll-up-mline ()
 (interactive)
 (scroll-up 5))

(defun scroll-down-mline ()
 (interactive)
 (scroll-down 5))
