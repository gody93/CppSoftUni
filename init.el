;; Init.el - emacs configuration file

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(require 'rg)

;;Winner Mode
(winner-mode 1)

;;Dogears
(use-package dogears
  :init (dogears-mode)
  :bind (:map global-map
              ("M-g d" . dogears-go)
              ("M-<left>" . dogears-back)
              ("M-<right>" . dogears-forward)
              ("M-g M-d" . dogears-list)
              ("M-g M-D" . dogears-sidebar)))

;;Startup Screen
(use-package dashboard
    :ensure t
    :diminish dashboard-mode
    :config
    (setq dashboard-items '((recents  . 10)
                            (bookmarks . 10)))
    (dashboard-setup-startup-hook))

;;Set default folder
(setq default-directory "~/projects/newGames/")


;;Set Time
(display-time-mode 1)
(setq inhibit-startup-message nil)
(setq display-time-24hr-format t)

;;Start emacs maximized
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;;Svg image type error
(add-to-list 'image-types 'svg)
(add-to-list 'image-types 'gif)

;; This causes the current time in the mode line to be displayed in bold
(setq display-time-string-forms
      '((propertize (format-time-string "%H:%M" now) 'face 'bold)))

;;some c goodies
(setq c-default-style "linux" ;; set style to "linux"
      c-basic-offset 4)

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room
(menu-bar-mode -1)          ; Disable the menu bar

;;enable region overwrite
(delete-selection-mode 1)

;;fixup prompts
(defalias 'yes-or-no-p 'y-or-n-p)

;;Switch to ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

;;Dont create lock files
(setq make-backup-files nil)

;;Enable line numbers
(column-number-mode)
(global-display-line-numbers-mode t)

;;Refresh buffer
(global-set-key (kbd "<f5>") 'revert-buffer)

;;Set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)

;;Different style comment
(add-hook 'c++-mode-hook (lambda () (setq comment-start "/* "
                                            comment-end   " */")))
