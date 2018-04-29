
;;; SESIÓN 05 - EJERCICIOS 01
;;; =========================
;;;               | F(0) = 1                  caso base
;;; Fibonacci     { F(1) = 1                  caso base
;;;               | F(n) = F(n-1) + F(n-2)    escalón recursivo

#lang racket

(define (fib n)
    (if (<= n 1) ; si n es 0 o 1
        1 ; devolvemos 1
        (+ (fib (- n 1)) (fib (- n 2))) ; si no devolvemos la suma de fib del anterior más los dos anteriores
    )
)

;;; Llamadas de prueba a las funciones
(and (display "(fib 0) = ") (displayln (fib 0)))
(and (display "(fib 1) = ") (displayln (fib 1)))
(and (display "(fib 2) = ") (displayln (fib 2)))
(and (display "(fib 3) = ") (displayln (fib 3)))
(and (display "(fib 4) = ") (displayln (fib 4)))
(and (display "(fib 5) = ") (displayln (fib 5)))
(and (display "(fib 6) = ") (displayln (fib 6)))