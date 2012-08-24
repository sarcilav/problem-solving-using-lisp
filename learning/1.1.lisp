(defparameter *ends*
  '(MD JR SJ))
(defun last-name (name)
  (if (member (first (last name)) *ends*)
      (last-name (reverse (rest (reverse name))))
    (first (last name))))
