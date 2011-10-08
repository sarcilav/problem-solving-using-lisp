(defun reverseAnInteger (s)
  (parse-integer (reverse (write-to-string s))))

(defun solve ()
  (let (
        (a (reverseAnInteger (read)))
        (b (reverseAnInteger (read)))
        )
    (print (reverseAnInteger (+ a b)))))

(defun doit (cases)
  (if (= cases 0)
      0
    (progn
      (solve )
      (doit (- cases 1))
      )))

(doit (read))
      