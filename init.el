;; emacsclient
;; https://www.yokoweb.net/2017/01/15/macos-emacs-emacsclient/
;; emacs-mac
;; https://monologu.com/select_emacs_for_mac/
;; MacのFinderで隠しフォルダを選択する
;; https://dev.classmethod.jp/articles/finder-hidden-files-shortcut/

;; 起動時の警告が鬱陶しい
(setq warning-suppress-log-types '((package reinitialization)))

(load "~/.emacs.d/server")

(require 'cask "/usr/local/opt/cask/cask.el")
(cask-initialize)

(require 'pallet)
(pallet-mode t)

(helm-mode t)

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

;; ;hs-minor-modeに入っていれば関数をshow/hide 入っていなければ突入
;; ;interactiveはユーザが直接呼び出せる関数であることを明示
;; ;boundpは変数の定義/未定義をチェック fboundpは関数の定義/未定義をチェック
(defun toggle-block ()
  (interactive) 
  (if (boundp 'hs-minor-mode) (hs-toggle-hiding) (hs-minor-mode t)))


(defun my-move-beginning-of-line ()
  (interactive)
  (if (bolp)
      (back-to-indentation)
    (beginning-of-line)))

(defun load-emacs-init ()
  (interactive)
  (load-file "~/.emacs.d/init.el"))

;; bindings for mac
(setq mac-command-key-is-meta nil)
(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'super)
(global-set-key [?\s-c] 'kill-ring-save)
(global-set-key [?\s-v] 'yank)
(global-set-key [?\s-x] 'kill-region)
(global-set-key [?\s-a] 'mark-whole-buffer)
(global-set-key [?\s-z] 'advertised-undo)

;; binding common
(define-key global-map [(C t)] 'toggle-block)
(global-set-key "\C-a" 'my-move-beginning-of-line)
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
;; スクロール上限（下限）に達したときに音を鳴らさない
(setq visible-bell t)

;;文字の色フォントや色を設定
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "LightCyan1" :foreground "LightSkyBlue4" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :height 144 :width normal :weight medium)))))


