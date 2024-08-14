;2024-08-13
#lang sicp

; Does this work? Does the program's behavior change if we interchange the order of expressions in the amb? 
(define (parse-verb-phrase)
  (amb (parse-word verbs)
       (list 'verb-phrase
             (parse-verb-phrase)
             (parse-prepositional-phrase))))

;Original
(define (parse-verb-phrase)
  (define (maybe-extend verb-phrase)
    (amb verb-phrase
         (maybe-extend (list 'verb-phrase
                             verb-phrase
                             (parse-prepositional-phrase)))))
  (maybe-extend (parse-word verbs)))


;this wouldn't work because it would recursively call parse-verb-phrase even if there isn't another verb phrase to be parsed.  
