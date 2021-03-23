(require 'autothemer)

(autothemer-deftheme
    standard "Nice default color sceme"
    
    (
     (((class color) (min-colors #xFFFFFF)))

     (standard-black "black")
     (standard-dark-grey "DimGrey")
     (standard-light-grey "gainsboro")
     (standard-white "white")

     (standard-red "red4")
     (standard-light-red "red")

     (standard-green "green3")
     (standard-light-green "green")

     (standard-yellow "yellow3")
     (standard-light-yellow "yellow")

     (standard-blue "DodgerBlue3")
     (standard-light-blue "DodgerBlue2")

     (standard-purple "purple3")
     (standard-light-purple "DeepPink1")

     (standard-cyan "cyan3")
     (standard-light-cyan "cyan")

     )

    (
     (default                           (:foreground standard-light-grey :background standard-black))
     (cursor                            (:background standard-light-red))
     (range                             (:background standard-red))

     (mode-line                         (:background standard-green))
     (mode-line-inactive                (:background standard-blue))

     (font-lock-constant-face           (:foreground standard-light-purple))
     (font-lock-keyword-face            (:foreground standard-light-yellow))
     (font-lock-string-face             (:foreground standard-light-green))
     (font-lock-builtin-face            (:foreground standard-yellow))
     (font-lock-comment-face            (:foreground standard-blue))
     (font-lock-variable-name-face      (:foreground standard-purple))
     (font-lock-function-name-face      (:foreground standard-green))
     (font-lock-type-face               (:foreground standard-light-cyan))

     (hl-line                           (:background ))

     )
 )

(provide-theme 'standard)
