;; My personal editing functions

(defun reunite-orphaned-first-letter ()
  "I make mistakes liket his a lot. This
  fixes them."
  (interactive)
  (progn
    (left-word 1)
    (backward-delete-char 1)
    (backward-char 1)
    (insert " ")
    (right-word 1)))

(defun reunite-orphaned-last-letter ()
  "I also make mistakes lik ethis a lot.
   This fixes them."
  (interactive)
  (progn
    (left-word 1)
    (backward-delete-char 1)
    (forward-char 1)
    (insert " ")
    (right-word 1)))

;; Note: In TeX insert mode, --- gets automatically replaced with
;; this. Pandoc also does this for Markdown.
(defun insert-unicode-em-dash ()
  (interactive)
  (insert "—"))

;; -- in TeX mode.
(defun insert-unicode-en-dash ()
  (interactive)
  (insert "–"))

(defun orgicize-headings (marker)
  "For my Thoughts files, to make the headings into org headings."
  (interactive "sEnter heading marker: ")
  (replace-regexp "^\(.+:

\)"
                  (format "%s %s" marker \1)))

;; For some unfathomable reason nothing I did with that function worked.
;; But that's the regexp to do it manually. Use \, before format to use
;; that replacement, or just type in ** \1 or ## \1.
;; It doesn't work because \1 doesn't work as a backref in this
;; context. If I look into elisp a bit more, I can probably make it work.

(defun clear-shell ()
  "Clear shell buffer output."
  (interactive)
  (let ((comint-buffer-maximum-size 0))
    (comint-truncate-buffer)))

;;(define-key org-mode-map "\"" #'endless/round-quotes)


;; Endless Parentheses solution since Typopunct is stupid.
;; (defun endless/round-quotes (italicize)
;;   "Insert “” and leave point in the middle.
;; With prefix argument ITALICIZE, insert /“”/ instead (meant for
;; org-mode).
;; If inside a code-block, simply calls `self-insert-command'."
;;   (interactive "P")
;;   (if (and (derived-mode-p 'org-mode) (org-in-src-block-p))
;;       (call-interactively 'self-insert-command)
;;     (if (looking-at "”[/=_\\*]?")
;;         (goto-char (match-end 0))
;;       (when italicize
;;         (insert "//")
;;         (forward-char -1))
;;       (insert "“”")
;;       (forward-char -1))))
