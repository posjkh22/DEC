	.text
	.file	"llvm-link"
	.globl	sha_init                # -- Begin function sha_init
	.p2align	4, 0x90
	.type	sha_init,@function
sha_init:                               # @sha_init
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
	pushq	%rbx
	pushq	%rax
.Lcfi3:
	.cfi_offset %rbx, -24
	movq	%rdi, %rbx
	movl	$40, %edi
	callq	enqueue_signature_with_return
	movl	$3285377520, %eax       # imm = 0xC3D2E1F0
	movl	$2562383102, %ecx       # imm = 0x98BADCFE
	movl	$4023233417, %edx       # imm = 0xEFCDAB89
	movq	%rbx, -16(%rbp)
	movq	-16(%rbp), %rsi
	movq	$1732584193, (%rsi)     # imm = 0x67452301
	movq	-16(%rbp), %rsi
	movq	%rdx, 8(%rsi)
	movq	-16(%rbp), %rdx
	movq	%rcx, 16(%rdx)
	movq	-16(%rbp), %rcx
	movq	$271733878, 24(%rcx)    # imm = 0x10325476
	movq	-16(%rbp), %rcx
	movq	%rax, 32(%rcx)
	movq	-16(%rbp), %rax
	movq	$0, 40(%rax)
	movq	-16(%rbp), %rax
	movq	$0, 48(%rax)
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end0:
	.size	sha_init, .Lfunc_end0-sha_init
	.cfi_endproc
                                        # -- End function
	.globl	sha_update              # -- Begin function sha_update
	.p2align	4, 0x90
	.type	sha_update,@function
sha_update:                             # @sha_update
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Lcfi4:
	.cfi_def_cfa_offset 16
.Lcfi5:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Lcfi6:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	subq	$24, %rsp
.Lcfi7:
	.cfi_offset %rbx, -40
.Lcfi8:
	.cfi_offset %r14, -32
.Lcfi9:
	.cfi_offset %r15, -24
	movl	%edx, %r14d
	movq	%rsi, %r15
	movq	%rdi, %rbx
	movl	$28, %edi
	callq	enqueue_signature
	movq	%rbx, -40(%rbp)
	movq	%r15, -48(%rbp)
	movl	%r14d, -28(%rbp)
	movq	-40(%rbp), %rax
	movq	40(%rax), %rax
	movslq	-28(%rbp), %rcx
	shlq	$3, %rcx
	addq	%rax, %rcx
	movq	-40(%rbp), %rax
	cmpq	40(%rax), %rcx
	jae	.LBB1_2
# BB#1:
	movl	$11, %edi
	callq	enqueue_signature
	movq	-40(%rbp), %rax
	movq	48(%rax), %rcx
	addq	$1, %rcx
	movq	%rcx, 48(%rax)
.LBB1_2:
	movl	$25, %edi
	callq	enqueue_signature
	movslq	-28(%rbp), %rax
	shlq	$3, %rax
	movq	-40(%rbp), %rcx
	addq	40(%rcx), %rax
	movq	%rax, 40(%rcx)
	movslq	-28(%rbp), %rax
	shrq	$29, %rax
	movq	-40(%rbp), %rcx
	addq	48(%rcx), %rax
	movq	%rax, 48(%rcx)
.LBB1_3:                                # =>This Inner Loop Header: Depth=1
	movl	$5, %edi
	callq	enqueue_signature
	cmpl	$64, -28(%rbp)
	jl	.LBB1_8
# BB#4:                                 #   in Loop: Header=BB1_3 Depth=1
	movl	$5, %edi
	callq	enqueue_signature
	movq	-40(%rbp), %rdi
	addq	$56, %rdi
	movq	-48(%rbp), %rsi
	movl	$64, %edx
	callq	memcpy
# BB#5:                                 #   in Loop: Header=BB1_3 Depth=1
	movl	$3, %edi
	callq	enqueue_signature_with_call
	movq	-40(%rbp), %rdi
	addq	$56, %rdi
	movl	$64, %esi
	callq	byte_reverse
