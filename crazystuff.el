;; Note: This installation is enforcing GNU Emacs Lisp style guide
;; recommendations for comments, so it automatically right-aligns
;; comments that start with ;, but it does what I want for comments
;; that start with ;;.

;; Makes sure it looks in .emacs.d for packages and addons.
(add-to-list 'load-path "/Users/trisdan/.emacs.d/my-extensions")
(add-to-list 'load-path "/Users/trisdan/.emacs.d/my-extensions/python-django")

(require 'linum)
;; Saves files between sessions.
(desktop-save-mode t)

;; Automatically reloads files which have changed on disk.
(global-auto-revert-mode t)

;; Let you use hex code points with C-q.
(setq read-quoted-char-radix 16)
; Turn on line numbers.
(global-linum-mode 1)

;; Turn off auto-fill mode. (It stinks).
;; It's actually good for programming language comments, but it sucks
;; for text (it's inferior to visual line mode).
;; LINE 83 starter-kit-defuns.el TO DISABLE GLOBALLY.
;;(turn-off-auto-fill)
;; (remove-hook 'text-mode-hook 'turn-on-auto-fill)
;; (remove-hook 'org-mode-hook 'turn-on-auto-fill)
;; (remove-hook 'markdown-mode-hook 'turn-on-auto-fill)

; Turn off flyspell mode since it doesn't work and is slow.
(flyspell-mode -1)
(remove-hook 'text-mode-hook #'turn-on-flyspell)

;; Turn off hl-line-mode that highlights current line.
(remove-hook 'coding-hook 'turn-on-hl-line-mode)

; add markdown mode as default for text and md
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(require 'typopunct)
(typopunct-change-language 'english t)

; Make markdown mode also have visual-line-mode and typopunct mode by default.
(add-hook 'text-mode-hook 'visual-line-mode)
;; “Using nice quotes.” Typopunct.
;; "Using ugly quotes." C-q C-”.
(add-hook 'text-mode-hook 'typopunct-mode)
(add-hook 'org-mode-hook 'typopunct-mode)
(add-hook 'markdown-mode-hook 'typopunct-mode)

;; Make web-mode the default for html and .html.erb files.
(add-to-list 'auto-mode-alist '("\\.html" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html.erb\\'" . web-mode))

;; Assign php-mode for php files
(add-to-list 'auto-mode-alist '("\\.php" . php-mode))

;; Make js2-mode (Yes, Steve Yegge's, though it's now maintained by
;; other people) the default for Javascript.
(add-to-list 'auto-mode-alist '("\\.js" . js2-mode))

;; Change C/C++/Java indentation rules
(setq c-default-style "bsd"
      c-basic-offset 4)

(setq nrepl-log-messages t)
(setq nrep-hide-special-buffers t)
(setq cider-prefer-local-resources t)
(setq nrepl-buffer-name-show-port t)

; Always use Unix line endings.
(set-default buffer-file-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
(set-default default-buffer-file-coding-system 'utf-8-unix)

;; Load my html entity replacement functions
(load "html-entities.el")
;; Load my personal editing functions.
(load "my-editing.el")

;; My personal global key bindings.
(global-set-key (kbd "C-c C-r") 'reunite-orphaned-first-letter)
(global-set-key (kbd "C-c C-l") 'reunite-orphaned-last-letter)
;; For when the above settings are overridden, eg org mode
(global-set-key (kbd "C-c C-0") 'reunite-orphaned-first-letter)
(global-set-key (kbd "C-c C-9") 'reunite-orphaned-last-letter)
;; Prevent accidentally closing out program
;;(global-set-key (kbd "C-x C-c") '(lambda () (interactive) (message "Try C-kp0 C-kp.")))
;;(global-set-key (kbd "C-<kp-0> C-<kp-decimal>") 'save-buffers-kill-terminal)
;; General
(global-set-key (kbd "C--") 'insert-unicode-em-dash)
(global-set-key (kbd "C-c C-n C--") 'insert-unicode-en-dash)
(global-set-key (kbd "M-z") 'other-window)
(global-set-key (kbd "<f2>") 'other-window)
(global-set-key (kbd "C-c M-z") 'zap-to-char)
;;(global-set-key (kbd "M-b") 'ido-switch-buffer)
(global-set-key (kbd "<f8>") 'ido-switch-buffer)
(global-set-key (kbd "C-x C-k") 'ido-kill-buffer)  ; I make this typo a lot.
(global-set-key (kbd "C-c C-a") 'mark-whole-buffer) ; Like CUA C-a.
(global-set-key (kbd "<kp-multiply>") 'count-words)
(global-set-key (kbd "<apps>") 'smex)
(global-set-key (kbd "<kp-enter>") 'save-buffer)
(global-set-key (kbd "<f9>") 'save-buffer)
(global-set-key (kbd "M-1") 'delete-other-windows)
(global-set-key (kbd "M-2") 'split-window-below)
(global-set-key (kbd "C-x C-o") 'delete-blank-lines)  ; C-o to insert one blank line.
(global-set-key (kbd "M-j") 'delete-indentation)  ; Joins line with line above.
;; M-space to remove all spaces save one.
;; M-\ to remove all spaces, period.
;; M-x canonically-space-region to put one space between every word and two after periods.

;; Set browse-url-of-buffer to C-c C-v in web mode as well.
(add-hook 'web-mode-hook
          (lambda () (local-set-key (kbd "C-c C-v") 'browse-url-of-buffer)))

;; set by M-x customize
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Linum-format "%7i ")
 '(ansi-color-names-vector ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(ansi-term-color-vector [unspecified "#110F13" "#b13120" "#719f34" "#ceae3e" "#7c9fc9" "#7868b5" "#009090" "#F4EAD5"])
 '(custom-enabled-themes (quote (tango)))
 '(custom-safe-themes (quote ("54a6c5c2bf2be95e6046327ec73e4c9f8c90b187a30b6c7729c3dca2dbad9e56" "5e1d1564b6a2435a2054aa345e81c89539a72c4cad8536cfe02583e0b7d5e2fa" "084fb2f46f170f79b68db062e7d47df904739e4846bf4cea742dbf66ceef672a" "787574e2eb71953390ed2fb65c3831849a195fd32dfdd94b8b623c04c7f753f0" "579e9950513524d8739e08eae289419cfcb64ed9b7cc910dd2e66151c77975c4" "617219c11282b84761477059b9339da78ce392c974d9308535ee4ec8c0770bee" "e83c94a6bfab82536cef63610ec58d08dfddd27752d860763055daf58d028aad" "180adb18379d7720859b39124cb6a79b4225d28cef4bfcf4ae2702b199a274c8" "e890fd7b5137356ef5b88be1350acf94af90d9d6dd5c234978cd59a6b873ea94" "f8b0f724d19fd72ff5a2aa42e0cf03e108d6098a705daf1eec43b720bf427720" default)))
 '(fci-rule-character-color "#202020")
 '(fci-rule-color "#2e2e2e")
 '(fringe-mode 10 nil (fringe))
 '(linum-format " %6d ")
 '(main-line-color1 "#222232")
 '(main-line-color2 "#333343")
 '(main-line-separator-style (quote chamfer))
 '(powerline-color1 "#222232")
 '(powerline-color2 "#333343")
 '(text-mode-hook (quote (visual-line-mode text-mode-hook-identify)))
 '(vc-annotate-background "#3b3b3b")
 '(vc-annotate-color-map (quote ((20 . "#dd5542") (40 . "#CC5542") (60 . "#fb8512") (80 . "#baba36") (100 . "#bdbc61") (120 . "#7d7c61") (140 . "#6abd50") (160 . "#6aaf50") (180 . "#6aa350") (200 . "#6a9550") (220 . "#6a8550") (240 . "#6a7550") (260 . "#9b55c3") (280 . "#6CA0A3") (300 . "#528fd1") (320 . "#5180b3") (340 . "#6380b3") (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Load functions to allow quick font changes.
(load "font-toggle.el")
(global-set-key (kbd "<f6>") 'cycle-font-forward)
(global-set-key (kbd "<f7>") 'cycle-font-backward)

;; Set default font for all windows.
(add-to-list 'default-frame-alist '(font . "Monaco 12"))

;; Get rid of annoying screen flash on Mac OS X. 
(setq ring-bell-function 'ignore)
