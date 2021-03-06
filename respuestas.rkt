#lang racket
(provide (all-defined-out))

(define (crearAnswer  id  respuesta fecha etiqueta)
  (list id respuesta fecha etiqueta)
  )

;Selector Fecha: Dada una pregunta, se ingresa una fecha
;Dom: Lista x lista
;Rec: Lista
(define (ingresarId id)
  (car id)
  )




;Selector Etiquetas: Dada una nueva pregunta, se ingresa una etiqueta
;Dom: Lista x lista
;Rec: Lista
(define (ingresarRespuesta respuesta)
  (cadr respuesta)
  )
;Selector Pregunta: Dada una nueva pregunta, se ingresa una pregunta
;Dom: Lista x lista
;Rec: Lista
(define (ingresarAnswer fecha)
  (caddr fecha)
  )

(define (ingresarEtiqueta etiqueta)
  (cadddr etiqueta)
  )