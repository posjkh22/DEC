
all: test.c
	clang -emit-llvm -c test.c
	llvm-dis test.bc

clean:
	rm -f test.bc test.ll
