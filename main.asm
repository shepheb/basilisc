; Main file. This one includes the others in a sane order.
set pc, main ; First instruction.

; TODO: Add file handling, and at least read-string and friends.
; TODO: Add @ reader macro for deref.

; Some high-level definitions.
.def mem_specials, 3 ; nil, true, false.
.def mem, 0x4000
.def pre_mem, mem-1
.def mem_top, 0xff00-(mem_specials * 2)

.macro list_type=ifg %0, pre_mem
.macro not_list_type=ifl %0, mem

.def empty_list, 0 ; FIXME
.def nil, 0xfefe
.def true, 0xfefc
.def false, 0xfefa

; Types need to be even, since the low bit is used for garbage collection.
; Lists are the default, and don't have a type. Literal values like numbers are
; a cell, where the car portion is a type and the cdr is the literal value.
.def type_number, 2
.def type_char, 4
.def type_string, 6
.def type_symbol, 8
.def type_assoc, 10
.def type_native, 12
.def type_closure, 14
.def type_macro, 14|32
.def type_boolean, 16
.def type_nil, 18
.def type_atom, 20 ; Atoms hold some value in their cdr, and can be updated.


.include "util.asm"
.include "input.asm"
.include "reader.asm"
.include "memory.asm"
.include "printer.asm"
.include "output.asm"

.include "env.asm"
.include "helpers.asm"
.include "builtins.asm"
.include "eval.asm"
.include "errors.asm"

.include "repl.asm"
.include "strings.asm"
.include "types.asm"

.include "lib.asm"

:main
jsr init_mem
jsr init_repl_env
jsr init_lib
jsr serial_init
jsr run_repl

:hw_serial .dat 0 ; FIXME
