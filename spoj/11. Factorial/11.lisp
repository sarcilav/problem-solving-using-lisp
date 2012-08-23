;; Accepted with sbcl
(defun Z ( n acum  )
  (if (= n 0)
      acum
    (let ((a (truncate (/ n 5)) ) )
      ( Z  a  (+ acum a) )
      )
    ))
(defun doit (m)
  (if (= m 0)
      0
    (progn
      (print (Z (read) 0) )
      (doit (- m 1))
      )))
(doit (read))