FILE = bitcnt_1.c bitcnt_2.c bitcnt_3.c bitcnt_4.c bitcnts.c bitfiles.c bitstrng.c bstr_i.c 


default: execute bitcode

execute: is_signature_queue_full.o bitcnt_1.o bitcnt_2.o bitcnt_3.o bitcnt_4.o bitcnts.o bitfiles.o bitstrng.o bstr_i.o 
	gcc -o bitcount is_signature_queue_full.o bitcnt_1.o bitcnt_2.o bitcnt_3.o bitcnt_4.o bitcnts.o bitfiles.o bitstrng.o bstr_i.o 

is_signature_queue_full.o:
	gcc -c is_signature_queue_full.c


bitcnt_1.o:
	gcc -c bitcnt_1.c 

bitcnt_2.o:
	gcc -c bitcnt_2.c

bitcnt_3.o:
	gcc -c bitcnt_3.c

bitcnt_4.o:
	gcc -c bitcnt_4.c

bitcnts.o:
	gcc -c bitcnts.c

bitfiles.o:
	gcc -c bitfiles.c

bitstrng.o:
	gcc -c bitstrng.c

bstr_i.o:
	gcc -c bstr_i.c 


bitcode: bitcnt_1.bc bitcnt_2.bc bitcnt_3.bc bitcnt_4.bc bitcnts.bc bitfiles.bc bitstrng.bc bstr_i.bc
	llvm-link -o bitcount.bc bitcnt_1.bc bitcnt_2.bc bitcnt_3.bc bitcnt_4.bc bitcnts.bc bitfiles.bc bitstrng.bc bstr_i.bc

bitcnt_1.bc:
	clang -emit-llvm -c bitcnt_1.c -o bitcnt_1.bc

bitcnt_2.bc:
	clang -emit-llvm -c bitcnt_2.c -o bitcnt_2.bc

bitcnt_3.bc:
	clang -emit-llvm -c bitcnt_3.c -o bitcnt_3.bc

bitcnt_4.bc:
	clang -emit-llvm -c bitcnt_4.c -o bitcnt_4.bc

bitcnts.bc:
	clang -emit-llvm -c bitcnts.c -o bitcnts.bc

bitfiles.bc:
	clang -emit-llvm -c bitfiles.c -o bitfiles.bc

bitstrng.bc:
	clang -emit-llvm -c bitstrng.c -o bitstrng.bc

bstr_i.bc:
	clang -emit-llvm -c bstr_i.c -o bstr_i.bc


clean:
	rm -rf bitcnts output* *.o
