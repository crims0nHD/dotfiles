(require 'autothemer)

(autothemer-deftheme
    cyberpunk "A theme for my setup"
    
    (
     (((class color) (min-colors #xFFFFFF)))

     (cyberpunk-black "grey4")

     (cyberpunk-pink "DeepPink")
     (cyberpunk-pink-dark "DeepPink3")

     (cyberpunk-purple "purple3")
     (cyberpunk-purple-deep "purple4")
     (cyberpunk-purple-pale "MediumPurple3")
     (cyberpunk-purple-pale-light "MediumPurple1")
     (cyberpunk-purple-pale-dark "MediumPurple4")

     (cyberpunk-blueish-purple "SlateBlue3")
     (cyberpunk-blue-pale "RoyalBlue2")

     )

    (
     (default                   (:foreground cyberpunk-purple-pale-light :background cyberpunk-black))
     (cursor                    (:background cyberpunk-purple))
     (range                     (:background cyberpunk-purple-deep))

     (mode-line                 (:background cyberpunk-purple-deep))

     (font-lock-constant-face   (:foreground cyberpunk-purple-pale))
     (font-lock-keyword-face    (:foreground cyberpunk-purple))
     (font-lock-string-face     (:foreground cyberpunk-blue-pale))
     (font-lock-builtin-face    (:foreground cyberpunk-blueish-purple))
    )
 )

(provide-theme 'cyberpunk)
