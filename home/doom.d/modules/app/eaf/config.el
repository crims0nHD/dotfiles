;; Flags:
;;      +default-browser : changes the default browser to EAF browser
;;      +custom-path : requires that eaf-installation-path is set manually
;;      +custom-repo : use a custom repo for eaf
;;      +custom-branch : use some different branch
;;
;; emacs application framework stuff
;; https://github.com/manateelazycat/emacs-application-framework
;; installation: git clone --depth=1 -b master https://github.com/manateelazycat/emacs-application-framework.git ~/.emacs.d/site-lisp/emacs-application-framework/

;; Default
;;(setq eaf-installation-path "~/.emacs.d/site-lisp/emacs-application-framework"))
;;(setq eaf-installation-repo "https://github.com/manateelazycat/emacs-application-framework.git"))
;;(setq eaf-installation-branch "master"))

;; Development
(setq eaf-installation-path "~/src/emacs-application-framework")
(setq eaf-installation-repo "https://github.com/crims0nHD/emacs-application-framework.git")
(setq eaf-installation-branch "development")

;; Helper functions
;; --------------------
(defun eaf-maintenence-run-install-py (&optional args)
  ;; Execute the installation script in a shell buffer
  (comint-send-string (get-buffer-process (shell))
                      (concat (file-name-as-directory eaf-installation-path) "install-eaf.py" args "\n")))

;; Exposed functions
;; --------------------
;; Automatic installation of EAF
(defun eaf-install-framework ()
  (interactive)
  ;; Prepare parent directory for repo
  (if (not (file-exists-p (file-name-directory eaf-installation-path)))
      (make-directory (file-name-directory eaf-installation-path)))

  ;; Clone the repo
  (shell-command (concat "git clone --depth=1 -b " eaf-installation-branch " " eaf-installation-repo " " eaf-installation-path))

  (eaf-maintenence-run-install-py))

(defun eaf-uninstall-framework ()
  (interactive)
  (delete-directory eaf-installation-path 1))

;; Package configuration
;; -------------------------
(use-package! eaf
  :load-path eaf-installation-path ; Set to "/usr/share/emacs/site-lisp/eaf" if installed from AUR
  :init
  (use-package! epc :defer t)
  (use-package! ctable :defer t)
  (use-package! deferred :defer t)
  (use-package! s :defer t)
  :custom
  (eaf-browser-continue-where-left-off t)
  :config
  ;; Dark mode
  (eaf-setq eaf-browser-dark-mode "true")
  (eaf-setq eaf-terminal-dark-mode "true")
  (eaf-setq eaf-mindmap-dark-mode "follow") ; default option
  (eaf-setq eaf-pdf-dark-mode "ignore") ; see below

  ;; Browser
  ;;(eaf-bind-key nil "M-q" eaf-browser-keybinding)
  (eaf-setq eaf-browser-enable-adblocker "true")
  ;;(eaf-setq eaf-browser-download-path "other_path")
  ;;(eaf-setq eaf-browser-remember-history "false")
  ;;(setq eaf-browser-default-search-engine "duckduckgo")
  ;;(eaf-setq eaf-browse-blank-page-url "https://duckduckgo.com")
  ;;(eaf-setq eaf-browser-enable-plugin "false")
  ;;(eaf-setq eaf-browser-enable-javascript "false")

  ;; PDF Viewer
  ;;(eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
  ;;(eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)

  ;;Camera
  ;;(eaf-bind-key take_photo "p" eaf-camera-keybinding)
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
