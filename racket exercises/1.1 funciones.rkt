
;;; SESIÓN 01 - EJERCICIOS 01
;;; =========================
;;; Definir las funciones para:
;;; A - Sexagesimal - Convertir radianes a grados.
;;; B - sen^2(3x).
;;; C - sen(3x^2).
;;;
;;; Para definir funciones usamos la palabra clave "define" 
;;; seguida del nombre de la función y sus parámetros, después lo 
;;; que devuelve esta función: 
;;; (define (nombre parametros ...) (valor que devuelve, operaciones)). 
;;;
;;; Las operaciones en racket se definen como 
;;; (operación operando 1 ... operando n)

#lang racket

;;; A) n grados sexagesimales = n radianes * (360 grados/2pi radianes)
(define (sex rad)
  (* rad (/ 360 (* 2 pi))))

;;; B) funcion sen^2(3x)
(define (fun1 x)
  (* (sin (* 3 x)) (sin (* 3 x))))

;;; C) funcion sen(3x^2)
(define (fun2 x)
  (sin (* 3 (* x x))))


;;; Llamadas de prueba a las funciones
(and (display "pi radianes = ") (display (sex pi)) (displayln " grados sexagesimales"))
(and (display "2pi radianes = ") (display (sex (* 2 pi))) (displayln " grados sexagesimales"))
(and (display "x = 0 ; sen^2(3x) = ") (displayln (fun1 0)))
(and (display "x = 3 ; sen^2(3x) = ") (displayln (fun1 3)))
(and (display "x = 0 ; sen^2(3x) = ") (displayln (fun2 0)))
(and (display "x = 3 ; sen^2(3x) = ") (displayln (fun2 3)))