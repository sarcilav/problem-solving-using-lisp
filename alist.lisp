(defparameter *drink-order* '((bill . double-expresso)
                             (lisa . small-drip-coffee)
                             (john . medium-latte)))
(assoc 'lisa *drink-order*) ;; => (LISA . SMALL-DRIP-COFFEE)
(push '(lisa . large-mocha-with-whipped-cream) *drink-order*) ;; =>
;; ((LISA . LARGE-MOCHA-WITH-WHIPPED-CREAM)
;;  (BILL . DOUBLE-EXPRESSO)
;;  (LISA . SMALL-DRIP-COFFEE)
;;  (JOHN . MEDIUM-LATTE))
;; assoc will only show the first occurrence
(assoc 'lisa *drink-oder*) ;; => (LISA . LARGE-MOCHA-WITH-WHIPPED-CREAM)
