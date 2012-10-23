(setf primes (make-array 100000 :initial-element 2))

(defun prime? (n list-of-primes)
  "Given the list of known primes, check if n is a new prime"
  (cond ((= (length list-of-primes) 0) t)
        ((= (mod n (first list-of-primes)) 0) nil)
        (t (prime? n (rest list-of-primes)))))

(defvar limit 100) ;;31623)
(defun sieve (n)
  (if (prime? n primes)
      (setf primes (cons n primes)))
  (if (< n limit)
      (sieve (+ n 2))))
(sieve 3)
(print primes)
;; (loop for i from 1 to (read) do
;;      (if (= i 1)
;;          ()
;;          (print())
;;      (primes-in (read) (read)))
(defun sieve-2 (n)
  (let ((bit-vector (make-array n :initial-element 1 :element-type 'bit)))
    (loop for i from 2 upto (isqrt n) do
         (loop for j from i
            for index = (* i j)
            until (>= index n) do
            (setf (sbit bit-vector index) 0)))
    (loop for i from 2 below (length bit-vector)
       unless (zerop (sbit bit-vector i)) collect i)))