(deftheme tan-background
  "Created 2014-01-18.")

(custom-theme-set-variables
 'tan-background
 '(text-mode-hook (quote (visual-line-mode text-mode-hook-identify))))

(custom-theme-set-faces
 'tan-background
 '(default ((t (:inherit nil :stipple nil :background "lemon chiffon" :foreground "SystemWindowText" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "outline" :family "Courier New")))))

(provide-theme 'tan-background)
