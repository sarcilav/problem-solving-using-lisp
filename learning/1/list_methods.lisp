(setf p '(john q public street)) ;; sample list

(first p) ;; JOHN

(last p) ;; (STREET)

(first (last p)) ;; STREET

(rest p) ;; (Q PUBLIC STREET)

(second p) ;; Q

(third p) ;; PUBLIC

(fourth p) ;; STREET

(fith p) ;; NIL

(setf l (append p '(hola))) ;; (JOHN Q PUBLIC STREET HOLA)

(length l) ;; 5

(setf x '((1st element) 2 (element 3) ((4)) 5)) ;; composed list

(length x) ;; 5

(second (first x)) ;; ELEMENT

;; Construct cons

(cons x p) ;; (((1ST ELEMENT) 2 (ELEMENT 3) ((4)) 5) JOHN Q PUBLIC STREET)

;; using functions

(defun last-name (name)
  "Select the last name from a name represented as a list."
  (first (last name)))

(defun first-name (name)
  "Select the first name from a name represented as a list."
  (first name))

(setf names '((John Q Public) (Malcolm X)
              (Admiral Grace Mirray Hopper) (Spot)
              (Aristotle) (A A Milne) (Z Z Top)
              (Sir Larry Olivier) (Miss Scarlet)))

(mapcar #'last-name names) ;; (PUBLIC X HOPPER SPOT ARISTOTLE MILNE
;; TOP OLIVIER SCARLET) ; O_o oh boy mapcar???

;; mapcar is passed two arguments, a function and a list. It returns a
;; list built by calling the function on every element of the input
;; list.
;; For example (mapcar #'last-name names) is equivalent to:
;; (list (last-name (first names))
;;       (last-name (second names))
;;       (last-name (third names))
;; map comes from map and car from "contents of the address register"
;; cdr "contents of the decrement register"
;; car = first
;; cdr = rest

(mapcar #'- '(1 2 3 4))                   ;; (-1 -2 -3 -4)
(mapcar #'+ '(1 2 3 4) '(40 30 20 10))    ;; (41 32 23 14)
(mapcar #'+ '(1 2 3 4) '(40 30 20))       ;; (41 32 23)
(mapcar #'+ '(1 2 3 4) '(40 30 20 10 10)) ;; (41 32 23 14)

;; Note mapcar in general expects an n-ary function as its first
;; argument, followed by n lists.

(mapcar #'first-name names) ;; (JOHN MALCOLM ADMIRAL SPOT ARISTOTLE A Z SIR MISS)

(defparameter *titles*
  '(Mr Mrs Miss Ms Sir Madam Dr Admiral Major General)
  "A list of titles that can appear at the start of a name.")

(defun first-name (name)
  "Select the first name from a name represented as a list."
  (if (member (first name) *titles*)
      (first-name (rest name))
    (first name)))

(mapcar #'first-name names) ;; (JOHN MALCOLM GRACE SPOT ARISTOTLE A Z LARRY SCARLET)

(first-name '(Madam Major General Paula Jones)) ;; PAULA

(trace first-name) ;; trace/untrace to track the execution of a function

;; * (first-name '(Madam Major General Paula Jones))
;;   0: (FIRST-NAME (MADAM MAJOR GENERAL PAULA JONES))
;;     1: (FIRST-NAME (MAJOR GENERAL PAULA JONES))
;;       2: (FIRST-NAME (GENERAL PAULA JONES))
;;         3: (FIRST-NAME (PAULA JONES))
;;         3: FIRST-NAME returned PAULA
;;       2: FIRST-NAME returned PAULA
;;     1: FIRST-NAME returned PAULA
;;   0: FIRST-NAME returned PAULA
;; PAULA

