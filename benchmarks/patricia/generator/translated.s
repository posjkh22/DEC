	.text
	.file	"llvm-link"
	.globl	pat_insert              # -- Begin function pat_insert
	.p2align	4, 0x90
	.type	pat_insert,@function
pat_insert:                             # @pat_insert
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
	subq	$64, %rsp
.Lcfi3:
	.cfi_offset %rbx, -32
.Lcfi4:
	.cfi_offset %r14, -24
	movq	%rsi, %r14
	movq	%rdi, %rbx
	movl	$19, %edi
	callq	enqueue_signature
	movq	%rbx, -32(%rbp)
	movq	%r14, -48(%rbp)
	cmpq	$0, -48(%rbp)
	je	.LBB0_3
# BB#1:
	movl	$5, %edi
	callq	enqueue_signature
	cmpq	$0, -32(%rbp)
	je	.LBB0_3
# BB#2:
	movl	$7, %edi
	callq	enqueue_signature
	movq	-32(%rbp), %rax
	cmpq	$0, 8(%rax)
	jne	.LBB0_4
.LBB0_3:
	movl	$4, %edi
	callq	enqueue_signature
	movq	$0, -72(%rbp)
	jmp	.LBB0_51
.LBB0_4:
	movl	$19, %edi
	callq	enqueue_signature
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rax
	movq	-32(%rbp), %rcx
	andq	(%rcx), %rax
	movq	%rax, (%rcx)
	movq	-48(%rbp), %rax
	movq	%rax, -40(%rbp)
.LBB0_5:                                # =>This Inner Loop Header: Depth=1
	movl	$16, %edi
	callq	enqueue_signature_with_call
	movq	-40(%rbp), %rax
	movsbl	17(%rax), %eax
	movl	%eax, -20(%rbp)
	movq	-40(%rbp), %rax
	movsbl	17(%rax), %edi
	movq	-32(%rbp), %rax
	movq	(%rax), %rsi
	callq	bit
	movq	%rax, %rbx
# BB#6:                                 #   in Loop: Header=BB0_5 Depth=1
	movl	$3, %edi
	callq	enqueue_signature
	cmpq	$0, %rbx
	je	.LBB0_8
# BB#7:                                 #   in Loop: Header=BB0_5 Depth=1
	movl	$5, %edi
	callq	enqueue_signature
	movq	-40(%rbp), %rax
	movq	32(%rax), %rbx
	jmp	.LBB0_9
.LBB0_8:                                #   in Loop: Header=BB0_5 Depth=1
	movl	$5, %edi
	callq	enqueue_signature
	movq	-40(%rbp), %rax
	movq	24(%rax), %rbx
.LBB0_9:                                #   in Loop: Header=BB0_5 Depth=1
	movl	$4, %edi
	callq	enqueue_signature
	movq	%rbx, -40(%rbp)
# BB#10:                                #   in Loop: Header=BB0_5 Depth=1
	movl	$9, %edi
	callq	enqueue_signature
	movl	-20(%rbp), %eax
	movq	-40(%rbp), %rcx
	movsbl	17(%rcx), %ecx
	cmpl	%ecx, %eax
	jl	.LBB0_5
# BB#11:
	movl	$11, %edi
	callq	enqueue_signature
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	-40(%rbp), %rcx
	cmpq	(%rcx), %rax
	jne	.LBB0_36
# BB#12:
	movl	$4, %edi
	callq	enqueue_signature
	movl	$0, -20(%rbp)
.LBB0_13:                               # =>This Inner Loop Header: Depth=1
	movl	$9, %edi
	callq	enqueue_signature
	movl	-20(%rbp), %eax
	movq	-40(%rbp), %rcx
	movzbl	16(%rcx), %ecx
	cmpl	%ecx, %eax
	jge	.LBB0_20
# BB#14:                                #   in Loop: Header=BB0_13 Depth=1
	movl	$17, %edi
	callq	enqueue_signature
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rax
	movq	-40(%rbp), %rcx
	movq	8(%rcx), %rcx
	movslq	-20(%rbp), %rdx
	shlq	$4, %rdx
	addq	%rcx, %rdx
	cmpq	(%rdx), %rax
	jne	.LBB0_18
# BB#15:
	movl	$20, %edi
	callq	enqueue_signature
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rax
	movq	-40(%rbp), %rcx
	movq	8(%rcx), %rcx
	movslq	-20(%rbp), %rdx
	shlq	$4, %rdx
	addq	%rcx, %rdx
	movq	%rax, 8(%rdx)
	movq	-32(%rbp), %rax
	movq	8(%rax), %rdi
	callq	free
# BB#16:
	movl	$3, %edi
	callq	enqueue_signature
	movq	-32(%rbp), %rdi
	callq	free
