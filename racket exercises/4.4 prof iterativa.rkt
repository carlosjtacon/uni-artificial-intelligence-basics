
;;; SESIÓN 04 - EJERCICIOS 04
;;; =========================
;;; Función que, en un problema de búsqueda en espacio de estados por el método de profuncidad iterativa,
;;; dados el factor de ramificación, la profundidad de la primera meta y con un escalón 1 en las iteraciones, 
;;; calcule el nº de estados a examinar en el peor caso.

#lang racket

(define (prof-iterativa-optima p pmeta r)
    (if (= p pmeta) ; si la profundidad actual es igual a la profundidad meta
        (expt r p) ; devolvemos la ramificación elevada a la profundidad
        (+ (prof-iterativa-optima (+ 1 p) pmeta r) (expt r p)) ; si no incrementamos la profundidad y sumamos
    )
)

;;; Llamadas de prueba a las funciones
(and (display "(prof-iterativa-optima 0 0 2) = ") (displayln (prof-iterativa-optima 0 0 2))) ; 1
(and (display "(prof-iterativa-optima 0 1 2) = ") (displayln (prof-iterativa-optima 0 1 2))) ; 1 + 2
(and (display "(prof-iterativa-optima 0 2 2) = ") (displayln (prof-iterativa-optima 0 2 2))) ; 1 + 2 + 4
(and (display "(prof-iterativa-optima 0 0 3) = ") (displayln (prof-iterativa-optima 0 0 3))) ; 1
(and (display "(prof-iterativa-optima 0 1 3) = ") (displayln (prof-iterativa-optima 0 1 3))) ; 1 + 3
(and (display "(prof-iterativa-optima 0 2 3) = ") (displayln (prof-iterativa-optima 0 2 3))) ; 1 + 3 + 9