(defparameter *simple-grammar*
  '((sentence -> (noun-phrase verb-phrase))
    (noun-phrase -> (Article Noun))
    (verb-phrase -> (Verb noun-phrase))
    (Article -> the a)
    (Noun -> man woman table ball)
    (Verb -> hit took saw liked))
  "A grammar for a trivial subset of English.")

(defvar *grammar* *simple-grammar*)

(assoc 'noun *simple-grammar*) ; -> (NOUN -> MAN WOMAN TABLE BALL)

(defun rule-lh (rule)
  (first rule))

(defun rule-rh (rule)
  (rest (rest rule))) ;; avoid the ->

(defun rewrites (category)
  (rule-rh (assoc category *grammar*)))