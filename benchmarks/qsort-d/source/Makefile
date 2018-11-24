FILE1 = qsort_small.c
FILE2 = qsort_large.c


default: execute bitcode

execute: qsort_large is_signature_queue_full.o
	gcc -o qsort qsort_large.o is_signature_queue_full.o -lm

is_signature_queue_full.o:
	gcc -c is_signature_queue_full.c
	
qsort_large: qsort_large.c Makefile
	gcc -c qsort_large.c

clean:
	rm -f qsort_large output* *.o *.bc qsort.bc qsort

	
bitcode: qsort_large.c
	clang -emit-llvm -c qsort_large.c -o qsort.bc

	
#qsort_small: qsort_small.c Makefile
#	gcc -static qsort_small.c -O3 -o qsort_small -lm
