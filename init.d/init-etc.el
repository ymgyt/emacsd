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

;; smartparens
(smartparens-global-strict-mode)
;; toggle strict mode
(define-key global-map (kbd "C-c s") 'smartparens-strict-mode)


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
(setq-default
 ispell-program-name "aspell"
 ispell-extra-args '("--sug-mode=ultra" "--lang=en_US" "--run-together" "--run-together-limit=5" "--run-together-min=2"))

(eval-after-load "ispell"
  '(add-to-list 'ispell-skip-region-alist '("[^\000-\377]+")))


;; flyspell
(setq flyspell-issue-message-flag nil)
;; flyspellのkeybindを無効にしておく
(eval-after-load "flyspell"
  '(define-key flyspell-mode-map (kbd "C-;") nil))

;; pair
(require 'smartparens-config)
(defun radian-enter-and-indent-sexp (&rest _ignored)
  "Insert an extra newline after point, and reindent."
  (newline)
  (indent-according-to-mode)
  (forward-line -1)
  (indent-according-to-mode))

(dolist (mode '(go-mode))
  (sp-local-pair mode "{" nil :post-handlers
                 '((radian-enter-and-indent-sexp "RET")
                   (radian-enter-and-indent-sexp "<return>")))
  (sp-local-pair mode "(" nil :post-handlers
                 '((radian-enter-and-indent-sexp "RET")
                   (radian-enter-and-indent-sexp "<return>"))))

;; indent guide
(setq highlight-indent-guides-responsive 'top)
(setq highlight-indent-guides-delay 0)
(setq highlight-indent-guides-method 'character)
;; うまく機能してるか怪しい
;; yaml modeでずれる
(defun my-highlighter (level responsive display)
  (if (> 1 level)
      nil
    (highlight-indent-guides--highlighter-default level responsive display)))

;; (setq highlight-indent-guides-highlighter-function 'my-highlighter)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(add-hook 'yaml-mode-hook 'highlight-indent-guides-mode)

(global-set-key (kbd "C-c d") 'sp-unwrap-sexp)


;; font
;; http://extra-vision.blogspot.com/2016/07/emacs.html
;; 第一引数にはfont-specは利用できない
(create-fontset-from-ascii-font "Ricty-13:weight=normal:slant=normal" nil "ricty")
;; create-fontset-from-ascii-fontで fontset-rictyが作成されている
;; 第二引数はunicodeの指定がよいらしい
;; 第三引数にはfont-specが利用できる
(set-fontset-font "fontset-ricty"
                  'unicode
                  (font-spec :family "Rictry" :size 13)
                  nil
                  'append)
(add-to-list 'default-frame-alist '(font . "fontset-ricty"))
(set-face-font 'default "fontset-ricty")

(provide 'init-etc)
