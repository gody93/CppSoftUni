;;; Init.el --- My Emacs configuration file

;;; Commentary:

;;; Code:
;;Setup the user details
(setq user-full-name "Gody")

;;Set default folder
(setq default-directory "~/projects/premier3/")

;;Package management
(load "package")
;;(add-to-list 'package-archives
;;	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/"))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(
		      smex
		      flx-ido
			  ido-vertical-mode
		      ido-ubiquitous
		      autopair
			  ag
			  magit
			  counsel
		      ))

(dolist (p my-packages)
 (when (not (package-installed-p p ))
	(package-install p)))

;;Initial screen
(setq inhibit-splash-screen t
      initial-scratch-message nil
      initial-major-mode 'org-mode)

;;remove bars
;;(scroll-bar-mode -1)
(tool-bar-mode -1)
;;(menu-bar-mode -1)

;;fixup prompts
(defalias 'yes-or-no-p 'y-or-n-p)

;;enable region overwrite
(delete-selection-mode 1)

;;some other fixups
(setq echo-keystrokes 0.1
      use-dialog-box nil
      visible-bell t)
(setq ring-bell-function 'ignore)
(show-paren-mode t)

;;show column number
(setq column-number-mode t)

;;display empty lines
(setq-default indicate-empty-lines t)

;; Highlight current line
(global-hl-line-mode 1)

;; Don't defer screen updates when performing operations
(setq redisplay-dont-pause t)

;;Set window size and pos
(when window-system
  (set-frame-position nil 0 50)
  (set-frame-size nil 105 70))

;;remove temporary files
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))
;disable backup
(setq backup-inhibited t)
;disable auto save
(setq auto-save-default nil)

