(defun dot-product (a b)
  "Function to compute the dot product of two sequences of numbers"
  (apply #'+ (mapcar #'* a b)))