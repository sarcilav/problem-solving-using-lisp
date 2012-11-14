(defun symbol-to-array (sym)
  (coerce (princ-to-string sym) 'list))

(defun rna-translation (list)
  (let ((pt (position #\T list)))
    (when pt
      (setf (nth pt list) #\U))
    (if pt
        (rna-translation list)
        list)))
        
(print (coerce (rna-translation (symbol-to-array (read))) 'string))
