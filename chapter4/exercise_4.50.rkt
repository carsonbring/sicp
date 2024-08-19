;2024-08-17
#lang sicp
(define (delete! l index)
  (cond ((null? l) '())
        ((= index 0) (cdr l))
        (else (cons (car l)
                    (delete! (cdr l) (- index 1))))
      ))
(define (list-ref l index)
  (if (null? l)
      '()
      (if (= 0 index)
          (car l)
          (list-ref (cdr l) (- index 1))))
  )
(define (shuffle-procs procs)
  (if (null? procs) '()
      (let* ((random-index (random (length procs)) )
             (random-proc (list-ref procs random-index))
             (new-procs (delete! procs random-index)))
        (cons random-proc
              (shuffle-procs (new-procs)))))
  )


(define (analyze-ramb exp)
  (let ((cprocs (map analyze (amb-choices exp))))
    (lambda (env succeed fail)
      (let ((shuffled-procs (shuffle-procs cprocs)))
        (define (try-next choices)
        (if (null? choices)
            (fail)
            ((car choices) env
                           succeed
                           (lambda ()
                             (try-next (cdr choices))))))
      (try-next shuffled-procs))
      )))
