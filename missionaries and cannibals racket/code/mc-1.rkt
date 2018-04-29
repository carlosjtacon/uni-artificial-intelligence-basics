
;;; ========================================== ;;;
;;; problema clásico de misioneros y caníbales ;;;
;;; ========================================== ;;;
;;; se encuentran tres misioneros y tres caníbales en el lado 
;;; derecho de un río, necesitan cruzar todos al lado izquierdo
;;; del mismo, para ello hay una barca de dos plazas. cómo hacer
;;; que pasen todos al otro lado sin que haya nunca más caníbales
;;; que misioneros en el mismo lado


#lang racket

;;; ================== ;;;
;;; métodos auxiliares ;;;
;;; ================== ;;;

;;; construye la estructura de un nodo a partir de los datos 
;;; necesarios [profundidad en el árbol, estado y camino]
;;; el estado se compone de un par de pares, el primer par 
;;; representa el lado derecho del río, el segundo par el lado 
;;; izquierdo el camino es una lista con el histórico de estados.
;;; estructura: '('((profundidad).(estado)).'(camino))
(define (construir_nodo profundidad estado camino) 
    (cons (cons profundidad estado) camino)
)

;;; devuelve el estado a partir de la estructura de un nodo
(define (get_estado nodo) (cdr (car nodo)))
;;; devuelve la profundidad en el árbol a partir de un nodo
(define (get_profundidad nodo) (car (car nodo)))
;;; devuelve la lista de los estados recorridos sin el actual
(define (get_camino_recorrido nodo) (cdr nodo))

;;; devuelve la parte que simboliza la orilla derecha del río
(define (get_orilla_drcha estado) (car estado))
;;; devuelve la parte que simboliza la orilla izquierda del río
(define (get_orilla_izqui estado) (cdr estado))

;;; devuelve el número que representa a los misioneros
(define (get_misioneros orilla) (car orilla))
;;; devuelve el número que representa a los caníbales
(define (get_canibales  orilla) (cdr orilla))

;;; método recursivo para imprimir un estado del camino
(define (imprimir_camino camino) 
    (if (empty? camino) (display "\n")
        (and 
            (display (get_misioneros 
                (get_orilla_izqui (car camino))))
            (display "M ") 
            (display (get_canibales 
                (get_orilla_izqui (car camino))))
            (display "C ") 
            (display "------ ") 
            (display (get_misioneros 
                (get_orilla_drcha (car camino))))
            (display "M ") 
            (display (get_canibales 
                (get_orilla_drcha (car camino))))
            (displayln "C") 
            
            (imprimir_camino (cdr camino)))
    )
)

;;; ===================================== ;;;
;;; generación de estados, inicial y meta ;;;
;;; ===================================== ;;;
;;; se definen las dos orillas como (cons num_misioneros 
;;; num_canibales) y con ellas se construyen los estados como 
;;; (cons orilla_drcha orilla_izqui)

; tres misioneros y tres caníbales en la derecha
(define estado_inicial (cons (cons 4 3) (cons 0 0)))
; tres misioneros y tres caníbales en la izquierda
(define estado_meta (cons (cons 0 0) (cons 4 3)))

; se comprueba que el estado actual sea igual al estado meta
(define (es_meta nodo) (equal? (get_estado nodo) estado_meta))

; el estado no es válido si hay más caníbales o
; si se han generado numeros negativos
(define (estado_invalido estado)
    (or
        ;;; no puede haber caníbales o misioneros negativos
        (< (get_canibales  (get_orilla_drcha estado)) 0)
        (< (get_misioneros (get_orilla_drcha estado)) 0)
        (< (get_canibales  (get_orilla_izqui estado)) 0)
        (< (get_misioneros (get_orilla_izqui estado)) 0)

        ;;; si hay más caníbales que misioneros en cualquier 
        ;;; orilla el estado no es válido, si hay misioneros
        (< 0 (get_misioneros (get_orilla_drcha estado)) 
            (get_canibales (get_orilla_drcha estado)))
        (< 0 (get_misioneros (get_orilla_izqui estado)) 
            (get_canibales (get_orilla_izqui estado)))
    )
)

;;; ======================= ;;;
;;; operaciones disponibles ;;;
;;; ======================= ;;;
;;; 1 - mover un misionero
;;; 2 - mover dos misioneros
;;; 3 - mover un caníbal
;;; 4 - mover dos caníbales
;;; 5 - mover un misionero y un caníbal
;;; *** dependiendo de la paridad de la profundidad del nodo a 
;;;     evaluar, el movimiento será de derecha a izquierda si la 
;;;     profundidad es par, al contrario si es impar
;;; *** suponemos que los costes de transiciones son iguales

