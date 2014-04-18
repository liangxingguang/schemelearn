#lang racket
(define-syntax nil!
  (syntax-rules()
    [(_ x)
     (set! x '())]
    [(_ x y)
     (begin (set! x "") (set! y ""))]))
(define x 10)
(define y 4)
x y
(nil! x y)
x y
(define-syntax when
  (syntax-rules()
    [(_ pred b1 ...)
     (if pred
         (begin b1 ...)
         (display ""))]))
(when 0 (+ 1 2) (- 2 1))
(let ([ i 0])
  (when (= i 0)
    (display "i == 0")
    (newline)))

(define-syntax while
  (syntax-rules()
    [(_ pred b1 ...)
     (let loop ()(when pred b1 ... (loop)))]))
(define-syntax for
  (syntax-rules()
                [(_ (i from to) b1 ...)
                 (let loop ([i from])
                   (when (< i to)
                     b1 ...
                     (loop (+ i 1))))]))

(let ([i 0])
  (while (< i 10)
         (display i)
         (display #\Space)
         (set! i (+ i 1))))
(newline)
(for (i 0 10)
  (display i)
  (display #\Space))

(define-syntax incf
  (syntax-rules()
    [(_ x)
     (begin (set! x (+ x 1)) x)]
    [(_ x i) (begin (set! x (+ x i)) x)]))
;;test the incf
(let ([i 0]
      [j 0])
  (incf i)
  (incf j 3)
  (display (list 'i '= i))
  (newline)
  (display (list 'j '= j)))

(define-syntax my-and
  (syntax-rules()
    [(_) #t]
    [(_ e) e]
    [(_ e1 e2 ...)
     (if e1
         (my-and e2 ...)
         #f)]))
(define-syntax my-or
  (syntax-rules()
    [(_) #f]
    [(_ e) e]
    [(_ e1 e2 ...)
     (let ([t e1])
       (if t t (my-or e2 ...)))]))