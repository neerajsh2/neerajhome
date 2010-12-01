; http://coderchrome.org/13

(eval-when-compile (require 'color-theme))

(defun color-theme-velvet ()
	(interactive)
	(color-theme-install '(color-theme-velvet 
	(
		(foreground-color . "#bebec6")
		(background-color . "#393847")
	)
	(font-lock-string-face ((t (:foreground "#99ff66"))))
	(font-lock-type-face ((t (:foreground "#99ff99"))))
	(font-lock-comment-face ((t (:foreground "#ffbd42"))))
	(font-lock-variable-name-face ((t (:foreground "#bebec6"))))
	(font-lock-comment-delimiter-face ((t (:foreground "#ffbd42"))))
	(font-lock-doc-face ((t (:foreground "#ffbd42"))))
	(font-lock-keyword-face ((t (:foreground "#788a93"))))
	(font-lock-constant-face ((t (:foreground "#cc66ff"))))
	(font-lock-preprocessor-face ((t (:foreground "#ff9966"))))
	(font-lock-doc-string-face ((t (:foreground "#ffbd42"))))
	(font-lock-builtin-face ((t (:foreground "#d4d4b9"))))
	(font-lock-function-name-face ((t (:foreground "#d4d4b9"))))
)))
