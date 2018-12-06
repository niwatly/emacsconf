
(add-to-list 'load-path "/usr/local/opt/cask")

(require 'cask)
(cask-initialize)
(require 'pallet)
(pallet-mode t)

;;apib
(autoload 'apib-mode "apib-mode"
        "Major mode for editing API Blueprint files" t)
(add-to-list 'auto-mode-alist '("\\.apib\\'" . apib-mode))

(helm-mode t)

(require 'go-autocomplete)
(require 'go-projectile)
(require 'go-mode)
(require 'go-eldoc)
(defun go-mode-setup()
  (go-eldoc-setup)
  (auto-complete-mode t)
  (flycheck-mode t)
  (local-set-key (kbd "C-;") 'auto-complete)
  (local-set-key (kbd "C-c .") 'godef-jump)
  (local-set-key (kbd "C-c ,") 'pop-tag-mark) )
(add-hook 'go-mode-hook 'go-mode-setup)
(add-hook 'before-save-hook 'gofmt-before-save)

(require 'magit)
(setq vcs-ediff-p nil)
(defadvice magit-ediff (around flymake-off activate)
  (setq vcs-ediff-p t)
  ad-do-it
  (setq vcs-ediff-p nil))

;;markdown
(autoload 'markdown-mode "markdown-mode.el"  t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(display-time-mode t)
 '(inhibit-startup-screen t)
 '(mail-interactive t)
 '(mail-signature t)
 '(markdown-command "/usr/local/bin/markdown")
 '(package-selected-packages
   (quote
	(gotest go-eldoc go-projectile go-rename go-autocomplete apib-mode go-mode rhtml-mode undo-tree helm csharp-mode)))
 '(pop3-password-required t)
 '(pop3-port 995)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(smtpmail-debug-info t)
 '(smtpmail-debug-verb t)
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))

;; SQL
;; (autoload 'sql-mode "sql-indent.el"  t)
;; (eval-after-load "sql"
;;   '(load-library "sql-indent"))
(setq sql-indent-offset 2)


;; ;hs-minor-modeに入っていれば関数をshow/hide 入っていなければ突入
;; ;interactiveはユーザが直接呼び出せる関数であることを明示
;; ;boundpは変数の定義/未定義をチェック fboundpは関数の定義/未定義をチェック
(define-key global-map [(C t)] (lambda () 
				 (interactive) 
				 (if (boundp 'hs-minor-mode) (hs-toggle-hiding) (hs-minor-mode t))
				 ))



;; (global-set-key (kbd "RET") 'newline-and-indent)
(define-key global-map (kbd "C-x g") 'magit-status)
(define-key global-map [(C z)] 'advertised-undo) 
(define-key global-map [(C \;)] 'comment-or-uncomment-region)
(define-key global-map [(C r)] 'replace-regexp)

(define-key global-map (kbd "C-c l") 'goto-line) 
(define-key global-map (kbd "C-c b") 'bookmark-jump)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key global-map [?¥] [?\\])

;; 極力UTF-8とする
(prefer-coding-system 'utf-8)
;; スタートアップメッセージを非表示
(setq inhibit-startup-message t)
;; ツールバーを非表示
(tool-bar-mode -1)		       
;; スクロールバーを右
(set-scroll-bar-mode 'right)
;; 対応括弧を表示	
(show-paren-mode 1)			
;; yes, no を y, no
(fset 'yes-or-no-p 'y-or-n-p)
;;
;; (defalias 'message-box 'message);
;; 時刻を表示する
(display-time)
;; 行番号を表示する
(line-number-mode t)
(column-number-mode t)
;; 起動時の画面はいらない
(setq inhibit-startup-message t)
;; 選択範囲(リージョン)のハイライト
(transient-mark-mode 1)
;;入力されたタブは空白に変換
(setq-default indent-tabs-mode nil)
;;入力されたタブは2文字分で
(add-hook 'java-mode-hook
 	  (lambda ()
 	    (setq indent-tabs-mode nil)
 	    (setq c-basic-offset 2)))
;;左側に行番号を
(global-linum-mode)
;; *.~ とかのバックアップファイルを作らない
(setq make-backup-files nil)
;; バックアップファイルを作らない
;;(setq auto-save-default nil)
;; ロックファイル（#aa.txt)を作らない
(setq create-lockfiles nil)

;;文字の色フォントや色を設定
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "LightCyan1" :foreground "LightSkyBlue4" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :height 144 :width normal :weight medium)))))
;; (cond (window-system
;;        (set-face-attribute 'default nil
;;        family "Consolas")
;;        (set-fontset-font (frame-parameter nil 'font)
;;                          'japanese-jisx0208
;;                          '("WenQuanYi Micro Hei Mono" . "unicode-bmp")
;;                          )
;;        (set-fontset-font (frame-parameter nil 'font)
;;                          'katakana-jisx0201
;;                          '("WenQuanYi Micro Hei Mono" . "unicode-bmp")
;;                          )
;; ))



