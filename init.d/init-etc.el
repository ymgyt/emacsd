;; disable GNU Emacs buffer at startup
(setq inhibit-splash-screen t)

;; defualt taw width
(setq-default tab-width 4)

;; indent by space
(setq-default indent-tabs-mode nil)

;; indent
(electric-indent-mode)

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


(setq sh-basic-offset 2)
(setq sh-indentation 2)


;; js
(setq js-indent-level 2)

;; scroll
(setq scroll-conservatively 1)

;; high-light current line
(global-hl-line-mode)

;; 自動で変更を読み込む
(global-auto-revert-mode t)

;; shbangがあれば実行権限を付与
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

;; 短形編集
(cua-mode t)
(setq cua-enable-cua-keys nil)

;; save cursol position
(save-place-mode 1)

;; beacon
(beacon-mode 1)

;; comment
(global-set-key (kbd "M-;") 'comment-dwim-2)

;; maximize window size
(add-hook 'window-setup-hook 'maximize-frame t)

;; yes or no -> y/n
(defalias 'yes-or-no-p 'y-or-n-p)

;; aspell
(setq-default ispell-program-name "aspell")
(eval-after-load "ispell"
  '(add-to-list 'ispell-skip-region-alist '("[^\000-\377]+")))
(setq flyspell-issue-message-flag nil)

(provide 'init-etc)
