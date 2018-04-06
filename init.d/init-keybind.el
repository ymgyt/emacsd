;; bind meta key to left command
(when (eq system-type 'darwin)
  (setq ns-command-modifier (quote meta)))

(provide 'init-keybind)