;; Themes
(use-package doom-themes
  :init (load-theme 'doom-one t))

;; Font
(set-face-attribute 'bold nil :font "Source Code Pro" :height 110)

;;Save history
(savehist-mode 1)

;;Remove trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq-default spacemacs-show-trailing-whitespace nil)

;;Uncomment region
(global-set-key (kbd "C-x C-u") 'uncomment-region)

;;Comment region
(global-set-key (kbd "C-c C-c") 'comment-region)

;;Kill current buffer
(global-set-key (kbd "C-x k") 'kill-this-buffer)

;;Go to line remap
(global-set-key (kbd "C-x C-l") 'goto-line)

;;Find matching h or cpp
(global-set-key (kbd "C-`") 'ff-find-other-file)

;;Treat headers as c++ rather than c
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; automatically indent when press RET
(global-set-key (kbd "RET") 'newline-and-indent)

;;Expand region
(use-package expand-region
  :bind ("C-S-m" . er/expand-region))

;; Doom Mod Line
(use-package all-the-icons)

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 12)
		   (doom-modeline-buffer-file-name-style 'relative-from-project)))

;; Which key
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))

;;Increase gc threshold
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb

;; Magit
(use-package magit
  :bind
  ("C-x g" . magit-status)
  ("C-x l" . magit-show-commit))

;;Grep
(global-set-key (kbd "C-S-F") 'ripgrep-regexp)

;;Format Region
(global-set-key (kbd "C-<tab>") 'clang-format-region)

;;Flycheck
(use-package flycheck)

;; Ivy
(use-package ivy
  :diminish
  :bind
  (:map ivy-minibuffer-map
		("C-j" . ivy-immediate-done)
		("RET" . ivy-alt-done))
  :config
  (setq ivy-extra-directories () )
  (setq ivy-re-builders-alist
        '((swiper . ivy--regex-plus)
          (counsel-imenu . ivy--regex-plus)
          (projectile-find-file . ivy--regex-plus)
          (counsel-find-file . ivy--regex-fuzzy)
          (lsp-ivy--workspace-symbol . ivy--regex-fuzzy)
		  (switch-to-buffer . ivy--regex-plus)))
  (ivy-mode 1))

;;Swiper
(use-package swiper
  :bind
  ("C-s" . swiper)
  ("M-s ." . swiper-thing-at-point))

;; Projectile
(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom (
		   (projectile-completion-system 'ivy)
		   (projectile-indexing-method 'alien)
		   (projectile-enable-caching t))
  :bind-keymap
  ("C-c p" . projectile-command-map))

;; Company
(use-package company
  :config
  (setq company-idle-delay 0.4)
  (setq company-selection-wrap-around t)
  (global-company-mode 1))

;;SmartParens
(use-package smartparens
  :init (smartparens-global-mode 1)
  :config(show-smartparens-global-mode))

;; Add new line and indent between {}
(defun indent-between-pair (&rest _ignored)
  (newline)
  (indent-according-to-mode)
  (forward-line -1)
  (indent-according-to-mode))

(sp-local-pair 'prog-mode "{" nil :post-handlers '((indent-between-pair "RET")))

;;Yasnippet
(use-package yasnippet
  :hook((c++-mode . yas-minor-mode)
		(c-mode . yas-minor-mode)))
(yas-global-mode 1)
(repeat-mode 1)

;;Dape
(use-package dape
  :preface
  ;; By default dape shares the same keybinding prefix as `gud'
  ;; If you do not want to use any prefix, set it to nil.
  ;; (setq dape-key-prefix "\C-x\C-a")

  :init
  ;; To use window configuration like gud (gdb-mi)
  ;; (setq dape-buffer-window-arrangement 'gud)

  :config
  ;; Info buffers to the right
  (setq dape-buffer-window-arrangement 'right)

  ;; Global bindings for setting breakpoints with mouse
  (dape-breakpoint-global-mode)

  ;; To not display info and/or buffers on startup
  ;; (remove-hook 'dape-on-start-hooks 'dape-info)
  ;; (remove-hook 'dape-on-start-hooks 'dape-repl)

  ;; To display info and/or repl buffers on stopped
  ;; (add-hook 'dape-on-stopped-hooks 'dape-info)
  ;; (add-hook 'dape-on-stopped-hooks 'dape-repl)

  ;; Kill compile buffer on build success
  (add-hook 'dape-compile-compile-hooks 'kill-buffer)

  ;; Save buffers on startup, useful for interpreted languages
  ;; (add-hook 'dape-on-start-hooks (lambda () (save-some-buffers t t)))

  ;; Projectile users
  ;; (setq dape-cwd-fn 'projectile-project-root)
  )

;;LSP
(use-package lsp-mode
  :hook((c++-mode . lsp)
		(c-mode . lsp))
  :commands lsp
  :config
  ;;  Dont show ui sideline
  (setq lsp-ui-sideline-show-flycheck nil)
  (setq lsp-ui-sideline-show-code-actions nil)
  (setq lsp-ui-sideline-show-hover nil)
  (setq lsp-ui-sideline-show-symbol nil)
  (setq lsp--apply-text-edit nil)
  (setq lsp-clients-clangd-args '("-j=4" "-background-index=true" "-log=error"))
  :bind
  ("C-c y" . lsp-execute-code-action))

;;Lsp Ivy
(use-package lsp-ivy
  :ensure t)

;; LSP UI
(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-position 'top)
  (lsp-ui-peek-fontify 'always)
  (lsp-ui-peek-list-width 80)
  :bind
  ("M-." . lsp-ui-find-next-reference)
  ("M-," . lsp-ui-find-prev-reference)
  ("C-x r ." . lsp-ui-peek-find-definitions)
  ("C-x r ," . lsp-ui-peek-find-references))

;;Multiple Cursors
(use-package multiple-cursors
  :init
  (setq multiple-cursors t)
  :bind
  ("C-x /" . mc/mark-next-like-this)
  ("C->" . mc/mark-next-like-this-word)
  ("C-<" . mc/mark-previous-like-this-word)
  ("C-M-SPC" . mc/skip-to-previous-like-this)
  ("C-S-<mouse-1>" . mc/add-cursor-on-click)
  ("C-x n" . mc/insert-numbers))

;;Counsel
(use-package counsel
  :config
  (setq counsel-find-file-ignore-regexp "\\(?:\\`[#.]\\)\\|\\.\\o")
  :bind
  ("<f9>" . counsel-imenu)
  ("C-x C-f" . counsel-find-file)
  ("M-x" . counsel-M-x))
(add-hook 'imenu-after-jump-hook #'recenter-top-bottom)

;;Ag
(use-package ag)

;;Move text
(use-package move-text
  :bind
  ("M-<up>" . move-text-up)
  ("M-<down>" . move-text-down))

;;Ediff
(use-package ediff
  :config
  (setq ediff-window-setup-function 'ediff-setup-windows-plain)
  (setq ediff-split-window-function 'split-window-horizontally)
  (setq ediff-diff-options "-w"))

;;"Renames current buffer and file it is visiting."
(defun my/rename-current-buffer-file ()
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'"
                   name (file-name-nondirectory new-name)))))))

;;"Removes file connected to current buffer and kills buffer."
(defun my/delete-current-buffer-file ()
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer))
        (name (buffer-name)))
    (if (not (and filename (file-exists-p filename)))
        (ido-kill-buffer)
      (when (yes-or-no-p "Are you sure you want to remove this file? ")
        (delete-file filename)
        (kill-buffer buffer)
        (message "File '%s' successfully removed" filename)))))

;; What hooks
(defun my/call-logging-hooks (command &optional verbose)
  "Call COMMAND, reporting every hook run in the process.
Interactively, prompt for a command to execute.

Return a list of the hooks run, in the order they were run.
Interactively, or with optional argument VERBOSE, also print a
message listing the hooks."
  (interactive "CCommand to log hooks: \np")
  (let* ((log     nil)
         (logger (lambda (&rest hooks)
                   (setq log (append log hooks nil)))))
    (my/with-advice
        ((#'run-hooks :before logger))
      (call-interactively command))
    (when verbose
      (message
       (if log "Hooks run during execution of %s:"
         "No hooks run during execution of %s.")
       command)
      (dolist (hook log)
        (message "> %s" hook)))
    log))


(defmacro my/with-advice (adlist &rest body)
  "Execute BODY with temporary advice in ADLIST.

Each element of ADLIST should be a list of the form
  (SYMBOL WHERE FUNCTION [PROPS])
suitable for passing to `advice-add'.  The BODY is wrapped in an
`unwind-protect' form, so the advice will be removed even in the
event of an error or nonlocal exit."
  (declare (debug ((&rest (&rest form)) body))
           (indent 1))
  `(progn
     ,@(mapcar (lambda (adform)
                 (cons 'advice-add adform))
               adlist)
     (unwind-protect (progn ,@body)
       ,@(mapcar (lambda (adform)
                   `(advice-remove ,(car adform) ,(nth 2 adform)))
                 adlist))))


;; nice scrolling
(setq scroll-margin 0
scroll-conservatively 100
scroll-preserve-screen-position 1)

(when (fboundp 'pixel-scroll-precision-mode)
(pixel-scroll-precision-mode t))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Buffer-menu-use-header-line nil)
 '(bookmark-fringe-mark nil)
 '(c-hanging-braces-alist
   '((block-close . c-snug-do-while)
	 (statement-cont)
	 (substatement-open after)
	 (brace-list-open after)
	 (brace-entry-open after)
	 (extern-lang-open after)
	 (namespace-open after)
	 (module-open after)
	 (composition-open after)
	 (inexpr-class-open after)
	 (inexpr-class-close before)
	 (arglist-cont-nonempty)))
 '(clang-format-fallback-style "none")
 '(clang-format-style nil)
 '(dap-gdb-lldb-path-lldb
   '("nodejs" "/home/default/.emacs.d/.extension/vscode/webfreak.debug/extension/out/src/lldb.js"))
 '(dape-configs
   '((attach modes nil ensure
			 (lambda
			   (config)
			   (unless
				   (plist-get config 'port)
				 (user-error "Missing `port' property")))
			 host "localhost" :request "attach")
	 (launch modes nil ensure
			 (lambda
			   (config)
			   (unless
				   (plist-get config 'command)
				 (user-error "Missing `command' property")))
			 command-cwd dape-command-cwd :request "launch")
	 (codelldb-cc modes
				  (c-mode c-ts-mode c++-mode c++-ts-mode)
				  ensure dape-ensure-command command "~/.emacs.d/debug-adapters/codelldb/extension/adapter/codelldb" command-cwd dape-command-cwd :type "lldb" :request "launch" command-args
				  ("--port" :autoport)
				  port :autoport :cwd "." :program "a.out" :args
				  []
				  :stopOnEntry nil)
	 (codelldb-rust ensure dape-ensure-command command "~/.emacs.d/debug-adapters/codelldb/extension/adapter/codelldb" command-cwd dape-command-cwd :type "lldb" :request "launch" modes
					(rust-mode rust-ts-mode)
					command-args
					("--port" :autoport "--settings" "{\"sourceLanguages\":[\"rust\"]}")
					port :autoport :cwd "." :program
					(lambda nil
					  (file-name-concat "target" "debug"
										(thread-first
										  (dape-cwd)
										  (directory-file-name)
										  (file-name-split)
										  (last)
										  (car))))
					:args
					[]
					:stopOnEntry nil)
	 (cpptools modes
			   (c-mode c-ts-mode c++-mode c++-ts-mode)
			   ensure dape-ensure-command command "~/.emacs.d/debug-adapters/cpptools/extension/debugAdapters/bin/OpenDebugAD7" command-cwd dape-command-cwd :type "cppdbg" :request "launch" :cwd "." :program "a.out" :MIMode "lldb")
	 (debugpy modes
			  (python-mode python-ts-mode)
			  ensure
			  (lambda
				(config)
				(dape-ensure-command config)
				(let
					((python
					  (dape-config-get config 'command)))
				  (unless
					  (zerop
					   (call-process-shell-command
						(format "%s -c \"import debugpy.adapter\"" python)))
					(user-error "%s module debugpy is not installed" python))))
			  command "python" :type "python" :request "launch" command-args
			  ("-m" "debugpy.adapter" "--host" "0.0.0.0" "--port" :autoport)
			  port :autoport :cwd dape-cwd :program dape-buffer-default :args
			  []
			  :justMyCode nil :console "integratedTerminal" :showReturnValue t :stopOnEntry nil)
	 (debugpy-module modes
					 (python-mode python-ts-mode)
					 ensure
					 (lambda
					   (config)
					   (dape-ensure-command config)
					   (let
						   ((python
							 (dape-config-get config 'command)))
						 (unless
							 (zerop
							  (call-process-shell-command
							   (format "%s -c \"import debugpy.adapter\"" python)))
						   (user-error "%s module debugpy is not installed" python))))
					 command "python" :type "python" :request "launch" command-args
					 ("-m" "debugpy.adapter" "--host" "0.0.0.0" "--port" :autoport)
					 port :autoport :cwd dape-cwd :module
					 (lambda nil
					   (thread-first default-directory
									 (directory-file-name)
									 (file-name-split)
									 (last)
									 (car)))
					 :args
					 []
					 :justMyCode nil :console "integratedTerminal" :showReturnValue t :stopOnEntry nil)
	 (dlv ensure dape-ensure-command command "dlv" command-args
		  ("dap" "--listen" "127.0.0.1::autoport")
		  command-cwd dape-command-cwd :type "debug" :request "launch" modes
		  (go-mode go-ts-mode)
		  port :autoport :cwd "." :program ".")
	 (flutter ensure dape-ensure-command command "flutter" command-args
			  ("debug_adapter")
			  command-cwd dape-command-cwd :type "dart" modes
			  (dart-mode)
			  :cwd "." :program "lib/main.dart" :toolArgs
			  ["-d" "all"])
	 (gdb modes
		  (c-mode c-ts-mode c++-mode c++-ts-mode)
		  ensure
		  (lambda
			(config)
			(dape-ensure-command config)
			(let*
				((default-directory
				  (or
				   (dape-config-get config 'command-cwd)
				   default-directory))
				 (output
				  (shell-command-to-string "gdb --version"))
				 (version
				  (save-match-data
					(when
						(string-match "GNU gdb \\(?:(.*) \\)?\\([0-9.]+\\)" output)
					  (string-to-number
					   (match-string 1 output))))))
			  (unless
				  (>= version 14.1)
				(user-error "Requires gdb version >= 14.1"))))
		  command "gdb" command-args
		  ("--interpreter=dap")
		  command-cwd dape-command-cwd :request "launch" :program "a.out" :args
		  []
		  :stopAtBeginningOfMainSubprogram nil)
	 (godot port 6006 :type "server" :request "launch" modes
			(gdscript-mode)
			:cwd dape-cwd)
	 (js-debug-node modes
					(js-mode js-ts-mode)
					ensure
					#[257 "\300\1!\210\301\1\302\"\211\203\20\0\303\1!\210\210\304\1\305\"@\306\1!?\205!\0\307\310\2\"\207"
						  [dape-ensure-command dape-config-get :runtimeExecutable dape--ensure-executable plist-get command-args file-exists-p user-error "File %S does not exist"]
						  5 "\12\12(fn CONFIG)"]
					command "node" :type "pwa-node" command-args
					("/home/default/.emacs.d/debug-adapters/js-debug/src/dapDebugServer.js" :autoport)
					port :autoport :cwd dape-cwd :program dape-buffer-default :console "internalConsole")
	 (js-debug-ts-node ensure
					   #[257 "\300\1!\210\301\1\302\"\211\203\20\0\303\1!\210\210\304\1\305\"@\306\1!?\205!\0\307\310\2\"\207"
							 [dape-ensure-command dape-config-get :runtimeExecutable dape--ensure-executable plist-get command-args file-exists-p user-error "File %S does not exist"]
							 5 "\12\12(fn CONFIG)"]
					   command "node" :type "pwa-node" modes
					   (typescript-mode typescript-ts-mode)
					   command-args
					   ("/home/default/.emacs.d/debug-adapters/js-debug/src/dapDebugServer.js" :autoport)
					   port :autoport :runtimeExecutable "ts-node" :cwd dape-cwd :program dape-buffer-default :console "internalConsole")
	 (js-debug-node-attach ensure
						   #[257 "\300\1!\210\301\1\302\"\211\203\20\0\303\1!\210\210\304\1\305\"@\306\1!?\205!\0\307\310\2\"\207"
								 [dape-ensure-command dape-config-get :runtimeExecutable dape--ensure-executable plist-get command-args file-exists-p user-error "File %S does not exist"]
								 5 "\12\12(fn CONFIG)"]
						   command "node" :type "pwa-node" :request "attach" modes
						   (js-mode js-ts-mode typescript-mode typescript-ts-mode)
						   command-args
						   ("/home/default/.emacs.d/debug-adapters/js-debug/src/dapDebugServer.js" :autoport)
						   port :autoport :port 9229)
	 (js-debug-chrome ensure
					  #[257 "\300\1!\210\301\1\302\"\211\203\20\0\303\1!\210\210\304\1\305\"@\306\1!?\205!\0\307\310\2\"\207"
							[dape-ensure-command dape-config-get :runtimeExecutable dape--ensure-executable plist-get command-args file-exists-p user-error "File %S does not exist"]
							5 "\12\12(fn CONFIG)"]
					  command "node" :type "pwa-chrome" modes
					  (js-mode js-ts-mode typescript-mode typescript-ts-mode)
					  command-args
					  ("/home/default/.emacs.d/debug-adapters/js-debug/src/dapDebugServer.js" :autoport)
					  port :autoport :url "http://localhost:3000" :webRoot dape-cwd)
	 (lldb-vscode ensure dape-ensure-command command "lldb-vscode" command-cwd dape-command-cwd :type "lldb-vscode" modes
				  (c-mode c-ts-mode c++-mode c++-ts-mode rust-mode rust-ts-mode)
				  :cwd "." :program "a.out")
	 (netcoredbg modes
				 (csharp-mode csharp-ts-mode)
				 ensure dape-ensure-command command "netcoredbg" :request "launch" command-args
				 ["--interpreter=vscode"]
				 :cwd dape-cwd :program
				 (lambda nil
				   (let
					   ((dlls
						 (file-expand-wildcards
						  (file-name-concat "bin" "Debug" "*" "*.dll"))))
					 (if dlls
						 (file-relative-name
						  (file-relative-name
						   (car dlls)))
					   ".dll"
					   (dape-cwd))))
				 :stopAtEntry nil)
	 (rdbg modes
		   (ruby-mode ruby-ts-mode)
		   ensure dape-ensure-command fn
		   (lambda
			 (config)
			 (plist-put config 'command-args
						(mapcar
						 (lambda
						   (arg)
						   (if
							   (eq arg :-c)
							   (plist-get config '-c)
							 arg))
						 (plist-get config 'command-args))))
		   command "rdbg" command-cwd dape-command-cwd :type "Ruby" command-args
		   ("-O" "--host" "0.0.0.0" "--port" :autoport "-c" "--" :-c)
		   port :autoport -c
		   (lambda nil
			 (format "ruby %s"
					 (or
					  (dape-buffer-default)
					  ""))))
	 (jdtls modes
			(java-mode java-ts-mode)
			ensure
			(lambda
			  (config)
			  (let
				  ((file
					(dape-config-get config :filePath)))
				(unless
					(and
					 (stringp file)
					 (file-exists-p file))
				  (user-error "Unable to find locate :filePath `%s'" file))
				(with-current-buffer
					(find-file-noselect file)
				  (unless
					  (eglot-current-server)
					(user-error "No eglot instance active in buffer %s"
								(current-buffer)))
				  (unless
					  (seq-contains-p
					   (eglot--server-capable :executeCommandProvider :commands)
					   "vscode.java.resolveClasspath")
					(user-error "Jdtls instance does not bundle java-debug-server, please install")))))
			fn
			(lambda
			  (config)
			  (with-current-buffer
				  (find-file-noselect
				   (dape-config-get config :filePath))
				(if-let
					((server
					  (eglot-current-server)))
					(pcase-let
						((`[,module-paths ,class-paths]
						  (eglot-execute-command server "vscode.java.resolveClasspath"
												 (vector
												  (plist-get config :mainClass)
												  (plist-get config :projectName))))
						 (port
						  (eglot-execute-command server "vscode.java.startDebugSession" nil)))
					  (thread-first config
									(plist-put 'port port)
									(plist-put :modulePaths module-paths)
									(plist-put :classPaths class-paths)))
				  server)))
			:type "java" :request "launch" :filePath
			#[0 "\300\301!\206\14\0\302\303 \304 \"\207"
				[#[257 "\3001!\0\301\302 \303\304\305\306 !!#\307\310\2\"\206\31\0\211\311H\312\1\4\"\266\2020\207\210\313\207"
					   [(error)
						eglot-execute-command eglot-current-server "vscode.java.resolveMainClass" file-name-nondirectory directory-file-name dape-cwd seq-find
						#[257 "\300\1\301\"\302 \232\207"
							  [plist-get :filePath buffer-file-name]
							  4 "\12\12(fn VAL)"]
						0 plist-get nil]
					   7 "\12\12(fn KEY)"]
				 :filePath expand-file-name dape-buffer-default dape-cwd]
				3]
			:mainClass
			#[0 "\300\301!\206\7\0\302\207"
				[#[257 "\3001!\0\301\302 \303\304\305\306 !!#\307\310\2\"\206\31\0\211\311H\312\1\4\"\266\2020\207\210\313\207"
					   [(error)
						eglot-execute-command eglot-current-server "vscode.java.resolveMainClass" file-name-nondirectory directory-file-name dape-cwd seq-find
						#[257 "\300\1\301\"\302 \232\207"
							  [plist-get :filePath buffer-file-name]
							  4 "\12\12(fn VAL)"]
						0 plist-get nil]
					   7 "\12\12(fn KEY)"]
				 :mainClass ""]
				2]
			:projectName
			#[0 "\300\301!\206\7\0\302\207"
				[#[257 "\3001!\0\301\302 \303\304\305\306 !!#\307\310\2\"\206\31\0\211\311H\312\1\4\"\266\2020\207\210\313\207"
					   [(error)
						eglot-execute-command eglot-current-server "vscode.java.resolveMainClass" file-name-nondirectory directory-file-name dape-cwd seq-find
						#[257 "\300\1\301\"\302 \232\207"
							  [plist-get :filePath buffer-file-name]
							  4 "\12\12(fn VAL)"]
						0 plist-get nil]
					   7 "\12\12(fn KEY)"]
				 :projectName ""]
				2]
			:args "" :stopOnEntry nil :vmArgs " -XX:+ShowCodeDetailsInExceptionMessages" :console "integratedConsole" :internalConsoleOptions "neverOpen")))
 '(dape-display-source-buffer-action '(display-buffer-use-some-window))
 '(dape-request-timeout 20)
 '(dired-dwim-target t)
 '(dogears-hooks '(ivy-mode-hook imenu-after-jump-hook))
 '(dogears-ignore-modes
   '(magit-status fundamental-mode dogears-list-mode exwm-mode helm-major-mode emacs-lisp help Custom))
 '(dogears-mode t)
 '(dogears-position-delta 500)
 '(grep-find-ignored-directories
   '("SCCS" "RCS" "CVS" "MCVS" ".src" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" ".ini"))
 '(ibuffer-formats
   '((mark modified read-only " "
		   (name 30 30 :left :elide)
		   " "
		   (size 9 -1 :right)
		   " "
		   (mode 16 16 :left :elide)
		   " " filename-and-process)
	 (mark " "
		   (name 16 -1)
		   " " filename)))
 '(initial-buffer-choice nil)
 '(ivy-wrap t)
 '(lsp-before-save-edits nil)
 '(lsp-completion-enable-additional-text-edit nil)
 '(lsp-enable-indentation nil)
 '(lsp-enable-on-type-formatting nil)
 '(lsp-headerline-breadcrumb-icons-enable t)
 '(lsp-headerline-breadcrumb-segments '(symbols))
 '(magit-section-visibility-indicator '(magit-fringe-bitmap-bold> . magit-fringe-bitmap-boldv))
 '(magit-status-sections-hook
   '(magit-insert-status-headers magit-insert-merge-log magit-insert-rebase-sequence magit-insert-am-sequence magit-insert-sequencer-sequence magit-insert-bisect-output magit-insert-bisect-rest magit-insert-bisect-log magit-insert-untracked-files magit-insert-unstaged-changes magit-insert-staged-changes magit-insert-stashes magit-insert-unpushed-to-upstream magit-insert-unpulled-from-pushremote magit-insert-unpulled-from-upstream))
 '(package-selected-packages
   '(dape all-the-icons centered-cursor-mode dogears footsteps rg projectile-ripgrep ripgrep quickrun clang-format color-identifiers-mode ivy-prescient prescient which-function-mode stickyfunc-enhance counsel-projectile move-text goto-last-change yasnippet smartparens ag node smex expand-region winner-mode lsp-clients which-key use-package swiper projectile multiple-cursors magit lsp-ui lsp-ivy flycheck doom-themes doom-modeline dashboard company))
 '(projectile-globally-ignored-directories
   '(".idea" ".vscode" ".ensime_cache" ".eunit" ".git" ".hg" ".fslckout" "_FOSSIL_" ".bzr" "_darcs" ".tox" ".svn" ".stack-work" ".ccls-cache" ".clangd" ".clangd/index"))
 '(python-shell-interpreter "python3")
 '(use-file-dialog nil)
 '(warning-suppress-types '((comp) (comp) (comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
