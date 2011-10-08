(defun doit (val)
  "recursive until you find a 42"

  (if (= val 42)
      0
    (progn
      (print val)
      (doit (read))
      )))
  
(doit (read))
