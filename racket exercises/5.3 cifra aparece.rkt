
;;; SESIÓN 05 - EJERCICIOS 03
;;; =========================
;;; Función que dado un numero natural y una cifra decida si la cifra aparece o no en el numero.
;;; ej. 7 no es cifra de 654

#lang racket

(define (aparece m n)
    (if (= 0 (quotient n 10)) ; si el número es menor que 10
        (= m n) ; comprobamos que el número sea igual a la cifra
        (if (= m (remainder n 10)) ; si es mayor pero el resto es igual a la cifra
            true ; devolvemos que sí contiene la cifra
            (aparece m (quotient n 10)) ; si no recorremos recursivamente pasando el cociente de n/10
        )
    )
)

;;; Llamadas de prueba a las funciones
(and (display "(aparece 5 543) = ") (displayln (aparece 5 543)))
(and (display "(aparece 5 345) = ") (displayln (aparece 5 345)))
(and (display "(aparece 5 666) = ") (displayln (aparece 5 666)))