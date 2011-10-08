(defun doit (val)
  "recursive until you find a 42"

  (if (= val 42)
      NIL
    (progn
      (print val)
      (doit (read))
      )))
  
(doit (read))