# BB#6:                                 #   in Loop: Header=BB1_3 Depth=1
	movl	$3, %edi
	callq	enqueue_signature_with_call
	movq	-40(%rbp), %rdi
	callq	sha_transform
# BB#7:                                 #   in Loop: Header=BB1_3 Depth=1
	movl	$11, %edi
	callq	enqueue_signature
	movq	-48(%rbp), %rax
	addq	$64, %rax
	movq	%rax, -48(%rbp)
	movl	-28(%rbp), %eax
	subl	$64, %eax
	movl	%eax, -28(%rbp)
	jmp	.LBB1_3
.LBB1_8:
	movl	$7, %edi
	callq	enqueue_signature
	movq	-40(%rbp), %rdi
	addq	$56, %rdi
	movq	-48(%rbp), %rsi
	movslq	-28(%rbp), %rdx
	callq	memcpy
# BB#9:
	movl	$1, %edi
	callq	enqueue_signature_with_return
	addq	$24, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end1:
	.size	sha_update, .Lfunc_end1-sha_update
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function byte_reverse
	.type	byte_reverse,@function
byte_reverse:                           # @byte_reverse
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Lcfi10:
	.cfi_def_cfa_offset 16
.Lcfi11:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Lcfi12:
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	subq	$32, %rsp
.Lcfi13:
	.cfi_offset %rbx, -32
