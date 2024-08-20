;2024-08-19
#lang sicp

; Devise a way to install a loop detector in the query system so as to avoid the kinds of simple loops illustrated in the text and in exercise 4.64. The general idea is that the system should maintain some sort of history of its current chain of deductions and should not begin processing a query that it is already working on. Describe what kind of information (patterns and frames) is included in this history, and how the check should be made. (After you study the details of the query-system implementation in section 4.4.4, you may want to modify the system to include your loop detector.)

;To install a loop detector, it would be important to check to make sure the same queries aren't being made repeatively over and over again. It wouldn't be enough to just check to make sure that a query didn't happen again in the qeval, we would have to see a pattern of alternation. To capture this alternation, recording repeating patterns would be a must. To break free, we would have to return a frame that satisfies one of these alternating queries and make sure not to unify again with a rule causing the alternation.


