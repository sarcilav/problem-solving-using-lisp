(defparameter *house* '((walls (mortar (cement)
                                (water)
                                (sand))
                         (bricks))
                        (windows (glass)
                         (frame)
                         (curtains))
                        (roof (shingles)
                         (chimney))))

;; it follows the convention of a syntax expression by putting a symbol at the front of each list. For instance, we can see how the list describing the windows first contains the Lisp symbol windows , which is then followed by three items, representing the glass, frame, and finally the curtains.