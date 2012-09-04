(defun sentence () (append (noun-phrase) (verb-phrase)))

(defun verb-phrase () (append (Verb) (noun-phrase)))
(defun Article () (one-of '(a the)))
(defun Noun () (one-of '(plane man table ball)))
(defun Verb () (one-of '(fly hit sit took)))

(defun noun-phrase ()
  (append (Article) (Adj*) (Noun) (PP*)))

(defun Adj* ()
  (if (random-element '(t nil))
      (append (Adj) (Adj*))
      nil))

(defun Adj ()
  (one-of '(big little blue green)))

(defun PP* ()
  (if (random-element '(t nil))
      (append (PP) (PP*))
      nil))

(defun PP ()
  (append (Prep) (noun-phrase)))

(defun Prep ()
  (one-of '(to in by with on)))

(defun random-element (options)
  (elt options (random (length options))))

(defun one-of (options)
  "get a random-element and put it in a list"
  (list (random-element options)))


