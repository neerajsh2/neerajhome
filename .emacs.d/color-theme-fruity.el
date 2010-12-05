; http://coderchrome.org/16

(eval-when-compile (require 'color-theme))

(defun color-theme-fruity ()
	(interactive)
	(color-theme-install '(color-theme-fruity 
	(
		(foreground-color . "#ffffff")
		(background-color . "#111111")
	)

	(font-lock-string-face ((t (:foreground "#0086d2"))))

	(font-lock-type-face ((t (:foreground "#cdcaa9"))))
	(font-lock-comment-face ((t (:foreground "#00d2ff"))))
	(font-lock-variable-name-face ((t (:foreground "#ffffff"))))
	(font-lock-comment-delimiter-face ((t (:foreground "#00d2ff"))))
	(font-lock-doc-face ((t (:foreground "#00d2ff"))))
	(font-lock-keyword-face ((t (:foreground "#ff0086"))))
	(font-lock-constant-face ((t (:foreground "#0086f7"))))
	(font-lock-preprocessor-face ((t (:foreground "#ff0007"))))
	(font-lock-doc-string-face ((t (:foreground "#00d2ff"))))
	(font-lock-builtin-face ((t (:foreground "#ff0086"))))
	(font-lock-function-name-face ((t (:foreground "#ff0086"))))
))
	        (set-cursor-color "yellow"))
