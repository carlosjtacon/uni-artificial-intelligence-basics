
;;; SESIÓN 08 - EJERCICIOS 05
;;; =========================
;;; Función que tome un entero n>=2 y produzca el primer (menor) divisor d≠1 de n

#lang racket

(define (divisor n) (divisor_aux n 2)) ; empezamos con 2 porque 1 siempre será
(define (divisor_aux n d) 
    (if (= 0 (remainder n d))
        d ; si el resto es 0 es divisor
        (divisor_aux n (+ d 1)) ; si no sumamos 1 y comprobamos
    )
)

;;; Llamadas de prueba a las funciones
(and (display "(divisor 2) = ") (displayln (divisor 2)))
(and (display "(divisor 3) = ") (displayln (divisor 3)))
(and (display "(divisor 4) = ") (displayln (divisor 4)))
(and (display "(divisor 5) = ") (displayln (divisor 5)))
(and (display "(divisor 10) = ") (displayln (divisor 10)))