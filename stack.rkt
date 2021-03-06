#lang racket
(provide (all-defined-out))

;----------
;TDA usuarioNuevo: Se genera una lista que contiene el nombre y la contraseña del usuario 
;Implementación: Lista x listas
;Constructor: Un nuevo usuario
(define (stackOverflow usuario preguntas respuestas reputacion)
  (list usuario preguntas respuestas reputacion)
  )
;Selector Nombre: Dado un usuario Nuevo, se ingresa un usuario con nombre y contraseña
;Dom: Lista x lista
;Rec: Lista
(define (ingresarName usuario)
  (car usuario)
  )


;Selector Preguntas: Dado un usuario Nuevo, se ingresa una pregunta
;Dom: Lista x lista
;Rec: Lista
(define (ingresarPreguntas preguntas)
  (cadr preguntas)
  )
;Selector Respuestas: Dado un usuario Nuevo, se ingresa un usuario con nombre y contraseña
;Dom: Lista x lista
;Rec: Lista
(define (ingresarRespuestas respuestas)
  (caddr respuestas)
  )

;Selector Puntuacion: Dado un usuario Nuevo, se ingresa una puntuacion
;Dom: Lista x lista
;Rec: Lista
(define (ingresarReputacion reputacion)
  (cadddr reputacion)
  )