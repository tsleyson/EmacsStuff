;; Note: This installation is enforcing GNU Emacs Lisp style guide
;; recommendations for comments, so it automatically right-aligns
;; comments that start with ;, but it does what I want for comments
;; that start with ;;.

;; Makes sure it looks in .emacs.d for packages and addons.
(add-to-list 'load-path "C:/Users/trisdan/.emacs.d")
(add-to-list 'load-path "C:/Users/trisdan/.emacs.d/my-extensions")
(require 'package)
(require 'linum)
;(require 'markdown-mode)

;; Let you use hex code points with C-q.
(setq read-quoted-char-radix 16)
; Turn on line numbers.
(global-linum-mode 1)

;; Turn off auto-fill mode. (It stinks).
;; It's actually good for programming language comments, but it sucks
;; for text (it's inferior to visual line mode).
;; LINE 83 starter-kit-defuns.el TO DISABLE GLOBALLY.
(turn-off-auto-fill)
(auto-fill-mode -1)
(remove-hook 'text-mode-hook 'turn-on-auto-fill)
(remove-hook 'ruby-mode-hook 'turn-on-auto-fill)
(remove-hook 'org-mode-hook 'turn-on-auto-fill)
(remove-hook 'markdown-mode-hook 'turn-on-auto-fill)

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

; Make markdown mode also have visual-line-mode by default.
(add-hook 'text-mode-hook 'visual-line-mode)

;; Change C/C++/Java indentation rules
(setq c-default-style "bsd"
      c-basic-offset 4)

; Include clojure mode and other starter kit packages.
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(defvar my-packages '(starter-kit
		      starter-kit-lisp
		      starter-kit-bindings
		      starter-kit-eshell
		      clojure-mode
		      clojure-test-mode
		      nrepl))
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

; Always use Unix line endings.
(set-default buffer-file-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
(set-default default-buffer-file-coding-system 'utf-8-unix)

;; Load my personal editing functions.
(load "my-editing.el")

;; My personal global key bindings.
(global-set-key (kbd "C-c C-r") 'reunite-orphaned-first-letter)
(global-set-key (kbd "C-c C-l") 'reunite-orphaned-last-letter)
;; For when the above settings are overridden, eg org mode
(global-set-key (kbd "C-c C-9") 'reunite-orphaned-first-letter)
(global-set-key (kbd "C-c C-0") 'reunite-orphaned-last-letter)
(global-set-key (kbd "C--") 'insert-unicode-em-dash)
(global-set-key (kbd "M-z") 'other-window)
(global-set-key (kbd "C-c M-z") 'zap-to-char)
(global-set-key (kbd "M-b") 'ido-switch-buffer)
(global-set-key (kbd "C-x C-k") 'ido-kill-buffer)  ; I make this typo a lot.
(global-set-key (kbd "C-c C-a") 'mark-whole-buffer) ; Like CUA C-a.
(global-set-key (kbd "M-1") 'delete-other-windows)
(global-set-key (kbd "M-2") 'split-window-below)
; set by M-x customize
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2"
                            "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes (quote (adwaita)))
 '(text-mode-hook (quote (visual-line-mode text-mode-hook-identify))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Sets the highlight line to let syntax highlighting show through,
;; and also changes the color to a nice dark yellow that you can see
;; through.
;;
;; (set-face-attribute 'hl-line nil
;;                     :background "#ffff99"
;;                     :foreground nil
;;                    :inherit t)
;; Note: the above works if you just hit M-x eval-buffer, but when you
;; start up Emacs it fails with the error "Invalid face hl-line". I'm
;; just going to turn off hl-line-mode from starter-kit-defuns.el.

;; Load functions to allow quick font changes.
(load "font-toggle.el")
(global-set-key (kbd "<f6>") 'cycle-font-forward)
(global-set-key (kbd "<f7>") 'cycle-font-backward)

;; Set default font for all windows.
(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-10"))

;; Also make text modes have variable-width font. Easier to read.
;; But also slow, so I'm going to try just using Constantia for everything.
;;(add-hook 'text-mode-hook 'variable-pitch-mode)

;; (setq explicit-shell-file-name "C:/cygwin/bin/bash")
;; (setq explicit-bash-args '("--login" "-i"))
;; Makes M-x shell use Cygwin, only it's so fucking annoying that
;; even cmd.exe is an improvement. (Autocomplete is iffy, no ability
;; to kill runaway processes, colors are ugly, always starts in home
;; directory, etc.) Some of these are fixable, though.

;; http://stackoverflow.com/questions/3847981/cygwin-shell-in-emacs-output-messed-up
;; shows how to fix the color and garbage output problems.
