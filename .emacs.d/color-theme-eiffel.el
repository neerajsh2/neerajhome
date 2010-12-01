; http://coderchrome.org/12

(eval-when-compile (require 'color-theme))

(defun color-theme-eiffel ()
	(interactive)
	(color-theme-install '(color-theme-eiffel 
	(
		(foreground-color . "#000000")
		(background-color . "#FFFFFF")
	)
	(font-lock-string-face ((t (:foreground "#D80800"))))
	(font-lock-type-face ((t (:foreground "#6D79DE"))))
	(font-lock-comment-face ((t (:foreground "#00B418"))))
	(font-lock-variable-name-face ((t (:foreground "#000000"))))
	(font-lock-comment-delimiter-face ((t (:foreground "#00B418"))))
	(font-lock-doc-face ((t (:foreground "#00B418"))))
	(font-lock-keyword-face ((t (:foreground "#0100B6"))))
	(font-lock-constant-face ((t (:foreground "#CD0000"))))
	(font-lock-preprocessor-face ((t (:foreground "#0100B6"))))
	(font-lock-doc-string-face ((t (:foreground "#00B418"))))
	(font-lock-builtin-face ((t (:foreground "#0000A2"))))
	(font-lock-function-name-face ((t (:foreground "#0000A2"))))
)))
