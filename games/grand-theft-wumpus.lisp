(load "grapher/graph-util")

(defparameter *congestion-city-nodes* nil)
(defparameter *congestion-city-edges* nil)
(defparameter *visited-nodes* nil)
(defparameter *node-num* 30)
(defparameter *edge-num* 45)
(defparameter *worm-num* 3)
(defparameter *cop-oddss* 15)

(defun random-node ()
  (1+ (random *node-num*)))

(defun edge-pair (u v)
  (unless (eql u v)
    (list (cons u v) (cons v u)))) ;; returns a list of 2 pairs

(defun make-edge-list ()
  (apply #'append (loop repeat *edge-num* ;; it is edge-num times
                     collect (edge-pair (random-node) (random-node))))) ;; collect?

;; loop/repeat/collect
;; (loop for n from 1 to 10
;;    collect (+ 100 n)) => (101 102 103 104 105 106 107 108 109 110)

(defun direct-edges (node edge-list)
  (remove-if-not (lambda (edge)
                   (eql node (car edge)))
                 edge-list))


(defun get-connected (node edge-list)
  (let ((visited nil))
    (labels ((traverse (node)
               (unless (member node visited)
                 (push node visited)
                 (mapc (lambda (edge)
                         (traverse (cdr edge)))
                       (direct-edges node edge-list)))))
      (traverse node))
    visited))

(defun find-islands (nodes edge-list)
  (let ((islands nil))
    (labels ((find-island (nodes)
               (let* ((connected (get-connected (car nodes) edge-list))
                      (unconnected (set-difference nodes connected)))
                 (push connected islands)
                 (when unconnected
                   (find-island unconnected)))))
      (find-island nodes))
    islands))

(defun connect-with-bridges (islands)
  (when (cdr islands)
    (append (edge-pair (caar islands) (caard islands))
            (connect-with-bridges (cdr islands)))))

(defun connect-all-islands (nodes edge-list)
  (append (connect-with-bridges (find-islands nodes edge-list)) edge-list))

