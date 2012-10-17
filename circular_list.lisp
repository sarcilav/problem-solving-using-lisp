;; you shoul enable the repl to print circular lists
(setf *print-circle* t)

;; basic circular list
(defparameter foo '(1 2 3))

(setf (cdddr foo) foo)