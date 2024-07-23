;2024-07-22
#lang sicp

;Consider the problem of transferring an amount from one account to another. Ben Bitdiddle claims that this can be accomplished with the following procedure, even if there are multiple people concurrently transferring money among multiple accounts, using any account mechanism that serializes deposit and withdrawal transactions, for example, the version of make-account in the text above.

(define (transfer from-account to-account amount)
  ((from-account 'withdraw) amount)
  ((to-account 'deposit) amount))

;Louis Reasoner claims that there is a problem here, and that we need to use a more sophisticated method, such as the one required for dealing with the exchange problem. Is Louis right? If not, what is the essential difference between the transfer problem and the exchange problem? (You should assume that the balance in from-account is at least amount.)

;There isn't a problem here and this would work just fine because the difference between the exchange problem and this problem is that the amount being transferred is a constant amount. If there is not enough money to withdrawl, the program will error before it reaches the deposit. The exchange account also has to check the balance multiple times thorughout the execution and that might change mid execution, that problem simply does not occur here. This is simply due to the fact that it is safe to assume that the balance in from-account is at least ammount. There is no need for the accounts to be idle when the transfer process starts, it can happen at the same time as any withdrawl or deposite process.
