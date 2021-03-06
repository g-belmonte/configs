;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Guilherme Belmonte"
      user-mail-address "contact@belmonte.dev")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Source Code Pro" :size 13 :weight 'semi-light)
      doom-big-font (font-spec :family "Source Code Pro" :size 18))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/Pessoal/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; New keybindings
(map! "C-x b" #'counsel-buffer-or-recentf
      "C-x C-b" #'counsel-switch-buffer)
(map! "M-g g" #'avy-goto-line
      "M-g M-g" #'avy-goto-line)

;; Set default shell
(setq-default shell-file-name "/bin/zsh")

;; Do not consider all text typed while on insert mode as a single big blob
(setq-default evil-want-fine-undo t)

;; elixir-ls executable name
(setq-default lsp-clients-elixir-server-executable "elixir-ls")

;; purescript language server
(setq-default psc-ide-purs-executable "/home/grb/.npm_globals/bin/purs")

;; identation
;; web development
(setq-default js2-basic-offset 2) ; js2-mode
(setq-default typescript-indent-level 2) ; typescript-mode
(setq-default web-mode-markup-indent-offset 2) ; web-mode, html tag in html file
(setq-default web-mode-css-indent-offset 2) ; web-mode, css tag in html file
(setq-default web-mode-code-indent-offset 2) ; web-mode, js code in html file
(setq-default css-indent-offset 2) ; css-mode
