;;; font-toggle.el
;; Defines a function that lets you cycle through a list of fonts.
;; The fonts are in ξ-font-list and are segregated by OS.
;; If you ever need to add Mac, add a clause with "darwin" to the
;; cond.

;; Courtesy of Xah Lee, http://ergoemacs.org/emacs/emacs_switching_fonts.html
(defcustom ξ-font-list nil "A list of fonts for `cycle-font' to choose from."
  :group 'font)

(set-default 'ξ-font-list
             (cond ((string-equal system-type "windows-nt")
                    '(
                      "Ubuntu Mono 12"
                      "DejaVu Sans Mono-10"
                      "Lucida Console-10"
                      "Lucida Sans Unicode-10"
                      "Gentium Book Basic-12"
                      "Simonetta-12"
                      "Constantia-12"
                      "Noto Serif-11"  ; Mamiko Noto's font.
                      ))
                   ((string-equal system-type "linux")
                    '("Ubuntu Mono-12"
                      "DejaVu Sans Mono-12"))
                   ((string-equal system-type "Darwin")
                    '("Monaco-12"
                      "Cochin-14"))))
                                        ; Don't bother adding Mac.
					; Now is the time to add Mac.
(defun cycle-font (ξ-n)
  "Change font in current frame.
Each time this is called, font cycles through the list of fonts in 
the variable ξ-font-list.
If ξ-n is 1, cycle forward.
If ξ-n is -1, cycle backward."
  (interactive "p")
  ;; Sets the property "state".
  (let (font-to-use state-before state-after)
    (setq state-before (if (get 'cycle-font 'state)
                           (get 'cycle-font 'state)
                         0))
    (setq state-after (% (+ state-before (length ξ-font-list) ξ-n)
                         (length ξ-font-list)))
    (setq font-to-use (nth state-after ξ-font-list))
    (set-frame-parameter nil 'font font-to-use)
    (redraw-frame (selected-frame))
    (message "Current font is: %s" font-to-use)
    (put 'cycle-font 'state state-after)))

(defun cycle-font-forward ()
  "Go to the next font."
  (interactive)
  (cycle-font 1))

(defun cycle-font-backward ()
  (interactive)
  (cycle-font -1))
