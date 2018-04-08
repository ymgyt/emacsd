;; bind meta key to left command
(when (eq system-type 'darwin)
  (setq ns-command-modifier (quote meta)))

(global-set-key (kbd "C-m") 'newline-and-indent)

;; bind C-h to backspace
(define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))

;; toggle line truncate
(define-key global-map (kbd "C-c l") 'toggle-truncate-lines)

;; save buffer
(define-key global-map (kbd "C-;") 'save-buffer)


(provide 'init-keybind)
