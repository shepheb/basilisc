; Core REPL functions for the interpreter.

:READ ; (buf, len) -> AST
jsr read_string
set pc, pop

; EVAL lives in eval.asm

:PRINT ; (AST) -> buf, len
set [cursor], reader_buffer
set b, 1 ; readable
jsr pr_str
set a, reader_buffer
set b, [cursor]
sub b, a
ret


:rep ; (buf, len) -> string
jsr READ
set b, [repl_env]
jsr EVAL
jsr PRINT
set pc, pop

; Main loop function.
; (It's really jacked because of all the REPs it does.)
:run_repl ; () ->
jsr print_prompt
jsr serial_read_raw ; buf, len
jsr rep             ; buf, len
jsr print_raw_str
jsr print_newline
set pc, run_repl

