;; Exercise 5.28.  Modify the definition of the evaluator by changing eval-sequence as described in section 5.4.2 so
;; that the evaluator is no longer tail-recursive. Rerun your experiments from exercises 5.26 and 5.27 to demonstrate
;; that both versions of the factorial procedure now require space that grows linearly with their input.

  
  
  
                          total-pushes             maximum-depth 
 recursion             37n + 33                  3n + 14 
 iteration              34n - 16                    8n + 3 
  
  
