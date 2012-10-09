(defparameter *bigone* 0)
(defparameter *mid* 0)
(defparameter *last* 0)
(defun guess-my-number (small big)
  (setf *bigone* (+ big 1))
  (setf *last* (- small 1))
  (setf *mid* (/ (+ *bigone* *last*) 2)))

(defun smaller ()
  (setf *bigone* *mid*)
  (setf *mid* (truncate (/ (+ *bigone* *last* 1) 2))))

(defun bigger ()
  (setf *last* *mid*)
  (setf *mid* (truncate (/ (+ *bigone* *last*) 2))))

;; 57
;; CL-USER> (guess-my-number)
;; 50
;; CL-USER> (bigger)
;; 74
;; CL-USER> (smaller)
;; 62
;; CL-USER> (smaller)
;; 56
;; CL-USER> (bigger)
;; 58
;; CL-USER> (smaller)
;; 57

(defun len (l)
  (if l
      (1+ (len (cdr l)))
      0))
