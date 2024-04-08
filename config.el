;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Volodymyr Yavdoshenko"
      user-mail-address "v.yavdoshenko@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!
(setq doom-font (font-spec :family "Fira Code" :size 40 :weight 'light))
(setq doom-variable-pitch-font (font-spec :family "Noto Sans" :size 26 :weight 'extra-light))

(when (eq system-type 'darwin)
  (setq doom-font (font-spec :family "Fira Code" :size 20 :weight 'light))
  (setq doom-variable-pitch-font (font-spec :family "Noto Sans" :size 13 :weight 'extra-light)))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)
(setq doom-themes-treemacs-theme "doom-colors")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/orgmode/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

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
(setq treemacs-width-is-initially-locked nil)
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
(map!
      "s-," #'evil-window-increase-width
      "s-." #'evil-window-decrease-width
      )

;; maximazed frame on startup
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . fullheight))

;; lsp settings
(when (eq system-type 'darwin)
  (setq exec-path (append exec-path '("/opt/homebrew/opt/llvm/bin"))))

;; override default cmake indentation to 4 spaces
(setq cmake-tab-width 4)

;; Unlike Vim, Emacs treats _ as a word separator. This is fix for that.
;; https://github.com/syl20bnr/spacemacs/issues/9740
(with-eval-after-load 'evil (defalias #'forward-evil-word #'forward-evil-symbol))

;; treemacs + undo settings
(after! undo-tree
  (setq undo-tree-auto-save-history nil))

;; whitespace settings
(global-whitespace-mode +1)
  (setq-default tab-width 4)

(setq-default fill-column 1600)

(defun column-hook()
  (setq fill-column 1600))

(add-hook 'cmake-mode-hook 'column-hook)

;; mouse horisontal scroll
(setq mouse-wheel-tilt-scroll t)
(setq mouse-wheel-flip-direction t)

(projectile-add-known-project "~/english")
