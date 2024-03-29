;;; init.el -- g-belmonte's config

;;; Commentary:

;; This is my personal configuration file.

;;; Code:

;; Produce backtraces for debugging purposes
;; (setq debug-on-error t)

(when (or (string-equal system-type "windows-nt")
          (string-equal system-type "darwin"))
  (error "This config is made for Linux distributions"))

(when (version< emacs-version "27.2")
  (message "This configuration was built with Emacs 27.2 and was not tested on older versions. Use at your own risk"))

;; ---------- STARTUP ----------
;; Avoid GC at startup
(setq gc-cons-threshold (* 500 1024 1024)
      gc-cons-percentage 0.4)

;; Tweak GC after startup
(add-hook 'emacs-startup-hook
          '(lambda ()
             (setq gc-cons-threshold (* 50 1024 1024)
                   gc-cons-percentage 0.1)))

;; No startup message
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

;; ---------- USER ----------
;; Configure user
(setq-default user-full-name "Guilherme Belmonte"
              user-email-address "contact@belmonte.dev")

;; ---------- FONTS AND ENCODING ----------
;; Use utf-8 encoding
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;; Set default font
(set-frame-font
 (cond
  ((member "Source Code Pro" (font-family-list)) "Source Code Pro")
  ((member "DejaVu Sans Mono" (font-family-list)) "DejaVu Sans Mono")
  (t nil))
 t t)

;; Set font for emoji
(set-fontset-font
 t
 '(#x1f300 . #x1fad0)
 (cond
  ((member "Noto Color Emoji" (font-family-list)) "Noto Color Emoji")
  ((member "Noto Emoji" (font-family-list)) "Noto Emoji")
  (t nil))
 )

;; Set font for chinese characters
(set-fontset-font
 t
 '(#x4e00 . #x9fff)
 (cond
  ((member "Source Han Sans" (font-family-list)) "Source Han Sans")
  ((member "Noto Sans CJK SC" (font-family-list)) "Noto Sans CJK SC")
  ((member "WenQuanYi Micro Hei" (font-family-list)) "WenQuanYi Micro Hei")
  (t nil)))

;; ---------- UI ----------
;; Clean UI
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode -1)

;; Show line and column number
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; ---------- DEFAULTS ----------
;; Newline at end of file
(setq require-final-newline t)

;; Enable reading bigger chunks of data
(setq read-process-output-max (* 1 1024 1024))

;; Spaces > tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; Indent, if indented then complete
(setq tab-always-indent 'complete)

;; Allow y/n insted of annoying yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; Delete selected text on keypress
(delete-selection-mode t)

;; Delete trailing spaces on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Show relative line numbers
(global-display-line-numbers-mode t)
(setq-default display-line-numbers-type 'relative)

;; Update buffer if file has changed on disk
(global-auto-revert-mode t)

;; Setup minibuffers
(setq-default enable-recursive-minibuffers t)
(setq-default max-mini-window-height 0.5)

;; Better scrolling
(setq mouse-wheel-progressive-speed nil)
(setq scroll-margin 3)

;; No need to warn
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'erase-buffer 'disabled nil)

;; After popping a mark (C-u C-SPC), C-SPC will pop another mark
(setq set-mark-command-repeat-pop t)

;; Try using hippie-expand instead of dabbrev
(setq hippie-expand-try-functions-list '(try-expand-dabbrev
                                         try-expand-dabbrev-all-buffers
                                         try-expand-dabbrev-from-kill
                                         try-complete-file-name-partially
                                         try-complete-file-name
                                         try-expand-all-abbrevs
                                         try-expand-list
                                         try-expand-line
                                         try-complete-lisp-symbol-partially
                                         try-complete-lisp-symbol))

(global-set-key (kbd "M-/") #'hippie-expand)

;; Prefer newest version of a file
(setq load-prefer-newer t)

;; Disable annoying bell sounds
(setq ring-bell-function 'ignore)

;; Disable backup files
(setq auto-save-default nil)
(setq make-backup-files nil)
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory "backups"))))

;; Disable lock files
(setq create-lockfiles nil)

;; Increase line size before wrapping
(setq fill-column 100)

;; Put customize stuff in its own file
(setq custom-file (expand-file-name "custom-file.el" user-emacs-directory))

;; ---------- PACKAGES ----------
;; Configure packages
(require 'package)

(setq package-archives '(("org"   . "http://orgmode.org/elpa/")
                         ("gnu"   . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))

(setq package-user-dir (expand-file-name "elpa" user-emacs-directory))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)

(setq use-package-verbose t)