.Lcfi14:
	.cfi_offset %r14, -24
	movl	%esi, %r14d
	movq	%rdi, %rbx
	movl	$25, %edi
	callq	enqueue_signature
	movq	%rbx, -48(%rbp)
	movl	%r14d, -40(%rbp)
	movslq	-40(%rbp), %rax
	shrq	$3, %rax
	movl	%eax, -40(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, -32(%rbp)
	movl	$0, -36(%rbp)
.LBB2_1:                                # =>This Inner Loop Header: Depth=1
	movl	$7, %edi
	callq	enqueue_signature
	movl	-36(%rbp), %eax
	cmpl	-40(%rbp), %eax
	jge	.LBB2_4
# BB#2:                                 #   in Loop: Header=BB2_1 Depth=1
	movl	$62, %edi
	callq	enqueue_signature
	movq	-32(%rbp), %rax
	movb	(%rax), %al
	movb	%al, -20(%rbp)
	movq	-32(%rbp), %rax
	movb	1(%rax), %al
	movb	%al, -19(%rbp)
	movq	-32(%rbp), %rax
	movb	2(%rax), %al
	movb	%al, -18(%rbp)
	movq	-32(%rbp), %rax
	movb	3(%rax), %al
	movb	%al, -17(%rbp)
	movb	-17(%rbp), %al
	movq	-32(%rbp), %rcx
	movb	%al, (%rcx)
	movb	-18(%rbp), %al
	movq	-32(%rbp), %rcx
	movb	%al, 1(%rcx)
	movb	-19(%rbp), %al
	movq	-32(%rbp), %rcx
	movb	%al, 2(%rcx)
	movb	-20(%rbp), %al
	movq	-32(%rbp), %rcx
	movb	%al, 3(%rcx)
	movq	-32(%rbp), %rax
	addq	$8, %rax
	movq	%rax, -32(%rbp)
# BB#3:                                 #   in Loop: Header=BB2_1 Depth=1
	movl	$9, %edi
	callq	enqueue_signature
	movl	-36(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -36(%rbp)
	jmp	.LBB2_1
.LBB2_4:
	movl	$1, %edi
	callq	enqueue_signature_with_return
	addq	$32, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end2:
	.size	byte_reverse, .Lfunc_end2-byte_reverse
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function sha_transform
	.type	sha_transform,@function
sha_transform:                          # @sha_transform
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Lcfi15:
	.cfi_def_cfa_offset 16
.Lcfi16:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Lcfi17:
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$712, %rsp              # imm = 0x2C8
.Lcfi18:
	.cfi_offset %rbx, -24
	movq	%rdi, %rbx
	movl	$16, %edi
	callq	enqueue_signature
	movq	%rbx, -56(%rbp)
	movl	$0, -12(%rbp)
.LBB3_1:                                # =>This Inner Loop Header: Depth=1
	movl	$5, %edi
	callq	enqueue_signature
	cmpl	$16, -12(%rbp)
	jge	.LBB3_4
# BB#2:                                 #   in Loop: Header=BB3_1 Depth=1
	movl	$12, %edi
	callq	enqueue_signature
	movq	-56(%rbp), %rax
	movslq	-12(%rbp), %rcx
	movq	56(%rax,%rcx,8), %rax
	movslq	-12(%rbp), %rcx
	movq	%rax, -720(%rbp,%rcx,8)
# BB#3:                                 #   in Loop: Header=BB3_1 Depth=1
	movl	$9, %edi
	callq	enqueue_signature
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	.LBB3_1
.LBB3_4:
	movl	$4, %edi
	callq	enqueue_signature
	movl	$16, -12(%rbp)
.LBB3_5:                                # =>This Inner Loop Header: Depth=1
	movl	$5, %edi
	callq	enqueue_signature
	cmpl	$80, -12(%rbp)
	jge	.LBB3_8
# BB#6:                                 #   in Loop: Header=BB3_5 Depth=1
	movl	$22, %edi
	callq	enqueue_signature
	movl	-12(%rbp), %eax
	subl	$3, %eax
	cltq
	movq	-720(%rbp,%rax,8), %rax
	movl	-12(%rbp), %ecx
	subl	$8, %ecx
	movslq	%ecx, %rcx
	xorq	-720(%rbp,%rcx,8), %rax
	movl	-12(%rbp), %ecx
	subl	$14, %ecx
	movslq	%ecx, %rcx
	xorq	-720(%rbp,%rcx,8), %rax
	movl	-12(%rbp), %ecx
	subl	$16, %ecx
	movslq	%ecx, %rcx
	xorq	-720(%rbp,%rcx,8), %rax
	movslq	-12(%rbp), %rcx
	movq	%rax, -720(%rbp,%rcx,8)
# BB#7:                                 #   in Loop: Header=BB3_5 Depth=1
	movl	$9, %edi
	callq	enqueue_signature
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	.LBB3_5
.LBB3_8:
	movl	$39, %edi
	callq	enqueue_signature
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
	movq	-56(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-56(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -48(%rbp)
	movq	-56(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -40(%rbp)
	movq	-56(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -64(%rbp)
	movl	$0, -12(%rbp)
.LBB3_9:                                # =>This Inner Loop Header: Depth=1
	movl	$5, %edi
	callq	enqueue_signature
	cmpl	$20, -12(%rbp)
	jge	.LBB3_12
# BB#10:                                #   in Loop: Header=BB3_9 Depth=1
	movl	$61, %edi
	callq	enqueue_signature
	movq	-32(%rbp), %rax
	shlq	$5, %rax
	movq	-32(%rbp), %rcx
	shrq	$27, %rcx
	orq	%rax, %rcx
	movq	-24(%rbp), %rax
	andq	-48(%rbp), %rax
	movq	-24(%rbp), %rdx
	xorq	$-1, %rdx
	andq	-40(%rbp), %rdx
	orq	%rax, %rdx
	addq	%rcx, %rdx
	addq	-64(%rbp), %rdx
	movslq	-12(%rbp), %rax
	addq	-720(%rbp,%rax,8), %rdx
	addq	$1518500249, %rdx       # imm = 0x5A827999
	movq	%rdx, -72(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -64(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, -40(%rbp)
	movq	-24(%rbp), %rax
	shlq	$30, %rax
	movq	-24(%rbp), %rcx
	shrq	$2, %rcx
	orq	%rax, %rcx
	movq	%rcx, -48(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-72(%rbp), %rax
	movq	%rax, -32(%rbp)
# BB#11:                                #   in Loop: Header=BB3_9 Depth=1
	movl	$9, %edi
	callq	enqueue_signature
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	.LBB3_9
.LBB3_12:
	movl	$4, %edi
	callq	enqueue_signature
	movl	$20, -12(%rbp)
.LBB3_13:                               # =>This Inner Loop Header: Depth=1
	movl	$5, %edi
	callq	enqueue_signature
	cmpl	$40, -12(%rbp)
	jge	.LBB3_16
# BB#14:                                #   in Loop: Header=BB3_13 Depth=1
	movl	$59, %edi
	callq	enqueue_signature
	movq	-32(%rbp), %rax
	shlq	$5, %rax
	movq	-32(%rbp), %rcx
	shrq	$27, %rcx
	orq	%rax, %rcx
	movq	-24(%rbp), %rax
	xorq	-48(%rbp), %rax
	xorq	-40(%rbp), %rax
	addq	%rcx, %rax
	addq	-64(%rbp), %rax
	movslq	-12(%rbp), %rcx
	addq	-720(%rbp,%rcx,8), %rax
	addq	$1859775393, %rax       # imm = 0x6ED9EBA1
	movq	%rax, -72(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -64(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, -40(%rbp)
	movq	-24(%rbp), %rax
	shlq	$30, %rax
	movq	-24(%rbp), %rcx
	shrq	$2, %rcx
	orq	%rax, %rcx
	movq	%rcx, -48(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-72(%rbp), %rax
	movq	%rax, -32(%rbp)
# BB#15:                                #   in Loop: Header=BB3_13 Depth=1
	movl	$9, %edi
	callq	enqueue_signature
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	.LBB3_13
.LBB3_16:
	movl	$4, %edi
	callq	enqueue_signature
	movl	$40, -12(%rbp)
.LBB3_17:                               # =>This Inner Loop Header: Depth=1
	movl	$5, %edi
	callq	enqueue_signature
	cmpl	$60, -12(%rbp)
	jge	.LBB3_20
# BB#18:                                #   in Loop: Header=BB3_17 Depth=1
	movl	$65, %edi
	callq	enqueue_signature
	movl	$2400959708, %eax       # imm = 0x8F1BBCDC
	movq	-32(%rbp), %rcx
	shlq	$5, %rcx
	movq	-32(%rbp), %rdx
	shrq	$27, %rdx
	orq	%rcx, %rdx
	movq	-24(%rbp), %rcx
	andq	-48(%rbp), %rcx
	movq	-24(%rbp), %rsi
	andq	-40(%rbp), %rsi
	orq	%rcx, %rsi
	movq	-48(%rbp), %rcx
	andq	-40(%rbp), %rcx
	orq	%rsi, %rcx
	addq	%rdx, %rcx
	addq	-64(%rbp), %rcx
	movslq	-12(%rbp), %rdx
	addq	-720(%rbp,%rdx,8), %rcx
	addq	%rax, %rcx
	movq	%rcx, -72(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -64(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, -40(%rbp)
	movq	-24(%rbp), %rax
	shlq	$30, %rax
	movq	-24(%rbp), %rcx
	shrq	$2, %rcx
	orq	%rax, %rcx
	movq	%rcx, -48(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-72(%rbp), %rax
	movq	%rax, -32(%rbp)
# BB#19:                                #   in Loop: Header=BB3_17 Depth=1
	movl	$9, %edi
	callq	enqueue_signature
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	.LBB3_17
.LBB3_20:
	movl	$4, %edi
	callq	enqueue_signature
	movl	$60, -12(%rbp)
.LBB3_21:                               # =>This Inner Loop Header: Depth=1
	movl	$5, %edi
	callq	enqueue_signature
	cmpl	$80, -12(%rbp)
	jge	.LBB3_24
# BB#22:                                #   in Loop: Header=BB3_21 Depth=1
	movl	$59, %edi
	callq	enqueue_signature
	movl	$3395469782, %eax       # imm = 0xCA62C1D6
	movq	-32(%rbp), %rcx
	shlq	$5, %rcx
	movq	-32(%rbp), %rdx
	shrq	$27, %rdx
	orq	%rcx, %rdx
	movq	-24(%rbp), %rcx
	xorq	-48(%rbp), %rcx
	xorq	-40(%rbp), %rcx
	addq	%rdx, %rcx
	addq	-64(%rbp), %rcx
	movslq	-12(%rbp), %rdx
	addq	-720(%rbp,%rdx,8), %rcx
	addq	%rax, %rcx
	movq	%rcx, -72(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -64(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, -40(%rbp)
	movq	-24(%rbp), %rax
	shlq	$30, %rax
	movq	-24(%rbp), %rcx
	shrq	$2, %rcx
	orq	%rax, %rcx
	movq	%rcx, -48(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-72(%rbp), %rax
	movq	%rax, -32(%rbp)
# BB#23:                                #   in Loop: Header=BB3_21 Depth=1
	movl	$9, %edi
	callq	enqueue_signature
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	.LBB3_21
.LBB3_24:
	movl	$61, %edi
	callq	enqueue_signature_with_return
	movq	-32(%rbp), %rax
	movq	-56(%rbp), %rcx
	addq	(%rcx), %rax
	movq	%rax, (%rcx)
	movq	-24(%rbp), %rax
	movq	-56(%rbp), %rcx
	addq	8(%rcx), %rax
	movq	%rax, 8(%rcx)
	movq	-48(%rbp), %rax
	movq	-56(%rbp), %rcx
	addq	16(%rcx), %rax
	movq	%rax, 16(%rcx)
	movq	-40(%rbp), %rax
	movq	-56(%rbp), %rcx
	addq	24(%rcx), %rax
	movq	%rax, 24(%rcx)
	movq	-64(%rbp), %rax
	movq	-56(%rbp), %rcx
	addq	32(%rcx), %rax
	movq	%rax, 32(%rcx)
	addq	$712, %rsp              # imm = 0x2C8
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end3:
	.size	sha_transform, .Lfunc_end3-sha_transform
	.cfi_endproc
                                        # -- End function
	.globl	sha_final               # -- Begin function sha_final
	.p2align	4, 0x90
	.type	sha_final,@function
sha_final:                              # @sha_final
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Lcfi19:
	.cfi_def_cfa_offset 16
.Lcfi20:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Lcfi21:
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$40, %rsp
.Lcfi22:
	.cfi_offset %rbx, -24
	movq	%rdi, %rbx
	movl	$44, %edi
	callq	enqueue_signature
	movq	%rbx, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	48(%rax), %rax
	movq	%rax, -40(%rbp)
	movq	-32(%rbp), %rax
	shrq	$3, %rax
	andq	$63, %rax
	movl	%eax, -12(%rbp)
	movq	-24(%rbp), %rax
	movl	-12(%rbp), %ecx
	leal	1(%rcx), %edx
	movl	%edx, -12(%rbp)
	movslq	%ecx, %rcx
	movb	$-128, 56(%rax,%rcx)
	cmpl	$56, -12(%rbp)
	jle	.LBB4_5
# BB#1:
	movl	$7, %edi
	callq	enqueue_signature
	movl	$64, %eax
	movq	-24(%rbp), %rcx
	addq	$56, %rcx
	movslq	-12(%rbp), %rdi
	addq	%rcx, %rdi
	subl	-12(%rbp), %eax
	movslq	%eax, %rdx
	xorl	%esi, %esi
	callq	memset
# BB#2:
	movl	$3, %edi
	callq	enqueue_signature_with_call
	movq	-24(%rbp), %rdi
	addq	$56, %rdi
	movl	$64, %esi
	callq	byte_reverse
# BB#3:
	movl	$3, %edi
	callq	enqueue_signature_with_call
	movq	-24(%rbp), %rdi
	callq	sha_transform
# BB#4:
	movl	$3, %edi
	callq	enqueue_signature
	movq	-24(%rbp), %rdi
	addq	$56, %rdi
	xorl	%esi, %esi
	movl	$56, %edx
	callq	memset
	jmp	.LBB4_6
.LBB4_5:
	movl	$7, %edi
	callq	enqueue_signature
	movl	$56, %eax
	movq	-24(%rbp), %rcx
	addq	$56, %rcx
	movslq	-12(%rbp), %rdi
	addq	%rcx, %rdi
	subl	-12(%rbp), %eax
	movslq	%eax, %rdx
	xorl	%esi, %esi
	callq	memset
.LBB4_6:
	movl	$3, %edi
	callq	enqueue_signature_with_call
	movq	-24(%rbp), %rdi
	addq	$56, %rdi
	movl	$64, %esi
	callq	byte_reverse
# BB#7:
	movl	$17, %edi
	callq	enqueue_signature_with_call
	movq	-40(%rbp), %rax
	movq	-24(%rbp), %rcx
	movq	%rax, 168(%rcx)
	movq	-32(%rbp), %rax
	movq	-24(%rbp), %rcx
	movq	%rax, 176(%rcx)
	movq	-24(%rbp), %rdi
	callq	sha_transform
# BB#8:
	movl	$1, %edi
	callq	enqueue_signature_with_return
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end4:
	.size	sha_final, .Lfunc_end4-sha_final
	.cfi_endproc
                                        # -- End function
	.globl	sha_stream              # -- Begin function sha_stream
	.p2align	4, 0x90
	.type	sha_stream,@function
sha_stream:                             # @sha_stream
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Lcfi23:
	.cfi_def_cfa_offset 16
.Lcfi24:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Lcfi25:
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	subq	$8224, %rsp             # imm = 0x2020
.Lcfi26:
	.cfi_offset %rbx, -32
.Lcfi27:
	.cfi_offset %r14, -24
	movq	%rsi, %r14
	movq	%rdi, %rbx
	movl	$13, %edi
	callq	enqueue_signature_with_call
	movq	%rbx, -24(%rbp)
	movq	%r14, -40(%rbp)
	movq	-24(%rbp), %rdi
	callq	sha_init
.LBB5_1:                                # =>This Inner Loop Header: Depth=1
	movl	$3, %edi
	callq	enqueue_signature
	leaq	-8240(%rbp), %rdi
	movq	-40(%rbp), %rcx
	movl	$1, %esi
	movl	$8192, %edx             # imm = 0x2000
	callq	fread
	movq	%rax, %rbx
# BB#2:                                 #   in Loop: Header=BB5_1 Depth=1
	movl	$6, %edi
	callq	enqueue_signature
	movl	%ebx, -28(%rbp)
	cmpl	$0, %ebx
	jle	.LBB5_4
# BB#3:                                 #   in Loop: Header=BB5_1 Depth=1
	movl	$5, %edi
	callq	enqueue_signature_with_call
	leaq	-8240(%rbp), %rsi
	movq	-24(%rbp), %rdi
	movl	-28(%rbp), %edx
	callq	sha_update
	jmp	.LBB5_1
.LBB5_4:
	movl	$3, %edi
	callq	enqueue_signature_with_call
	movq	-24(%rbp), %rdi
	callq	sha_final
# BB#5:
	movl	$1, %edi
	callq	enqueue_signature_with_return
	addq	$8224, %rsp             # imm = 0x2020
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end5:
	.size	sha_stream, .Lfunc_end5-sha_stream
	.cfi_endproc
                                        # -- End function
	.globl	sha_print               # -- Begin function sha_print
	.p2align	4, 0x90
	.type	sha_print,@function
sha_print:                              # @sha_print
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Lcfi28:
	.cfi_def_cfa_offset 16
.Lcfi29:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Lcfi30:
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
.Lcfi31:
	.cfi_offset %rbx, -24
	movq	%rdi, %rbx
	movl	$5, %edi
	callq	enqueue_signature_with_return
	movq	%rbx, -16(%rbp)
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end6:
	.size	sha_print, .Lfunc_end6-sha_print
	.cfi_endproc
                                        # -- End function
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Lcfi32:
	.cfi_def_cfa_offset 16
.Lcfi33:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Lcfi34:
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	subq	$240, %rsp
.Lcfi35:
	.cfi_offset %rbx, -32
.Lcfi36:
	.cfi_offset %r14, -24
	movq	%rsi, %r14
	movl	%edi, %ebx
	callq	init_monitor
	movl	$17, %edi
	callq	enqueue_signature
	leaq	-64(%rbp), %rdi
	movl	$0, -32(%rbp)
	movl	%ebx, -28(%rbp)
	movq	%r14, -72(%rbp)
	xorl	%esi, %esi
	callq	gettimeofday
# BB#1:
	movl	$1, %edi
	callq	enqueue_signature
	movabsq	$.L.str, %rdi
	movabsq	$.L.str.1, %rsi
	callq	fopen
	movq	%rax, %rbx
# BB#2:
	movl	$6, %edi
	callq	enqueue_signature_with_call
	leaq	-256(%rbp), %rdi
	movq	%rbx, -24(%rbp)
	movq	-24(%rbp), %rsi
	callq	sha_stream
# BB#3:
	movl	$1, %edi
	callq	enqueue_signature_with_call
	leaq	-256(%rbp), %rdi
	callq	sha_print
# BB#4:
	movl	$3, %edi
	callq	enqueue_signature
	movq	-24(%rbp), %rdi
	callq	fclose
# BB#5:
	movl	$1, %edi
	callq	enqueue_signature
	movabsq	$.L.str.2, %rdi
	movb	$0, %al
	callq	printf
# BB#6:
	movl	$1, %edi
	callq	enqueue_signature
	leaq	-48(%rbp), %rdi
	xorl	%esi, %esi
	callq	gettimeofday
# BB#7:
	movl	$16, %edi
	callq	enqueue_signature
	movabsq	$.L.str.3, %rdi
	movq	-48(%rbp), %rax
	subq	-64(%rbp), %rax
	imulq	$1000000, %rax, %rax    # imm = 0xF4240
	movq	-40(%rbp), %rsi
	subq	-56(%rbp), %rsi
	addq	%rax, %rsi
	movb	$0, %al
	callq	printf
# BB#8:
	movl	$4, %edi
	callq	enqueue_signature_with_remainder_process
	movl	$1, is_signature_queue_full
	xorl	%eax, %eax
	addq	$240, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end7:
	.size	main, .Lfunc_end7-main
	.cfi_endproc
                                        # -- End function
	.globl	CallcheckerSet          # -- Begin function CallcheckerSet
	.p2align	4, 0x90
	.type	CallcheckerSet,@function
CallcheckerSet:                         # @CallcheckerSet
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rax
.Lcfi37:
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
.Lfunc_end8:
	.size	CallcheckerSet, .Lfunc_end8-CallcheckerSet
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"input_small.asc"
	.size	.L.str, 16

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"rb"
	.size	.L.str.1, 3

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	" [target finished!]\n"
	.size	.L.str.2, 21

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	" [target] Execution Time: %ld\n"
	.size	.L.str.3, 31


	.ident	"clang version 5.0.0 (tags/RELEASE_500/final)"
	.ident	"clang version 5.0.0 (tags/RELEASE_500/final)"
	.section	".note.GNU-stack","",@progbits
