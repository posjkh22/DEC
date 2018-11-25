	.text
	.file	"testd.c"
	.globl	t1                      # -- Begin function t1
	.p2align	4, 0x90
	.type	t1,@function
t1:                                     # @t1
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
	subq	$16, %rsp
	movl	$17, %edi
	callq	enqueue_signature
	movl	$0, -4(%rbp)
	movl	$1, -12(%rbp)
	movl	$2, -16(%rbp)
	movl	$0, -8(%rbp)
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movl	$5, %edi
	callq	enqueue_signature
	cmpl	$11, -8(%rbp)
	jge	.LBB0_4
# BB#2:                                 #   in Loop: Header=BB0_1 Depth=1
	movl	$19, %edi
	callq	enqueue_signature
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	addl	-12(%rbp), %eax
	movl	%eax, -4(%rbp)
# BB#3:                                 #   in Loop: Header=BB0_1 Depth=1
	movl	$9, %edi
	callq	enqueue_signature
	movl	-8(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -8(%rbp)
	jmp	.LBB0_1
.LBB0_4:
	movl	$1, %edi
	callq	enqueue_signature_with_return
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end0:
	.size	t1, .Lfunc_end0-t1
	.cfi_endproc
                                        # -- End function
	.globl	t2                      # -- Begin function t2
	.p2align	4, 0x90
	.type	t2,@function
t2:                                     # @t2
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Lcfi3:
	.cfi_def_cfa_offset 16
.Lcfi4:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Lcfi5:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	$164, %edi
	callq	enqueue_signature_with_return
	movl	$1, -4(%rbp)
	movl	$2, -12(%rbp)
	movl	$3, -8(%rbp)
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	imull	$3, -4(%rbp), %eax
	movl	%eax, -4(%rbp)
	movl	-12(%rbp), %eax
	cltd
	idivl	-4(%rbp)
	movl	%eax, -12(%rbp)
	movl	-4(%rbp), %eax
	addl	-8(%rbp), %eax
	movl	%eax, -8(%rbp)
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	movl	-12(%rbp), %eax
	cltd
	idivl	-4(%rbp)
	movl	%eax, -12(%rbp)
	movl	-4(%rbp), %eax
	addl	-8(%rbp), %eax
	movl	%eax, -12(%rbp)
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	movl	-8(%rbp), %eax
	shll	$0, %eax
	movl	%eax, -4(%rbp)
	movl	-12(%rbp), %eax
	cltd
	idivl	-4(%rbp)
	movl	%eax, -12(%rbp)
	movl	-4(%rbp), %eax
	addl	-8(%rbp), %eax
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	movl	-8(%rbp), %eax
	shll	$0, %eax
	movl	%eax, -4(%rbp)
	movl	-12(%rbp), %eax
	cltd
	idivl	-4(%rbp)
	movl	%eax, -12(%rbp)
	movl	-4(%rbp), %eax
	addl	-8(%rbp), %eax
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end1:
	.size	t2, .Lfunc_end1-t2
	.cfi_endproc
                                        # -- End function
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Lcfi6:
	.cfi_def_cfa_offset 16
.Lcfi7:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Lcfi8:
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	callq	init_monitor
	movl	$11, %edi
	callq	enqueue_signature
	leaq	-56(%rbp), %rdi
	movl	$0, -20(%rbp)
	xorl	%esi, %esi
	callq	gettimeofday
# BB#1:
	movl	$13, %edi
	callq	enqueue_signature
	movl	$0, -4(%rbp)
	movl	$1, -8(%rbp)
	movl	$2, -12(%rbp)
	movl	$0, -16(%rbp)
.LBB2_2:                                # =>This Inner Loop Header: Depth=1
	movl	$5, %edi
	callq	enqueue_signature
	cmpl	$50, -16(%rbp)
	jge	.LBB2_6
# BB#3:                                 #   in Loop: Header=BB2_2 Depth=1
	movl	$30, %edi
	callq	enqueue_signature_with_call
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	movl	-8(%rbp), %eax
	cltd
	idivl	-4(%rbp)
	movl	%eax, -8(%rbp)
	movl	-4(%rbp), %eax
	addl	-12(%rbp), %eax
	movl	%eax, -12(%rbp)
	callq	t1
# BB#4:                                 #   in Loop: Header=BB2_2 Depth=1
	movl	$32, %edi
	callq	enqueue_signature_with_call
	movl	-4(%rbp), %eax
	addl	-8(%rbp), %eax
	movl	%eax, -4(%rbp)
	movl	-8(%rbp), %eax
	imull	-12(%rbp), %eax
	movl	%eax, -8(%rbp)
	movl	-4(%rbp), %eax
	addl	-4(%rbp), %eax
	movl	%eax, -12(%rbp)
	callq	t2
# BB#5:                                 #   in Loop: Header=BB2_2 Depth=1
	movl	$9, %edi
	callq	enqueue_signature
	movl	-16(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -16(%rbp)
	jmp	.LBB2_2
.LBB2_6:
	movl	$1, %edi
	callq	enqueue_signature
	movabsq	$.L.str, %rdi
	movb	$0, %al
	callq	printf
# BB#7:
	movl	$1, %edi
	callq	enqueue_signature
	leaq	-40(%rbp), %rdi
	xorl	%esi, %esi
	callq	gettimeofday
# BB#8:
	movl	$16, %edi
	callq	enqueue_signature
	movabsq	$.L.str.1, %rdi
	movq	-40(%rbp), %rax
	subq	-56(%rbp), %rax
	imulq	$1000000, %rax, %rax    # imm = 0xF4240
	movq	-32(%rbp), %rsi
	subq	-48(%rbp), %rsi
	addq	%rax, %rsi
	movb	$0, %al
	callq	printf
# BB#9:
	movl	$3, %edi
	callq	enqueue_signature_with_remainder_process
	movl	-20(%rbp), %eax
	addq	$64, %rsp
	popq	%rbp
	retq
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
	.cfi_endproc
                                        # -- End function
	.globl	CallcheckerSet          # -- Begin function CallcheckerSet
	.p2align	4, 0x90
	.type	CallcheckerSet,@function
CallcheckerSet:                         # @CallcheckerSet
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rax
.Lcfi9:
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
.Lfunc_end3:
	.size	CallcheckerSet, .Lfunc_end3-CallcheckerSet
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	" [target finished!]\n"
	.size	.L.str, 21

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	" [target] Execution Time: %ld\n"
	.size	.L.str.1, 31


	.ident	"clang version 5.0.0 (tags/RELEASE_500/final)"
	.section	".note.GNU-stack","",@progbits
