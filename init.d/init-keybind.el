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

;; window undo
(winner-mode)
(global-set-key (kbd "C-z") 'winner-undo)
(global-set-key (kbd "C-M-z") 'winner-redo)

;; rotate window
(global-set-key (kbd "C-t") 'other-window)


(provide 'init-keybind)
