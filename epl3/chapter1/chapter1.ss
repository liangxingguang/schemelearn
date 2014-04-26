#lang racket

;;the list-length return the length of a list
(define list-length
  (lambda (lst)
    (if (null? lst) 0
        (+ 1 (list-length (cdr lst))))))
;; test the list-length function
(list-length '(a b c))

;;
(define nth-element
  (lambda (lst n)
    (if (null? lst)
        (report-list-too-short n)
        (if (zero? n)
            (car lst)
            (nth-element (cdr lst) (- n 1))))))
(define report-list-too-short
  (lambda (n)
    (error 'nth-element
           "List too short by ~s elements.~%" (+ n 1))))
;;test the function nth-element

(nth-element '(a b c) 2)