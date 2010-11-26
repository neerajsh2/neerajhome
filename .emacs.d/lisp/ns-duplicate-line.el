;;; ns-dublicate-line.el --- Easily dublicate a line

;; Here's a couple of commands I find indispensible;; they might as well
;; see the light of day now, while I'm thinking of them.  I bind them
;; thus:
;; 
;; (global-set-key "\M-p" 'duplicate-previous-line)
;; (global-set-key "\M-n" 'duplicate-following-line)
;; 
;; and they behave in ordinary text buffers something like the same keys
;; do in buffers with history, duplicating lines from nearby in the
;; buffer.
;; 
;; I included my `point-at' macro rather than expanding it out by hand.
;; 
;; Copyright notice included even though I doubt it's needed on something
;; so small.

;;; Code:

(defmacro point-at (&rest forms)
  "Evaluate list of forms, and return the value of point after evaluation."
  (` (progn (,@ forms)
	    (,@ '((point))))))

(defun ns-duplicate-line (n dir)
  "Copy the Nth following line to point.
If the last command was a duplication, replace the current line by the next
line in direction DIR."
  (if (eq (car-safe last-command) 'duplicate-line)
      (progn
        (delete-region (point-at (beginning-of-line nil))
                       (point-at (end-of-line nil)))
        (setq n (+ dir (cdr last-command))))
    (kill-region (point-at (beginning-of-line nil))
                 (point-at (end-of-line nil))))
  (if (= n 0)
      (insert (current-kill 0))
    (insert (save-excursion
              (beginning-of-line (1+ n))
              (buffer-substring (point)
                                (point-at (end-of-line nil)))))
    (setq this-command (cons 'duplicate-line n))))

(defun ns-duplicate-previous-line (n)
  "Copy the Nth previous line to point.
If repeated, replace by the line preceding the one that was copied last time.
This command can be interleaved with \\[duplicate-following-line]."
  (interactive "p")
  (ns-duplicate-line (- n) -1))

(defun ns-duplicate-following-line (n)
  "Copy the Nth following line to point.
If repeated, replace by the line following the one that was copied last time.
This command can be interleaved with \\[duplicate-previous-line]."
  (interactive "p")
  (ns-duplicate-line n 1))

(provide 'ns-duplicate-line)
;;; dublicate-line.el ends here.