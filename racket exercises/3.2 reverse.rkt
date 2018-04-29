
;;; SESIÓN 03 - EJERCICIOS 02
;;; =========================
;;; Construir una funcion que emule a la primitiva reverse.
;;; Ejemplo (reverse (list 'a 'b 'c 'd)) = (rev (list 'a 'b 'c 'd)) = (d c b a)

#lang racket

(define (rev l)
    (if (= 1 (length l))
        l ; ultimo elemento de la lista la devolvemos entera porque solo tiene 1
        (append (rev (cdr l)) (list (car l))) ; juntamos mediante recursión la cola con la cabeza
    )
)

;;; Llamadas de prueba a las funciones
(and (display "(reverse (list 'a 'b 'c 'd)) = ") (displayln (reverse (list 'a 'b 'c 'd))))
(and (display "(rev (list 'a 'b 'c 'd)) = ") (displayln (rev (list 'a 'b 'c 'd))))