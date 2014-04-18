#lang racket
;; fahrenheit->celsius : number -> number
;; computes the celsius equivalent of t

;; EXAMPLES
;; 32 degrees fahrenheit is 0 degrees celsius
;; 212 degrees fahrenheit is 100 degrees celsius
;; -40 degrees fahrenheit is -40 degrees celsuis

(define (fahrenheit->celsius t)
  (* 5/9 (- t 32)))

;; EXAMPLES TURNED INTO TESTS
(fahrenheit->celsius 32) "should be" 0
(fahrenheit->celsius 212) "should be" 100
(fahrenheit->celsius -40) "should be" -40

(define-struct movie (title producer))
(movie-title (make-movie 'ThePhantomMenace 'Lucas)) 
;"should be" 'ThePhantomMenace
(movie-producer (make-movie 'TheEmpireStrikesBack 'Lucas))
;"should be" 'Lucas

; for any values x and y,
; (movie-title (make-movie x y)) = x
; for any values x and y,
; (movie-producer (make-movie x y)) = y

;; A jet-fighter is a structure:
;;  (make-jet-fighter symbol number number number)
(define-struct jet-fighter (designation acceleration top-speed range))

;; within-range : jet-fighter number -> boolean
;; to determine if jf can go distance d
(define (within-range jf d)
  (<= d (jet-fighter-range jf)))

;; EXAMPLES
(within-range (make-jet-fighter 'f22 4 1000 600) 400)
"should be" true
(within-range (make-jet-fighter 'mig22 10 800 300) 400)
"should be" false

;; reduce-range : jet-fighter -> jet-fighter
;; to return a jet-fighter whose range is 80% of jf's.
(define (reduce-range jf)
  (make-jet-fighter
   (jet-fighter-designation jf)
   (jet-fighter-acceleration jf)
   (jet-fighter-top-speed jf)
   (* .8 (jet-fighter-range jf))))

;; EXAMPLE
(reduce-range
 (make-jet-fighter 'f22 4 1000 600))
"should be"
(make-jet-fighter 'f22 4 1000 480)