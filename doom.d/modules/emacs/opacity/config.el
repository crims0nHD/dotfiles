;; Config
(setq opacity-active 90)
(setq opacity-inactive 90)

(setq opacity-on-startup nil)
(when (featurep! +onstartup)
    (setq opacity-on-startup t))

(setq opacity/is-termux nil) ;; Implement something that detects termux
(setq opacity-is-enabled nil) ;; Disabled by default

(when opacity-on-startup
  (opacity-set opacity-active opacity-inactive)
  (setq opacity-is-enabled t)
)

(defun opacity-toggle ()
  (interactive)
  (unless opacity/is-termux
    (if opacity-is-enabled
	(progn ;; true (not nil)
          (opacity-set 100 100)
	  (setq opacity-is-enabled nil)
	  (message "Frame opacity disabled")
	  )
	(progn ;; false (nil)
          (opacity-set opacity-active opacity-inactive)
	  (setq opacity-is-enabled t)
	  (message "Frame opacity enabled")
	  )
	)
    )
  )
