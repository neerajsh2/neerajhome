;;; init.el - Startup of the world
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

    (setq inhibit-startup-message t)
    (setq initial-scratch-message nil)

(setq is-win32 (memq system-type '(windows-nt ms-dos ms-windows)))

;; Directories
(defconst MAIN_DIR "~/.emacs.d/" 
  "Main Directory")

(defconst SITELISP_DIR "lisp/" 
  "Site-Lisp directory")

;;; turn off the 3d formatting for the mode line
(set-face-attribute 'mode-line nil :box nil)

(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/emms-latest/lisp/")
(when is-win32
  (add-to-list 'exec-path "C:/Program Files (x86)/SMplayer/mplayer"))

(add-to-list 'load-path "~/.emacs.d/lisp")

;; colors
(when is-win32
(set-frame-font "-outline-Consolas-normal-normal-normal-mono-13-*-*-*-c-*-iso8859-1"))

;; linux
(when (and (not is-win32) window-system)
(set-frame-font "-bitstream-Bitstream Charter-normal-normal-normal-*-18-*-*-*-*-0-iso10646-1"))


(require 'color-theme)
;(autoload 'color-theme "color-theme" "Color Theme " t nil)
(autoload 'color-theme-blackboard "color-theme-blackboard" "Color Theme Blackboard" t nil)
(autoload 'color-theme-gruber-darker "color-theme-gruber-darker" "Color Theme Gruber Darker" t nil)
(autoload 'color-theme-dark-emacs "color-theme-dark-emacs" "Color Theme Dark Emacs" t nil)
(autoload 'color-theme-subdued "color-theme-subdued" "Color Theme Subdued" t nil)

(require 'darkroom-mode)

;;(when window-system)
;;(w32-fullscreen)


(when window-system
	(color-theme-subdued))

(set-frame-parameter (selected-frame) 'alpha '(98 97))
 (add-to-list 'default-frame-alist '(alpha 98 97))



;; Speedbar parameters
 (require 'speedbar)
 (setq speedbar-frame-parameters (quote
 								 ((minibuffer)
 								  (width          . 35)
 								  (border-width   . 0)
 								  (menu-bar-lines . 0)
 								  (unsplittable   . t)
 								  (font           . "-*-Consolas-normal-r-*-*-11-*-*-*-c-*-iso8859-1"))))

;; Display clock
(display-time)
(display-battery-mode)

;; Dot mode
(require 'dot-mode)
     (add-hook 'find-file-hooks 'dot-mode-on)
(autoload 'dot-mode "dot-mode" nil t) ; vi `.' command emulation
     (global-set-key [(control ?.)] (lambda () (interactive) (dot-mode 1)
                                       (message "Dot mode activated.")))

;; When scrolling down using the cursor emacs will scroll down one line at a time 
(setq scroll-step 1)
;; (require 'emms-setup)
;; (emms-devel)
;; (emms-default-players)
;; (setq emms-source-list '((emms-directory-tree "C:/users/neerajsh/Music")))

;; modes
;; (ido-mode)
(require 'lusty-explorer)

;   (setq viper-mode nil)
;   (require 'viper)
;   (require 'vimpulse)

   (require 'yasnippet)
   (yas/initialize)
   (yas/load-directory "~/.emacs.d/snippets")

(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)


   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; c#

   (autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
   (add-to-list 'auto-mode-alist '("\\.cs$" . csharp-mode))
   ;(load-library "dino-csharp")

   ;; For Hide/Show 
   ;; (Ref: Dino's Emacs file. http://blogs.msdn.com/dotnetinterop/archive/2008/04/14/dino-s-emacs-file.aspx)
   (defun csharp-hs-forward-sexp (&optional arg)

     "I set hs-forward-sexp-func to this function.

   I found this customization necessary to do the hide/show magic in C#
   code, when dealing with region/endregion. This routine
   goes forward one s-expression, whether it is defined by curly braces
   or region/endregion. It handles nesting, too.

   The forward-sexp method takes an arg which can be negative, which
   indicates the move should be backward.  Therefore, to be fully
   correct this function should also handle a negative arg. However,
   the hideshow.el package never uses negative args to its
   hs-forward-sexp-func, so it doesn't matter that this function does not
   do negative numbers.

   The arg can also be greater than 1, which means go forward
   multiple times. This function doesn't handle that EITHER.  But
   again, I haven't see that as a problem."

     (message "csharp-hs-forward-sexp, (arg %d) (point %d)..."
	      (if (numberp arg) arg -1)
	      (point))

     (let ((nestlevel 0)
	   (mark1 (point))
	   (done nil)
	   )

       (if (and arg (< arg 0))
	   (message "negative arg (%d) is not supported..." arg)

	 ;; else, we have a positive argument, hence move forward.
	 ;; simple case is just move forward one brace
	 (if (looking-at "{")
	     (forward-sexp arg)

	   ; The more complex case is dealing with a "region/endregion" block.
	   ; We have to deal with nested regions!
	   (and
	    (while (not done)
	      (re-search-forward "^[ \\t]*#[ \\t]*\\(region\\|endregion\\)\\b"
				 (point-max) 'move)
	      (cond

	       ((eobp))                    ; do nothing if at end of buffer

	       ((and
		 (match-beginning 1)
		 ;; if the match is longer than 6 chars, we know it is "endregion"
		 (if (> (- (match-end 1) (match-beginning 1)) 6)
		     (setq nestlevel (1- nestlevel))
		   (setq nestlevel (1+ nestlevel))
		   )
		 )))

	      (setq done (not (and (> nestlevel 0) (not (eobp)))))

	      )                            ; while

	    (if (= nestlevel 0)
		(goto-char (match-end 2)))

	    )
	   )
	 )
       )
     )

   ;; ;; more for hideshow.el 
   ;; ; (Ref: Dino's Emacs file. http://blogs.msdn.com/dotnetinterop/archive/2008/04/14/dino-s-emacs-file.aspx)
   (unless (assoc 'csharp-mode hs-special-modes-alist)
     (push '(csharp-mode
		     "\\(^[ \\t]*#[ \\t]*region\\b\\)\\|{"      ; regexp for start block                  
		     "\\(^[ \\t]*#[ \\t]*endregion\\b\\)\\|}"   ; regexp for end block                  
		     "/[*/]"                                    ; regexp for comment start                  
		     csharp-hs-forward-sexp                     ; hs-forward-sexp-func
		     hs-c-like-adjust-block-beginning)          ; c-like adjust (1 char)
		   hs-special-modes-alist))

   ;; Initialize C#-mode.
   (defun csharp-mode-init()
     (cond (window-system
	    (yas/minor-mode-on)
	    (hs-minor-mode 1)		 
	    (setq hs-isearch-open t))))
   (add-hook 'csharp-mode-hook 'csharp-mode-init)
   (autoload 'powershell-mode "powershell-mode" "Major mode for editing PSH code." t)
   (add-to-list 'auto-mode-alist '("\\.ps1$" . powershell-mode))

   (cua-mode)

   ;; Windows Like Selection mode
   (pc-selection-mode t)
   (setq visible-bell t)

   (fset 'yes-or-no-p 'y-or-n-p)

   (setq major-mode 'text-mode)

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; emacs server mode

   (defun my-done()
     (interactive)
     (server-edit)
     (make-frame-invisible nil t))


   (defun select-word ()
   "Select a word under cursor.
   word here is considered any alphanumeric sequence with _ or -."
    (interactive)
    (let (b1 b2)
      (skip-chars-backward "-_A-Za-z0-9")
      (setq b1 (point))
      (skip-chars-forward "-_A-Za-z0-9")
      (setq b2 (point))
      (set-mark b1)
    )
   )


   (defun ns-duplicate-line (&optional commentfirst)
     "copy the line at point, if COMMENTFIRST is not nul, comment the original"
     (interactive)
     (beginning-of-line)
     (push-mark)
     (end-of-line)
     (let ((str (buffer-substring (region-beginning) (region-end))))
       (when commentfirst
	 (comment-region (region-beginning) (region-end)))
       (insert
	(concat (if (= 0 (forward-line 1)) "" "\n") str "\n"))
       (forward-line -1)))

   (defun ns-open-line ()
    "Open a new line"
    (interactive)
    (end-of-line)
    (newline-and-indent)
    )


   (defun ns-open-line-above ()
    "Open a new line above the current line"
    (interactive)
    (beginning-of-line)
    (newline-and-indent)
    (previous-line)
    )


   (defun ns-open-init()
    "compile the init file"
    (interactive)
    (find-file "~/.emacs.d/init.el")
   )

   (defun ns-compile-init()
    "compile the init file"
    (interactive)
    (byte-compile-file "~/.emacs.d/init.el")
   )


   (defun ns-copy-to-prev-line ()
    "Open a new line"
    (interactive)
    (save-excursion)
    (kill-ring-save (mark) (point))
    (ns-open-line-above)
    (yank)
    )

;; key bindings


    (require 'fastnav)
    (global-set-key "\M-z" 'zap-up-to-char-forward)   
    (global-set-key "\M-Z" 'zap-up-to-char-backward)  
    (global-set-key "\M-s" 'jump-to-char-forward)     
    (global-set-key "\M-S" 'jump-to-char-backward)    
    (global-set-key "\M-r" 'replace-char-forward)     
    (global-set-key "\M-R" 'replace-char-backward)    
    (global-set-key "\M-i" 'insert-at-char-forward)   
    (global-set-key "\M-I" 'insert-at-char-backward)  
    (global-set-key "\M-j" 'execute-at-char-forward)  
    (global-set-key "\M-J" 'execute-at-char-backward) 
    (global-set-key "\M-k" 'delete-char-forward)      
    (global-set-key "\M-K" 'delete-char-backward)     
    (global-set-key "\M-m" 'mark-to-char-forward)     
    (global-set-key "\M-M" 'mark-to-char-backward)    
    (global-set-key "\M-D" 'select-word)
    (global-set-key "\C-\M-f" 'w32-fullscreen)
    (global-set-key "\C-\M-d" 'darkroom-mode)
;    (global-set-key (kbd "\C-x\C-c") 'my-done)
    (global-set-key (kbd "\C-c w") 'select-word)
    (global-set-key (kbd "C-c y") 'ns-duplicate-line)
    (global-set-key (kbd "C-c C-y") 'ns-duplicate-line)
    (global-set-key (kbd "\C-o") 'ns-open-line)
    (global-set-key (kbd "\C-\M-o") 'ns-open-line-above)
    (global-set-key "\C-x\C-\M-k" 'kill-emacs)
    (global-set-key "\C-x\M-i" 'ns-compile-init)
    (global-set-key "\C-\M-y" 'ns-copy-to-prev-line)
    (global-set-key "\C-x\M-o" 'ns-open-init)


 (when (require 'lusty-explorer nil 'noerror)

  ;; overrride the normal file-opening, buffer switching
  (global-set-key (kbd "C-x C-f") 'lusty-file-explorer)
  (global-set-key (kbd "C-x b")   'lusty-buffer-explorer))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; External Commands Settings

;; The almighty grep.
(setq-default grep-command "grep -i ")

;; Backup files in one spot
(setq backup-directory-alist nil)
(setq backup-directory-alist
      (cons (cons "\\.*$" (expand-file-name "~/ebacks"))
            backup-directory-alist))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Global Keys Settings

;; Function Keys
(define-key global-map [f1] 'hs-toggle-hiding)                     ;; F1 - Toggle block Hiding
(define-key global-map [f2] 'create-scratch-buffer)                ;; F2 - Create new Scratch buffer
(define-key global-map [f3] 'kill-buffer-fast)                     ;; F3 - Close buffer
(define-key global-map [f4] 'goto-line)                            ;; F4 - Go to line
(define-key global-map [f5] 'other-window)                         ;; F5 - Other window
(define-key global-map [f6] 'hs-show-block)                        ;; F6 - Show Block
(define-key global-map [f7] 'hs-hide-block)                        ;; F7 - Hide Block
(define-key global-map [f8] 'toggle-speedbar)                      ;; F8 - Toggle speedbar
(define-key global-map [f9] 'w32-restore-frame)                    ;; F9 - Minimize window
(define-key global-map [f10] 'w32-maximize-frame)                  ;; F10 - Maximize window
(define-key global-map [f11] 'vs2emacs)                            ;; F11 - VS2005 2 Unix
(define-key global-map [f12] 'add-change-log-entry-other-window)   ;; F12 - Add Change log entry

;; Global Keys
(global-set-key "\C-cu" 'uncomment-region)
(global-set-key "\C-cf" 'speedbar-toggle-show-all-files)
(global-set-key "\C-cf" 'sp)

(global-unset-key "\C-t")
(global-set-key "\C-t\C-s" '(lambda () (interactive) (insert-csharp-summary t)))
(global-set-key "\C-t\C-p" '(lambda () (interactive) (insert-csharp-param t)))
(global-set-key "\C-t\C-r" '(lambda () (interactive) (insert-csharp-returns t)))
(global-set-key "\C-t\C-g" 'insert-file-header)
(global-set-key "\C-t\C-k" 'insert-csharp-property)

; with point inside the block, use these keys to hide/show
;; (Ref: Dino's Emacs file. http://blogs.msdn.com/dotnetinterop/archive/2008/04/14/dino-s-emacs-file.aspx)
(global-set-key "\C-c>"  'hs-hide-block)
(global-set-key "\C-c<"  'hs-show-block)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Custom Functions

(defun update-snippets() "Updates, Byte Compiles and Loads the snippets bundle."
  (interactive)
  (yas/compile-bundle (format "%s%s%s" MAIN_DIR SITELISP_DIR "yasnippet.el")
					  (format "%s%s%s" MAIN_DIR SITELISP_DIR "yasnippet-bundle.el")
					  (format "%s%s%s" MAIN_DIR SITELISP_DIR "snippets"))
  (byte-compile-file  (format "%s%s%s" MAIN_DIR SITELISP_DIR "yasnippet-bundle.el") 1))

(defun csharp-newline-and-indent() "Adds a new line and indents it."
  (interactive)
  (end-of-line)
  (insert "\n")
  (c-indent-line))

(defun csharp-indent-and-newline() "Indents the line and adds a new line."
  (interactive)
  (beginning-of-line)
  (c-indent-line)  
  (end-of-line)
  (insert "\n"))

(defun insert-csharp-summary(movePos) "Inserts chsarp comment 'summary' tag."
  (interactive)
  (beginning-of-line)
  (c-indent-line)
  (insert "/// <summary>") 
  (csharp-newline-and-indent)
  (insert "/// ") 
  (csharp-newline-and-indent)
  (insert "/// </summary>")
  (if movePos
	  (previous-line 1)
	(end-of-line)))

(defun insert-csharp-param(movePos) "Inserts chsarp comment 'param' tag."
  (interactive)
  (beginning-of-line)
  (c-indent-line)
  (insert "/// <param name=\"\"></param>")
  (if movePos
	  (backward-char 10)))

(defun insert-csharp-value(movePos) "Inserts chsarp comment 'value' tag."
  (interactive)
  (beginning-of-line)
  (c-indent-line)
  (insert "/// <value></value>")
  (if movePos
	  (backward-char 9)))

(defun insert-csharp-returns(movePos) "Inserts chsarp comment 'returns' tag."
  (interactive)
  (beginning-of-line)
  (c-indent-line)
  (insert "/// <returns></returns>")
  (if movePos
	  (backward-char 10)))

(defun insert-csharp-property() "Inserts chsarp property skeleton."
  (interactive)
  (insert-csharp-summary nil)
  (csharp-newline-and-indent)
  (insert-csharp-value nil)
  (csharp-indent-and-newline)
  (c-indent-line)
  (insert "public ") 
  (csharp-newline-and-indent)
  (insert "{") 
  (csharp-indent-and-newline)
  (insert "get {") 
  (csharp-indent-and-newline)
  (insert "return this._;") 
  (csharp-indent-and-newline)
  (insert "}") 
  (csharp-indent-and-newline)
  (insert "set {") 
  (csharp-indent-and-newline)
  (insert "this._ = value;") 
  (csharp-indent-and-newline)
  (insert "}") 
  (csharp-indent-and-newline)
  (insert "}")
  (c-indent-line)
  (previous-line 8)
  (end-of-line))

(defun insert-file-header() "Inserts the file header"
  (interactive)  
  (insert "/*\n")
  (insert " * .cs\n")
  (insert (concat " * Copyright (C) " (format-time-string "%Y")  ", " user-full-name ". All Rights Reserved.\n"))
  (insert " *\n")
  (insert " * Description :\n")
  (insert " *   \n")
  (insert " *\n")
  (insert " * Author(s):\n")
  (insert (concat " *   " user-full-name " <" user-mail-address ">\n"))
  (insert " *\n")
  (insert (concat " * This is UNPUBLISHED PROPRIETARY SOURCE CODE of " user-full-name  ".\n"))
  (insert " * The contents of this file may not be disclosed to third parties, copied or\n")
  (insert " * duplicated in any form, in whole or in part, without the prior written\n")
  (insert (concat " * permission of " user-full-name ".\n"))
  (insert " */\n")
  (previous-line 13)
  (backward-char 4))

(defvar speedbar-frame nil)
(defun toggle-speedbar () "Toggles the speedbar"
  (interactive)
  (if speedbar-frame
	  (speedbar-frame-mode -1)
	(speedbar-get-focus)))

(defun kill-buffer-fast () "Kills the current buffer"
  (interactive )
  (kill-buffer nil))

(defun w32-restore-frame () "Restore a minimized frame"
     (interactive)
     (w32-send-sys-command 61728))

(defun w32-maximize-frame () "Maximize the current frame"
     (interactive)
     (w32-send-sys-command 61488))

(defun swap-tab-for-space() "Swaps tab for space"
   (interactive)
   (narrow-to-region (region-beginning) (region-end))
   (goto-char(point-min))
   (while (search-forward "\t" nil t) (replace-match " "))
   (widen)
   nil)

(defun create-scratch-buffer nil "Create a new scratch buffer to work in. (could be *scratch* - *scratchX*)"
  (interactive)
  (let ((n 0)
	bufname)
    (while (progn
	     (setq bufname (concat "*scratch"
				   (if (= n 0) "" (int-to-string n))
				   "*"))
	     (setq n (1+ n))
	     (get-buffer bufname)))
    (switch-to-buffer (get-buffer-create bufname))
    (if (= n 1) (lisp-interaction-mode))))

(defun vs2emacs() "Remove (^@) from a visual studio formated text."
  (interactive)
  (goto-char(point-min))
  (while (search-forward "ÿþ" nil t) (replace-match ""))
  (goto-char(point-min))
  (while (search-forward "\C-@" nil t) (replace-match ""))
  (dos2unix))

(defun dos2unix() "Convert dos (^M) end of line to unix end of line"
  (interactive)
  (goto-char(point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

(defun unix2dos() "Unix 2 Dos"
  (interactive)
  (goto-char(point-min))
  (while (search-forward "\n" nil t) (replace-match "\r\n")))

(defun insert-date () "Insert date at point."
  (interactive)
  (insert (format-time-string "%A, %B %e, %Y %k:%M:%S %z")))

(defun region-length () "Length of a region"
  (interactive)
  (message (format "%d" (- (region-end) (region-beginning)))))

(message ".emacs loaded. Let's get coding..!!!")
