
;;; SESIÓN 04 - EJERCICIOS 02
;;; =========================
;;; Función que indique si un número entero es potencia de 2.

#lang racket

(define (es-potencia-2 n)
    (cond ((= n 2) true) ; 2 es en sí potencia de 2
          ((even? n) (es-potencia-2 (/ n 2))) ; si es par, comprobamos si la mitad es potencia de 2, hasta llegar a 2
          (else false) ; si no cumple estas condiciones no es potencia de 2
    )
)

;;; Llamadas de prueba a las funciones
(and (display "(es-potencia-2 1) = ") (displayln (es-potencia-2 1)))
(and (display "(es-potencia-2 2) = ") (displayln (es-potencia-2 2)))
(and (display "(es-potencia-2 3) = ") (displayln (es-potencia-2 3)))
(and (display "(es-potencia-2 4) = ") (displayln (es-potencia-2 4)))
(and (display "(es-potencia-2 6) = ") (displayln (es-potencia-2 6)))
(and (display "(es-potencia-2 16) = ") (displayln (es-potencia-2 16)))
