; 2024-07-09
#lang sicp

(define (make-table)
  (let ((local-table (list '*table*)))
    (define (lookup key-1 key-2)
      (let ((subtable (assoc key-1 (cdr local-table))))
        (if subtable
            (let ((record (assoc key-2 (cdr subtable))))
              (if record
                  (cdr record)
                  false))
            false)))
    (define (insert! key-1 key-2 value)
      (let ((subtable (assoc key-1 (cdr local-table))))
        (if subtable
            (let ((record (assoc key-2 (cdr subtable))))
              (if record
                  (set-cdr! record value)
                  (set-cdr! subtable
                            (cons (cons key-2 value)
                                  (cdr subtable)))))
            (set-cdr! local-table
                      (cons (list key-1
                                  (cons key-2 value))
                            (cdr local-table)))))
      'ok)    
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            (else (error "Unknown operation -- TABLE" m))))
    dispatch))

(define operation-table (make-table))
(define get (operation-table 'lookup-proc))
(define put (operation-table 'insert-proc!))

; a. Implement for headquarters a get-record procedure that retrieves a specified employee's record from a specified personnel file. The procedure should be applicable to any division's file. Explain how the individual divisions' files should be structured. In particular, what type information must be supplied?

(define (get-record employee-name personnel-file)
  ((get 'get-record personnel-file) employee-name))

;Each of the files should have their own version of get-record selector implemented It should select on the employee name to fine the record in the file


;b.  Implement for headquarters a get-salary procedure that returns the salary information from a given employee's record from any division's personnel file. How should the record be structured in order to make this operation work?
(define (get-salary employee-name personnel-file)
  ((get 'get-salary personnel-file) employee-name))
; This procedure works the same as the previous but instead of retrieving the whole record, each divison would have to implement a selector for salary which would be able to retreive the salary from a record.

;c.  Implement for headquarters a find-employee-record procedure. This should search all the divisions' files for the record of a given employee and return the record. Assume that this procedure takes as arguments an employee's name and a list of all the divisions' files.

(define (find-employee-record name div-file-list)
  (let ((employee ((get 'get-record (car div-file-list)) name)))
      (cond ((not (null? employee)) employee )
            ((null? div-file-list) (error "Employee not found"))
            (else (find-employee-record name (cdr div-file-list))))))

; d When Insatiable takes over a new company, what changes must be made in order to incorporate the new personnel information into the central system?

; All they have to do is create their own division package that implements each of the already existing generic procedures so that they are able to access their division file seamlessly. 
