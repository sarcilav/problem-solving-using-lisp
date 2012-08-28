(defun mappend (fn the-list)
  "Apply fn to each element of the list and append the results."
  (apply #'append (mapcar fn the-list)))

(apply #'+ '(1 2 3 4))                           ;; 10
(mapcar #'+ (list 1) (list 2) (list 3) (list 4)) ;; (10)
(mapcar #'+ '(1) '(2) '(3) '(4))                 ;; (10)

(apply #'append '((1 2 3) (a b c))) ;; (1 2 3 A B C)

(defun self-and-double (x)
  (list x (+ x x)))

(self-and-double 3) ;; (3 6)

;; (apply #'self-and-double '(3 4)) ; ERROR (self-and-double 3 4)

(mapcar #'self-and-double '(1 10 300)) ;; ((1 2) (10 20) (300 600))

(mappend #'self-and-double '(1 10 300)) ;; (1 2 10 20 300 600)

(defun numbers-and-negations (input)
  "Given a list, return only the numbers and their negations."
  (mappend #'number-and-negation input))

(defun number-and-negation (x)
  "If x is a number, return a list of x and -x."
  (if (numberp x) ;; Returns true if object is of type number; otherwise, returns false.
      (list x (- x))
    nil))

(numbers-and-negations '(testing 1 2 3 -4 test 5)) ;; (1 -1 2 -2 3 -3
;; -4 4 5-5)

;; New mappend

(defun mappend (fn the-list)
  "Apply fn to each element of the list and append the results."
  (if (null the-list) ;; Returns true if its argument is NIL.
      nil
    (append (funcall fn (first the-list))
            (mappend fn (rest the-list)))))

;; Difference between apply and funcall apply works over a list and
;; funcal use the list of arguments (separately)
;; * (funcall #'+ 2 3)

;; 5
;; * (apply #'+ '(2 3))

;; 5
;; * (funcall #'+ '(2 3))

;; Error



;; lambda expressions are in general like
;; (lambda (parameters...) body...)

((lambda (x) (+ x 2)) 4) ;;  6
(funcall #'(lambda (x) (+ x 2)) 4) ;; 6 we still need to use #'
