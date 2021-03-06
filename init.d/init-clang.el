;; imenu
(require 'cc-mode)

(add-hook 'c-mode-common-hook
          (lambda ()
            (setq c-default-style "k&r")
            (setq indent-tabs-mode nil)
            (setq c-basic-offset 2)
            (c-toggle-auto-state nil)
            (c-toggle-auto-hungry-state 1)
            (define-key c-mode-map (kbd "C-c c") 'compile)
            (setq eldoc-idle-delay 0.7)
            (setq eldoc-echo-area-use-multiline-p t)
            (c-turn-on-eldoc-mode)
            ))

(add-hook 'c-mode-common-hook 'flycheck-mode)
(add-hook 'c-mode-common-hook 'google-set-c-style)

(setq company-backends (delete 'company-semantic company-backends))
(add-to-list 'company-backends 'company-c-headers)

;; gtags
(add-hook 'c-mode-hook 'helm-gtags-mode)
(custom-set-variables
 '(helm-gtags-auto-update t)
 '(helm-gtags-prefix-key "\C-g"))

(add-hook 'helm-gtags-mode-hook
          '(lambda ()
             ;;入力されたタグの定義元へジャンプ
             (local-set-key (kbd "M-.") 'helm-gtags-find-tag)

             ;;入力タグを参照する場所へジャンプ
             (local-set-key (kbd "M-r") 'helm-gtags-find-rtag)  

             ;;入力したシンボルを参照する場所へジャンプ
             (local-set-key (kbd "M-s") 'helm-gtags-find-symbol)

             ;;タグ一覧からタグを選択し, その定義元にジャンプする
             (local-set-key (kbd "M-l") 'helm-gtags-select)

             ;;ジャンプ前の場所に戻る
             (local-set-key (kbd "M-*") 'helm-gtags-pop-stack)))

(provide 'init-clang)
