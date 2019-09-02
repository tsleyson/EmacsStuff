;; Make sure melpa certificates are verified correctly
(require 'gnutls)
(add-to-list 'gnutls-trustfiles "/usr/local/etc/openssl/cert.pem")

;; Some other extension I'm using has screwed up package initialzation which has
;; made stuff in the elpa folder not load correctly.
(package-initialize)

;; My personal global key bindings.
(global-set-key (kbd "C-c C-r") 'reunite-orphaned-first-letter)
(global-set-key (kbd "C-c C-l") 'reunite-orphaned-last-letter)
;; For when the above settings are overridden, eg org mode
(global-set-key (kbd "C-c C-0") 'reunite-orphaned-first-letter)
(global-set-key (kbd "C-c C-9") 'reunite-orphaned-last-letter)
;; General
;;(global-set-key (kbd "M--") 'insert-unicode-em-dash)
;;(global-set-key (kbd "C-c C-n C--") 'insert-unicode-en-dash)—
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

(global-set-key (kbd "C-c C-d w") 'delete-trailing-whitespace)
(global-set-key (kbd "<f12>") 'magit-status)

(add-to-list 'load-path "/Users/trisdan/.emacs.d/my-extensions")
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

;; Don't show top tool bar
(tool-bar-mode -1)

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

;;(require 'typopunct)
;;(typopunct-change-language 'english t)
;; “Using nice quotes.” Typopunct.
;; "Using ugly quotes." C-q C-”.

; Make markdown mode also have visual-line-mode and typopunct mode by default.
(add-hook 'text-mode-hook 'visual-line-mode)
;;(add-hook 'text-mode-hook 'typopunct-mode)
;;(add-hook 'org-mode-hook 'typopunct-mode)
;;(add-hook 'markdown-mode-hook 'typopunct-mode)

;; Change C/C++/Java indentation rules
(setq c-default-style "bsd"
      c-basic-offset 4)

;; Load my html entity replacement functions
(load "html-entities.el")
;; Load my personal editing functions.
(load "my-editing.el")

;; Load functions to allow quick font changes.
(load "font-toggle.el")
(global-set-key (kbd "<f6>") 'cycle-font-forward)
(global-set-key (kbd "<f7>") 'cycle-font-backward)

;; Set default font for all windows.
(add-to-list 'default-frame-alist '(font . "Monaco 12"))

;; Get rid of annoying screen flash on Mac OS X. 
(setq ring-bell-function 'ignore)

;; Activate ido mode.
(require 'ido)
(ido-mode t)

;; Saves files between sessions.
(desktop-save-mode t)

;; Turn on line numbers.
(require 'linum)
(global-linum-mode t)

;; Automatically reloads files which have changed on disk.
(global-auto-revert-mode t)

;; Let you use hex code points with C-q.
(setq read-quoted-char-radix 16)

;; add markdown mode as default for text and md
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; Settings for backups. See [[http://www.emacswiki.org/emacs/BackupDirectory]]
(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.backups"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups

;;(exec-path-from-shell-initialize)
(add-to-list 'exec-path "/usr/bin/local")

;; Fullscreen on startup
(add-to-list 'default-frame-alist '(fullscreen . fullheight))
(add-to-list 'default-frame-alist '(fullscreen . fullwidth))

;; Use js2-minor-mode with Javascript files.
(add-hook 'js-mode-hook 'js2-minor-mode)

;; Configure auto-complete mode.
(require 'auto-complete-config)
;; Dictionaries
(add-to-list 'ac-dictionary-directories 
	     "~/.emacs.d/elpa/auto-complete-20160107.8/dict")
(setq-default ac-sources (add-to-list 'ac-sources 'ac-source-dictionary))
(add-hook 'prog-mode-hook 'auto-complete-mode)
(setq ac-auto-start 3)
(setq ac-ignore-case nil)

;; Configure yasnippets
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/elpa/yasnippet-20160226.1359/snippets/")
(add-to-list 'yas-snippet-dirs (locate-user-emacs-file "snippets"))
(yas-global-mode 1)
(add-to-list 'ac-sources 'ac-source-yasnippet)

(require 'nodejs-repl)

(add-to-list 'auto-mode-alist '("\\.handlebars" . handlebars-mode))

;; Make runpython use Python 3
(setq python-shell-interpreter "python3")

;; Make sure emacs can find ispell so spell-checking works
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))
(add-hook 'text-mode-hook 'flyspell-mode)

;; Make sure emacs can find cargo for Rust
(setq cargo-dir (substitute-in-file-name "$HOME/.cargo/bin/cargo"))
(setenv "PATH" (concat (getenv "PATH") (format ":%s" cargo-dir)))
(setq exec-path (append exec-path '(~cargo-dir)))

;; Set default font for OS X. Change for other platforms.
(set-default-font "Monaco 12")
;;(set-default-font "Georgia 14")
(setq default-tab-width 4)

;; Try making command also meta for a while, see how it goes.
(setq mac-command-modifier 'meta)

;; Smart quotes mode
;;(require 'smart-quotes)

;; Ruby / Rails configuration
(require 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)
(add-hook 'ruby-mode-hook 'projectile-on)
(add-hook 'comint-mode-hook (lambda () (setq comint-process-echoes t)))

;; Set command as meta for mac os x, and make option nothing so you
;; can use it as a modifier. I'm having trouble getting used to it
;; and I actually like having meta a little further over, so it's
;; disabled for now. 
;; (when (eq system-type 'darwin)
;;   (setq mac-command-modifier 'meta)
;;   (setq mac-option-modifier nil))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
	("28ec8ccf6190f6a73812df9bc91df54ce1d6132f18b4c8fcc85d45298569eb53" "569964314f42b3ca20080c39516c523bb07d768be9af2c6437b799127a31b380" "a3132bd39a977ddde4c002f8bd0ef181414c3fbe9228e3643b999491192680ad" "8aa7eb0cc23931423f719e8b03eb14c4f61aa491e5377073d6a55cba6a7bc125" "01ce486c3a7c8b37cf13f8c95ca4bb3c11413228b35676025fdf239e77019ea1" "bf25a2d5c2eddc36b2ee6fc0342201eb04ea090e637562c95b3b6e071216b524" "90e4b4a339776e635a78d398118cb782c87810cb384f1d1223da82b612338046" default)))
 '(package-selected-packages
   (quote
	(yasnippet-classic-snippets magit tommyh-theme toml-mode cargo rust-mode terraform-mode cider yasnippet yaml-mode web-mode sx spinner seq scala-mode2 rvm reykjavik-theme queue projectile paredit org-bookmark-heading nodejs-repl js2-mode inf-ruby highlight-chars helm haskell-mode handlebars-sgml-mode handlebars-mode gotham-theme gorepl-mode golint go-mode flymake-ruby exec-path-from-shell dark-krystal-theme coffee-mode clues-theme clojure-mode auto-complete afternoon-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
