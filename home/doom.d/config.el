(setq user-full-name "David Hintringer"
      user-mail-address "gamedavid.dh@gmail.com")

(setq org-directory "~/org/")

(setq org-roam-directory (file-truename "~/org-roam"))
(if (not (file-exists-p org-roam-directory))
    (make-directory org-roam-directory))

(setq projectile-project-search-path '("~/src/"))
(projectile-discover-projects-in-search-path)

(setenv "RUST_SRC_PATH" "/usr/lib/rustlib/rustc-src")

(setq doom-theme 'doom-dracula)

;; Outrun-electric
(defun custom-theme-patch--outrun-electric ()
    (set-face-background 'hl-line "DeepPink4"))
(if doom-theme 'doom-outrun-electric
  (progn
    (add-hook 'treemacs-mode-hook
              #'custom-theme-patch--outrun-electric
    )))

;; Dracula
(defun custom-theme-patch--dracula ()
    (set-face-background 'hl-line "DeepPink4"))
(if doom-theme 'doom-dracula
  (progn
    (add-hook 'treemacs-mode-hook
              #'custom-theme-patch--dracula)
    (message "Wtf")
    ))

(setq doom-font (font-spec :family "FuraCode Nerd Font"))

(setq display-line-numbers-type t)

(map! :leader :desc "Line highlighting" "t h" #'hl-line-mode)
(remove-hook 'doom-first-buffer-hook #'global-hl-line-mode)

(map! :leader :desc "Frame opacity" "t o" #'opacity-toggle)

(defun ace-window-global (arg)
  (interactive "p")
  (setq aw-scope #'global)
  (ace-window arg))

(map! :leader :desc "Ace Window" "w a" #'ace-window-global)

(map! :leader :desc "Find string in project" "p SPC" #'+helm:project-search)

(map! :leader :desc "Replace String in line" "r" #'replace-string)

(map! :leader :prefix-map ("i c" . "Color codes"))
(map! :leader :desc "Insert Emacs Color" "i c e" #'counsel-colors-emacs)
(map! :leader :desc "Insert Web Color" "i c w" #'counsel-colors-web)

(map! :leader :desc "Color preview" "t c" #'rainbow-mode)

(defun set-no-process-query-on-exit ()
    (let ((proc (get-buffer-process (current-buffer))))
    (when (processp proc)
    (set-process-query-on-exit-flag proc nil))))
(add-hook 'term-exec-hook 'set-no-process-query-on-exit) ;; ansi-term
(add-hook 'vterm-mode-hook 'set-no-process-query-on-exit) ;; vterm

(xterm-mouse-mode 1)

(map! :map evil-normal-state-map :desc "Increase current font size" "C-M-+" #'doom/increase-font-size)
(map! :map evil-normal-state-map :desc "Reset current font size" "C-M-=" #'doom/reset-font-size)
(map! :map evil-normal-state-map :desc "Decrease current font size" "C-M--" #'doom/decrease-font-size)

(defun doom/goto-private-literate-config ()
       (interactive)
       (find-file (expand-file-name "~/.doom.d/config.org")))
(map! :leader :desc "Edit literate config" "h d o" #'doom/goto-private-literate-config)

(defun c-insert-weird-arrow ()
  (interactive)
  (insert "->"))

(map! :map c-mode-map
      :desc "Insert ->"
      :nv "C-."
      #'c-insert-weird-arrow)

(map! :map dired-mode-map
      :desc "Create File"
      :nv "c"
      #'dired-create-empty-file)

(map! :leader :desc "Stage all changes" "g a" #'magit-stage-modified)
(map! :leader :desc "Push to upstream branch" "g p" #'magit-push-current-to-upstream)

(map! :leader :prefix-map ("o SPC" . "EAF Applications"))
(map! :leader :desc "EAF Browser" "o SPC b" #'eaf-open-browser)
(map! :leader :desc "EAF Terminal" "o SPC t" #'eaf-open-terminal)
(map! :leader :desc "EAF Jupyter" "o SPC j" #'eaf-open-jupyter)

(setq eaf-installation-path "~/src/emacs-application-framework")
(setq eaf-installation-repo     "https://github.com/crims0nHD/emacs-application-framework.git")
(setq eaf-installation-branch
      "development")

(setq lsp-zig-zls-executable "~/toolchains/zls/zls")

(add-to-list 'auto-mode-alist '("template" . shell-script-mode))

(map! :leader :desc "Open Calendar" "o c" #'+calendar/open-calendar)

(defun interop-flatpak-update ()
  (interactive)
  (comint-send-string
   (get-buffer-process (shell))
   "flatpak update"))

(defun interop-paru-update ()
  (interactive)
  (comint-send-string
   (get-buffer-process (shell))
   "paru -Syu"))