;; Builtin packages
(use-package dired
  :config
  (put 'dired-find-alternate-file 'disabled nil)
  (setq dired-recursive-deletes 'always)
  (setq dired-recursive-copies 'always)
  (setq dired-dwim-target t)
  (require 'dired-x))

(use-package elec-pair
  :config (electric-pair-mode t))

(use-package frame
  :commands display-graphic-p)

(use-package ibuffer
  :bind ("C-x C-b" . ibuffer))

(use-package paren
  :config (show-paren-mode t))

(use-package recentf
  :config
  (setq recentf-max-saved-items 1000
        recentf-save-file (concat user-emacs-directory ".recentf"))
  (recentf-mode t))

(use-package savehist
  :config
  (setq savehist-file (concat user-emacs-directory ".savehist"))
  (savehist-mode t))

(use-package uniquify
  :config
  (setq uniquify-buffer-name-style 'forward)
  ;; rename after killing uniquified buffer
  (setq uniquify-after-kill-buffer-p t))

(use-package whitespace
  :bind ("C-c T w" . whitespace-mode))

(use-package shell
  :config (add-hook 'shell-mode-hook (lambda ()
                                       (display-line-numbers-mode -1))))

(use-package eshell
  :config (add-hook 'eshell-mode-hook (lambda ()
                                        (display-line-numbers-mode -1))))

;; Third party packages
(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one t)
  (setq-default doom-one-brighter-comments t))

(use-package all-the-icons
  :if window-system
  :ensure t)

(use-package all-the-icons-dired
  :if window-system
  :ensure t
  :after (all-the-icons)
  :hook (dired-mode . all-the-icons-dired-mode))

(use-package all-the-icons-ibuffer
  :if window-system
  :ensure t
  :init (all-the-icons-ibuffer-mode t))

(use-package all-the-icons-ivy
  :if window-system
  :ensure t
  :init (add-hook 'after-init-hook 'all-the-icons-ivy-setup))

(use-package diminish
  :ensure t)

(use-package which-key
  :ensure t
  :config (which-key-mode t))

(use-package undo-tree
  :ensure t
  :bind (("C-/" . undo-tree-undo)
         ("C-?" . undo-tree-redo)
         ("C-x u" . undo-tree-visualize)
         ("C-x r u" . undo-tree-save-state-to-register)
         ("C-x r U" . undo-tree-restore-state-from-register))
  :config (global-undo-tree-mode t))

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))

(use-package git-gutter
  :ensure t
  :config
  (global-git-gutter-mode t)
  (custom-set-variables '(git-gutter:hide-gutter t)))

(use-package direnv
  :ensure t
  :config (direnv-mode))

(use-package projectile
  :ensure t
  :config (projectile-mode t)
  :bind (("C-c p" . projectile-command-map)))

(use-package ibuffer-projectile
  :ensure t
  :config (add-hook 'ibuffer-hook
                    (lambda ()
                      (ibuffer-projectile-set-filter-groups)
                      (unless (eq ibuffer-sorting-mode 'alphabetic)
                        (ibuffer-do-sort-by-alphabetic)))))

(use-package ace-window
  :ensure t
  :bind (("C-x o" . ace-window)))

(use-package avy
  :ensure t
  :bind (("M-g M-g" . avy-goto-line)
         ("M-g w" . avy-goto-word-1)
         ("M-g M-w" . avy-goto-word-0)
         ("M-g c" . avy-goto-char-2)
         ("M-g M-c" . avy-goto-char)))

(use-package ivy
  :ensure t
  :config
  (ivy-mode t)
  (setq ivy-wrap t)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-initial-inputs-alist nil)
  :bind (("C-x b" . ivy-switch-buffer)
         ("C-x B" . ivy-switch-buffer-other-window)))

(use-package swiper
  :ensure t
  :bind (("C-s" . swiper)
         ("C-M-s" . isearch-forward-regexp)
         ("C-M-r" . isearch-backward-regexp)))

(use-package fzf
  :ensure t)

(use-package counsel
  :ensure t
  :bind (("M-x" . counsel-M-x)
         ("C-c i" . counsel-imenu)
         ("C-c s" . counsel-rg)
         ("C-x C-f" . counsel-find-file)
         ("C-h f" . counsel-describe-function)
         ("C-h v" . counsel-describe-variable)
         ("C-h f" . counsel-describe-symbol)))

(use-package company
  :ensure t
  :init
  (setq company-require-match nil
        company-tooltip-align-annotations t
        company-minimum-prefix-length 1)
  :hook (after-init . global-company-mode))

(use-package company-fuzzy
  :ensure t
  :after (company)
  :config
  (global-company-fuzzy-mode 1))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package flycheck-pos-tip
  :ensure t
  :config (setq flycheck-pos-tip-timeout 10))

;; (use-package treemacs
;;   :ensure t
;;   :bind (("C-x t t" . treemacs-select-window)))

;; (use-package treemacs-projectile
;;   :after (treemacs projectile)
;;   :ensure t)

;; (use-package treemacs-magit
;;   :after (treemacs magit)
;;   :ensure t)

(use-package neotree
  :ensure t
  :bind (([f8] . neotree-toggle))
  :config
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (add-hook 'neotree-mode-hook (lambda ()
                               (display-line-numbers-mode -1))))

