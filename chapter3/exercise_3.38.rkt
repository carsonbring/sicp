; 2024-07-21
#lang sicp

;Suppose that Peter, Paul, and Mary share a joint bank account that initially contains $100. Concurrently, Peter deposits $10, Paul withdraws $20, and Mary withdraws half the money in the account, by executing the following commands:
;; Peter: 	(set! balance (+ balance 10))
;; Paul: 	(set! balance (- balance 20))
;; Mary: 	(set! balance (- balance (/ balance 2)))

;List all the different possible values for balance after these three transactions have been completed, assuming that the banking system forces the three processes to run sequentially in some order.

;45, 35, 50, 40

