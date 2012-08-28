(defun exponentiate (base exp)
  (if (= exp 0)
      1
    (* base (exponentiate base (- exp 1)))))