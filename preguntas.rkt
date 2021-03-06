#lang racket
(provide (all-defined-out))

;TDA pregunta: Se genera una lista que contiene la pregunta realizada por el usuario y la fecha
;Implementación: Lista x listas
;Constructor: Pregunta con fecha
(define (crearAsk  id pregunta fecha etiquetas)
  (list id pregunta fecha etiquetas)
  )
(define (ingresarIds id)
  (car id)
  )
;Selector Pregunta: Dada una nueva pregunta, se ingresa una pregunta
;Dom: Lista x lista
;Rec: Lista
(define (ingresarAsk pregunta)
  (cadr pregunta)
  )

;Selector Fecha: Dada una pregunta, se ingresa una fecha
;Dom: Lista x lista
;Rec: Lista
(define (ingresarFecha fecha)
  (caddr fecha)
  )

;Selector Etiquetas: Dada una nueva pregunta, se ingresa una etiqueta
;Dom: Lista x lista
;Rec: Lista
(define (ingresarEtiquetas etiquetas)
  (cadddr etiquetas)
  )