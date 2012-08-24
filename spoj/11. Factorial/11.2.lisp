(defun z (n  acum)
  (setf temp (/ n 5))
  (if (< n 1)
      acum
    (z temp (+ acum (truncate temp)))))

(loop for i from 1 to (read) do
      (print (z (read) 0)))