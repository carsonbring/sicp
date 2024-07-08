;; 2024-07-07
#lang sicp

(define (make-leaf symbol weight)
  (list 'leaf symbol weight))
(define (leaf? object)
  (eq? (car object) 'leaf))
(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))
(define (symbols tree)
  
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))
(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits)
        '()
        (let ((next-branch
               (choose-branch (car bits) current-branch)))
          (if (leaf? next-branch)
              (cons (symbol-leaf next-branch)
                    (decode-1 (cdr bits) tree))
              (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))

(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
        ((= bit 1) (right-branch branch))
        (else (error "bad bit -- CHOOSE-BRANCH" bit))))

(define (encode-symbol symbol tree)
  (define (traversal sub-tree bits)
    (cond ((or (null? sub-tree) (and (leaf? sub-tree) (not (eq? (symbol-leaf sub-tree) symbol)))) '())
          ((and (leaf? sub-tree) (eq? (symbol-leaf sub-tree) symbol)) bits)
          (else (append (traversal (left-branch sub-tree) (append bits (list 0))) (traversal (right-branch sub-tree) (append bits (list 1))))))
    )
  (let ((answer (traversal tree '())))
    (if (null? answer) (error "SYMBOL NOT FOUND IN LIST") answer)
    )
  )
(define (encode message tree)
  (if (null? message) '() (append (encode-symbol (car message) tree)
                                  (encode (cdr message) tree))))
(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))
(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf (car pair)    ; symbol
                               (cadr pair))  ; frequency
                    (make-leaf-set (cdr pairs))))))

(define (successive-merge leaf-set) 
  (if (= (length leaf-set) 1) 
      (car leaf-set) 
      (let ((first (car leaf-set)) 
            (second (cadr leaf-set)) 
            (rest (cddr leaf-set))) 
        (successive-merge (adjoin-set (make-code-tree first second) 
                                      rest))))) 
(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                   (make-leaf 'B 2)
                   (make-code-tree (make-leaf 'D 1)
                                   (make-leaf 'C 1)))))
(let ((alphabet '((A 2) (BOOM 1) (GET 2) (JOB 2) (NA 16) (SHA 3) (YIP 9) (WAH 1))))
  (display (encode '(GET A JOB SHA NA NA NA NA NA NA NA NA GET A JOB SHA NA NA NA NA NA NA NA NA WAH YIP YIP YIP YIP YIP YIP YIP YIP YIP SHA BOOM) (generate-huffman-tree alphabet))))



