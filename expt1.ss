(define expt1
  (lambda(x y)
    (if (< y 0)
        'error
        (if (= y 0)
            1
            (if (= y 1)
                x
                (* x (expt1 x (- y 1)))
             )
         )
      )
    )
  )
(expt1 2 0.1)