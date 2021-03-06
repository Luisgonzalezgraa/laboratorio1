#lang racket
(require "stack.rkt")
(require "preguntas.rkt")
(require "respuestas.rkt")
;-----------------------
;Funcion register: Funcion que permite generar un nuevo usuario 
;Dom: stack X string X string
;Rec: stack
;Recursion: Natural
;Ejemplo de uso:(define stack2 (register stack1 2 "luis" "asd123" ))
(define (register stack id name contrasenia)
   (if(null? stack)
      (stackOverflow
       (concatenar(list id name contrasenia) (ingresarName stack))
       (ingresarPreguntas stack)
       (ingresarReputacion stack)
         )
      (if (estaenlista? (car stack) id)
        "\n Id del Usuario ya registrado intente con otro Número...\n"
       (stackOverflow
          (concatenar(list id name contrasenia) (ingresarName stack))
          (ingresarPreguntas stack)
          (ingresarRespuestas stack)
          (ingresarReputacion stack)
          )
        
      ))
  )
  
  
;-------------------------------------
;Funcion login: Funcion que permite ingresar al usuario
;Dom: stack X string X string X function)
;Rec: stack
;Recursion: natural

(define (login stack name contrasenia operation)
   (if (and(estaenlista? (car stack) name) (estaenlista? (car stack) contrasenia))
       (if(eq? operation stack->string)
          (string-append "\nUsuario: " (stackAux->string (ingresarName stack))
                 "\nPregunta: " (stackAux->string (ingresarPreguntas stack) )
                 "\nRespuesta: "  (stackAux->string (ingresarRespuestas stack))
                 "\nReputacion: 0 " (stackAux->string (ingresarReputacion stack))
                 
        "\n"
  )
        (lambda(fecha)(lambda(id) (lambda(pregunta) (lambda (etiqueta)
                                                      ((((operation stack) fecha)id name contrasenia) pregunta etiqueta))))))
        
        
       
       
      (lambda(fecha)(lambda(id) (lambda(pregunta) (lambda (etiqueta)
                                                      ((((operation stack) fecha)null null null) pregunta etiqueta)))))
      )
  )
;-------------------------------------
;Funcion ask: permite al usuario ingresar una pregunta al stack
;Dom: stack
;Rec:list ->stack X date X string X string list
;Recursion: natural

(define ask (lambda(stack) (lambda (fecha)
               (lambda (id name contrasenia)
               (lambda(pregunta etiqueta)
                 (if(null? name)
                    #f
               (stackOverflow (list name contrasenia) (concatenar (ingresarPreguntas stack) (crearAsk id pregunta fecha etiqueta)) (ingresarRespuestas stack) (ingresarReputacion stack))
               ))))))
;-------------------------------------
;Funcion answer: permite ingresar una pregunta al stack de parte del usuario
;Dom: stack
;Rec: list ->stack X date X string X string list
;Recursion: natural

(define answer (lambda(stack) (lambda (fecha)
               (lambda (id name contrasenia)
               (lambda(respuesta etiqueta)
                 (if(null? name)
                 #f
                 (if(estaenlista? (cadr stack) id)
                        (stackOverflow (list name contrasenia) (ingresarPreguntas stack) (concatenar (ingresarRespuestas stack)(crearAnswer id  respuesta fecha etiqueta)) (ingresarReputacion stack))
                       '()
               )))))))

;-----------------------
;Función stack->string: Recibe el stack y las representa por pantalla de manera simple
;Dom: stack 
;Rec: string
;Ejemplo de uso : (stack->string (stackOverflow (list ) (list) (list)(list) ))
(define (stack->string stack)
  (string-append "\nUsuario: " (stackAux->string (ingresarName stack))
                 "\nPregunta: " (stackAux->string (ingresarPreguntas stack) )
                 "\nRespuesta: "  (stackAux->string (ingresarRespuestas stack))
                 "\nReputacion: 0 " (stackAux->string (ingresarReputacion stack))
                 
        "\n"
  )
  )
