

default: execute bitcode

execute: is_signature_queue_full.o susan.o
	gcc -o susan susan.o is_signature_queue_full.o -lm

is_signature_queue_full.o:
	gcc -c is_signature_queue_full.c

susan.o: susan.c
	gcc -c susan.c

bitcode: susan.c
	clang -emit-llvm -c susan.c -o susan.bc


clean:
	rm -rf susan output* susan *.bc *.o
