;2024-07-22
#lang sicp

;Give a scenario where the deadlock-avoidance mechanism described above does not work. (Hint: In the exchange problem, each process knows in advance which accounts it will need to get access to. Consider a situation where a process must get access to some shared resources before it can know which additional shared resources it will require.)

;;If the process doesn't know all of the locks it will need before doing the first lock, it cannot enforce the ordering. 
