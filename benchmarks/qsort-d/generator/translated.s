	.text
	.file	"qsort_large.c"
	.globl	compare                 # -- Begin function compare
	.p2align	4, 0x90
	.type	compare,@function
compare:                                # @compare
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Lcfi0:
	.cfi_def_cfa_offset 16
.Lcfi1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Lcfi2:
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	subq	$32, %rsp
.Lcfi3:
	.cfi_offset %rbx, -32
.Lcfi4:
	.cfi_offset %r14, -24
	movq	%rsi, %r14
	movq	%rdi, %rbx
	movl	$65537, %edi            # imm = 0x10001
	callq	enqueue_signature
	movq	%rbx, -48(%rbp)
	movq	%r14, -40(%rbp)
	movq	-48(%rbp), %rax
	movsd	16(%rax), %xmm0         # xmm0 = mem[0],zero
	movsd	%xmm0, -32(%rbp)
	movq	-40(%rbp), %rax
	movsd	16(%rax), %xmm0         # xmm0 = mem[0],zero
	movsd	%xmm0, -24(%rbp)
	movsd	-32(%rbp), %xmm0        # xmm0 = mem[0],zero
	ucomisd	-24(%rbp), %xmm0
	jbe	.LBB0_2
# BB#1:
	movl	$65538, %edi            # imm = 0x10002
	callq	enqueue_signature
	movl	$1, %ebx
	jmp	.LBB0_3
.LBB0_2:
	movl	$65539, %edi            # imm = 0x10003
	callq	enqueue_signature
	movl	$4294967295, %eax       # imm = 0xFFFFFFFF
	xorl	%ebx, %ebx
	movsd	-32(%rbp), %xmm0        # xmm0 = mem[0],zero
	movsd	-24(%rbp), %xmm1        # xmm1 = mem[0],zero
	ucomisd	%xmm1, %xmm0
	setnp	%cl
	sete	%dl
	testb	%cl, %dl
	cmovel	%eax, %ebx
.LBB0_3:
	movl	$65540, %edi            # imm = 0x10004
	callq	enqueue_signature_with_return
	movl	%ebx, %eax
	addq	$32, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end0:
	.size	compare, .Lfunc_end0-compare
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3               # -- Begin function main
.LCPI1_0:
	.quad	4611686018427387904     # double 2
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Lcfi5:
	.cfi_def_cfa_offset 16
.Lcfi6:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Lcfi7:
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	subq	$1440128, %rsp          # imm = 0x15F980
.Lcfi8:
	.cfi_offset %rbx, -32
.Lcfi9:
	.cfi_offset %r14, -24
	movq	%rsi, %r14
	movl	%edi, %ebx
	callq	init_monitor
	movl	$131073, %edi           # imm = 0x20001
	callq	enqueue_signature
	leaq	-120(%rbp), %rdi
	movl	$0, -84(%rbp)
	movl	%ebx, -68(%rbp)
	movq	%r14, -80(%rbp)
	movl	$0, -20(%rbp)
	xorl	%esi, %esi
	callq	gettimeofday
# BB#1:
	movl	$131074, %edi           # imm = 0x20002
	callq	enqueue_signature
	cmpl	$2, -68(%rbp)
	jge	.LBB1_3
# BB#2:
	movl	$131075, %edi           # imm = 0x20003
	callq	enqueue_signature
	movabsq	$.L.str, %rsi
	movq	stderr, %rdi
	movb	$0, %al
	callq	fprintf
	jmp	.LBB1_19
.LBB1_3:
	movl	$131076, %edi           # imm = 0x20004
	callq	enqueue_signature
	movabsq	$.L.str.1, %rsi
	movq	-80(%rbp), %rax
	movq	8(%rax), %rdi
	callq	fopen
	movq	%rax, %rbx
# BB#4:
	movl	$131077, %edi           # imm = 0x20005
	callq	enqueue_signature
	movq	%rbx, -64(%rbp)
