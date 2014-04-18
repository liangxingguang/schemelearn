#lang racket
(define x (make-vector 10))
(vector-length x)
(define f 
  (lambda(vec len)
         (cond ((= len (vector-length vec)))
               (else (begin (vector-set! vec len len) (set! len (+ len 1)) (f vec len))))))
(f x 0)
(define list-vector
  (lambda (vector lent)
    (cond ((= lent 10) )
          (else (begin (display (vector-ref vector lent)) (set! lent (+ lent 1)) (list-vector vector lent))))))
(list-vector x 0)
(vector-ref x 2)
x
(define xq (vector 'a 'b 'c 'l 'e ))
(vector-copy! xq 0 #(1 2 3))
(vector-copy! xq 0 xq 3 4)
xq
(define add2
  (lambda(x)
    (+ 4 x)))
(build-vector 3 add2)
(vector-fill! xq 5)
xq
(list->vector (list 1 2 3 4 5))
(define xq1 (vector->immutable-vector xq))
xq1
(vector? xq1)
(vector->list xq1)

;;this is a test to a vector in racket
;;(vector? ve) return #t if the vec is vector
(vector? '#(1 2 3 4))  ;;#t
(vector? 1) ;; #f
;;(make-vector size [v]) create a vector with the length of size
(define x1 (make-vector 10 2))
(vector? x1)
(display (cons "the length of vector is " (vector-length x1)))
(newline)
x1
;;(vector v ...) create a vector with the value of v1 v2 ....
(define x2 (vector 1 2 3 4 5 6 7))
(display "x2 is vector?")
(vector? x2)
(newline)
x2
;;create a vector which is immutable
(define x3 (vector-immutable 1 2 3 4 5))
;;(vector-set! x3 0 'a) wrong because x3 is not setable
;;(vector-ref vec pos) get the element in the position of vec
(vector-ref x2 3)
;;(vector-set! x2 pos v) set the value as v in the position of x2
(display "before set:")
x2
(newline)
(vector-set! x2 3 'a)
(display "after set:")
x2
;;(vector->list vec) transform a vector to a list and return it
(vector->list x2)
x2
;;(list->vector lst) transform a list to a vector and return it
(list->vector (list 1 23 4 56 7))
;;(vector->immutable-vector vec) transform a mutable vector to a immutable vecteo
(vector->immutable-vector x2)
;;(vector-fill! vec value) fill the vector vec with value
(vector-fill! x2 34) 
x2
;;(vector-copy! )
(define x4 (make-vector 10 'a))
(vector-copy! x4 3 x3 3 (vector-length x3))
x4
;;(vector-values vec [start-pos end-post]) display the value of vec from start-pos to end-post
(vector->values x4 0 (vector-length x4))
(define x5 (build-vector 3 add1))
(require racket/vector)
x2
(vector-set*! x2 3 3)
x2

(vector-map + #(1 2) #(3 4))
(vector-map! add1 #(1 2 3 4))
(vector-append #(1 2) #(3 4))
(vector-take x2 3)
(vector-take-right x2 3)
(vector-drop x2 3)
x2
(vector-drop-right x2 3)
(vector-split-at x2 3)
x2
(vector-split-at-right x2 4)
(vector-copy x2 2 4)
(define df (lambda(x) (> x 3)))
(vector-filter df #(1 2 3 4 5 6))
(vector-filter-not df #(1 2 3 4 5 6))
(vector-count df #(1 2 3 4 5))
(vector-argmin car #([3 pears] [1 bananan] [2 apple]))
(vector-argmax car #([3 pears] [1 bananan] [2 apple]))
(vector-member 2 (vector 1 2 3 4))
(vector-member 6 (vector 1 2 3 4))
(vector-memv 2 (vector 1 2 3 4))
(vector-memv 6 (vector 1 2 3 4))
(vector-memq 2 (vector 1 2 3 4))
(vector-memq 6 (vector 1 2 3 4))