# BB#17:
	movl	$9, %edi
	callq	enqueue_signature
	movq	$0, -32(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -72(%rbp)
	jmp	.LBB0_51
.LBB0_18:                               #   in Loop: Header=BB0_13 Depth=1
	movl	$1, %edi
	callq	enqueue_signature
# BB#19:                                #   in Loop: Header=BB0_13 Depth=1
	movl	$9, %edi
	callq	enqueue_signature
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	.LBB0_13
.LBB0_20:
	movl	$12, %edi
	callq	enqueue_signature
	movq	-40(%rbp), %rax
	movzbl	16(%rax), %eax
	addl	$1, %eax
	movslq	%eax, %rdi
	shlq	$4, %rdi
	callq	malloc
	movq	%rax, %rbx
# BB#21:
	movl	$15, %edi
	callq	enqueue_signature
	movq	%rbx, -80(%rbp)
	movl	$0, -60(%rbp)
	movl	$0, -20(%rbp)
	movq	-80(%rbp), %rax
	movq	%rax, -56(%rbp)
.LBB0_22:                               # =>This Inner Loop Header: Depth=1
	movl	$9, %edi
	callq	enqueue_signature
	movl	-20(%rbp), %eax
	movq	-40(%rbp), %rcx
	movzbl	16(%rcx), %ecx
	cmpl	%ecx, %eax
	jge	.LBB0_30
# BB#23:                                #   in Loop: Header=BB0_22 Depth=1
	movl	$17, %edi
	callq	enqueue_signature
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rax
	movq	-40(%rbp), %rcx
	movq	8(%rcx), %rcx
	movslq	-20(%rbp), %rdx
	shlq	$4, %rdx
	addq	%rcx, %rdx
	cmpq	(%rdx), %rax
	jbe	.LBB0_26
# BB#24:                                #   in Loop: Header=BB0_22 Depth=1
	movl	$9, %edi
	callq	enqueue_signature
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	movslq	-20(%rbp), %rdi
	shlq	$4, %rdi
	addq	%rax, %rdi
	movq	-56(%rbp), %rsi
	movl	$16, %edx
	callq	bcopy
# BB#25:                                #   in Loop: Header=BB0_22 Depth=1
	movl	$9, %edi
	callq	enqueue_signature
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	.LBB0_28
.LBB0_26:                               #   in Loop: Header=BB0_22 Depth=1
	movl	$7, %edi
	callq	enqueue_signature
	movq	-32(%rbp), %rax
	movq	8(%rax), %rdi
	movq	-56(%rbp), %rsi
	movl	$16, %edx
	callq	bcopy
# BB#27:                                #   in Loop: Header=BB0_22 Depth=1
	movl	$11, %edi
	callq	enqueue_signature
	movl	$4294967295, %eax       # imm = 0xFFFFFFFF
	movq	-32(%rbp), %rcx
	movq	8(%rcx), %rcx
	movq	%rax, (%rcx)
	movl	$1, -60(%rbp)
.LBB0_28:                               #   in Loop: Header=BB0_22 Depth=1
	movl	$1, %edi
	callq	enqueue_signature
# BB#29:                                #   in Loop: Header=BB0_22 Depth=1
	movl	$6, %edi
	callq	enqueue_signature
	movq	-56(%rbp), %rax
	addq	$16, %rax
	movq	%rax, -56(%rbp)
	jmp	.LBB0_22
.LBB0_30:
	movl	$5, %edi
	callq	enqueue_signature
	cmpl	$0, -60(%rbp)
	jne	.LBB0_32
# BB#31:
	movl	$7, %edi
	callq	enqueue_signature
	movq	-32(%rbp), %rax
	movq	8(%rax), %rdi
	movq	-56(%rbp), %rsi
	movl	$16, %edx
	callq	bcopy
.LBB0_32:
	movl	$5, %edi
	callq	enqueue_signature
	movq	-32(%rbp), %rax
	movq	8(%rax), %rdi
	callq	free
# BB#33:
	movl	$3, %edi
	callq	enqueue_signature
	movq	-32(%rbp), %rdi
	callq	free
# BB#34:
	movl	$18, %edi
	callq	enqueue_signature
	movq	$0, -32(%rbp)
	movq	-40(%rbp), %rax
	movb	16(%rax), %cl
	addb	$1, %cl
	movb	%cl, 16(%rax)
	movq	-40(%rbp), %rax
	movq	8(%rax), %rdi
	callq	free
# BB#35:
	movl	$13, %edi
	callq	enqueue_signature
	movq	-80(%rbp), %rax
	movq	-40(%rbp), %rcx
	movq	%rax, 8(%rcx)
	movq	-40(%rbp), %rax
	movq	%rax, -72(%rbp)
	jmp	.LBB0_51
.LBB0_36:
	movl	$4, %edi
	callq	enqueue_signature
	movl	$1, -20(%rbp)
.LBB0_37:                               # =>This Inner Loop Header: Depth=1
	movl	$5, %edi
	callq	enqueue_signature
	xorl	%ebx, %ebx
	cmpl	$32, -20(%rbp)
	jge	.LBB0_41
# BB#38:                                #   in Loop: Header=BB0_37 Depth=1
	movl	$7, %edi
	callq	enqueue_signature_with_call
	movl	-20(%rbp), %edi
	movq	-32(%rbp), %rax
	movq	(%rax), %rsi
	callq	bit
	movq	%rax, %r14
# BB#39:                                #   in Loop: Header=BB0_37 Depth=1
	movl	$7, %edi
	callq	enqueue_signature_with_call
	movl	-20(%rbp), %edi
	movq	-40(%rbp), %rax
	movq	(%rax), %rsi
	callq	bit
	movq	%rax, %rbx
# BB#40:                                #   in Loop: Header=BB0_37 Depth=1
	movl	$3, %edi
	callq	enqueue_signature
	cmpq	%rbx, %r14
	sete	%bl
.LBB0_41:                               #   in Loop: Header=BB0_37 Depth=1
	movl	$1, %edi
	callq	enqueue_signature
	testb	$1, %bl
	jne	.LBB0_42
	jmp	.LBB0_44
.LBB0_42:                               #   in Loop: Header=BB0_37 Depth=1
	movl	$1, %edi
	callq	enqueue_signature
# BB#43:                                #   in Loop: Header=BB0_37 Depth=1
	movl	$9, %edi
	callq	enqueue_signature
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	.LBB0_37
.LBB0_44:
	movl	$9, %edi
	callq	enqueue_signature_with_call
	movq	-48(%rbp), %rax
	movsbl	17(%rax), %edi
	movq	-32(%rbp), %rax
	movq	(%rax), %rsi
	callq	bit
	movq	%rax, %rbx
# BB#45:
	movl	$3, %edi
	callq	enqueue_signature
	cmpq	$0, %rbx
	je	.LBB0_48
# BB#46:
	movl	$11, %edi
	callq	enqueue_signature_with_call
	movq	-48(%rbp), %rax
	movq	32(%rax), %rdi
	movq	-32(%rbp), %rsi
	movl	-20(%rbp), %edx
	movq	-48(%rbp), %rcx
	callq	insertR
	movq	%rax, %rbx
# BB#47:
	movl	$6, %edi
	callq	enqueue_signature
	movq	-48(%rbp), %rax
	movq	%rbx, 32(%rax)
	jmp	.LBB0_50
.LBB0_48:
	movl	$11, %edi
	callq	enqueue_signature_with_call
	movq	-48(%rbp), %rax
	movq	24(%rax), %rdi
	movq	-32(%rbp), %rsi
	movl	-20(%rbp), %edx
	movq	-48(%rbp), %rcx
	callq	insertR
	movq	%rax, %rbx
# BB#49:
	movl	$6, %edi
	callq	enqueue_signature
	movq	-48(%rbp), %rax
	movq	%rbx, 24(%rax)
.LBB0_50:
	movl	$6, %edi
	callq	enqueue_signature
	movq	-32(%rbp), %rax
	movq	%rax, -72(%rbp)
.LBB0_51:
	movl	$3, %edi
	callq	enqueue_signature_with_return
	movq	-72(%rbp), %rax
	addq	$64, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end0:
	.size	pat_insert, .Lfunc_end0-pat_insert
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function bit
	.type	bit,@function
bit:                                    # @bit
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
	subq	$16, %rsp
.Lcfi8:
	.cfi_offset %rbx, -32
.Lcfi9:
	.cfi_offset %r14, -24
	movq	%rsi, %r14
	movl	%edi, %ebx
	movl	$13, %edi
	callq	enqueue_signature_with_return
	movl	$1, %eax
	movl	$31, %ecx
	movl	%ebx, -20(%rbp)
	movq	%r14, -32(%rbp)
	movq	-32(%rbp), %rdx
	subl	-20(%rbp), %ecx
                                        # kill: %CL<def> %ECX<kill>
	shll	%cl, %eax
	cltq
	andq	%rdx, %rax
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end1:
	.size	bit, .Lfunc_end1-bit
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function insertR
	.type	insertR,@function
insertR:                                # @insertR
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
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	subq	$48, %rsp
.Lcfi13:
	.cfi_offset %rbx, -48
.Lcfi14:
	.cfi_offset %r12, -40
.Lcfi15:
	.cfi_offset %r14, -32
.Lcfi16:
	.cfi_offset %r15, -24
	movq	%rcx, %r14
	movl	%edx, %r15d
	movq	%rsi, %r12
	movq	%rdi, %rbx
	movl	$26, %edi
	callq	enqueue_signature
	movq	%rbx, -48(%rbp)
	movq	%r12, -56(%rbp)
	movl	%r15d, -36(%rbp)
	movq	%r14, -72(%rbp)
	movq	-48(%rbp), %rax
	movsbl	17(%rax), %eax
	cmpl	-36(%rbp), %eax
	jge	.LBB2_2
# BB#1:
	movl	$11, %edi
	callq	enqueue_signature
	movq	-48(%rbp), %rax
	movsbl	17(%rax), %eax
	movq	-72(%rbp), %rcx
	movsbl	17(%rcx), %ecx
	cmpl	%ecx, %eax
	jg	.LBB2_11
.LBB2_2:
	movl	$14, %edi
	callq	enqueue_signature_with_call
	movl	-36(%rbp), %eax
	movq	-56(%rbp), %rcx
	movb	%al, 17(%rcx)
	movl	-36(%rbp), %edi
	movq	-56(%rbp), %rax
	movq	(%rax), %rsi
	callq	bit
	movq	%rax, %rbx
# BB#3:
	movl	$3, %edi
	callq	enqueue_signature
	cmpq	$0, %rbx
	je	.LBB2_5
# BB#4:
	movl	$3, %edi
	callq	enqueue_signature
	movq	-48(%rbp), %rbx
	jmp	.LBB2_6
.LBB2_5:
	movl	$3, %edi
	callq	enqueue_signature
	movq	-56(%rbp), %rbx
.LBB2_6:
	movl	$12, %edi
	callq	enqueue_signature_with_call
	movq	-56(%rbp), %rax
	movq	%rbx, 24(%rax)
	movl	-36(%rbp), %edi
	movq	-56(%rbp), %rax
	movq	(%rax), %rsi
	callq	bit
	movq	%rax, %rbx
# BB#7:
	movl	$3, %edi
	callq	enqueue_signature
	cmpq	$0, %rbx
	je	.LBB2_9
# BB#8:
	movl	$3, %edi
	callq	enqueue_signature
	movq	-56(%rbp), %rbx
	jmp	.LBB2_10
.LBB2_9:
	movl	$3, %edi
	callq	enqueue_signature
	movq	-48(%rbp), %rbx
.LBB2_10:
	movl	$11, %edi
	callq	enqueue_signature
	movq	-56(%rbp), %rax
	movq	%rbx, 32(%rax)
	movq	-56(%rbp), %rax
	movq	%rax, -64(%rbp)
	jmp	.LBB2_18
.LBB2_11:
	movl	$9, %edi
	callq	enqueue_signature_with_call
	movq	-48(%rbp), %rax
	movsbl	17(%rax), %edi
	movq	-56(%rbp), %rax
	movq	(%rax), %rsi
	callq	bit
	movq	%rax, %rbx
# BB#12:
	movl	$3, %edi
	callq	enqueue_signature
	cmpq	$0, %rbx
	je	.LBB2_15
# BB#13:
	movl	$11, %edi
	callq	enqueue_signature_with_call
	movq	-48(%rbp), %rax
	movq	32(%rax), %rdi
	movq	-56(%rbp), %rsi
	movl	-36(%rbp), %edx
	movq	-48(%rbp), %rcx
	callq	insertR
	movq	%rax, %rbx
# BB#14:
	movl	$6, %edi
	callq	enqueue_signature
	movq	-48(%rbp), %rax
	movq	%rbx, 32(%rax)
	jmp	.LBB2_17
.LBB2_15:
	movl	$11, %edi
	callq	enqueue_signature_with_call
	movq	-48(%rbp), %rax
	movq	24(%rax), %rdi
	movq	-56(%rbp), %rsi
	movl	-36(%rbp), %edx
	movq	-48(%rbp), %rcx
	callq	insertR
	movq	%rax, %rbx
# BB#16:
	movl	$6, %edi
	callq	enqueue_signature
	movq	-48(%rbp), %rax
	movq	%rbx, 24(%rax)
.LBB2_17:
	movl	$6, %edi
	callq	enqueue_signature
	movq	-48(%rbp), %rax
	movq	%rax, -64(%rbp)
.LBB2_18:
	movl	$3, %edi
	callq	enqueue_signature_with_return
	movq	-64(%rbp), %rax
	addq	$48, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end2:
	.size	insertR, .Lfunc_end2-insertR
	.cfi_endproc
                                        # -- End function
	.globl	pat_remove              # -- Begin function pat_remove
	.p2align	4, 0x90
	.type	pat_remove,@function
pat_remove:                             # @pat_remove
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Lcfi17:
	.cfi_def_cfa_offset 16
.Lcfi18:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Lcfi19:
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	subq	$96, %rsp
.Lcfi20:
	.cfi_offset %rbx, -32
.Lcfi21:
	.cfi_offset %r14, -24
	movq	%rsi, %r14
	movq	%rdi, %rbx
	movl	$22, %edi
	callq	enqueue_signature
	movq	%rbx, -56(%rbp)
	movq	%r14, -104(%rbp)
	cmpq	$0, -56(%rbp)
	je	.LBB3_3
# BB#1:
	movl	$7, %edi
	callq	enqueue_signature
	movq	-56(%rbp), %rax
	cmpq	$0, 8(%rax)
	je	.LBB3_3
# BB#2:
	movl	$5, %edi
	callq	enqueue_signature
	cmpq	$0, -24(%rbp)
	jne	.LBB3_4
.LBB3_3:
	movl	$4, %edi
	callq	enqueue_signature
	movl	$0, -44(%rbp)
	jmp	.LBB3_66
.LBB3_4:
	movl	$12, %edi
	callq	enqueue_signature
	movq	-104(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	%rax, -40(%rbp)
	movq	%rax, -80(%rbp)
.LBB3_5:                                # =>This Inner Loop Header: Depth=1
	movl	$26, %edi
	callq	enqueue_signature_with_call
	movq	-24(%rbp), %rax
	movsbl	17(%rax), %eax
	movl	%eax, -28(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -80(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -40(%rbp)
	movq	-24(%rbp), %rax
	movsbl	17(%rax), %edi
	movq	-56(%rbp), %rax
	movq	(%rax), %rsi
	callq	bit
	movq	%rax, %rbx
# BB#6:                                 #   in Loop: Header=BB3_5 Depth=1
	movl	$3, %edi
	callq	enqueue_signature
	cmpq	$0, %rbx
	je	.LBB3_8
# BB#7:                                 #   in Loop: Header=BB3_5 Depth=1
	movl	$5, %edi
	callq	enqueue_signature
	movq	-24(%rbp), %rax
	movq	32(%rax), %rbx
	jmp	.LBB3_9
.LBB3_8:                                #   in Loop: Header=BB3_5 Depth=1
	movl	$5, %edi
	callq	enqueue_signature
	movq	-24(%rbp), %rax
	movq	24(%rax), %rbx
.LBB3_9:                                #   in Loop: Header=BB3_5 Depth=1
	movl	$4, %edi
	callq	enqueue_signature
	movq	%rbx, -24(%rbp)
# BB#10:                                #   in Loop: Header=BB3_5 Depth=1
	movl	$9, %edi
	callq	enqueue_signature
	movl	-28(%rbp), %eax
	movq	-24(%rbp), %rcx
	movsbl	17(%rcx), %ecx
	cmpl	%ecx, %eax
	jl	.LBB3_5
# BB#11:
	movl	$11, %edi
	callq	enqueue_signature
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	-56(%rbp), %rcx
	cmpq	(%rcx), %rax
	je	.LBB3_13
# BB#12:
	movl	$4, %edi
	callq	enqueue_signature
	movl	$0, -44(%rbp)
	jmp	.LBB3_66
.LBB3_13:
	movl	$7, %edi
	callq	enqueue_signature
	movq	-24(%rbp), %rax
	movzbl	16(%rax), %eax
	cmpl	$1, %eax
	jne	.LBB3_48
# BB#14:
	movl	$7, %edi
	callq	enqueue_signature
	movq	-24(%rbp), %rax
	movsbl	17(%rax), %eax
	cmpl	$0, %eax
	jne	.LBB3_16
# BB#15:
	movl	$4, %edi
	callq	enqueue_signature
	movl	$0, -44(%rbp)
	jmp	.LBB3_66
.LBB3_16:
	movl	$15, %edi
	callq	enqueue_signature
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rax
	movq	-56(%rbp), %rcx
	movq	8(%rcx), %rcx
	cmpq	(%rcx), %rax
	je	.LBB3_18
# BB#17:
	movl	$4, %edi
	callq	enqueue_signature
	movl	$0, -44(%rbp)
	jmp	.LBB3_66
.LBB3_18:
	movl	$9, %edi
	callq	enqueue_signature
	movq	-40(%rbp), %rax
	movq	%rax, -64(%rbp)
	movq	%rax, -72(%rbp)
.LBB3_19:                               # =>This Inner Loop Header: Depth=1
	movl	$21, %edi
	callq	enqueue_signature_with_call
	movq	-64(%rbp), %rax
	movsbl	17(%rax), %eax
	movl	%eax, -28(%rbp)
	movq	-64(%rbp), %rax
	movq	%rax, -72(%rbp)
	movq	-64(%rbp), %rax
	movsbl	17(%rax), %edi
	movq	-40(%rbp), %rax
	movq	(%rax), %rsi
	callq	bit
	movq	%rax, %rbx
# BB#20:                                #   in Loop: Header=BB3_19 Depth=1
	movl	$3, %edi
	callq	enqueue_signature
	cmpq	$0, %rbx
	je	.LBB3_22
# BB#21:                                #   in Loop: Header=BB3_19 Depth=1
	movl	$5, %edi
	callq	enqueue_signature
	movq	-64(%rbp), %rax
	movq	32(%rax), %rbx
	jmp	.LBB3_23
.LBB3_22:                               #   in Loop: Header=BB3_19 Depth=1
	movl	$5, %edi
	callq	enqueue_signature
	movq	-64(%rbp), %rax
	movq	24(%rax), %rbx
.LBB3_23:                               #   in Loop: Header=BB3_19 Depth=1
	movl	$4, %edi
	callq	enqueue_signature
	movq	%rbx, -64(%rbp)
# BB#24:                                #   in Loop: Header=BB3_19 Depth=1
	movl	$9, %edi
	callq	enqueue_signature
	movl	-28(%rbp), %eax
	movq	-64(%rbp), %rcx
	movsbl	17(%rcx), %ecx
	cmpl	%ecx, %eax
	jl	.LBB3_19
# BB#25:
	movl	$9, %edi
	callq	enqueue_signature_with_call
	movq	-72(%rbp), %rax
	movsbl	17(%rax), %edi
	movq	-40(%rbp), %rax
	movq	(%rax), %rsi
	callq	bit
	movq	%rax, %rbx
# BB#26:
	movl	$3, %edi
	callq	enqueue_signature
	cmpq	$0, %rbx
	je	.LBB3_28
# BB#27:
	movl	$8, %edi
	callq	enqueue_signature
	movq	-24(%rbp), %rax
	movq	-72(%rbp), %rcx
	movq	%rax, 32(%rcx)
	jmp	.LBB3_29
.LBB3_28:
	movl	$8, %edi
	callq	enqueue_signature
	movq	-24(%rbp), %rax
	movq	-72(%rbp), %rcx
	movq	%rax, 24(%rcx)
.LBB3_29:
	movl	$9, %edi
	callq	enqueue_signature_with_call
	movq	-80(%rbp), %rax
	movsbl	17(%rax), %edi
	movq	-56(%rbp), %rax
	movq	(%rax), %rsi
	callq	bit
	movq	%rax, %rbx
# BB#30:
	movl	$3, %edi
	callq	enqueue_signature
	cmpq	$0, %rbx
	je	.LBB3_36
# BB#31:
	movl	$9, %edi
	callq	enqueue_signature_with_call
	movq	-40(%rbp), %rax
	movsbl	17(%rax), %edi
	movq	-56(%rbp), %rax
	movq	(%rax), %rsi
	callq	bit
	movq	%rax, %rbx
# BB#32:
	movl	$3, %edi
	callq	enqueue_signature
	cmpq	$0, %rbx
	je	.LBB3_34
# BB#33:
	movl	$5, %edi
	callq	enqueue_signature
	movq	-40(%rbp), %rax
	movq	24(%rax), %rbx
	jmp	.LBB3_35
.LBB3_34:
	movl	$5, %edi
	callq	enqueue_signature
	movq	-40(%rbp), %rax
	movq	32(%rax), %rbx
.LBB3_35:
	movl	$6, %edi
	callq	enqueue_signature
	movq	-80(%rbp), %rax
	movq	%rbx, 32(%rax)
	jmp	.LBB3_41
.LBB3_36:
	movl	$9, %edi
	callq	enqueue_signature_with_call
	movq	-40(%rbp), %rax
	movsbl	17(%rax), %edi
	movq	-56(%rbp), %rax
	movq	(%rax), %rsi
	callq	bit
	movq	%rax, %rbx
# BB#37:
	movl	$3, %edi
	callq	enqueue_signature
	cmpq	$0, %rbx
	je	.LBB3_39
# BB#38:
	movl	$5, %edi
	callq	enqueue_signature
	movq	-40(%rbp), %rax
	movq	24(%rax), %rbx
	jmp	.LBB3_40
.LBB3_39:
	movl	$5, %edi
	callq	enqueue_signature
	movq	-40(%rbp), %rax
	movq	32(%rax), %rbx
.LBB3_40:
	movl	$6, %edi
	callq	enqueue_signature
	movq	-80(%rbp), %rax
	movq	%rbx, 24(%rax)
.LBB3_41:
	movl	$9, %edi
	callq	enqueue_signature
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	cmpq	$0, 8(%rax)
	je	.LBB3_43
# BB#42:
	movl	$7, %edi
	callq	enqueue_signature
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	8(%rax), %rdi
	callq	free
.LBB3_43:
	movl	$5, %edi
	callq	enqueue_signature
	movq	-24(%rbp), %rax
	movq	8(%rax), %rdi
	callq	free
# BB#44:
	movl	$7, %edi
	callq	enqueue_signature
	movq	-24(%rbp), %rax
	cmpq	-40(%rbp), %rax
	je	.LBB3_46
# BB#45:
	movl	$28, %edi
	callq	enqueue_signature
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	-24(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	movq	-24(%rbp), %rcx
	movq	%rax, 8(%rcx)
	movq	-40(%rbp), %rax
	movb	16(%rax), %al
	movq	-24(%rbp), %rcx
	movb	%al, 16(%rcx)
.LBB3_46:
	movl	$3, %edi
	callq	enqueue_signature
	movq	-40(%rbp), %rdi
	callq	free
# BB#47:
	movl	$4, %edi
	callq	enqueue_signature
	movl	$1, -44(%rbp)
	jmp	.LBB3_66
.LBB3_48:
	movl	$4, %edi
	callq	enqueue_signature
	movl	$0, -28(%rbp)
.LBB3_49:                               # =>This Inner Loop Header: Depth=1
	movl	$9, %edi
	callq	enqueue_signature
	movl	-28(%rbp), %eax
	movq	-24(%rbp), %rcx
	movzbl	16(%rcx), %ecx
	cmpl	%ecx, %eax
	jge	.LBB3_54
# BB#50:                                #   in Loop: Header=BB3_49 Depth=1
	movl	$17, %edi
	callq	enqueue_signature
	movq	-56(%rbp), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rax
	movq	-24(%rbp), %rcx
	movq	8(%rcx), %rcx
	movslq	-28(%rbp), %rdx
	shlq	$4, %rdx
	addq	%rcx, %rdx
	cmpq	(%rdx), %rax
	jne	.LBB3_52
# BB#51:
	movl	$1, %edi
	callq	enqueue_signature
	jmp	.LBB3_55
.LBB3_52:                               #   in Loop: Header=BB3_49 Depth=1
	movl	$1, %edi
	callq	enqueue_signature
# BB#53:                                #   in Loop: Header=BB3_49 Depth=1
	movl	$9, %edi
	callq	enqueue_signature
	movl	-28(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -28(%rbp)
	jmp	.LBB3_49
.LBB3_54:                               # %.loopexit
	jmp	.LBB3_55
.LBB3_55:
	movl	$9, %edi
	callq	enqueue_signature
	movl	-28(%rbp), %eax
	movq	-24(%rbp), %rcx
	movzbl	16(%rcx), %ecx
	cmpl	%ecx, %eax
	jl	.LBB3_57
# BB#56:
	movl	$4, %edi
	callq	enqueue_signature
	movl	$0, -44(%rbp)
	jmp	.LBB3_66
.LBB3_57:
	movl	$9, %edi
	callq	enqueue_signature
	movq	-24(%rbp), %rax
	movzbl	16(%rax), %eax
	subl	$1, %eax
	movslq	%eax, %rdi
	shlq	$4, %rdi
	callq	malloc
	movq	%rax, %rbx
# BB#58:
	movl	$12, %edi
	callq	enqueue_signature
	movq	%rbx, -96(%rbp)
	movl	$0, -28(%rbp)
	movq	-96(%rbp), %rax
	movq	%rax, -88(%rbp)
.LBB3_59:                               # =>This Inner Loop Header: Depth=1
	movl	$9, %edi
	callq	enqueue_signature
	movl	-28(%rbp), %eax
	movq	-24(%rbp), %rcx
	movzbl	16(%rcx), %ecx
	cmpl	%ecx, %eax
	jge	.LBB3_64
# BB#60:                                #   in Loop: Header=BB3_59 Depth=1
	movl	$17, %edi
	callq	enqueue_signature
	movq	-56(%rbp), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rax
	movq	-24(%rbp), %rcx
	movq	8(%rcx), %rcx
	movslq	-28(%rbp), %rdx
	shlq	$4, %rdx
	addq	%rcx, %rdx
	cmpq	(%rdx), %rax
	je	.LBB3_62
# BB#61:                                #   in Loop: Header=BB3_59 Depth=1
	movl	$12, %edi
	callq	enqueue_signature
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movslq	-28(%rbp), %rdi
	shlq	$4, %rdi
	addq	%rax, %rdi
	movq	-88(%rbp), %rsi
	leaq	16(%rsi), %rax
	movq	%rax, -88(%rbp)
	movl	$16, %edx
	callq	bcopy
.LBB3_62:                               #   in Loop: Header=BB3_59 Depth=1
	movl	$1, %edi
	callq	enqueue_signature
# BB#63:                                #   in Loop: Header=BB3_59 Depth=1
	movl	$9, %edi
	callq	enqueue_signature
	movl	-28(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -28(%rbp)
	jmp	.LBB3_59
.LBB3_64:
	movl	$15, %edi
	callq	enqueue_signature
	movq	-24(%rbp), %rax
	movb	16(%rax), %cl
	addb	$-1, %cl
	movb	%cl, 16(%rax)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rdi
	callq	free
# BB#65:
	movl	$11, %edi
	callq	enqueue_signature
	movq	-96(%rbp), %rax
	movq	-24(%rbp), %rcx
	movq	%rax, 8(%rcx)
	movl	$1, -44(%rbp)
.LBB3_66:
	movl	$3, %edi
	callq	enqueue_signature_with_return
	movl	-44(%rbp), %eax
	addq	$96, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end3:
	.size	pat_remove, .Lfunc_end3-pat_remove
	.cfi_endproc
                                        # -- End function
	.globl	pat_search              # -- Begin function pat_search
	.p2align	4, 0x90
	.type	pat_search,@function
pat_search:                             # @pat_search
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Lcfi22:
	.cfi_def_cfa_offset 16
.Lcfi23:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Lcfi24:
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	subq	$48, %rsp
.Lcfi25:
	.cfi_offset %rbx, -32
.Lcfi26:
	.cfi_offset %r14, -24
	movq	%rsi, %r14
	movq	%rdi, %rbx
	movl	$25, %edi
	callq	enqueue_signature
	movq	%rbx, -32(%rbp)
	movq	%r14, -64(%rbp)
	movq	$0, -48(%rbp)
	movq	-64(%rbp), %rax
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.LBB4_2
# BB#1:
	movl	$4, %edi
	callq	enqueue_signature
	movq	$0, -56(%rbp)
	jmp	.LBB4_15
.LBB4_2:
	movl	$1, %edi
	callq	enqueue_signature
.LBB4_3:                                # =>This Inner Loop Header: Depth=1
	movl	$15, %edi
	callq	enqueue_signature
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rdx
	movq	8(%rdx), %rdx
	andq	(%rdx), %rcx
	cmpq	%rcx, %rax
	jne	.LBB4_5
# BB#4:                                 #   in Loop: Header=BB4_3 Depth=1
	movl	$6, %edi
	callq	enqueue_signature
	movq	-24(%rbp), %rax
	movq	%rax, -48(%rbp)
.LBB4_5:                                #   in Loop: Header=BB4_3 Depth=1
	movl	$14, %edi
	callq	enqueue_signature_with_call
	movq	-24(%rbp), %rax
	movsbl	17(%rax), %eax
	movl	%eax, -36(%rbp)
	movq	-24(%rbp), %rax
	movsbl	17(%rax), %edi
	movq	-32(%rbp), %rsi
	callq	bit
	movq	%rax, %rbx
# BB#6:                                 #   in Loop: Header=BB4_3 Depth=1
	movl	$3, %edi
	callq	enqueue_signature
	cmpq	$0, %rbx
	je	.LBB4_8
# BB#7:                                 #   in Loop: Header=BB4_3 Depth=1
	movl	$5, %edi
	callq	enqueue_signature
	movq	-24(%rbp), %rax
	movq	32(%rax), %rbx
	jmp	.LBB4_9
.LBB4_8:                                #   in Loop: Header=BB4_3 Depth=1
	movl	$5, %edi
	callq	enqueue_signature
	movq	-24(%rbp), %rax
	movq	24(%rax), %rbx
.LBB4_9:                                #   in Loop: Header=BB4_3 Depth=1
	movl	$4, %edi
	callq	enqueue_signature
	movq	%rbx, -24(%rbp)
# BB#10:                                #   in Loop: Header=BB4_3 Depth=1
	movl	$9, %edi
	callq	enqueue_signature
	movl	-36(%rbp), %eax
	movq	-24(%rbp), %rcx
	movsbl	17(%rcx), %ecx
	cmpl	%ecx, %eax
	jl	.LBB4_3
# BB#11:
	movl	$15, %edi
	callq	enqueue_signature
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rdx
	movq	8(%rdx), %rdx
	andq	(%rdx), %rcx
	cmpq	%rcx, %rax
	jne	.LBB4_13
# BB#12:
	movl	$3, %edi
	callq	enqueue_signature
	movq	-24(%rbp), %rbx
	jmp	.LBB4_14
.LBB4_13:
	movl	$3, %edi
	callq	enqueue_signature
	movq	-48(%rbp), %rbx
.LBB4_14:
	movl	$4, %edi
	callq	enqueue_signature
	movq	%rbx, -56(%rbp)
.LBB4_15:
	movl	$3, %edi
	callq	enqueue_signature_with_return
	movq	-56(%rbp), %rax
	addq	$48, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end4:
	.size	pat_search, .Lfunc_end4-pat_search
	.cfi_endproc
                                        # -- End function
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Lcfi27:
	.cfi_def_cfa_offset 16
.Lcfi28:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Lcfi29:
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	subq	$256, %rsp              # imm = 0x100
.Lcfi30:
	.cfi_offset %rbx, -32
.Lcfi31:
	.cfi_offset %r14, -24
	movq	%rsi, %r14
	movl	%edi, %ebx
	callq	init_monitor
	movl	$28, %edi
	callq	enqueue_signature
	leaq	-128(%rbp), %rdi
	movl	$4294967295, %eax       # imm = 0xFFFFFFFF
	movl	$0, -52(%rbp)
	movl	%ebx, -96(%rbp)
	movq	%r14, -88(%rbp)
	movq	%rax, -64(%rbp)
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
	callq	enqueue_signature
	movq	%rbx, -72(%rbp)
	cmpq	$0, %rbx
	jne	.LBB5_6
# BB#3:
	movl	$5, %edi
	callq	enqueue_signature
	movabsq	$.L.str.2, %rdi
	movq	-88(%rbp), %rax
	movq	8(%rax), %rsi
	movb	$0, %al
	callq	printf
# BB#4:
	movl	$1, %edi
	callq	enqueue_signature
	xorl	%edi, %edi
	callq	exit
# BB#5:
	xorl	%edi, %edi
	callq	enqueue_signature_with_return
.LBB5_6:
	movl	$1, %edi
	callq	enqueue_signature
	movl	$40, %edi
	callq	malloc
	movq	%rax, %rbx
# BB#7:
	movl	$8, %edi
	callq	enqueue_signature
	movq	%rbx, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.LBB5_11
# BB#8:
	movl	$1, %edi
	callq	enqueue_signature
	movabsq	$.L.str.3, %rdi
	callq	perror
# BB#9:
	movl	$1, %edi
	callq	enqueue_signature
	xorl	%edi, %edi
	callq	exit
# BB#10:
	xorl	%edi, %edi
	callq	enqueue_signature_with_return
.LBB5_11:
	movl	$3, %edi
	callq	enqueue_signature
	movq	-24(%rbp), %rdi
	xorl	%esi, %esi
	movl	$40, %edx
	callq	memset
# BB#12:
	movl	$1, %edi
	callq	enqueue_signature
	movl	$16, %edi
	callq	malloc
	movq	%rax, %rbx
# BB#13:
	movl	$12, %edi
	callq	enqueue_signature
	movq	-24(%rbp), %rax
	movq	%rbx, 8(%rax)
	movq	-24(%rbp), %rax
	cmpq	$0, 8(%rax)
	jne	.LBB5_17
# BB#14:
	movl	$1, %edi
	callq	enqueue_signature
	movabsq	$.L.str.4, %rdi
	callq	perror
# BB#15:
	movl	$1, %edi
	callq	enqueue_signature
	xorl	%edi, %edi
	callq	exit
# BB#16:
	xorl	%edi, %edi
	callq	enqueue_signature_with_return
.LBB5_17:
	movl	$5, %edi
	callq	enqueue_signature
	movq	-24(%rbp), %rax
	movq	8(%rax), %rdi
	xorl	%esi, %esi
	movl	$16, %edx
	callq	memset
# BB#18:
	movl	$8, %edi
	callq	enqueue_signature
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -48(%rbp)
	movl	$16, %edi
	callq	malloc
	movq	%rax, %rbx
# BB#19:
	movl	$12, %edi
	callq	enqueue_signature
	movq	-48(%rbp), %rax
	movq	%rbx, 8(%rax)
	movq	-48(%rbp), %rax
	cmpq	$0, 8(%rax)
	jne	.LBB5_23
# BB#20:
	movl	$1, %edi
	callq	enqueue_signature
	movabsq	$.L.str.5, %rdi
	callq	perror
# BB#21:
	movl	$1, %edi
	callq	enqueue_signature
	xorl	%edi, %edi
	callq	exit
# BB#22:
	xorl	%edi, %edi
	callq	enqueue_signature_with_return
.LBB5_23:
	movl	$5, %edi
	callq	enqueue_signature
	movq	-48(%rbp), %rax
	movq	8(%rax), %rdi
	xorl	%esi, %esi
	movl	$1, %edx
	callq	memset
# BB#24:
	movl	$18, %edi
	callq	enqueue_signature
	movq	-24(%rbp), %rax
	movb	$1, 16(%rax)
	movq	-24(%rbp), %rax
	movq	-24(%rbp), %rcx
	movq	%rax, 32(%rcx)
	movq	-24(%rbp), %rcx
	movq	%rax, 24(%rcx)
.LBB5_25:                               # =>This Inner Loop Header: Depth=1
	movl	$3, %edi
	callq	enqueue_signature
	leaq	-256(%rbp), %rdi
	movq	-72(%rbp), %rdx
	movl	$128, %esi
	callq	fgets
	movq	%rax, %rbx
# BB#26:                                #   in Loop: Header=BB5_25 Depth=1
	movl	$3, %edi
	callq	enqueue_signature
	cmpq	$0, %rbx
	je	.LBB5_54
# BB#27:                                #   in Loop: Header=BB5_25 Depth=1
	movl	$1, %edi
	callq	enqueue_signature
	movabsq	$.L.str.6, %rsi
	leaq	-92(%rbp), %rdx
	leaq	-40(%rbp), %rcx
	leaq	-256(%rbp), %rdi
	movb	$0, %al
	callq	__isoc99_sscanf
# BB#28:                                #   in Loop: Header=BB5_25 Depth=1
	movl	$1, %edi
	callq	enqueue_signature
	movl	$40, %edi
	callq	malloc
	movq	%rax, %rbx
# BB#29:                                #   in Loop: Header=BB5_25 Depth=1
	movl	$8, %edi
	callq	enqueue_signature
	movq	%rbx, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.LBB5_33
# BB#30:
	movl	$1, %edi
	callq	enqueue_signature
	movabsq	$.L.str.3, %rdi
	callq	perror
# BB#31:
	movl	$1, %edi
	callq	enqueue_signature
	xorl	%edi, %edi
	callq	exit
# BB#32:
	xorl	%edi, %edi
	callq	enqueue_signature_with_return
.LBB5_33:                               #   in Loop: Header=BB5_25 Depth=1
	movl	$3, %edi
	callq	enqueue_signature
	movq	-32(%rbp), %rdi
	xorl	%esi, %esi
	movl	$40, %edx
	callq	memset
# BB#34:                                #   in Loop: Header=BB5_25 Depth=1
	movl	$1, %edi
	callq	enqueue_signature
	movl	$16, %edi
	callq	malloc
	movq	%rax, %rbx
# BB#35:                                #   in Loop: Header=BB5_25 Depth=1
	movl	$12, %edi
	callq	enqueue_signature
	movq	-32(%rbp), %rax
	movq	%rbx, 8(%rax)
	movq	-32(%rbp), %rax
	cmpq	$0, 8(%rax)
	jne	.LBB5_39
# BB#36:
	movl	$1, %edi
	callq	enqueue_signature
	movabsq	$.L.str.4, %rdi
	callq	perror
# BB#37:
	movl	$1, %edi
	callq	enqueue_signature
	xorl	%edi, %edi
	callq	exit
# BB#38:
	xorl	%edi, %edi
	callq	enqueue_signature_with_return
.LBB5_39:                               #   in Loop: Header=BB5_25 Depth=1
	movl	$5, %edi
	callq	enqueue_signature
	movq	-32(%rbp), %rax
	movq	8(%rax), %rdi
	xorl	%esi, %esi
	movl	$16, %edx
	callq	memset
# BB#40:                                #   in Loop: Header=BB5_25 Depth=1
	movl	$8, %edi
	callq	enqueue_signature
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -48(%rbp)
	movl	$16, %edi
	callq	malloc
	movq	%rax, %rbx
# BB#41:                                #   in Loop: Header=BB5_25 Depth=1
	movl	$12, %edi
	callq	enqueue_signature
	movq	-48(%rbp), %rax
	movq	%rbx, 8(%rax)
	movq	-48(%rbp), %rax
	cmpq	$0, 8(%rax)
	jne	.LBB5_45
# BB#42:
	movl	$1, %edi
	callq	enqueue_signature
	movabsq	$.L.str.5, %rdi
	callq	perror
# BB#43:
	movl	$1, %edi
	callq	enqueue_signature
	xorl	%edi, %edi
	callq	exit
# BB#44:
	xorl	%edi, %edi
	callq	enqueue_signature_with_return
.LBB5_45:                               #   in Loop: Header=BB5_25 Depth=1
	movl	$5, %edi
	callq	enqueue_signature
	movq	-48(%rbp), %rax
	movq	8(%rax), %rdi
	xorl	%esi, %esi
	movl	$1, %edx
	callq	memset
# BB#46:                                #   in Loop: Header=BB5_25 Depth=1
	movl	$10, %edi
	callq	enqueue_signature
	movl	-40(%rbp), %eax
	movq	-32(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-64(%rbp), %rdi
                                        # kill: %EDI<def> %EDI<kill> %RDI<kill>
	callq	htonl
	movl	%eax, %ebx
# BB#47:                                #   in Loop: Header=BB5_25 Depth=1
	movl	$12, %edi
	callq	enqueue_signature_with_call
	movl	%ebx, %eax
	movq	-32(%rbp), %rcx
	movq	8(%rcx), %rcx
	movq	%rax, (%rcx)
	movl	-40(%rbp), %edi
	movq	-24(%rbp), %rsi
	callq	pat_search
	movq	%rax, %rbx
# BB#48:                                #   in Loop: Header=BB5_25 Depth=1
	movl	$12, %edi
	callq	enqueue_signature
	movq	%rbx, -80(%rbp)
	movq	-80(%rbp), %rax
	movq	(%rax), %rax
	movl	-40(%rbp), %ecx
	cmpq	%rcx, %rax
	jne	.LBB5_50
# BB#49:                                #   in Loop: Header=BB5_25 Depth=1
	movl	$1, %edi
	callq	enqueue_signature
	jmp	.LBB5_51
.LBB5_50:                               #   in Loop: Header=BB5_25 Depth=1
	movl	$1, %edi
	callq	enqueue_signature
.LBB5_51:                               #   in Loop: Header=BB5_25 Depth=1
	movl	$5, %edi
	callq	enqueue_signature
	cmpq	$0, -32(%rbp)
	jne	.LBB5_53
# BB#52:                                #   in Loop: Header=BB5_25 Depth=1
	movl	$1, %edi
	callq	enqueue_signature
.LBB5_53:                               #   in Loop: Header=BB5_25 Depth=1
	movl	$1, %edi
	callq	enqueue_signature
	jmp	.LBB5_25
.LBB5_54:
	movl	$1, %edi
	callq	enqueue_signature
	movabsq	$.L.str.7, %rdi
	movb	$0, %al
	callq	printf
# BB#55:
	movl	$1, %edi
	callq	enqueue_signature
	leaq	-112(%rbp), %rdi
	xorl	%esi, %esi
	callq	gettimeofday
# BB#56:
	movl	$16, %edi
	callq	enqueue_signature
	movabsq	$.L.str.8, %rdi
	movq	-112(%rbp), %rax
	subq	-128(%rbp), %rax
	imulq	$1000000, %rax, %rax    # imm = 0xF4240
	movq	-104(%rbp), %rsi
	subq	-120(%rbp), %rsi
	addq	%rax, %rsi
	movb	$0, %al
	callq	printf
# BB#57:
	movl	$6, %edi
	callq	enqueue_signature_with_remainder_process
	movl	$1, is_signature_queue_full
	movl	-52(%rbp), %eax
	addq	$256, %rsp              # imm = 0x100
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end5:
	.size	main, .Lfunc_end5-main
	.cfi_endproc
                                        # -- End function
	.globl	CallcheckerSet          # -- Begin function CallcheckerSet
	.p2align	4, 0x90
	.type	CallcheckerSet,@function
CallcheckerSet:                         # @CallcheckerSet
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rax
.Lcfi32:
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
.Lfunc_end6:
	.size	CallcheckerSet, .Lfunc_end6-CallcheckerSet
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"small.udp"
	.size	.L.str, 10

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"r"
	.size	.L.str.1, 2

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"File %s doesn't seem to exist\n"
	.size	.L.str.2, 31

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	"Allocating p-trie node"
	.size	.L.str.3, 23

	.type	.L.str.4,@object        # @.str.4
.L.str.4:
	.asciz	"Allocating p-trie mask data"
	.size	.L.str.4, 28

	.type	.L.str.5,@object        # @.str.5
.L.str.5:
	.asciz	"Allocating p-trie mask's node data"
	.size	.L.str.5, 35

	.type	.L.str.6,@object        # @.str.6
.L.str.6:
	.asciz	"%f %d"
	.size	.L.str.6, 6

	.type	.L.str.7,@object        # @.str.7
.L.str.7:
	.asciz	" [target finished!]\n"
	.size	.L.str.7, 21

	.type	.L.str.8,@object        # @.str.8
.L.str.8:
	.asciz	" [target] Execution Time: %ld\n"
	.size	.L.str.8, 31


	.ident	"clang version 5.0.0 (tags/RELEASE_500/final)"
	.ident	"clang version 5.0.0 (tags/RELEASE_500/final)"
	.section	".note.GNU-stack","",@progbits