.LBB1_5:                                # =>This Inner Loop Header: Depth=1
	movl	$131078, %edi           # imm = 0x20006
	callq	enqueue_signature
	movabsq	$.L.str.2, %rsi
	leaq	-44(%rbp), %rdx
	movq	-64(%rbp), %rdi
	movb	$0, %al
	callq	__isoc99_fscanf
	movl	%eax, %ebx
# BB#6:                                 #   in Loop: Header=BB1_5 Depth=1
	movl	$131079, %edi           # imm = 0x20007
	callq	enqueue_signature
	xorl	%r14d, %r14d
	cmpl	$1, %ebx
	jne	.LBB1_12
# BB#7:                                 #   in Loop: Header=BB1_5 Depth=1
	movl	$131080, %edi           # imm = 0x20008
	callq	enqueue_signature
	movabsq	$.L.str.2, %rsi
	leaq	-40(%rbp), %rdx
	movq	-64(%rbp), %rdi
	movb	$0, %al
	callq	__isoc99_fscanf
	movl	%eax, %ebx
# BB#8:                                 #   in Loop: Header=BB1_5 Depth=1
	movl	$131081, %edi           # imm = 0x20009
	callq	enqueue_signature
	xorl	%r14d, %r14d
	cmpl	$1, %ebx
	jne	.LBB1_12
# BB#9:                                 #   in Loop: Header=BB1_5 Depth=1
	movl	$131082, %edi           # imm = 0x2000A
	callq	enqueue_signature
	movabsq	$.L.str.2, %rsi
	leaq	-36(%rbp), %rdx
	movq	-64(%rbp), %rdi
	movb	$0, %al
	callq	__isoc99_fscanf
	movl	%eax, %ebx
# BB#10:                                #   in Loop: Header=BB1_5 Depth=1
	movl	$131083, %edi           # imm = 0x2000B
	callq	enqueue_signature
	xorl	%r14d, %r14d
	cmpl	$1, %ebx
	jne	.LBB1_12
# BB#11:                                #   in Loop: Header=BB1_5 Depth=1
	movl	$131084, %edi           # imm = 0x2000C
	callq	enqueue_signature
	cmpl	$60000, -20(%rbp)       # imm = 0xEA60
	setl	%r14b
.LBB1_12:                               #   in Loop: Header=BB1_5 Depth=1
	movl	$131085, %edi           # imm = 0x2000D
	callq	enqueue_signature
	testb	$1, %r14b
	jne	.LBB1_13
	jmp	.LBB1_18
.LBB1_13:                               #   in Loop: Header=BB1_5 Depth=1
	movl	$131086, %edi           # imm = 0x2000E
	callq	enqueue_signature
	movsd	.LCPI1_0(%rip), %xmm1   # xmm1 = mem[0],zero
	leaq	-1440128(%rbp), %rax
	movl	-44(%rbp), %ecx
	movslq	-20(%rbp), %rdx
	imulq	$24, %rdx, %rdx
	addq	%rax, %rdx
	movl	%ecx, (%rdx)
	movl	-40(%rbp), %ecx
	movslq	-20(%rbp), %rdx
	imulq	$24, %rdx, %rdx
	addq	%rax, %rdx
	movl	%ecx, 4(%rdx)
	movl	-36(%rbp), %ecx
	movslq	-20(%rbp), %rdx
	imulq	$24, %rdx, %rdx
	addq	%rax, %rdx
	movl	%ecx, 8(%rdx)
	cvtsi2sdl	-44(%rbp), %xmm0
	callq	pow
	movsd	%xmm0, -32(%rbp)        # 8-byte Spill
# BB#14:                                #   in Loop: Header=BB1_5 Depth=1
	movl	$131087, %edi           # imm = 0x2000F
	callq	enqueue_signature
	movsd	.LCPI1_0(%rip), %xmm1   # xmm1 = mem[0],zero
	cvtsi2sdl	-40(%rbp), %xmm0
	callq	pow
	movsd	%xmm0, -56(%rbp)        # 8-byte Spill
