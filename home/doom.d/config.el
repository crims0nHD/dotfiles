(setq user-full-name "David Hintringer"
      user-mail-address "gamedavid.dh@gmail.com")

(setq org-directory "~/org/")

(setq org-roam-directory (file-truename "~/org-roam"))
(if (not (file-exists-p org-roam-directory))
    (make-directory org-roam-directory))

(setq projectile-project-search-path '("~/src/"))
(projectile-discover-projects-in-search-path)

(setenv "RUST_SRC_PATH" "/usr/lib/rustlib/rustc-src")

(setq loaded-theme-name 'doom-outrun-electric)

(load-theme loaded-theme-name t)

;; Apply custom modifications to loaded theme
;; TODO
(if loaded-theme-name 'doom-outrun-electric
  (progn
    (setq doom-theme 'doom-outrun-electric)
    (add-hook 'treemacs-mode-hook
              (lambda () (set-face-background 'hl-line "DimGrey")))
    ))

(setq doom-font (font-spec :family "Fira Code"))

(setq display-line-numbers-type t)

(map! :leader :desc "Line highlighting" "t h" #'hl-line-mode)
(remove-hook 'doom-first-buffer-hook #'global-hl-line-mode)

(map! :leader :desc "Frame opacity" "t o" #'opacity-toggle)
