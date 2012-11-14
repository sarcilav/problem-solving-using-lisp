(defun increment (A B)
  (loop for i in A
     append (loop for j in B
               collect (list i j))))

(defun C (lista n)
  (cond ((eql n 1) lista)
        (t (increment (C lista (1- n)) lista))))

(defun email-me (lista domain)
  (let ((s-domain (string-downcase (princ-to-string domain))))
    (labels ((pretty (ele)
               (remove-if (lambda (x) (or (eql x #\() (eql x #\)) (eql x #\space))) ele))
             (format-email (ele domain)
               (fresh-line)
               (princ (string-downcase (pretty (princ-to-string ele))))
               (princ #\@)
               (princ domain)))
      (loop for i in lista do
           (format-email i s-domain)))))

(defun range (a b)
  (loop for i from a to b
     collect i))

(defun gen-list ()
  (mapcar #'code-char (append (range (char-int #\a) (char-int #\z)) (range (char-int #\0) (char-int #\9)))))

(defun gen-mails (maxn domain)
  (let ((lista (gen-list)))
    (loop for i from 1 to maxn do
         (email-me (C lista i) domain))))

(defun mails->txt (fname thunk)
  (with-open-file (*standard-output*
                   fname
                   :direction :output
                   :if-exists :supersede)
    (funcall thunk)))

(defun init (fname maxn domain)
  (mails->txt fname (lambda () (gen-mails maxn domain))))