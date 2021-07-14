;;;###autoload
;; Code
(defun opacity-set (active inactive)
  (interactive)
  (unless (integerp active)
    (error "argument active: wrong type")
    )
  (unless (integerp inactive)
    (error "argument inactive: wrong type")
    )
  (set-frame-parameter (selected-frame) 'alpha (cons active inactive))
  (add-to-list 'default-frame-alist (cons 'alpha (cons active inactive)))
  )

