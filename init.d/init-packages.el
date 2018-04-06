(require 'package)
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
  '(go-mode
    company
    company-go
    helm
    nlinum
    auto-save-buffers-enhanced
    solarized-theme))

(let ((not-installed (loop for x in installing-package-list
			   when (not (package-installed-p x))
			   collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
      (package-install pkg))))

;; helm
(require 'helm-config)
(helm-mode 1)

(define-key global-map (kbd "C-x b")   'helm-buffers-list)
(define-key global-map (kbd "M-x")     'helm-M-x)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(define-key global-map (kbd "C-x C-r") 'helm-recentf)

;; nlinum
(global-nlinum-mode t)

;; auto-save
(require 'auto-save-buffers-enhanced)
; only files managed by git
(auto-save-buffers-enhanced-include-only-checkout-path t)
; supress wrote message
(setq auto-save-buffers-enhanced-quiet-save-p t)
(auto-save-buffers-enhanced t)

;;company
(global-company-mode 1)

;;;go

;; path
(add-to-list 'exec-path (expand-file-name "/usr/local/go/bin"))
(add-to-list 'exec-path (expand-file-name "~/go/bin"))

;; load package
(require 'go-mode)

(setq gofmt-command "goimports")

(add-hook 'go-mode-hook (lambda()
  (add-hook 'before-save-hook 'gofmt-before-save)))
  
(require 'company-go)
(add-hook 'go-mode-hook 'company-mode)
(add-hook 'go-mode-hook 'flycheck-mode)



(provide 'init-packages)		       
