;; disable GNU Emacs buffer at startup
(setq inhibit-splash-screen t)

;; defualt taw width
(setq-default tab-width 4)

;; indent by space
(setq-default indent-tabs-mode nil)

;; show paren
(setq show-paren-mode-delay 0)
(show-paren-mode t)

;; autoclose
(electric-pair-mode 1)

(setq kill-whole-line t)

;; set backup dirctory
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))

;; set autosave directory
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; disable auto-save-list directory automatically created
(setq auto-save-list-file-prefix nil)

;; disable lock file
(setq create-lockfiles nil)
;; load modified file
(global-auto-revert-mode t)

;; 日本語入力時のちらつき防止
(setq redisplay-dont-pause nil)

(provide 'init-etc)
