(defun sentence () (append (noun-phrase) (verb-phrase)))
(defun noun-phrase () (append (Article) (Noun)))
(defun verb-phrase () (append (Verb) (noun-phrase)))
(defun Article () (one-of '(a the)))
(defun Noun () (one-of '(plane man table ball)))
(defun Verb () (one-of '(fly hit sit took)))

(defun one-of (options)
  "get a random-element and put it in a list"
  (list (random-element options)))

(defun random-element (options)
  (elt options (random (length options))))
;; (random (length options)) generates a random number between
;; 0 and length of option non inclusive
;; elt gets an element from sequence

;; CL-USER> (sentence)
;; (A TABLE HIT A BALL)
;; CL-USER> (sentence)
;; (THE MAN SIT THE BALL)
;; CL-USER> (sentence)
;; (THE PLANE SIT THE PLANE)
;; CL-USER> (sentence)
;; (THE PLANE HIT A MAN)
;; CL-USER> (sentence)
;; (THE BALL TOOK A TABLE)
;; CL-USER> (sentence)
;; (A MAN FLY THE PLANE)

