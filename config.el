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
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

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

;; vterm open
(map! :leader
      :desc "vterm toggle"
      "o t" #'vterm)

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
(map! :leader
      :desc "Create a new tab"
      "n t" #'centaur-tabs--create-new-tab)

;; org mode
(map! :leader
      :desc "Compile org mode file"
      "c f" #'org-babel-tangle)

;; maximazed frame on startup
(add-hook 'after-init-hook #'toggle-frame-maximized)

;; lsp settings
(when (eq system-type 'darwin)
    (setq lsp-clients-clangd-executable "/opt/homebrew/opt/llvm/bin/clangd"))
(setq lsp-clients-clangd-args '("-j=3"
                                "--clang-tidy"))
(after! lsp-clangd (set-lsp-priority! 'clangd 2))
(set-eglot-client! 'cc-mode '("clangd" "-j=3" "--clang-tidy"))

(setq doom-theme 'doom-monokai-machine)
(setq doom-themes-treemacs-theme "doom-colors")
