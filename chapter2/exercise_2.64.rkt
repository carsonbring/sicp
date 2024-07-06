;; 2024-07-04
;; list->tree works by calling partial-tree which returns the tree as the first element and the rest of the elements not included as the rest of the list
;; partial-tree works by taking the elements as first parameter and the length of the element list as a second parameter
;; partial-tree creates the tree by getting the middle value as this-entry, the left tree from calling partial-tree with the list of elements along with the size of the left half and the right tree by calling the partial tree method with the the right elements and the right size. This approach utilizes recursion and has O(n) time complexity.

#lang sicp


(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  (right-result (partial-tree (cdr non-left-elts)
                                              right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts (cdr right-result)))
                (cons (make-tree this-entry left-tree right-tree)
                      remaining-elts))))))))

