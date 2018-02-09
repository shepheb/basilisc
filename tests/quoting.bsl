;; Testing cons function

(cons 1 (list))
;=>(1)
(cons 1 (list 2))
;=>(1 2)
(cons 1 (list 2 3))
;=>(1 2 3)
(cons (list 1) (list 2 3))
;=>((1) 2 3)

(def! a (list 2 3))
(cons 1 a)
;=>(1 2 3)
a
;=>(2 3)

;; Testing concat function
(concat)
;=>()
(concat (list 1 2))
;=>(1 2)
(concat (list 1 2) (list 3 4))
;=>(1 2 3 4)
(concat (list 1 2) (list 3 4) (list 5 6))
;=>(1 2 3 4 5 6)
(concat (concat))
;=>()
(concat (list) (list))
;=>()

(def! a (list 1 2))
(def! b (list 3 4))
(concat a b (list 5 6))
;=>(1 2 3 4 5 6)
a
;=>(1 2)
b
;=>(3 4)


;; Testing regular quote
(quote 7)
;=>7
(quote (1 2 3))
;=>(1 2 3)
(quote (1 2 (3 4)))
;=>(1 2 (3 4))

;; Testing simple quasiquote
(quasiquote 7)
;=>7
(quasiquote (1 2 3))
;=>(1 2 3)
(quasiquote (1 2 (3 4)))
;=>(1 2 (3 4))
(quasiquote (nil))
;=>(nil)

;; Testing unquote
(quasiquote (unquote 7))
;=>7
(def! a 8)
;=>8
(quasiquote a)
;=>a
(quasiquote (unquote a))
;=>8
(quasiquote (1 a 3))
;=>(1 a 3)
(quasiquote (1 (unquote a) 3))
;=>(1 8 3)
(def! b (quote (1 "b" "d")))
;=>(1 "b" "d")
(quasiquote (1 b 3))
;=>(1 b 3)
(quasiquote (1 (unquote b) 3))
;=>(1 (1 "b" "d") 3)
(quasiquote ((unquote 1) (unquote 2)))
;=>(1 2)

;; Testing splice-unquote
(def! c (quote (1 "b" "d")))
;=>(1 "b" "d")
(quasiquote (1 c 3))
;=>(1 c 3)
(quasiquote (1 (splice-unquote c) 3))
;=>(1 1 "b" "d" 3)


;; Testing symbol equality
(= (quote abc) (quote abc))
;=>true
(= (quote abc) (quote abcd))
;=>false
(= (quote abc) "abc")
;=>false
(= "abc" (quote abc))
;=>false
(= "abc" (str (quote abc)))
;=>true
(= (quote abc) nil)
;=>false
(= nil (quote abc))
;=>false