;;Enable IDO mode
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-auto-merge-work-directories-length -1)
(setq ido-use-filename-at-point 'nil)
(setq ido-create-new-buffer 'always)
;;Set a priority of the files used so they show before others
(setq ido-file-extensions-order '(".cpp" ".h" ".c" ".hpp"))

;;Ido-vertical
(require 'ido-vertical-mode)
(setq ido-use-faces t)
(ido-vertical-mode 1)

;;Define function to enable nice ido
(defun ido-goto-symbol (&optional symbol-list)
 "Refresh imenu and jump to a place in the buffer using Ido."
 (interactive)
 (unless (featurep 'imenu)
   (require 'imenu nil t))
 (cond
  ((not symbol-list)
   (let ((ido-mode ido-mode)
         (ido-enable-flex-matching
          (if (boundp 'ido-enable-flex-matching)
              ido-enable-flex-matching t))
         name-and-pos symbol-names position)
     (unless ido-mode
       (ido-mode 1)
       (setq ido-enable-flex-matching t))
     (while (progn
              (imenu--cleanup)
              (setq imenu--index-alist nil)
              (ido-goto-symbol (imenu--make-index-alist))
              (setq selected-symbol
                    (ido-completing-read "Symbol? " symbol-names))
              (string= (car imenu--rescan-item) selected-symbol)))
     (unless (and (boundp 'mark-active) mark-active)
       (push-mark nil t nil))
     (setq position (cdr (assoc selected-symbol name-and-pos)))
     (cond
      ((overlayp position)
       (goto-char (overlay-start position)))
      (t
       (goto-char position)))))
  ((listp symbol-list)
   (dolist (symbol symbol-list)
     (let (name position)
       (cond
        ((and (listp symbol) (imenu--subalist-p symbol))
         (ido-goto-symbol symbol))
        ((listp symbol)
         (setq name (car symbol))
         (setq position (cdr symbol)))
        ((stringp symbol)
         (setq name symbol)
         (setq position
               (get-text-property 1 'org-imenu-marker symbol))))
       (unless (or (null position) (null name)
                   (string= (car imenu--rescan-item) name))
         (add-to-list 'symbol-names name)
         (add-to-list 'name-and-pos (cons name position))))))))

(global-set-key (kbd "<f9>") 'ido-goto-symbol)
(global-set-key (kbd "<f5>") 'revert-buffer)
(global-set-key (kbd "C-`") 'ff-find-other-file)

;;flx-ido
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

;;autopair
(require 'autopair)

;; Show the current function name in the header line
(which-function-mode)
(setq-default header-line-format
              '((which-func-mode ("" which-func-format " "))))
(setq mode-line-misc-info
            ;; We remove Which Function Mode from the mode line, because it's mostly
            ;; invisible here anyway.
            (assq-delete-all 'which-func-mode mode-line-misc-info))

;;Treat headers as c++ rather than c
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;;ediff
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-diff-options "-w")

(winner-mode)
(add-hook 'ediff-after-quit-hook-internal 'winner-undo)

;;some c goodies
(setq
 c-default-style "linux" ;; set style to "linux"
 c-basic-offset 4
 )
(global-set-key (kbd "RET") 'newline-and-indent)  ; automatically indent when press RET
;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)

;;ag
(setq ag-highlight-search t)
(setq ag-reuse-buffers 't)

(add-hook 'c-mode-common-hook 'hs-minor-mode)
(add-hook 'c-mode-common-hook 'linum-mode)

;;font
(add-to-list 'default-frame-alist
			 '(font . "Consolas"))
;;(add-to-list 'default-frame-alist
;;			 '(font . "Semi Shaft"))

(global-font-lock-mode 't)

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)
;;smerge
(setq smerge-command-prefix "\C-cv")
(setq emerge-diff-options "--ignore-all-space")

(ivy-mode 1)

(setq ivy-use-virtual-buffers t)

(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
;; (global-set-key (kbd "C-x C-f") 'counsel-find-file)
;; (global-set-key (kbd "<f1> f") 'counsel-describe-function)
;; (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
;; (global-set-key (kbd "<f1> l") 'counsel-load-library)
;; (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
;; (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
;;(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)

;;Go to line remap
(global-set-key (kbd "C-x C-l") 'goto-line)

;;Switch to ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
;;remove trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;Some clipboard thingies
(setq kill-ring-max 100)
(setq x-select-enable-clipboard t)
(setq select-active-regions t)
(setq save-interprogram-paste-before-kill 1)
(setq yank-pop-change-selection t)

;;Make gc run at 100MB
(setq gc-cons-threshold 100000000)

;;Use the faster ag
(defalias 'find-grep 'ag)

;;(setq display-time-day-and-date t)
(setq display-time-24hr-format t)

 ;; This causes the current time in the mode line to be displayed in bold
(setq display-time-string-forms
	  '((propertize (format-time-string "%H:%M" now) 'face 'bold)))

(display-time-mode 1)

(setq frame-title-format "%b")

;; Emacs server
;;(if (not server-mode)
;;    (server-start nil t))

(provide 'init)
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#32302F" "#FB4934" "#B8BB26" "#FABD2F" "#83A598" "#D3869B" "#17CCD5" "#EBDBB2"])
 '(custom-enabled-themes (quote (darktooth)))
 '(custom-safe-themes
   (quote
	("a4d03266add9a1c8f12b5309612cbbf96e1291773c7bc4fb685bfdaf83b721c6" "0ee3fc6d2e0fc8715ff59aed2432510d98f7e76fe81d183a0eb96789f4d897ca" "00de442f1a471c98c62281bdf5000b4311db26832a0d6b6f8ffde8705e027828" "1db337246ebc9c083be0d728f8d20913a0f46edc0a00277746ba411c149d7fe5" "e8a976fbc7710b60b069f27f5b2f1e216ec8d228fe5091f677717d6375d2669f" "6bb8133d789c96c383de9062019fb236dec2302346482eb8ff897b328b9a61a4" default)))
 '(fci-rule-color "#2e2e2e")
 '(magit-module-sections-hook (quote (magit-insert-modules-overview)))
 '(magit-status-sections-hook
   (quote
	(magit-insert-status-headers magit-insert-merge-log magit-insert-rebase-sequence magit-insert-am-sequence magit-insert-sequencer-sequence magit-insert-bisect-output magit-insert-bisect-rest magit-insert-bisect-log magit-insert-untracked-files magit-insert-unstaged-changes magit-insert-staged-changes magit-insert-stashes magit-insert-unpulled-from-upstream magit-insert-unpushed-to-pushremote magit-insert-unpushed-to-upstream)))
 '(package-selected-packages
   (quote
	(company-rtags irony rtags multiple-cursors smex magit ido-vertical-mode ido-ubiquitous ggtags flx-ido darktooth-theme counsel company-irony autopair ample-zen-theme ag)))
 '(pos-tip-background-color "#36473A")
 '(pos-tip-foreground-color "#FFFFC8")
 '(rtags-autostart-diagnostics t)
 '(rtags-completions-enabled t)
 '(rtags-process-flags "")
 '(vc-annotate-background "#3b3b3b")
 '(vc-annotate-color-map
   (quote
	((20 . "#dd5542")
	 (40 . "#CC5542")
	 (60 . "#fb8512")
	 (80 . "#baba36")
	 (100 . "#bdbc61")
	 (120 . "#7d7c61")
	 (140 . "#6abd50")
	 (160 . "#6aaf50")
	 (180 . "#6aa350")
	 (200 . "#6a9550")
	 (220 . "#6a8550")
	 (240 . "#6a7550")
	 (260 . "#9b55c3")
	 (280 . "#6CA0A3")
	 (300 . "#528fd1")
	 (320 . "#5180b3")
	 (340 . "#6380b3")
	 (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ediff-current-diff-B ((t (:background "#006430"))))
 '(ediff-even-diff-A ((t (:background "gray27"))))
 '(ediff-even-diff-Ancestor ((t nil)))
 '(ediff-even-diff-B ((t (:background "gray27"))))
 '(ediff-even-diff-C ((t nil)))
 '(ediff-fine-diff-A ((t (:background "coral4"))))
 '(ediff-fine-diff-Ancestor ((t (:background "sea green"))))
 '(ediff-fine-diff-B ((t (:background "#004040"))))
 '(ediff-odd-diff-A ((t (:background "gray27"))))
 '(ediff-odd-diff-Ancestor ((t nil)))
 '(ediff-odd-diff-B ((t (:background "gray27"))))
 '(ediff-odd-diff-C ((t nil)))
 '(which-func ((t nil))))
(put 'scroll-left 'disabled nil)
;;RTags

(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/rtags/")

(require 'rtags)
(require 'company)

(setq rtags-autostart-diagnostics t)
(rtags-diagnostics)
(setq rtags-completions-enabled t)
(push 'company-rtags company-backends)
(global-company-mode)
(define-key c-mode-base-map (kbd "<C-tab>") (function company-rtags))
(rtags-enable-standard-keybindings c-mode-base-map "\C-xr")
(setq company-minimum-prefix-length 50)

(add-hook 'c-mode-common-hook 'rtags-start-process-unless-running)
(add-hook 'c++-mode-common-hook 'rtags-start-process-unless-running)

(rtags-show-rtags-buffer)


;; Start maximised (cross-platf)
(add-hook 'window-setup-hook 'toggle-frame-maximized t)

;;Uncomment region
(global-set-key (kbd "C-x C-u") 'uncomment-region)

;;Kill current buffer
(global-set-key (kbd "C-x k") 'kill-this-buffer)
