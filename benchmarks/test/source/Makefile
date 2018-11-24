
default: testd.c
	clang -emit-llvm -c testd.c
	llvm-dis testd.bc
	clang -o testd testd.c

clean:
	rm -f testd.bc testd.ll
