
;;; SESIÓN 08 - EJERCICIOS 03
;;; =========================
;;; Función contador del numero de apariciones de un símbolo en una lista.

#lang racket

(define (contador list sym) 
    (if (empty? list)
        0 ; cuando la lista está vacía devolvemos 0 apariciones
        (if (= (car list) sym) ; si la cabeza es el símbolo
            (+ 1 (contador (cdr list) sym)) ; contamos una aparición mas las apariciones de la cola
            (contador (cdr list) sym) ; si no solo contamos las apariciones de la cola
        )
    )
)

;;; Llamadas de prueba a las funciones
(and (display "(contador '(1 2 1 3 1 4) 1) = ") (displayln (contador '(1 2 1 3 1 4) 1)))
(and (display "(contador '(1 2 1 3 1 4) 2) = ") (displayln (contador '(1 2 1 3 1 4) 2)))
