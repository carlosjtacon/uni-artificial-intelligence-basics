
;;; SESIÓN 03 - EJERCICIOS 08
;;; =========================
;;; Función que dada una lista de monitores y otra de jugadores, 
;;; distribuya los segundos en equipos dirigidos por los primeros

#lang racket

; funcion que devuelve los n primeros valores de una lista l
(define (nprimeros n l)
    (if (= n 0)
        '() ; como ya no hay que devolver más, devolvemos una lista vacía
        (cons (first l) (nprimeros (- n 1) (cdr l))) ; concatenamos el primer elemento con la recursión pasando la cola de l y decrementando n
    )
)

; funcion que devuelve los ultimos valores de una lista l quitando n primeros
(define (nultimos n l)
    (if (= n 1)
        (cdr l) ; devolvemos la cola cuando ya hemos decrementado los necesarios
        (nultimos (- n 1) (cdr l)) ; recursion decrementando n y pasando la cola de l
    )    
)

; hace los emparejamientos a partir de una lista de jugadores y otra de monitores
(define (equipos m j) 
    (if (empty? m)
        '() ; cuando ya no quedan monitores devolvemos una lista vacía, no hay que emparejar
        (append ; va emparejando los n primeros = cociente de m/j
            (list (car m) (nprimeros (quotient (length j) (length m)) j)) ; empareja un monitor con n jugadores
            (equipos (cdr m) (nultimos (quotient (length j) (length m)) j)) ; y vuelve a llamar eliminando los ya adjudicados
        )
    )
)

;;; Llamadas de prueba a las funciones
(and (display "(equipos '(a b c) '(1 2 3 4 5 6 7)) = ") (displayln (equipos '(a b c) '(1 2 3 4 5 6 7))))
(and (display "(equipos '(a b c d) '(1 2 3 4 5 6 7)) = ") (displayln (equipos '(a b c d) '(1 2 3 4 5 6 7))))
(and (display "(equipos '(a b c d) '(1 2 3 4 5 6 7 8)) = ") (displayln (equipos '(a b c d) '(1 2 3 4 5 6 7 8))))