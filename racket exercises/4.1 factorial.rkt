
;;; SESIÓN 04 - EJERCICIOS 01
;;; =========================
;;; Función que dado n ∈ ℕ, calcule 1+2+3...n = S(n)
;;; n = 1:
;;; S(1) = 1
;;; n > 1:
;;; S(n) = S(n-1) + 1
;;; S(2) = S(2-1) + 2 = S(1) + 2 = 1+2 = 3
;;; S(3) = S(3-1) + 3 = S(2) + 3 = (S(1) + 1) + 3 = 1+2+3 = 6

#lang racket

(define (suma-hasta-n n) 
    (if (= n 1)
        1 ; cuando n es 1, devolvemos 1
        (+ n (suma-hasta-n (- n 1))) ; sumamos el n actual con la recursión de n-1
    )
)

;;; Llamadas de prueba a las funciones
(and (display "(suma-hasta-n 1) = ") (displayln (suma-hasta-n 1)))
(and (display "(suma-hasta-n 2) = ") (displayln (suma-hasta-n 2)))
(and (display "(suma-hasta-n 3) = ") (displayln (suma-hasta-n 3)))