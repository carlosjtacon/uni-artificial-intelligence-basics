
;;; SESIÓN 02 - EJERCICIOS 01
;;; =========================
;;; Diseñar una función que tenga como entradas números 
;;; y como salida calificaciones orales de un examen.
;;;
;;; Tenemos dos opciones para hacer condicionales:
;;; (if (condicion) (operaciones condicion true) (operaciones condicion false))
;;; (cond ((condicion) (operaciones condicion true)) ... (else (operaciones ninguna condicion true)))

#lang racket

;;; Función usando if
(define (calificacion-if n)
    (if (or (< n 0) (> n 10))
        "error dato"
        (if (< n 5) 
            "suspenso" 
            (if (< n 7) 
                "aprobado"
                (if (<= n 8) 
                    "notable" 
                    "sobresaliente"
                )
            )
        )
    )
)

;;; Función usando cond
(define (calificacion-cond n)
    (cond   ((< n 0) "error dato")
            ((> n 10) "error dato")
            ((< n 5) "suspenso")
            ((< n 7) "aprobado")
            ((<= n 8) "notable")
            (else "sobresaliente")
    )
)

;;; Llamadas de prueba a las funciones
(and (display "(calificacion-if 4) ")(displayln (calificacion-if 4)))
(and (display "(calificacion-if 6) ")(displayln (calificacion-if 6)))
(and (display "(calificacion-if 7) ")(displayln (calificacion-if 7)))
(and (display "(calificacion-if 9) ")(displayln (calificacion-if 9)))
(and (display "(calificacion-cond 4) ")(displayln (calificacion-cond 4)))
(and (display "(calificacion-cond 6) ")(displayln (calificacion-cond 6)))
(and (display "(calificacion-cond 7) ")(displayln (calificacion-cond 7)))
(and (display "(calificacion-cond 9) ")(displayln (calificacion-cond 9)))
