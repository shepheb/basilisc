;; Testing a string
"foo bar \"baz\""
;=>"foo bar \"baz\""

;; Testing numbers 1
0
;=>0

;; Testing numbers 2
25
;=>25

;; Testing numbers 3
-3221
;=>-3221

;; Testing min int
-32768
;=>-32768

;; Testing max int
32767
;=>32767

;; Testing error-free wrapping
50000
;=>-15536

;; Testing error-free wrapping 2
-50000
;=>15536


;; Testing empty list
()
;=>()
