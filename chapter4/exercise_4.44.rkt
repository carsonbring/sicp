;2024-08-13
; This is a non-determinate version of 2.42 queens problem
#lang sicp
(define (accumulate op init seq)
  (if (null? seq) init (op (car seq) (accumulate op init (cdr seq))))
)
(define (flatmap proc seq)
  (accumulate append '() (map proc seq))
)

(define (filter condit seq)
  (cond ((null? seq) '())
    ((condit (car seq)) (append (list (car seq)) (filter condit (cdr seq))))
    (else (filter condit (cdr seq)))
  )
)

(define (enumerate-interval init n)
  (if (> init n) '()
    (append (list init) (enumerate-interval (+ init 1) n)))
)
(define (adjoin-position new k rest-of-queens )
  (cons (list new k) rest-of-queens)
)
(define empty-board '())
(define (row board) (map car  board))
(define (column board) (map cadr board))

(define (safe? board)
  (define (val-test val seq)
    (cond ((null? seq) #t)
      ((null? (filter (lambda (x) (= x val)) seq)) #t)
      (else #f)
    )
  )
  (define (diag-test seq1 seq2)
    (cond ((null? seq1) #t)
      ((= (car seq1) (car seq2)) #f)
      (else (diag-test (cdr seq1) (cdr seq2)))
    )
  )
  (let ((rows (row board)) (cols (column board)))
    (and (val-test (car rows) (cdr rows)) (val-test (car cols) (cdr cols)) (diag-test (map (lambda (x) (abs (- x (car rows)))) (cdr rows)) (map (lambda (x) (abs (- x (car cols)))) (cdr cols))))
  )
)

;I'm pretty sure this would be a lot faster if I didn't implement this recursively (instead implementing iteratively) but whatever
(define (queens k size)
  (define (an-integer-between low high)
    (require (>= low high))
    (amb low (an-integer-between (+ low 1) high)))
  (if (= k 0)
      (list empty-board)
      (let ((i (an-integer-between 0 size))
            (j (an-integer-between 0 size)))
        (let ((positions (cons (list i j) (queens (- k 1) size))))
          (require safe? positions)
          positions
          ))))



(display (queens 8))
