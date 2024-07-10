; 2024-07-09
#lang sicp

;;Q: As a large system with generic operations evolves, new types of data objects or new operations may be needed. For each of the three strategies -- generic operations with explicit dispatch, data-directed style, and message-passing-style -- describe the changes that must be made to a system in order to add new types or new operations. Which organization would be most appropriate for a system in which new types must often be added? Which would be most appropriate for a system in which new operations must often be added?

;; Explicit Dispatch
; For explicit dispatch if we want to create a new type, we have to add a check in each of the generic procedures for the new data type FOR EVERY PROCEDURE, and to create a new operation, we would have to create a new procedure for the added type and add it to the generic implementation. 

;; Data-directed style
; Adding a new type to this style proves to be easy due to the fact that you would just have to implement a new package and make sure to include a constructor and all operations for the generic procedure. Adding new operations mean that you would have to jump to each of the different packages to add the new operation

;;Message-Passing style
; Message passing style has the same benefits of the data-directed approach due to the operations being contained in the constructor. 
