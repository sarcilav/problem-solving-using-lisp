(defun count-anywhere (item tree)
  "Function that counts the number of times an expression occurs anywhere within another expression."
  (cond ((equal item tree) 1)
        ((atom tree) 0)
        (t (+ (count-anywhere item (first tree))
              (count-anywhere item (rest tree))))))


