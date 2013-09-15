; The following iterative sequence is defined for the set of positive integers:
; n → n/2 (n is even)
; n → 3n + 1 (n is odd)
; Using the rule above and starting with 13, we generate the following sequence:
; 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
; It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
; Which starting number, under one million, produces the longest chain?
; NOTE: Once the chain starts the terms are allowed to go above one million.

(defun next (n)
  (if (= (mod n 2) 0)
    (/ n 2)
    (+ 1 (* n 3))))

(defvar max)
(setf max 0)

(defvar maxstart)
(setf maxstart 0)

(defvar count)

(loop for i from 1 to 1000000 do
  (setf count 1)

  (loop with x = i do
    (if (= x 1) (return))
    (setf count (+ count 1))
    (setf x (next x)))
  
  (if (> count max)
    (progn
      (setf max count)
      (setf maxstart i))))

(print maxstart)
