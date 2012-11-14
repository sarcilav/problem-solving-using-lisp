(defun symbol-to-array (sym)
  (coerce (princ-to-string sym) 'list))

(defun count-char (char list)
  (count-if (lambda (x) (eq x char)) list))
 
(let ((list (symbol-to-array (read))))
  (princ (count-char #\A list))
  (princ #\space)
  (princ (count-char #\C list))
  (princ #\space)
  (princ (count-char #\G list))
  (princ #\space)
  (princ (count-char #\T list)))

