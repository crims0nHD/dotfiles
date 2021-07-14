(require 'autothemer)

(autothemer-deftheme
    manjoro "Unofficial manjaro-esk theme"

    (
     (((class color) (min-colors #xFFFFFF)))

     (standard-black "black")
     (standard-darker-grey "grey7")
     (standard-dark-grey "DimGrey")
     (standard-light-grey "gainsboro")
     (standard-white "white")

     (manjoro-green-main "SeaGreen")
     (manjoro-green-second "SeaGreen2")

     (manjoro-grey-dark "grey14")

     )

    (
     (default                           (:foreground standard-light-grey :background standard-black))
     (cursor                            (:background standard-light-red))
     (region                             (:background standard-red))

     (mode-line                         (:background standard-green :foreground standard-black))
     (mode-line-inactive                (:background standard-blue))

     (font-lock-constant-face           (:foreground standard-light-purple))
     (font-lock-keyword-face            (:foreground standard-light-yellow))
     (font-lock-string-face             (:foreground standard-light-green))
     (font-lock-builtin-face            (:foreground standard-yellow))
     (font-lock-comment-face            (:foreground standard-blue))
     (font-lock-variable-name-face      (:foreground standard-purple))
     (font-lock-function-name-face      (:foreground standard-green))
     (font-lock-type-face               (:foreground standard-light-cyan))

     (hl-line                           (:background standard-dark-grey))

     )
 )

(provide-theme 'standard)
