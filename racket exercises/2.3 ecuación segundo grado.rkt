
;;; SESIÓN 02 - EJERCICIOS 03
;;; =========================
;;; Función que devuelva la solución de ecuación de segundo grado ax^2+bx+c=0.
;;; x = -b+-sqrt(b^2 - 4ac)/2a

#lang racket

(define (segundogrado a b c) 
    (if (= a 0) ; la ecuación falla en la fórmula si a es 0, división por 0
        "error formula hay que usar otro método" ; si es 0 mostramos error y si no es 0 ejecutamos formula
        (list   ; devolvemos una tupla de la respues en forma de lista con las dos variantes de la fórmula
            (
                / 
                (+ (- b) (sqrt(- (expt b 2) (* 4 a c)))) ; sqrt(b^2 - 4ac)
                (* 2 a) ; 2a    
            )
            (
                / 
                (- (- b) (sqrt(- (expt b 2) (* 4 a c)))) ; sqrt(b^2 - 4ac)
                (* 2 a) ; 2a
            )
        )
    )
)

;;; Llamadas de prueba a las funciones
(and (display "4x^2+3x+0 = 0 ; x = ") (displayln (segundogrado 4 2 0)))
(and (display "2x^2+2x+2 = 0 ; x = ") (displayln (segundogrado 2 2 2)))
(and (display "0x^2+2x+0 = 0 ; x = ") (displayln (segundogrado 0 2 0)))