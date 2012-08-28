(defun count-atoms (expr)
  (if (null expr)
      0
      (if (atom expr) 
          1
          (+ (count-atoms (first expr)) (count-atoms (rest expr))))))