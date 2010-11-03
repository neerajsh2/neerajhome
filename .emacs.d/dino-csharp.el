;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; csharp mode
;

;; csharp mode was originally from Brad Merrill, bmerrill@microsoft.com
;; but then Dennis Haney (I think) <davh@davh.dk> updated it.
;; http://davh.dk/script/
;;
;; I then found what I think is a later version? better integrated with cc-modes.?
;; maintained by Dylan Moonfire. Most recently updated September 2007.
;; http://mfgames.com/linux/csharp-mode
;;

(require 'csharp-mode)

(require 'hideshow)  ; builtin to emacs


;(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
(c-add-style "C#"
 '("Java"
   (c-basic-offset . 2)
   (c-comment-only-line-offset . (0 . 0))
   (c-offsets-alist
    . (
       (access-label . -)
       (arglist-close . c-lineup-arglist)
       (arglist-cont . 0)
       (arglist-cont-nonempty . c-lineup-arglist)
       (arglist-intro . c-lineup-arglist-intro-after-paren)
       (block-close . 0)
       (block-open . 0)
       (brace-entry-open . 0)
       (brace-list-close . 0)
       (brace-list-entry . 0)
       (brace-list-intro . +)
       (brace-list-open . +)
       (c . c-lineup-C-comments)
       (case-label . 0)
       (catch-clause . 0)
       (class-close . 0)
       (class-open . 0)
       (comment-intro . c-lineup-comment)
       (cpp-macro . 0)
       (cpp-macro-cont . c-lineup-dont-change)
       (defun-block-intro . +)
       (defun-close . 0)
       (defun-open . 0)
       (do-while-closure . 0)
       (else-clause . 0)
       (extern-lang-close . 0)
       (extern-lang-open . 0)
       (friend . 0)
       (func-decl-cont . +)
       (inclass . +)
       (inexpr-class . +)
       (inexpr-statement . 0)
       (inextern-lang . +)
       (inher-cont . c-lineup-multi-inher)
       (inher-intro . +)
       (inlambda . c-lineup-inexpr-block)
       (inline-close . 0)
       (inline-open . 0)
       (innamespace . +)
       (knr-argdecl . 0)
       (knr-argdecl-intro . 5)
       (label . 0)
       (lambda-intro-cont . +)
       (member-init-cont . c-lineup-multi-inher)
       (member-init-intro . +)
       (namespace-close . 0)
       (namespace-open . 0)
       (objc-method-args-cont . c-lineup-ObjC-method-args)
       (objc-method-call-cont . c-lineup-ObjC-method-call)
       (objc-method-intro . [0])
       (statement . 0)
       (statement-block-intro . +)
       (statement-case-intro . +)
       (statement-case-open . +)
       (statement-cont . +)
       (stream-op . c-lineup-streamop)
       (string . c-lineup-dont-change)
       (substatement . +)
       (substatement-open . 0)
       (template-args-cont c-lineup-template-args +)
       (topmost-intro . 0)
       (topmost-intro-cont . 0)
       ))
   ))


(c-add-style "myC#Style"
  '("C#"  ; this must be defined elsewhere
  (c-basic-offset . 4)
  (c-echo-syntactic-information-p . t)
  (c-comment-only-line-offset . (0 . 0))
  (c-offsets-alist . (
    (c                     . c-lineup-C-comments)
    (namespace-open        . 0)
    (namespace-close       . 0)
    (innamespace           . +)
    (class-open            . 0)
    (class-close           . 0)
    (inclass               . +)
    (block-open            . -)    ; eg, open a block under a function name or if stmt;
                                   ; want this to be flush with prev line.
    (arglist-cont          . +)
    (substatement-open     . 0)  ; I think this is for a try {} or if{} or etc. why this is not block open, I don't know!
    (defun-open            . 0)  ; method defn? (but no!)
    (defun-block-intro     . +)  ;0 ; block within a function????
    (inline-open           . 0)  ; eg, opening a function? ??
    (statement-block-intro . +)  ; unknown what this is
    (brace-list-open       . 0)  ; list open (like an enum, array initializer)
    (brace-list-intro      . +)  ; first item in the list
    (brace-list-entry      . 0)  ; subsequent items in the list
    (brace-list-close      . 0)  ; list close
    (statement-cont        . (dinoch-csharp-lineup-string-cont +))  ; align long strings
    ))
  ))

; this aligns long strings broken across multiple lines.
; need   (statement-cont . (dinoch-csharp-lineup-string-cont +)) in the styles list
(defun dinoch-csharp-lineup-string-cont (langelem)
  "Like `c-lineup-string-cont' but works with csharp string continuations."
  (save-excursion
    (back-to-indentation)
    (and (looking-at "@?\\s\"")
         (let ((quote (if (equal (char-after) ?@)
                          (char-after (1+ (point)))
                        (char-after)))
               pos)
           (while (and (progn (c-backward-syntactic-ws)
                              (when (eq (char-before) ?+)
                                (backward-char)
                                (c-backward-syntactic-ws))
                              (eq (char-before) quote))
                       (c-safe (c-backward-sexp) t)
                       ;; uncomment this to lineup under the @
                       ;;(progn (if (eq (char-before) ?@) (backward-char)) t)
                       (/= (setq pos (point)) (c-point 'boi))))
           (when pos
             (goto-char pos)
             (vector (current-column)))))))



;(debug-on-entry 'hs-hide-level-recursive)


;; for hideshow.el
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

  (let ((nestlevel 0)
        (mark1 (point))
        (done nil)
        )

    ;(show-match-data)

    (if (and arg (< arg 0))
        ;; a negative argument; we want to back up!
        (message "negative arg (%d) is not supported..." arg)

      ;; else, we have a positive argument, hence move forward.
      ;; simple case is just move forward one brace
      (if (looking-at "{")
          (and
           (forward-sexp arg)
           )

        ; The more complex case is dealing with a "region/endregion" block.
        ; We have to deal with nested regions!
        (and
         (while (not done)
           (re-search-forward "^[ \\t]*#[ \\t]*\\(region\\|endregion\\)\\b"
                              (point-max) 'move)
           (cond

            ((eobp))                            ; do nothing if at end of buffer

            ((and
              (match-beginning 1)

              ;; if the match is longer than 6 chars, we know it is "endregion"
              (if (> (- (match-end 1) (match-beginning 1)) 6)
                   (setq nestlevel (1- nestlevel))
                 (setq nestlevel (1+ nestlevel))
                )
              )))

           (setq done (not (and (> nestlevel 0) (not (eobp)))))

           ) ; while

         (if (= nest 0)
             (goto-char (match-end 2)))

         )
        )
      )
    )
  )

;; more for hideshow.el
(unless (assoc 'csharp-mode hs-special-modes-alist)
          (push '(csharp-mode
                  ; "\\(^\\s*#\\s*region\\b\\)\\|{"      ; regexp for start block
                  "\\(^[ \\t]*#[ \\t]*region\\b\\)\\|{"  ; regexp for start block

                  ; "\\(^\\s*#\\s*endregion\\b\\)\\|}"   ; regexp for end block
                  "\\(^[ \\t]*#[ \\t]*endregion\\b\\)\\|}"   ; regexp for end block

                  "/[*/]"                                ; regexp for comment start

                  csharp-hs-forward-sexp                 ; hs-forward-sexp-func
                  hs-c-like-adjust-block-beginning       ;c-like adjust (1 char)
                  ;csharp-hs-adjust-block-beginning      ;csharp adjust ?
                  )
                hs-special-modes-alist))

(defun raf-csharp-bracket ()
  "handle {}"
  (interactive)
  (let ((limit (+ 1 (point)))
        (found nil))
    (save-excursion
      (back-to-indentation)
      (setq found (re-search-forward "\\(try\\|else\\|namespace\\|class\\|interface\\|struct\\|)\\)[ \t\n]" limit t))
      )
    (if found
        (progn
          (end-of-line)
          (newline)
          (insert "{")
          (indent-according-to-mode)
          (newline)
          (newline)
          (insert "}")
          (indent-according-to-mode)
          (previous-line)
          (indent-according-to-mode))
        (insert "{"))))

(defun dino-csharp-mode-fn ()
  (cond (window-system
         (turn-on-font-lock)
         (c-set-style "myC#Style")
         (local-set-key "\M-\C-R"  'indent-region)
         (local-set-key "\M-#"     'dino-indent-buffer)
         (local-set-key "\M-s"     'dino-insert-csharp-gettersetter)
         (local-set-key "\C-cp"    'dino-convert-csharp-field-to-property)
         (local-set-key "\C-c\C-p" 'dino-convert-csharp-field-to-property)

         ; for skeleton stuff?  do I need this now?
         ;(make-local-variable skeleton-pair)
         (setq skeleton-pair t)
         ;;          (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
         ;;          (local-set-key (kbd "[") 'skeleton-pair-insert-maybe)
         (local-set-key (kbd "{") 'raf-csharp-bracket)
         ;; (local-set-key (kbd "\"") 'skeleton-pair-insert-maybe)

         ;; for snippets support:
         (yas/minor-mode-on)

         ;; for flymake support:
         (flymake-mode)

         ; for hide/show support
         (hs-minor-mode 1)
         (setq hs-isearch-open t)

         ; with point inside the block, use these keys to hide/show
         (local-set-key "\C-c>"  'hs-hide-block)
         (local-set-key "\C-c<"  'hs-show-block)

         ; autorevert.el is built-in to emacs; if files
         ; are changed outside of emacs, the buffer auto-reverts.
         (turn-on-auto-revert-mode)

         ; EmacsHelper Stuff:
         (require 'ide-bridge)
         (ide-bridge-setup)

         ; if you want to assign the key "C-;" you have to use (quote [67108923]) I'don't know why :o)
         (local-set-key (quote [67108923])      'ide-bridge-complete)
         (local-set-key "."      'ide-bridge-self-insert-complete)
         (local-set-key " "      'ide-bridge-self-insert-complete)
         (local-set-key "("      'ide-bridge-self-insert-complete)
         (local-set-key "\M-."  'ide-bridge-go-to-definition)
         (local-set-key "\M-,"  'ide-bridge-go-to-next-location)
         ;; end of EmacsHelper Stuff
         )))

(add-hook 'csharp-mode-hook 'dino-csharp-mode-fn)

