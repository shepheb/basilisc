ASM=dasm
TESTER=./test_runner.py

TEST_HARDWARE=serial,clock
RUN_CMD=dcpu -turbo -hw $(TEST_HARDWARE) lisp.bin

TESTS=tests/values.bsl tests/builtins.bsl tests/env.bsl tests/if_fn_do.bsl \
      tests/strings.bsl tests/tco.bsl tests/atoms.bsl tests/quoting.bsl \
      tests/macros.bsl tests/lists.bsl tests/lib.bsl


lisp.bin: *.asm
	$(ASM) main.asm $@

build: lisp.bin

default: build

clean: FORCE
	rm -f lisp.bin test.bsl

test1: tests/values.bsl build FORCE
	$(TESTER) $< -- $(RUN_CMD)

test2: tests/builtins.bsl build FORCE
	$(TESTER) $< -- $(RUN_CMD)

test3: tests/env.bsl build FORCE
	$(TESTER) $< -- $(RUN_CMD)

test4a: tests/if_fn_do.bsl build FORCE
	$(TESTER) $< -- $(RUN_CMD)

test4b: tests/strings.bsl build FORCE
	$(TESTER) $< -- $(RUN_CMD)

test4: tests/if_fn_do.bsl tests/strings.bsl build FORCE
	cat tests/if_fn_do.bsl tests/strings.bsl > test.bsl
	$(TESTER) test.bsl -- $(RUN_CMD)
	rm -rf test.bsl

test5: tests/tco.bsl build FORCE
	$(TESTER) $< -- $(RUN_CMD)

test6: tests/atoms.bsl build FORCE
	$(TESTER) $< -- $(RUN_CMD)

test7: tests/quoting.bsl build FORCE
	$(TESTER) $< -- $(RUN_CMD)

test8a: tests/macros.bsl build FORCE
	$(TESTER) $< -- $(RUN_CMD)

test8b: tests/lists.bsl build FORCE
	$(TESTER) $< -- $(RUN_CMD)

test8c: tests/lib.bsl build FORCE
	$(TESTER) $< -- $(RUN_CMD)

test8: tests/macros.bsl tests/lists.bsl tests/lib.bsl build FORCE
	cat tests/macros.bsl tests/lists.bsl tests/lib.bsl > test.bsl
	$(TESTER) test.bsl -- $(RUN_CMD)
	rm -f test.bsl

test9a: tests/try-catch.bsl build FORCE
	$(TESTER) $< -- $(RUN_CMD)

test9b: tests/lib2.bsl build FORCE
	$(TESTER) $< -- $(RUN_CMD)

test9: tests/try-catch.bsl tests/lib2.bsl build FORCE
	cat tests/try-catch.bsl tests/lib2.bsl > test.bsl
	$(TESTER) test.bsl -- $(RUN_CMD)
	rm -f test.bsl


test: $(TESTS) build FORCE
	cat $(TESTS) > test.bsl
	$(TESTER) test.bsl -- $(RUN_CMD)
	rm -rf test.bsl

FORCE:


