;; Config
(setq opacity-active 90)
(setq opacity-inactive 90)

(when (featurep! +onstartup)
    (setq opacity-on-startup t))

(setq opacity/is-termux nil) ;; Implement something that detects termux
(setq opacity-is-enabled nil) ;; Disabled by default

(when opacity-on-startup
  (set-opacity opacity-active opacity-inactive)
  (setq opacity-is-enabled t)
)
