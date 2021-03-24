;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "David Hintringer"
      user-mail-address "gamedavid.dh@gmail.com")

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
(setq doom-theme 'standard)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type "relative")


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

;; Movement
(map! :leader :desc "Ace Window" "w a" #'ace-window)

;; Git / Magit
(map! :leader :desc "Stage all changes" "g a" #'magit-stage-modified)
(map! :leader :desc "Push to upstream branch" "g p" #'magit-push-current-to-upstream)
(load! "./git-identity.el")
(use-package! git-identity
  :ensure t
  :after magit
  :config
  (git-identity-magit-mode 1)
  ;; Bind I to git-identity-info in magit-status
  (define-key magit-status-mode-map (kbd "I") 'git-identity-info)
  :custom
  ;; Warn if the global identity setting violates your policy
  (git-identity-verify t)
  ;; The default user name
  (git-identity-default-username "David Hintringer"))
(setq git-identity-list '(("gamedavid.dh@gmail.com"
                          :domains ("github.com")
                          )))

;; Color
(map! :leader :desc "Insert Emacs Color" "i c" #'counsel-colors-emacs)
(map! :leader :desc "Color preview" "t c" #'rainbow-mode)

;; Toggle line highlight
(map! :leader :desc "Line highlighting" "t h" #'hl-line-mode)

;; stop line highlight from autostarting
(global-hl-line-mode -1)

;; Arduino 😄
(load! "./arduino-mode.el")

;; Background opacity
(setq dw/is-termux nil) ;; Implement something that detects termux
(unless dw/is-termux
  (set-frame-parameter (selected-frame) 'alpha '(90 . 90))
  (add-to-list 'default-frame-alist '(alpha . (90 . 90))))

;;; Don't whine if there is a terminal open.
(defun set-no-process-query-on-exit ()
(let ((proc (get-buffer-process (current-buffer))))
(when (processp proc)
(set-process-query-on-exit-flag proc nil))))
(add-hook 'term-exec-hook 'set-no-process-query-on-exit) ;; ansi-term
(add-hook 'vterm-mode-hook 'set-no-process-query-on-exit) ;; vterm
