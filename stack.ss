#lang racket
;;
;; A stack implementation
;;

(define (make-stack)
  (define stack '())
  (define (empty?) (null? stack))
  (define (top)
    (if (null? stack)
        (error "Stack is empty -- Top" 
               stack)
        (car stack)))
  (define (push! object)
    (set! stack (cons object stack))
    object)
  (define (pop!)
    (if (null? stack)
        (error "Stack underflow -- POP!" stack)
        (let ((object (car stack)))
          (set! stack (cdr stack))
          object)))
  (define (dispatch  op . args)
    (case op
      ((empty?) (apply empty? args))
      ((top) (apply top args))
      ((push!) (apply push! args))
      ((pop!) (apply pop! args))
      (else
       (error "Unknown stack operation -- DISPATCH" op))))
  dispatch
  )

(define p1 (make-stack))
(p1 'empty?)
(p1 'push! 'a)
(p1 'push! 'b)
(p1 'push! 'c)
(p1 'pop!)
(p1 'top)

;;a simple example for  object-oriented programming in scheme

(define (make-point-2D x y)
  (define (get-x) x)
  (define (get-y) y)
  (define (set-x! new-x) (set! x new-x))
  (define (set-y! new-y) (set! y new-y))
  (lambda (selector . args)
    (case selector
      ((get-x) (apply get-x args))
      ((get-y) (apply get-y args))
      ((set-x!) (apply set-x! args))
      ((set-y!) (apply set-y! args))
      (else
       (error "don't understand" selector))))
  )
(define p2 (make-point-2D 10 20))
(p2 'get-x)
(p2 'get-y)
(p2 'set-x! 45)
(p2 'set-y! 50)
(list (p2 'get-x) (p2 'get-y))


;;;;;;;;;;;;;;;;;;;;;;;
(define (make-point-3D x y z)
  (let ((parent (make-point-2D x y)))
    (define (get-z) z)
    (define (set-z! new-z) (set! z new-z))
    (lambda (selector . args)
      (case selector
        ((get-z) (apply get-z args))
        ((set-z!) (apply set-z! args))
        (else (apply parent (cons selector args)))))))
(define p3 (make-point-3D 3 4 5))
(display "-------------\n")
(p3 'get-z)
(p3 'set-z! 46)
(p3 'get-z)
(p3 'get-x)
(p3 'get-y)


;;;;;;;;;;;;;
(define (make-stack1)
  (cons '() 0))

;;check the stack is emptied
(define (empty-stack? stack)
  (= (cdr stack) 0))

;;get the top element of the stack
(define (top-stack1 stack)
  (if (empty-stack? stack)
      (display "No element!")
      (caar stack)))
;;push a element into the stack
(define (push-stack! stack item)
  (let ((new-item (cons item (car stack))))
    (set-car! stack new-item)
    (set-cdr! stack (+ (cdr stack) 1))))
(define (set-car! lat new)
   (cons new (cdr lat)))
(define (set-cdr! lat new)
   (cons (car lat) new))
;;pop out a element of the stack
(define (pop-stack! stack)
  (if (empty-stack? stack)
      (display "No element！")
      (let ((item (top-stack1 stack)))
        (set-car! stack (cdar stack))
        (set-cdr! stack (- (cdr stack) 1))
        item)))
(define stack (make-stack1))
(display "!!!!!!!!!!!!!\n")
(empty-stack? stack)
(push-stack! stack 'a)
(push-stack! stack 'b)
(top-stack1 stack)
stack
(pop-stack! stack)
stack
(set-car! )