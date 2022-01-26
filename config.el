;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Vladimir Yavdoshenko"
      user-mail-address "v.yavdoshenko@gmail.com")

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
(setq doom-font (font-spec :family "FiraCode NF" :size 15 :weight 'light))
(setq doom-variable-pitch-font (font-spec :family "Noto Sans" :size 12 :weight 'extra-light))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/orgmode/")

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

;; switching windows
(map! :leader
      :desc "Window left"
      "w <left>" #'evil-window-left)
(map! :leader
      :desc "Window right"
      "w <right>" #'evil-window-right)
(map! :leader
      :desc "Window up"
      "w <up>" #'evil-window-up)
(map! :leader
      :desc "Window down"
      "w <down>" #'evil-window-down)

;; resizing windows
(map! :leader
      :desc "Increase width"
      "<left>" #'evil-window-increase-width)
(map! :leader
      :desc "Decrease width"
      "<right>" #'evil-window-decrease-width)
(map! :leader
      :desc "Increase height"
      "<up>" #'evil-window-increase-height)
(map! :leader
      :desc "Decrease height"
      "<down>" #'evil-window-decrease-height)

;; tabs
(map! "S-<left>"
      :desc "Move tab left"
      #'centaur-tabs-move-current-tab-to-left)
(map! "S-<right>"
      :desc "Move tab right"
      #'centaur-tabs-move-current-tab-to-right)

;; maximazed frame on startup
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . fullheight))

;; lsp settings
(when (eq system-type 'darwin)
    (setq exec-path (append exec-path '("/opt/homebrew/opt/llvm/bin"))))
(setq lsp-clients-clangd-args '("-j=7"
                                "--fallback-style=Google"
                                "--background-index"
                                "--clang-tidy"
                                "--completion-style=bundled"))
(after! lsp-clangd (set-lsp-priority! 'clangd 2))
(set-eglot-client! 'cc-mode '("clangd"
                              "-j=7"
                              "--fallback-style=Google"
                              "--background-index"
                              "--clang-tidy"
                              "--completion-style=bundled"))
;; override default cmake indentation to 4 spaces
(setq cmake-tab-width 4)

;; select theme and colors
(setq doom-theme 'doom-monokai-classic)
(setq doom-themes-treemacs-theme "doom-colors")

; Unlike Vim, Emacs treats _ as a word separator. This is fix for that.
; https://github.com/syl20bnr/spacemacs/issues/9740
(with-eval-after-load 'evil (defalias #'forward-evil-word #'forward-evil-symbol))

; turn off lsp code formatter
(setq +format-with-lsp nil)
(setq lsp-enable-on-type-formatting nil)

; disable annoying tips
(setq lsp-ui-doc-enable nil)
(setq lsp-ui-doc-show-with-cursor nil)
(setq lsp-ui-doc-show-with-mouse nil)

; treemacs + undo settings
(after! undo-tree
    (setq undo-tree-auto-save-history nil))

; format settings
(setq +format-on-save-enabled-modes
      '(not emacs-lisp-mode  ; elisp's mechanisms are good enough
            sql-mode         ; sqlformat is currently broken
            tex-mode         ; latexindent is broken
            latex-mode
            cmake-mode
            nxml-mode))

; whitespace settings
(global-whitespace-mode +1)
(setq-default tab-width 4)

(defun column-hook()
  (setq fill-column 140))

(add-hook 'c-mode-hook 'column-hook)
(add-hook 'c++-mode-hook 'column-hook)
(add-hook 'cmake-mode-hook 'column-hook)
