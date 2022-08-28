#lang racket/base

(provide (struct-out Graph)
         Graph:init
         Graph:add
         Graph:remove
         Graph:connect
         Graph:disconnect
         Graph:djikstra
         )


(struct Graph (nodes edges strict?)
  #:transparent)

(define (Graph:init . args)
  0)

(define (Graph:add)
  0)

(define (Graph:remove)
  0)

(define (Graph:connect)
  0)

(define (Graph:disconnect)
  0)

(define (Graph:djikstra)
  0)
