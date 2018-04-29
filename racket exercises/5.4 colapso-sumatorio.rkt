
;;; SESIÓN 05 - EJERCICIOS 04
;;; =========================
;;; Dado un numero natural, este se reduce a la suma de sus cifras, 
;;; recursivamente hasta llegar a un número de una cifra

#lang racket

; función para sumar cifras del ejercicio 5.2
(define (sumacifras n)
    (if (= 0 (quotient n 10)) ; si n es más pequeño que 10
        n ; devolvemos n
        (+ (remainder n 10) (sumacifras (quotient n 10))) ; si no sumamos el resto con la función recursiva del cociente
    )
)

(define (colapso n)
    (if (= 0 (quotient n 10)) ; si n es menor a 10
        n ; devolvemos el propio n
        (+ 
            (remainder (sumacifras n) 10) ; sumamos el resto de sumar las cifras / 10
            (colapso (quotient (sumacifras n) 10)) ; más el colapso del cociente de sumar las cifras / 10
        )
    )
)

;;; Llamadas de prueba a las funciones
(and (display "(colapso 6) = ") (displayln (colapso 6)))
(and (display "(colapso 51) = ") (displayln (colapso 51)))
(and (display "(colapso 66) = ") (displayln (colapso 66)))
(and (display "(colapso 666) = ") (displayln (colapso 666)))
(and (display "(colapso 6666) = ") (displayln (colapso 6666)))