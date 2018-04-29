
;;; SESIÓN 03 - EJERCICIOS 03
;;; =========================
;;; Construir una funcion que dada una lista numérica produzca su suma, 
;;; comprobando que la lista dada contiene elementos adecuados.

#lang racket

(define (suma l)
    (if (number? (car l)) ; si el elemento a evaluar es un numero seguimos, si no error
        (if (= 1 (length l)) ; si es el ultimo elemento lo devolvemos si no realizamos la suma de forma recursiva
            (car l)
            (if (number? (suma (cdr l))) ; si va a ser un número hacemos la operación si no seguimos devolviendo el error
                (+ (car l) (suma (cdr l))) ; sumamos la cabeza con el resultado de sumar la cola
                "la lista no tiene elementos adecuados"
            )
        )
        "la lista no tiene elementos adecuados"
    )
)

;;; Llamadas de prueba a las funciones
(and (display "(suma (list 1 2 3 4)) = ") (displayln (suma (list 1 2 3 4))))
(and (display "(suma (list 1 2 3 'd)) = ") (displayln (suma (list 1 2 3 'd))))