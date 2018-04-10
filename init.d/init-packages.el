'(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")))

(package-initialize)

(require 'cl)


;; config custom-set-variable file
(setq custom-file (locate-user-emacs-file "custom.el"))
(unless (file-exists-p custom-file)
  (write-region "" nil custom-file))
(load custom-file)

(defvar installing-package-list
  '(
    ace-jump-mode
    ace-window
    all-the-icons
    company
    company-go
    flycheck
    flycheck-gometalinter
    go-eldoc
    go-mode
    helm
    magit
    neotree
    nlinum
    shackle
    solarized-theme
    yasnippet))

(let ((not-installed (loop for x in installing-package-list
			   when (not (package-installed-p x))
			   collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
      (package-install pkg))))

;; ace-jump
(setq ace-jump-mode-gray-background nil)
(setq ace-jump-word-mode-use-query-char nil)
(define-key global-map (kbd "C-j") 'ace-jump-mode)

;; ace-window
(define-key global-map (kbd "C-'") 'ace-window)


;;neotree
(setq neo-persist-show t)
(setq neo-theme 'icons)
(setq neo-smart-open t)
(global-set-key [f8] 'neotree-toggle)

;; shackle
(setq shackle-rules
      '(;; *compilation*は下部に2割の大きさで表示
        (compilation-mode :align below :ratio 0.2)
        ;; ヘルプバッファは右側に表示
        ("*Help*" :align right)
        ;; 補完バッファは下部に3割の大きさで表示
        ("*Completions*" :align below :ratio 0.3)
        ;; M-x helm-miniは下部に7割の大きさで表示
        ("*helm mini*" :align below :ratio 0.7)
        ;; 他のhelmコマンドは右側に表示 (バッファ名の正規表現マッチ)
        ("\*helm" :regexp t :align right)
        ;; magit-status
        ("magit: *" :regexp t :align 'below :size 0.3)
        ;; 上部に表示
        ("foo" :align above)
        ;; 別フレームで表示
        ("bar" :frame t)
        ;; 同じウィンドウで表示
        ("baz" :same t)
        ;; ポップアップで表示
        ("hoge" :popup t)
        ;; 選択する
        ("abc" :select t)
        ))
(shackle-mode 1)
(setq shackle-lighter "")

;; magit
(global-set-key (kbd "C-c m s") 'magit-status)

;; company
(global-company-mode)
(setq company-tooltip-limit 20) ; bigger popup window
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 2)
(setq company-selection-wrap-around t)

(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)

;; go
(add-to-list 'exec-path (expand-file-name "~/go/bin"))


(defun my-go-mode-hook ()
  ;; use goimport as fmt command
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  
  ;; keybind
  (local-set-key (kbd "C-c C-o") 'pop-tag-mark)
  (local-set-key (kbd "M-p") 'compile)
  (local-set-key (kbd "M-]") 'next-error)
  (local-set-key (kbd "M-[") 'previous-error)
  
  ;; explicitly set company-go
  (set (make-local-variable 'company-backends) '(company-go))

  ;; function signature on buffer
  (go-eldoc-setup)

  ;; flycheck
  (flycheck-gometalinter-setup)
  (setq flycheck-gometalinter-fast t)
  (setq flycheck-gometalinter-test t)
  (setq flycheck-gometalinter-vendor t)
  (setq flycheck-gometalinter-errors-only t)
  (setq flycheck-gometalinter-deadline "10s"))

(add-hook 'go-mode-hook 'my-go-mode-hook)
(add-hook 'go-mode-hook 'flycheck-mode)

;; helm
(require 'helm-config)
(helm-mode 1)

(define-key global-map (kbd "C-x b")   'helm-buffers-list)
(define-key global-map (kbd "M-x")     'helm-M-x)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(define-key global-map (kbd "C-x C-r") 'helm-recentf)

;; nlinum
(global-nlinum-mode t)

(provide 'init-packages)		       