(use-package vterm
  :ensure t
  :commands vterm-mode
  :config
  (setq vterm-kill-buffer-on-exit t)
  (add-hook 'vterm-mode-hook (lambda ()
                               (display-line-numbers-mode -1))))

(use-package anzu
  :ensure t
  :bind (("M-%" . anzu-query-replace)
         ("C-M-%" . anzu-query-replace-regexp))
  :config (global-anzu-mode))

(use-package hl-todo
  :ensure t
  :config
  (setq hl-todo-highlight-punctuation ":")
  (global-hl-todo-mode))

(use-package rainbow-mode
  :ensure t
  :hook prog-mode)

(use-package format-all
  :ensure t)

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l"
        lsp-enable-snippet nil)
  :config
  ;; Use this only for debugging, otherwise keep it off
  (setq lsp-log-io nil)
  (lsp-enable-which-key-integration t)
  :commands lsp)

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package lsp-ivy
  :ensure t
  :commands lsp-ivy-workspace-symbol)

(use-package lsp-treemacs
  :ensure t
  :commands lsp-treemacs-errors-list)

(use-package dap-mode
  :ensure t)

;; cc
(use-package ccls
  :ensure t
  :after (lsp)
  :hook ((c-mode . lsp)
         (c++-mode . lsp))
  :config
  (require 'dap-gdb-lldb))

(use-package cider
  :ensure t
  :config (setq nrepl-log-messages t))

;; docker
(use-package docker
  :ensure t
  :bind ("C-c d" . docker))

(use-package docker-tramp
  :ensure t)

(use-package dockerfile-mode
  :ensure t)

(use-package docker-compose-mode
  :ensure t)

;; elisp
(use-package f
  :ensure t)

(use-package s
  :ensure t)

(use-package dash
  :ensure t)

;; elixir
(use-package elixir-mode
  :ensure t
  :after (lsp)
  :hook (elixir-mode . lsp)
  :config
  (setq-default lsp-elixir-server-command "/usr/lib/elixir-ls/language_server.sh")
  (require 'dap-elixir))

;; elm
(use-package elm-mode
  :ensure t
  :after (lsp)
  :hook (elm-mode . lsp))

;; GLSL
(use-package glsl-mode
  :ensure t)

(use-package company-glsl
  :ensure t
  :config
  (when (executable-find "glslValidator")
    (add-to-list 'company-backends 'company-glsl)))

;; haskell
(use-package haskell-mode
  :ensure t)

;; (use-package lsp-haskell
;;   :ensure t
;;   :after (lsp)
;;   :hook (haskell-mode . lsp))
(use-package dante
  :ensure t
  :after haskell-mode
  :commands 'dante-mode
  :init
  (add-hook 'haskell-mode-hook 'flycheck-mode)
  (add-hook 'haskell-mode-hook 'dante-mode))


;; js / ts / web
(use-package js2-mode
  :ensure t
  :mode "\\.[mc]?js\\'"
  :hook (js2-mode . lsp)
  :config
  (setq-default js-basic-indent 2
                js2-basic-offset 2
                js2-basic-indent 2)
  (require 'dap-node))

(use-package typescript-mode
  :ensure t
  :mode "\\.ts\\'"
  :hook (typescript-mode . lsp)
  :config
  (setq-default typescript-indent-level 2)
  (require 'dap-node))

(use-package web-mode
  :ensure t
  :mode ("\\.html?\\'" "\\.eex\\'")
  :custom
  (web-mode-markup-indent-offset 2)
  (web-mode-css-indent-offset 2)
  (web-mode-code-indent-offset 2))

;; json
(use-package json-mode
  :ensure t)

(use-package counsel-jq
  :ensure t
  :after (json-mode))

;; markdown
(use-package markdown-mode
  :ensure t)

;; nix
(use-package nix-mode
  :ensure t
  :after lsp
  :hook (nix-mode . lsp))

;; rust
(use-package rustic
  :ensure t)

;; sh
(use-package company-shell
  :ensure t)

;; yaml
(use-package yaml-mode
  :ensure t)

(provide 'init)
;;; init.el ends here