; método de generación de estados basado en la suma en una orilla
; a costa de la resta de personas en la otra
(define (generar_estado nodo num_misioneros num_canibales)
    ; si es par se mueve hacia la izquierda, si no a la derecha
    (if (even? (get_profundidad nodo))
        (cons
            (cons 
                (- (get_misioneros (get_orilla_drcha 
                    (get_estado nodo))) num_misioneros) 
                (- (get_canibales (get_orilla_drcha 
                    (get_estado nodo))) num_canibales))
            (cons 
                (+ (get_misioneros (get_orilla_izqui 
                    (get_estado nodo))) num_misioneros) 
                (+ (get_canibales (get_orilla_izqui 
                    (get_estado nodo))) num_canibales))
        )
        (cons
            (cons 
                (+ (get_misioneros (get_orilla_drcha 
                    (get_estado nodo))) num_misioneros) 
                (+ (get_canibales (get_orilla_drcha 
                    (get_estado nodo))) num_canibales))
            (cons 
                (- (get_misioneros (get_orilla_izqui 
                    (get_estado nodo))) num_misioneros) 
                (- (get_canibales (get_orilla_izqui 
                    (get_estado nodo))) num_canibales))
        )
    )
)

; método para generar todos los hijos posibles de un nodo, 
; enumeración de movimientos posibles, prioridad según posición
; en la lista generada. teniendo en cuenta la eliminación
; de nodos inválidos para menor tiempo de ejecución
(define (generar_hijos nodo)
    (remove* (list 0) (list 
        (if (estado_invalido (generar_estado nodo 1 0)) 0
            (construir_nodo (+ 1 (get_profundidad nodo)) 
                (generar_estado nodo 1 0) (cons (get_estado nodo) 
                (get_camino_recorrido nodo))))
        (if (estado_invalido (generar_estado nodo 2 0)) 0
            (construir_nodo (+ 1 (get_profundidad nodo)) 
                (generar_estado nodo 2 0) (cons (get_estado nodo) 
                (get_camino_recorrido nodo))))
        (if (estado_invalido (generar_estado nodo 0 1)) 0
            (construir_nodo (+ 1 (get_profundidad nodo)) 
                (generar_estado nodo 0 1) (cons (get_estado nodo) 
                (get_camino_recorrido nodo))))
        (if (estado_invalido (generar_estado nodo 0 2)) 0
            (construir_nodo (+ 1 (get_profundidad nodo)) 
                (generar_estado nodo 0 2) (cons (get_estado nodo) 
                (get_camino_recorrido nodo))))
        (if (estado_invalido (generar_estado nodo 1 1)) 0
            (construir_nodo (+ 1 (get_profundidad nodo)) 
                (generar_estado nodo 1 1) (cons (get_estado nodo) 
                (get_camino_recorrido nodo))))
    ))
)

;;; ========================================== ;;;
;;; recorrido en anchura de árbol de expansión ;;;
;;; ========================================== ;;;
;;; búsqueda desinformada utilizando el algoritmo de búsqueda 
;;; en anchura para encontrar siempre (algoritmo completo)
;;; el camino óptimo

; método recursivo que tiene por parámetros el nodo a 
; evaluar además de la lista de nodos abiertos
(define (buscar_solucion nodo_actual abiertos)
    (cond 
        ; cuando el nodo a evaluar es meta, se imprime la solución,
        ; que es el camino recorrido más el nodo actual, reverso 
        ; ya que se almacena como una pila
        ((es_meta nodo_actual) 
            (imprimir_camino (reverse (cons (get_estado nodo_actual) 
                (get_camino_recorrido nodo_actual)))))
        
        ; si el estado actual es inválido, se descarta el nodo, 
        ; se busca la solución en el siguiente de la lista de 
        ; abiertos
        ((estado_invalido (get_estado nodo_actual)) 
            (buscar_solucion (car abiertos) (cdr abiertos)))
        
        ; si el nodo sí es válido, pero no solución, se expandirá 
        ; el árbol generando los hijos de ese nodo y añadiéndolos 
        ; a abiertos, pasasndo al siguiente
        (else 
            (buscar_solucion 
                (if (empty? abiertos) 
                    ; si la lista de abiertos está vacía, 
                    ; evaluaremos el primer hijo
                    (car (generar_hijos nodo_actual)) 
                    ; si no, seguimos adelante con el primer 
                    ; nodo en abiertos
                    (car abiertos)
                ) 
                (if (empty? abiertos)
                    ; si la lista de abiertos está vacía, hemos 
                    ; pasado como actual el primer hijo, como 
                    ; abiertos el resto
                    (cdr (generar_hijos nodo_actual)) 
                    ; si no concatenamos los hijos generados, a 
                    ; la lista abiertos actual, con el esquema fifo
                    (append (cdr abiertos) (generar_hijos nodo_actual))
                )
            )
        )
    )
)

;;; ================== ;;;
;;; programa principal ;;;
;;; ================== ;;;
;;; llamada a buscar solución construyendo el nodo raíz, con 
;;; profundidad 0, estado inicial, camino vacío y lista vacía 
;;; de abiertos
(buscar_solucion (construir_nodo 0 estado_inicial '()) '())