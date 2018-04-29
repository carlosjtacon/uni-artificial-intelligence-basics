
;;; SESIÓN 05 - EJERCICIOS 05
;;; =========================
;;; Funcion que dada una palabra produzca la palabra invertida en el orden de sus letras.
;;; Ej. alfa -> afla
;;; Operaciones con cadenas: (string-length str) \ (string-append str ...) \ (substring str start [end])

#lang racket

(define (invertida p)
    (if (= 1 (string-length p)) ; si la palabra solo tiene una letra
        p ; devolvemos esa palabra
        (string-append 
            (invertida (substring p 1)) ; concatenamos la inversión de la cola de la palabra 
            (substring p 0 1) ; con la primera letra de la palabra
        )
    )
)

;;; Llamadas de prueba a las funciones
(and (display "(invertida alfa) = ") (displayln (invertida "alfa")))
(and (display "(invertida palabra) = ") (displayln (invertida "palabra")))