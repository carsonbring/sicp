;; 2024-07-06
;;Output is the same as the input from 2.67. (0 1 1 0 0 1 0 1 0 1 1 1 0)
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

(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                   (make-leaf 'B 2)
                   (make-code-tree (make-leaf 'D 1)
                                   (make-leaf 'C 1)))))
(display (encode '(A D A B B C A) sample-tree))
