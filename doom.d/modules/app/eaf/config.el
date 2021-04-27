;; emacs application framework stuff
;; https://github.com/manateelazycat/emacs-application-framework
;; installation: git clone --depth=1 -b master https://github.com/manateelazycat/emacs-application-framework.git ~/.emacs.d/site-lisp/emacs-application-framework/
(setq eaf-installation-path "~/.emacs.d/site-lisp/emacs-application-framework")

(if (file-directory-p eaf-installation-path)
  (progn
(use-package! eaf
  :load-path eaf-installation-path ; Set to "/usr/share/emacs/site-lisp/eaf" if installed from AUR
  :init
  (use-package! epc :defer t :ensure t)
  (use-package! ctable :defer t :ensure t)
  (use-package! deferred :defer t :ensure t)
  (use-package! s :defer t :ensure t)
  :custom
  (eaf-browser-continue-where-left-off t)
  :config
  ;; Dark mode
  (eaf-setq eaf-browser-dark-mode "true")
  (eaf-setq eaf-terminal-dark-mode "true")
  (eaf-setq eaf-mindmap-dark-mode "follow") ; default option
  (eaf-setq eaf-pdf-dark-mode "ignore") ; see below
  ;; Browser
  (eaf-bind-key nil "M-q" eaf-browser-keybinding)
  (eaf-setq eaf-browser-enable-adblocker "true")
  ;;(eaf-setq eaf-browser-download-path "other_path")
  ;;(eaf-setq eaf-browser-remember-history "false")
  ;;(setq eaf-browser-default-search-engine "duckduckgo")
  ;;(eaf-setq eaf-browse-blank-page-url "https://duckduckgo.com")
  ;;(eaf-setq eaf-browser-enable-plugin "false")
  ;;(eaf-setq eaf-browser-enable-javascript "false")
  ;; PDF Viewer
  (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
  (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
  ;;Camera
  (eaf-bind-key take_photo "p" eaf-camera-keybinding)
  ) ;; unbind, see more in the Wiki

;; evil stuff
(when (featurep! :editor evil)
    (define-key key-translation-map (kbd "SPC")
    (lambda (prompt)
      (if (derived-mode-p 'eaf-mode)
          (pcase eaf--buffer-app-name
            ("browser" (if  (string= (eaf-call-sync "call_function" eaf--buffer-id "is_focus") "True")
                           (kbd "SPC")
                         (kbd eaf-evil-leader-key)))
            ("pdf-viewer" (kbd eaf-evil-leader-key))
            ("image-viewer" (kbd eaf-evil-leader-key))
            (_  (kbd "SPC")))
        (kbd "SPC")))))

(when (featurep! +default-browser)
  (setq browse-url-browser-function 'eaf-open-browser)
  (defalias 'browse-web #'eaf-open-browser))
)
  (message "EAF installation not found!");
  )