;Funcion stackAux->string: convierte una lista de usuarios con sus preguntas a un string visible para el usuario
;Dom: stack
;Rec: string
;Recursion: Natural
(define (stackAux->string stack)
  (if (null? stack)
      ""
      (string-append  (car stack)   (stackAux->string (cdr stack)) " - "))
  )

;-----------------------------
;Funcion Concatenar: Concatena dos listas
;Dom: Lista x lista
;Rec: Lista
;Recursion: Natural
(define (concatenar lista1 lista2)
  (if(null? lista1)
     lista2
     (cons (car lista1) (concatenar (cdr lista1) lista2))
  )
)

;-------------------------------------
;Funcion estaenlista?: Ve si un elemento es parte de la lista
;Dom: lista x (string-int-entre otros)
;Rec: Booleano
;Recursion: Cola

(define (estaenlista? lista parametro)
  (if (null? lista)
      #f
      (if (eq? (car lista) parametro)
          #t
          (estaenlista? (cdr lista) parametro)
          )
      )
  )


;-------------------------------------
;Funcion estaenlista?: Ve si un elemento es parte de la lista
;Dom: lista x (string-int-entre otros)
;Rec: Booleano
;Recursion: Cola
(define (agregaralStack lista1 lista2)
  (stackOverflow
   (ingresarName lista2)
   (concatenar(ingresarPreguntas lista1) (ingresarPreguntas lista2))
   (concatenar(ingresarRespuestas lista1) (ingresarRespuestas lista2))
   (concatenar(ingresarReputacion lista1) (ingresarReputacion lista2))
   )
  )



;----------------------------------------------------------
;EJEMPLOS DE USO:

;(define stack1 (stackOverflow (list ) (list) (list)(list) ))
;(define stack2 (register stack1 "2" "luis" "asd123" ))
;(define stack3 (register stack2 "3" "asdsad" "asd1aS23" ))
;(define stack4 (((((login stack3 "luis" "asd123" ask)"21-3-2020") "12") "mi pregunta") "e1 e2 e3"))
;(define stack5 (((((login stack4 "luis" "asd123" answer) "5-12-2020")"12") "mi respuesta") "e1 e2 e3"))
;(define stack6 (agregaralStack stack5 stack3))
;(display stack6)
;(display (stack->string stack6))
;(display (login stack5 "luis" "asd123" stack->string))

;(define stack1 (stackOverflow ("user" "sad") ("13" "pregunta" "02-02-2002" "e1 e2 e3") (list)(list) ))
;(define stack2 (register stack1 "2" "luis" "asd123" ))
;(define stack3 (register stack2 "3" "asdsad" "asd1aS23" ))
;(define stack4 (((((login stack3 "luis" "asd123" ask)"21-3-2020") "12") "mi pregunta") "e1 e2 e3"))
;(define stack5 (((((login stack4 "luis" "asd123" answer) "5-12-2020")"12") "mi respuesta") "e1 e2 e3"))
;(define stack6 (agregaralStack stack5 stack3))
;(display stack6)
;(display (stack->string stack6))
;(display (login stack5 "luis" "asd123" stack->string))

;(define stack1 (stackOverflow ("user" "sad") ("132" "pregunta2" "12-22-2002" "e1 e2 e3") ("132" "respuesta" "05-02-2002" "e1 e2 e3")(list) ))
;(define stack2 (register stack1 "2" "luis" "asd123" ))
;(define stack3 (register stack2 "3" "asdsad" "asd1aS23" ))
;(define stack4 (((((login stack3 "luis" "asd123" ask)"21-3-2020") "12") "mi pregunta") "e1 e2 e3"))
;(define stack5 (((((login stack4 "luis" "asd123" answer) "5-12-2020")"12") "mi respuesta") "e1 e2 e3"))
;(define stack6 (agregaralStack stack5 stack3))
;(display stack6)
;(display (stack->string stack6))
;(display (login stack5 "luis" "asd123" stack->string))

