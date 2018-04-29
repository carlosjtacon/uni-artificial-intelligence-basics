
;;; SESIÓN 03 - EJERCICIOS 07
;;; =========================
;;; Función que dados a1 ∈ ℝ, r ∈ ℝ y n ∈ ℕ produzca los n primeros términos 
;;; de la progresión geométrica que empieza con a1 y tiene por razón r
;;;
;;; https://es.wikipedia.org/wiki/Progresión_geométrica
;;; Una progresión geométrica es una secuencia en la que el elemento 
;;; siguiente se obtiene multiplicando el elemento anterior por una constante denominada razón.

#lang racket

(define (progresion a r n)
    (if (= 0 n)
        '() ; cuando llegamos a n = 0 ya no quedan elementos que generar
        (cons ; concatenamos
            a ; el valor actual de a
            (progresion (* a r) r (- n 1)) ; con la progresión tomando a=a*r y decrementando n
        )
    )
)

;;; Llamadas de prueba a las funciones
(and (display "(progresion 1 2 4) = ") (displayln (progresion 1 2 4)))
(and (display "(progresion 2 4 9) = ") (displayln (progresion 2 4 9)))