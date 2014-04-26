#lang racket
(define atom?
  (lambda (x)
    (and (not (pair? x)) 
         (not (null? x)))))
;;;;;;;;;;
(define lat?
  (lambda(l)
    (cond
      ((null? l) #t)
      ((atom? (car l)) (lat? (cdr l)))
      (else #f))))
;;test the function
(lat? (list 'a 'b 'c))
(lat? '((a b) c d))

;;;;;;;;;;;;;;;;;;;;;;;;;

(define member?
  (lambda (a lat)
    (cond
      ((null? lat) #f)
      (else (or (eq? (car lat) a)
                (member? a (cdr lat)))))))
(member? 'meat '(meat abc def dkg))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define rember
  (lambda (a lat)
    (cond
      ((null? lat) (quote ()))
      (else
       (cond
         ((eq? (car lat) a) (cdr lat))
         (else
          (cons (car lat)
                (rember a (cdr lat)))))))))
(rember 'a '(a b c d a d))

;;simplify from rember
(define rember_s
  (lambda (a lat)
    (cond
      ((null? lat) (quote ()))
      ((eq? (car lat) a) (cdr lat))
      (else
       (cons (car lat) 
             (rember a (cdr lat)))))))
(rember_s 'a '(a b c d a d))

;;;;;;;;;;;;;;;;;;;
(define firsts
  (lambda (l)
    (cond
      ((null? l) '())
      (else
       (cons (car (car l))
             (firsts (cdr l)))))))
(firsts '((a b) (c d) (e f)))

(define firsts*
  (lambda (l)
    (cond
      ((null? l) '())
      (else
       (cond
         ((atom? (car l)) (cons (car l) (firsts* (cdr l))))
         (else
          (cons (car (car l)) (firsts* (cdr l)))))))))
(firsts* '(((g a) b) (c d) (e f) a))
(define firsts**
  (lambda (l)
    (define getthefirst
    (lambda(n)
      (cond
        ((null? n) '())
        ((atom? (car n)) (car n))
        (else
         (getthefirst (car n)))
      )))
    (cond
      ((null? l) '())
      ((atom? (car l)) (cons (car l) (firsts** ( cdr l))))
      (else
       (cons (getthefirst (car l)) (firsts** (cdr l)))))))

(firsts** '(((((g d) d) a) b) (c d) (e f) a))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define replace
  (lambda (new old lat)
    (cond
      ((null? lat) (quote ()))
      (else
       (cond
         ((eq? (car lat) old)
          (cons new (cdr lat)))
         (else
          (cons (car lat)
                (replace new old (cdr lat)))))))))
(replace 'ab 'd '(a b c d e f))
(define replace*
  (lambda (new old lat)
    (cond
      ((null? lat) (quote ()))
      ((eq? (car lat) old)
       (cons new (replace* new old (cdr lat))))
      (else
       (cons (car lat) (replace* new old (cdr lat)))))))
(replace* 'ab 'd '(a b c d e f))
(replace* 'ab 'd '(a b c d e d f d g))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define insertR
  (lambda (new old lat)
    (cond
      ((null? lat) (quote ()))
      ((eq? (car lat) old)
       (cons old (cons new (cdr lat))))
      (else
       (cons (car lat) (insertR new old (cdr lat)))))))
(insertR 'ab 'b '(a b c d b e))
(define insertL
  (lambda (new old lat)
    (cond
      ((null? lat) (quote ()))
      ((eq? old (car lat)) (cons new (cons old (cdr lat))))
      (else
       (cons (car lat) (insertL new old (cdr lat)))))))
(insertL 'ab 'd '(a b c d b e))
(define insertR* 
  (lambda (new old lat)
    (cond
      ((null? lat) (quote ()))
      (else
       (cond
         ((eq? old (car lat))
          (cons old (cons new (insertR* new old (cdr lat)))))
         (else
          (cons (car lat) (insertR* new old (cdr lat)))))))))
(insertR* 'ab 'b '(a b c d b e))
(define insertL*
  (lambda (new old lat)
    (cond
      ((null? lat) (quote ()))
      (else
       (cond
         ((eq? old (car lat))
          (cons new (cons old (insertL* new old (cdr lat)))))
         (else
          (cons (car lat) (insertL* new old (cdr lat)))))))))
(insertL* 'ab 'b '(a b c d b e))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define subst2
  (lambda (new o1 o2 lat)
    (cond
      ((null? lat) (quote ()))
      (else
       (cond
         ((or (eq? (car lat) o1) (eq? (car lat) o2))
          (cons new (cdr lat)))
         (else
          (cons (car lat)
                (subst2 new o1 o2 (cdr lat)))))))))
(subst2 'vanilla 'with 'banana 
        '(banana ice cream with chocolate topping))

(define subst2*
  (lambda (new o1 o2 lat)
    (cond
      ((null? lat) (quote ()))
      (else
       (cond
         ((or (eq? (car lat) o1) (eq? (car lat) o2))
          (cons new (subst2* new o1 o2 (cdr lat))))
         (else
          (cons (car lat) (subst2* new o1 o2 (cdr lat)))))))))
(subst2* 'vanilla 'with 'banana 
        '(banana ice cream with chocolate topping))
