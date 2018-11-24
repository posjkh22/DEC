	.text
	.file	"blocked.c"
	.globl	calculation_type_A      # -- Begin function calculation_type_A
	.p2align	4, 0x90
	.type	calculation_type_A,@function
calculation_type_A:                     # @calculation_type_A
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
	movl	$65537, %edi            # imm = 0x10001
	callq	enqueue_signature
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movl	$65538, %edi            # imm = 0x10002
	callq	enqueue_signature
	cmpl	$30, -8(%rbp)
	jge	.LBB0_4
# BB#2:                                 #   in Loop: Header=BB0_1 Depth=1
	movl	$65539, %edi            # imm = 0x10003
	callq	enqueue_signature
	movl	-8(%rbp), %eax
	addl	-4(%rbp), %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	shll	$1, %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -4(%rbp)
# BB#3:                                 #   in Loop: Header=BB0_1 Depth=1
	movl	$65540, %edi            # imm = 0x10004
	callq	enqueue_signature
	movl	-8(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -8(%rbp)
	jmp	.LBB0_1
.LBB0_4:
	movl	$65541, %edi            # imm = 0x10005
	callq	enqueue_signature_with_return
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end0:
	.size	calculation_type_A, .Lfunc_end0-calculation_type_A
	.cfi_endproc
                                        # -- End function
	.globl	calculation_type_B      # -- Begin function calculation_type_B
	.p2align	4, 0x90
	.type	calculation_type_B,@function
calculation_type_B:                     # @calculation_type_B
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
	movl	$131073, %edi           # imm = 0x20001
	callq	enqueue_signature
	movl	$1, -8(%rbp)
	movl	$1, -4(%rbp)
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	movl	$131074, %edi           # imm = 0x20002
	callq	enqueue_signature
	cmpl	$50, -4(%rbp)
	jge	.LBB1_4
# BB#2:                                 #   in Loop: Header=BB1_1 Depth=1
	movl	$131075, %edi           # imm = 0x20003
	callq	enqueue_signature
	movl	-4(%rbp), %eax
	imull	-8(%rbp), %eax
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addl	$2, %eax
	movl	%eax, -8(%rbp)
# BB#3:                                 #   in Loop: Header=BB1_1 Depth=1
	movl	$131076, %edi           # imm = 0x20004
	callq	enqueue_signature
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	jmp	.LBB1_1
.LBB1_4:
	movl	$131077, %edi           # imm = 0x20005
	callq	enqueue_signature_with_return
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end1:
	.size	calculation_type_B, .Lfunc_end1-calculation_type_B
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
	pushq	%rbx
	subq	$104, %rsp
.Lcfi9:
	.cfi_offset %rbx, -24
	callq	init_monitor
	movl	$196609, %edi           # imm = 0x30001
	callq	enqueue_signature
	leaq	-80(%rbp), %rdi
	movl	$0, -44(%rbp)
	xorl	%esi, %esi
	callq	gettimeofday
# BB#1:
	movl	$196610, %edi           # imm = 0x30002
	callq	enqueue_signature
	movl	$50, -20(%rbp)
	movl	$0, -16(%rbp)
.LBB2_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_7 Depth 2
	movl	$196611, %edi           # imm = 0x30003
	callq	enqueue_signature
	movl	-16(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jge	.LBB2_21
# BB#3:                                 #   in Loop: Header=BB2_2 Depth=1
	movl	$196612, %edi           # imm = 0x30004
	callq	enqueue_signature_with_call
	callq	calculation_type_A
# BB#4:                                 #   in Loop: Header=BB2_2 Depth=1
	movl	$196613, %edi           # imm = 0x30005
	callq	enqueue_signature
	movabsq	$.L.str, %rdi
	movabsq	$.L.str.1, %rsi
	callq	fopen
	movq	%rax, %rbx
# BB#5:                                 #   in Loop: Header=BB2_2 Depth=1
	movl	$196614, %edi           # imm = 0x30006
	callq	enqueue_signature_with_call
	movq	%rbx, -40(%rbp)
	callq	calculation_type_B
# BB#6:                                 #   in Loop: Header=BB2_2 Depth=1
	movl	$196615, %edi           # imm = 0x30007
	callq	enqueue_signature
	movl	$0, -12(%rbp)
.LBB2_7:                                #   Parent Loop BB2_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	$196616, %edi           # imm = 0x30008
	callq	enqueue_signature
	cmpl	$50, -12(%rbp)
	jge	.LBB2_18
# BB#8:                                 #   in Loop: Header=BB2_7 Depth=2
	movl	$196617, %edi           # imm = 0x30009
	callq	enqueue_signature_with_call
	callq	calculation_type_B
# BB#9:                                 #   in Loop: Header=BB2_7 Depth=2
	movl	$196618, %edi           # imm = 0x3000A
	callq	enqueue_signature
	leaq	-112(%rbp), %rdi
	movq	-40(%rbp), %rdx
	movl	$20, %esi
	callq	fgets
# BB#10:                                #   in Loop: Header=BB2_7 Depth=2
	movl	$196619, %edi           # imm = 0x3000B
	callq	enqueue_signature_with_call
	callq	calculation_type_A
# BB#11:                                #   in Loop: Header=BB2_7 Depth=2
	movl	$196620, %edi           # imm = 0x3000C
	callq	enqueue_signature
	movabsq	$.L.str.2, %rdi
	movabsq	$.L.str.3, %rsi
	callq	fopen
	movq	%rax, %rbx
# BB#12:                                #   in Loop: Header=BB2_7 Depth=2
	movl	$196621, %edi           # imm = 0x3000D
	callq	enqueue_signature_with_call
	movq	%rbx, -32(%rbp)
	callq	calculation_type_B
# BB#13:                                #   in Loop: Header=BB2_7 Depth=2
	movl	$196622, %edi           # imm = 0x3000E
	callq	enqueue_signature
	leaq	-112(%rbp), %rdi
	movq	-32(%rbp), %rsi
	callq	fputs
# BB#14:                                #   in Loop: Header=BB2_7 Depth=2
	movl	$196623, %edi           # imm = 0x3000F
	callq	enqueue_signature_with_call
	callq	calculation_type_A
# BB#15:                                #   in Loop: Header=BB2_7 Depth=2
	movl	$196624, %edi           # imm = 0x30010
	callq	enqueue_signature
	movq	-32(%rbp), %rdi
	callq	fclose
# BB#16:                                #   in Loop: Header=BB2_7 Depth=2
	movl	$196625, %edi           # imm = 0x30011
	callq	enqueue_signature_with_call
	callq	calculation_type_B
# BB#17:                                #   in Loop: Header=BB2_7 Depth=2
	movl	$196626, %edi           # imm = 0x30012
	callq	enqueue_signature
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	.LBB2_7
.LBB2_18:                               #   in Loop: Header=BB2_2 Depth=1
	movl	$196627, %edi           # imm = 0x30013
	callq	enqueue_signature_with_call
	callq	calculation_type_A
# BB#19:                                #   in Loop: Header=BB2_2 Depth=1
	movl	$196628, %edi           # imm = 0x30014
	callq	enqueue_signature
	movq	-40(%rbp), %rdi
	callq	fclose
# BB#20:                                #   in Loop: Header=BB2_2 Depth=1
	movl	$196629, %edi           # imm = 0x30015
	callq	enqueue_signature
	movl	-16(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -16(%rbp)
	jmp	.LBB2_2
.LBB2_21:
	movl	$196630, %edi           # imm = 0x30016
	callq	enqueue_signature
	movabsq	$.L.str.4, %rdi
	movb	$0, %al
	callq	printf
# BB#22:
	movl	$196631, %edi           # imm = 0x30017
	callq	enqueue_signature
	leaq	-64(%rbp), %rdi
	xorl	%esi, %esi
	callq	gettimeofday
# BB#23:
	movl	$196632, %edi           # imm = 0x30018
	callq	enqueue_signature
	movabsq	$.L.str.5, %rdi
	movq	-64(%rbp), %rax
	subq	-80(%rbp), %rax
	imulq	$1000000, %rax, %rax    # imm = 0xF4240
	movq	-56(%rbp), %rsi
	subq	-72(%rbp), %rsi
	addq	%rax, %rsi
	movb	$0, %al
	callq	printf
# BB#24:
	movl	$196633, %edi           # imm = 0x30019
	callq	enqueue_signature_with_remainder_process
	movl	$1, is_signature_queue_full
	xorl	%eax, %eax
	addq	$104, %rsp
	popq	%rbx
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
.Lfunc_end3:
	.size	CallcheckerSet, .Lfunc_end3-CallcheckerSet
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"hello.txt"
	.size	.L.str, 10

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"r"
	.size	.L.str.1, 2

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"write.txt"
	.size	.L.str.2, 10

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	"a"
	.size	.L.str.3, 2

	.type	.L.str.4,@object        # @.str.4
.L.str.4:
	.asciz	" [target finished!]\n"
	.size	.L.str.4, 21

	.type	.L.str.5,@object        # @.str.5
.L.str.5:
	.asciz	" [target] Execution Time: %ld\n"
	.size	.L.str.5, 31


	.ident	"clang version 5.0.0 (tags/RELEASE_500/final)"
	.section	".note.GNU-stack","",@progbits
