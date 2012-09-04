(defun ! (n)
  (if (= n 1)
      1
      (* n (! (- n 1)))))

(loop for i from 1 to (read) do
     (print (! (read))))