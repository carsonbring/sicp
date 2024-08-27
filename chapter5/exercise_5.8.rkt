;2024-08-26
#lang sicp

; The following register-machine code is ambiguous, because the label here is defined more than
once: 

start
  (goto (label here))
here
  (assign a (const 3))
  (goto (label there))
here
  (assign a (const 4))
  (goto (label there))
there

;; With the simulator as written, what will the contents of register a be when control reaches there? Modify the
;; extract-labels procedure so that the assembler will signal an error if the same label name is used to indicate two
;; different locations.

;IN TEXT IMPLEMENTATIONS
(define (make-label-entry label-name insts)
  (cons label-name insts))

;Entries will be looked up in the table with 

(define (lookup-label labels label-name)
  (let ((val (assoc label-name labels)))
    (if val
        (cdr val)
        (error "Undefined label -- ASSEMBLE" label-name))))
;It would be dependent on how assoc is initialized because it will return the cdr of val to the executed. Going based off of assoc from previous chapters, it would be assigned to 3.

;;New helper method
(define (label-exists? label-name labels
         (assoc label-names labels)))
;new implementation of extract-labels
(define (extract-labels text receive)
  (if (null? text)
      (receive '() '())
      (extract-labels (cdr text)
       (lambda (insts labels)
         (let ((next-inst (car text)))
           (if (symbol? next-inst)
               (if (label-exists? next-inst labels)
                   (error "Same Label is entered twice")
                   (receive insts
                   (cons (make-label-entry next-inst
                                           insts)
                         labels)))
               
               (receive (cons (make-instruction next-inst)
                              insts)
                        labels)))))))
