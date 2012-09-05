(setf primes '(2))
(defun prime? (n list-of-primes)
  "Given the list of known primes, check if n is a new prime"
  (cond ((= (length list-of-primes) 0) t)
        ((= (mod n (first list-of-primes)) 0) nil)
        (t (prime? n (rest list-of-primes)))))

(defvar limit 31623)      
(defun sieve (n)
  (if (prime? n primes)
      (setf primes (cons n primes)))
  (if (< n limit)
      (sieve (+ n 2))))
(sieve 3)
