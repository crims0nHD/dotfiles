;; Config
(setq opacity/active 90)
(setq opacity/inactive 90)

(setq opacity/enable-on-startup nil)
(when (featurep! +onstartup)
    (setq opacity/enabled-on-startup t))

(setq opacity/is-enabled nil) ;; Disabled by default
(when opacity/enable-on-startup
  (opacity-set opacity/active opacity/inactive)
  (setq opacity/is-enabled t)
)

;; Bind this to key
(defun opacity-toggle ()
  (interactive)
  (if (display-graphic-p)
    (if opacity/is-enabled
	(progn ;; true (not nil)
          (opacity-set 100 100)
	  (setq opacity/is-enabled nil)
	  (message "Frame opacity disabled")
	  )
	(progn ;; false (nil)
          (opacity-set opacity/active opacity/inactive)
	  (setq opacity/is-enabled t)
	  (message "Frame opacity enabled")
	  )
        )
        (message "Opacity not supported when running in Terminal!")
    )
  )
