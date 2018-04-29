
;;; SESIÓN 05 - EJERCICIOS 02
;;; =========================
;;; Dado un numero entero, función que calcule la suma de sus cifras.

#lang racket

(define (sumacifras n)
    (if (= 0 (quotient n 10)) ; si n es más pequeño que 10
        n ; devolvemos n
        (+ (remainder n 10) (sumacifras (quotient n 10))) ; si no sumamos el resto con la función recursiva del cociente
    )
)

;;; Llamadas de prueba a las funciones
(and (display "(sumacifras 6) = ") (displayln (sumacifras 6)))
(and (display "(sumacifras 66) = ") (displayln (sumacifras 66)))
(and (display "(sumacifras 666) = ") (displayln (sumacifras 666)))