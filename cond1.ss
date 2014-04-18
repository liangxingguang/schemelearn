#lang racket
(define income-tax
  (lambda (income)
    (cond
      [(<= income 10000) (* income .005)]
      [(<= income 20000) (+ (* (- income 10000) .08) 500.00)]
      [(<= income 30000) (+ (* (- income 20000) .13) 1300.00)]
      [else (+ (* (- income 30000) .21) 2600.00)])))
(define myatom?
  (lambda (n)
    (cond
      [(pair? n) #f]
      [else #t])))
(myatom? '2)
(define shorter
  (lambda (list1 list2)
    (cond
      [(and (list? list1) (list? list2))
       (cond
         [(<= (length list1) (length list2)) list1]
         [else list2])]
      [else "not a list"])))
(shorter '(1 2 3) '(1 2 3 4))
(shorter 'a '(1 2 3))
(shorter '(3 2) '(1 2))
(shorter '(1 2 3 4) '(1 2))