# BB#15:                                #   in Loop: Header=BB1_5 Depth=1
	movl	$131088, %edi           # imm = 0x20010
	callq	enqueue_signature
	movsd	.LCPI1_0(%rip), %xmm1   # xmm1 = mem[0],zero
	movsd	-32(%rbp), %xmm0        # 8-byte Reload
                                        # xmm0 = mem[0],zero
	addsd	-56(%rbp), %xmm0        # 8-byte Folded Reload
	movsd	%xmm0, -32(%rbp)        # 8-byte Spill
	cvtsi2sdl	-36(%rbp), %xmm0
	callq	pow
	movsd	%xmm0, -56(%rbp)        # 8-byte Spill
# BB#16:                                #   in Loop: Header=BB1_5 Depth=1
	movl	$131089, %edi           # imm = 0x20011
	callq	enqueue_signature
	movsd	-32(%rbp), %xmm0        # 8-byte Reload
                                        # xmm0 = mem[0],zero
	addsd	-56(%rbp), %xmm0        # 8-byte Folded Reload
	callq	sqrt
	movsd	%xmm0, -32(%rbp)        # 8-byte Spill
# BB#17:                                #   in Loop: Header=BB1_5 Depth=1
	movl	$131090, %edi           # imm = 0x20012
	callq	enqueue_signature
	leaq	-1440128(%rbp), %rax
	movslq	-20(%rbp), %rcx
	imulq	$24, %rcx, %rcx
	addq	%rax, %rcx
	movsd	-32(%rbp), %xmm0        # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movsd	%xmm0, 16(%rcx)
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	.LBB1_5
.LBB1_18:
	movl	$131091, %edi           # imm = 0x20013
	callq	enqueue_signature
.LBB1_19:
	movl	$131092, %edi           # imm = 0x20014
	callq	enqueue_signature
	movabsq	$compare, %rcx
	leaq	-1440128(%rbp), %rdi
	movslq	-20(%rbp), %rsi
	movl	$24, %edx
	callq	qsort
# BB#20:
	movl	$131093, %edi           # imm = 0x20015
	callq	enqueue_signature
	movabsq	$.L.str.3, %rdi
	movb	$0, %al
	callq	printf
# BB#21:
	movl	$131094, %edi           # imm = 0x20016
	callq	enqueue_signature
	leaq	-104(%rbp), %rdi
	xorl	%esi, %esi
	callq	gettimeofday
# BB#22:
	movl	$131095, %edi           # imm = 0x20017
	callq	enqueue_signature
	movabsq	$.L.str.4, %rdi
	movq	-104(%rbp), %rax
	subq	-120(%rbp), %rax
	imulq	$1000000, %rax, %rax    # imm = 0xF4240
	movq	-96(%rbp), %rsi
	subq	-112(%rbp), %rsi
	addq	%rax, %rsi
	movb	$0, %al
	callq	printf
# BB#23:
	movl	$131096, %edi           # imm = 0x20018
	callq	enqueue_signature_with_remainder_process
	movl	$1, is_signature_queue_full
	xorl	%eax, %eax
	addq	$1440128, %rsp          # imm = 0x15F980
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.globl	CallcheckerSet          # -- Begin function CallcheckerSet
	.p2align	4, 0x90
	.type	CallcheckerSet,@function
CallcheckerSet:                         # @CallcheckerSet
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rax
.Lcfi10:
	.cfi_def_cfa_offset 16
	callq	init_monitor
	movl	$1, %edi
	callq	enqueue_signature
	movl	$1, %edi
	callq	enqueue_signature_with_call
	movl	$1, %edi
	callq	enqueue_signature_with_return
	movl	$1, %edi
	callq	enqueue_signature_with_remainder_process
	popq	%rax
	retq
.Lfunc_end2:
	.size	CallcheckerSet, .Lfunc_end2-CallcheckerSet
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Usage: qsort_large <file>\n"
	.size	.L.str, 27

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"r"
	.size	.L.str.1, 2

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"%d"
	.size	.L.str.2, 3

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	" [target finished!]\n"
	.size	.L.str.3, 21

	.type	.L.str.4,@object        # @.str.4
.L.str.4:
	.asciz	" [target] Execution Time: %ld\n"
	.size	.L.str.4, 31


	.ident	"clang version 5.0.0 (tags/RELEASE_500/final)"
	.section	".note.GNU-stack","",@progbits
