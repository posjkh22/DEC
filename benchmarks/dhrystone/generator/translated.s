	.text
	.file	"llvm-link"
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2               # -- Begin function main
.LCPI0_0:
	.long	1140457472              # float 500
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI0_1:
	.quad	4696837146684686336     # double 1.0E+6
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
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
	subq	$144, %rsp
.Lcfi3:
	.cfi_offset %rbx, -32
.Lcfi4:
	.cfi_offset %r14, -24
	callq	init_monitor
	movl	$65537, %edi            # imm = 0x10001
	callq	enqueue_signature
	leaq	-88(%rbp), %rdi
	movl	$0, -52(%rbp)
	xorl	%esi, %esi
	movb	$0, %al
	callq	gettimeofday
# BB#1:
	movl	$65538, %edi            # imm = 0x10002
	callq	enqueue_signature
	movl	$56, %edi
	movb	$0, %al
	callq	malloc
	movq	%rax, %rbx
# BB#2:
	movl	$65539, %edi            # imm = 0x10003
	callq	enqueue_signature
	movq	%rbx, Next_Ptr_Glob
	movl	$56, %edi
	movb	$0, %al
	callq	malloc
	movq	%rax, %rbx
# BB#3:
	movl	$65540, %edi            # imm = 0x10004
	callq	enqueue_signature
	movq	%rbx, Ptr_Glob
	movq	Next_Ptr_Glob, %rax
	movq	Ptr_Glob, %rcx
	movq	%rax, (%rcx)
	movq	Ptr_Glob, %rax
	movl	$0, 8(%rax)
	movq	Ptr_Glob, %rax
	movl	$2, 12(%rax)
	movq	Ptr_Glob, %rax
	movl	$40, 16(%rax)
	movq	Ptr_Glob, %rdi
	addq	$12, %rdi
	addq	$8, %rdi
	movl	$.L.str, %esi
	callq	strcpy
# BB#4:
	movl	$65541, %edi            # imm = 0x10005
	callq	enqueue_signature
	leaq	-160(%rbp), %rdi
	movl	$.L.str.1, %esi
	callq	strcpy
# BB#5:
	movl	$65542, %edi            # imm = 0x10006
	callq	enqueue_signature
	movl	$10, Arr_2_Glob+1628
	cmpl	$0, Reg
	je	.LBB0_7
# BB#6:
	movl	$65543, %edi            # imm = 0x10007
	callq	enqueue_signature
	jmp	.LBB0_8
.LBB0_7:
	movl	$65544, %edi            # imm = 0x10008
	callq	enqueue_signature
.LBB0_8:
	movl	$65545, %edi            # imm = 0x10009
	callq	enqueue_signature
	movl	$1000, -48(%rbp)        # imm = 0x3E8
	movl	-48(%rbp), %eax
	movl	%eax, -40(%rbp)
	movl	$1, -32(%rbp)
.LBB0_9:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_15 Depth 2
                                        #     Child Loop BB0_21 Depth 2
	movl	$65546, %edi            # imm = 0x1000A
	callq	enqueue_signature
	movl	-32(%rbp), %eax
	cmpl	-40(%rbp), %eax
	jg	.LBB0_31
# BB#10:                                #   in Loop: Header=BB0_9 Depth=1
	movl	$65547, %edi            # imm = 0x1000B
	callq	enqueue_signature_with_call
	callq	Proc_5
# BB#11:                                #   in Loop: Header=BB0_9 Depth=1
	movl	$65548, %edi            # imm = 0x1000C
	callq	enqueue_signature_with_call
	callq	Proc_4
# BB#12:                                #   in Loop: Header=BB0_9 Depth=1
	movl	$65549, %edi            # imm = 0x1000D
	callq	enqueue_signature
	leaq	-128(%rbp), %rdi
	movl	$2, -24(%rbp)
	movl	$3, -28(%rbp)
	movl	$.L.str.2, %esi
	callq	strcpy
# BB#13:                                #   in Loop: Header=BB0_9 Depth=1
	movl	$65550, %edi            # imm = 0x1000E
	callq	enqueue_signature_with_call
	leaq	-128(%rbp), %rsi
	leaq	-160(%rbp), %rdi
	movl	$1, -44(%rbp)
	movb	$0, %al
	callq	Func_2
	movl	%eax, %ebx
# BB#14:                                #   in Loop: Header=BB0_9 Depth=1
	movl	$65551, %edi            # imm = 0x1000F
	callq	enqueue_signature
	cmpl	$0, %ebx
	setne	%al
	xorb	$-1, %al
	andb	$1, %al
	movzbl	%al, %eax
	movl	%eax, Bool_Glob
.LBB0_15:                               #   Parent Loop BB0_9 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	$65552, %edi            # imm = 0x10010
	callq	enqueue_signature
	movl	-24(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jge	.LBB0_18
# BB#16:                                #   in Loop: Header=BB0_15 Depth=2
	movl	$65553, %edi            # imm = 0x10011
	callq	enqueue_signature_with_call
	leaq	-36(%rbp), %rdx
	imull	$5, -24(%rbp), %eax
	subl	-28(%rbp), %eax
	movl	%eax, -36(%rbp)
	movl	-24(%rbp), %edi
	movl	-28(%rbp), %esi
	movb	$0, %al
	callq	Proc_7
# BB#17:                                #   in Loop: Header=BB0_15 Depth=2
	movl	$65554, %edi            # imm = 0x10012
	callq	enqueue_signature
	movl	-24(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -24(%rbp)
	jmp	.LBB0_15
.LBB0_18:                               #   in Loop: Header=BB0_9 Depth=1
	movl	$65555, %edi            # imm = 0x10013
	callq	enqueue_signature_with_call
	movabsq	$Arr_1_Glob, %rdi
	movabsq	$Arr_2_Glob, %rsi
	movl	-24(%rbp), %edx
	movl	-36(%rbp), %ecx
	movb	$0, %al
	callq	Proc_8
# BB#19:                                #   in Loop: Header=BB0_9 Depth=1
	movl	$65556, %edi            # imm = 0x10014
	callq	enqueue_signature_with_call
	movq	Ptr_Glob, %rdi
	callq	Proc_1
# BB#20:                                #   in Loop: Header=BB0_9 Depth=1
	movl	$65557, %edi            # imm = 0x10015
	callq	enqueue_signature
	movb	$65, -17(%rbp)
.LBB0_21:                               #   Parent Loop BB0_9 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	$65558, %edi            # imm = 0x10016
	callq	enqueue_signature
	movsbl	-17(%rbp), %eax
	movsbl	Ch_2_Glob, %ecx
	cmpl	%ecx, %eax
	jg	.LBB0_29
# BB#22:                                #   in Loop: Header=BB0_21 Depth=2
	movl	$65559, %edi            # imm = 0x10017
	callq	enqueue_signature_with_call
	movl	-44(%rbp), %r14d
	movsbl	-17(%rbp), %edi
	movl	$67, %esi
	movb	$0, %al
	callq	Func_1
	movl	%eax, %ebx
# BB#23:                                #   in Loop: Header=BB0_21 Depth=2
	movl	$65560, %edi            # imm = 0x10018
	callq	enqueue_signature
	cmpl	%ebx, %r14d
	jne	.LBB0_27
# BB#24:                                #   in Loop: Header=BB0_21 Depth=2
	movl	$65561, %edi            # imm = 0x10019
	callq	enqueue_signature_with_call
	leaq	-44(%rbp), %rsi
	xorl	%edi, %edi
	movb	$0, %al
	callq	Proc_6
# BB#25:                                #   in Loop: Header=BB0_21 Depth=2
	movl	$65562, %edi            # imm = 0x1001A
	callq	enqueue_signature
	leaq	-128(%rbp), %rdi
	movl	$.L.str.3, %esi
	callq	strcpy
# BB#26:                                #   in Loop: Header=BB0_21 Depth=2
	movl	$65563, %edi            # imm = 0x1001B
	callq	enqueue_signature
	movl	-32(%rbp), %eax
	movl	%eax, -28(%rbp)
	movl	-32(%rbp), %eax
	movl	%eax, Int_Glob
.LBB0_27:                               #   in Loop: Header=BB0_21 Depth=2
	movl	$65564, %edi            # imm = 0x1001C
	callq	enqueue_signature
# BB#28:                                #   in Loop: Header=BB0_21 Depth=2
	movl	$65565, %edi            # imm = 0x1001D
	callq	enqueue_signature
	movb	-17(%rbp), %al
	addb	$1, %al
	movb	%al, -17(%rbp)
	jmp	.LBB0_21
.LBB0_29:                               #   in Loop: Header=BB0_9 Depth=1
	movl	$65566, %edi            # imm = 0x1001E
	callq	enqueue_signature_with_call
	leaq	-24(%rbp), %rdi
	movl	-28(%rbp), %eax
	imull	-24(%rbp), %eax
	movl	%eax, -28(%rbp)
	movl	-28(%rbp), %eax
	cltd
	idivl	-36(%rbp)
	movl	%eax, -24(%rbp)
	movl	-28(%rbp), %eax
	subl	-36(%rbp), %eax
	imull	$7, %eax, %eax
	subl	-24(%rbp), %eax
	movl	%eax, -28(%rbp)
	callq	Proc_2
# BB#30:                                #   in Loop: Header=BB0_9 Depth=1
	movl	$65567, %edi            # imm = 0x1001F
	callq	enqueue_signature
	movl	-32(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -32(%rbp)
	jmp	.LBB0_9
.LBB0_31:
	movl	$65568, %edi            # imm = 0x10020
	callq	enqueue_signature
	movq	End_Time, %rax
	subq	Begin_Time, %rax
	movq	%rax, User_Time
	cmpq	$1000, User_Time        # imm = 0x3E8
	jge	.LBB0_33
# BB#32:
	movl	$65569, %edi            # imm = 0x10021
	callq	enqueue_signature
	jmp	.LBB0_34
.LBB0_33:
	movl	$65570, %edi            # imm = 0x10022
	callq	enqueue_signature
	movss	.LCPI0_0(%rip), %xmm0   # xmm0 = mem[0],zero,zero,zero
	movsd	.LCPI0_1(%rip), %xmm1   # xmm1 = mem[0],zero
	cvtsi2ssq	User_Time, %xmm2
	cvtss2sd	%xmm2, %xmm2
	mulsd	%xmm1, %xmm2
	cvtsi2ssl	-40(%rbp), %xmm1
	mulss	%xmm0, %xmm1
	cvtss2sd	%xmm1, %xmm1
	divsd	%xmm1, %xmm2
	cvtsd2ss	%xmm2, %xmm1
	movss	%xmm1, Microseconds
	cvtsi2ssl	-40(%rbp), %xmm1
	mulss	%xmm0, %xmm1
	cvtsi2ssq	User_Time, %xmm0
	divss	%xmm0, %xmm1
	movss	%xmm1, Dhrystones_Per_Second
.LBB0_34:
	movl	$65571, %edi            # imm = 0x10023
	callq	enqueue_signature
	leaq	-72(%rbp), %rdi
	xorl	%esi, %esi
	movb	$0, %al
	callq	gettimeofday
# BB#35:
	movl	$65572, %edi            # imm = 0x10024
	callq	enqueue_signature
	movabsq	$.L.str.4, %rdi
	movb	$0, %al
	callq	printf
# BB#36:
	movl	$65573, %edi            # imm = 0x10025
	callq	enqueue_signature
	movabsq	$.L.str.5, %rdi
	movq	-72(%rbp), %rax
	subq	-88(%rbp), %rax
	imulq	$1000000, %rax, %rax    # imm = 0xF4240
	movq	-64(%rbp), %rsi
	subq	-80(%rbp), %rsi
	addq	%rax, %rsi
	movb	$0, %al
	callq	printf
# BB#37:
	movl	$65574, %edi            # imm = 0x10026
	callq	enqueue_signature_with_remainder_process
	movl	-52(%rbp), %eax
	addq	$144, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.globl	Proc_5                  # -- Begin function Proc_5
	.p2align	4, 0x90
	.type	Proc_5,@function
Proc_5:                                 # @Proc_5
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
	subq	$16, %rsp
	movl	$327681, %edi           # imm = 0x50001
	callq	enqueue_signature_with_return
	movb	$65, Ch_1_Glob
	movl	$0, Bool_Glob
	movl	-4(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end1:
	.size	Proc_5, .Lfunc_end1-Proc_5
	.cfi_endproc
                                        # -- End function
	.globl	Proc_4                  # -- Begin function Proc_4
	.p2align	4, 0x90
	.type	Proc_4,@function
Proc_4:                                 # @Proc_4
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Lcfi8:
	.cfi_def_cfa_offset 16
.Lcfi9:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Lcfi10:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	$393217, %edi           # imm = 0x60001
	callq	enqueue_signature_with_return
	movsbl	Ch_1_Glob, %eax
	cmpl	$65, %eax
	sete	%al
	andb	$1, %al
	movzbl	%al, %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	orl	Bool_Glob, %eax
	movl	%eax, Bool_Glob
	movb	$66, Ch_2_Glob
	movl	-8(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end2:
	.size	Proc_4, .Lfunc_end2-Proc_4
	.cfi_endproc
                                        # -- End function
	.globl	Proc_1                  # -- Begin function Proc_1
	.p2align	4, 0x90
	.type	Proc_1,@function
Proc_1:                                 # @Proc_1
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Lcfi11:
	.cfi_def_cfa_offset 16
.Lcfi12:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Lcfi13:
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$24, %rsp
.Lcfi14:
	.cfi_offset %rbx, -24
	movq	%rdi, %rbx
	movl	$458753, %edi           # imm = 0x70001
	callq	enqueue_signature
	movq	%rbx, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rdi
	movq	Ptr_Glob, %rsi
	movl	$56, %edx
	callq	memcpy
# BB#1:
	movl	$458754, %edi           # imm = 0x70002
	callq	enqueue_signature_with_call
	movq	-24(%rbp), %rax
	movl	$5, 16(%rax)
	movq	-24(%rbp), %rax
	movl	16(%rax), %eax
	movq	-16(%rbp), %rcx
	movl	%eax, 16(%rcx)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-16(%rbp), %rdi
	callq	Proc_3
# BB#2:
	movl	$458755, %edi           # imm = 0x70003
	callq	enqueue_signature
	movq	-16(%rbp), %rax
	cmpl	$0, 8(%rax)
	jne	.LBB3_5
# BB#3:
	movl	$458756, %edi           # imm = 0x70004
	callq	enqueue_signature_with_call
	movq	-16(%rbp), %rax
	movl	$6, 16(%rax)
	movq	-24(%rbp), %rax
	movl	12(%rax), %edi
	movq	-16(%rbp), %rsi
	addq	$12, %rsi
	movb	$0, %al
	callq	Proc_6
# BB#4:
	movl	$458757, %edi           # imm = 0x70005
	callq	enqueue_signature_with_call
	movq	Ptr_Glob, %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-16(%rbp), %rax
	movl	16(%rax), %edi
	movq	-16(%rbp), %rdx
	addq	$12, %rdx
	addq	$4, %rdx
	movl	$10, %esi
	movb	$0, %al
	callq	Proc_7
	jmp	.LBB3_6
.LBB3_5:
	movl	$458758, %edi           # imm = 0x70006
	callq	enqueue_signature
	movq	-24(%rbp), %rdi
	movq	-24(%rbp), %rax
	movq	(%rax), %rsi
	movl	$56, %edx
	callq	memcpy
.LBB3_6:
	movl	$458759, %edi           # imm = 0x70007
	callq	enqueue_signature_with_return
	movl	-28(%rbp), %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end3:
	.size	Proc_1, .Lfunc_end3-Proc_1
	.cfi_endproc
                                        # -- End function
	.globl	Proc_2                  # -- Begin function Proc_2
	.p2align	4, 0x90
	.type	Proc_2,@function
Proc_2:                                 # @Proc_2
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
	subq	$24, %rsp
.Lcfi18:
	.cfi_offset %rbx, -24
	movq	%rdi, %rbx
	movl	$524289, %edi           # imm = 0x80001
	callq	enqueue_signature
	movq	%rbx, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	addl	$10, %eax
	movl	%eax, -12(%rbp)
.LBB4_1:                                # =>This Inner Loop Header: Depth=1
	movl	$524290, %edi           # imm = 0x80002
	callq	enqueue_signature
	movsbl	Ch_1_Glob, %eax
	cmpl	$65, %eax
	jne	.LBB4_3
# BB#2:                                 #   in Loop: Header=BB4_1 Depth=1
	movl	$524291, %edi           # imm = 0x80003
	callq	enqueue_signature
	movl	-12(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	subl	Int_Glob, %eax
	movq	-24(%rbp), %rcx
	movl	%eax, (%rcx)
	movl	$0, -16(%rbp)
.LBB4_3:                                #   in Loop: Header=BB4_1 Depth=1
	movl	$524292, %edi           # imm = 0x80004
	callq	enqueue_signature
# BB#4:                                 #   in Loop: Header=BB4_1 Depth=1
	movl	$524293, %edi           # imm = 0x80005
	callq	enqueue_signature
	cmpl	$0, -16(%rbp)
	jne	.LBB4_1
# BB#5:
	movl	$524294, %edi           # imm = 0x80006
	callq	enqueue_signature_with_return
	movl	-28(%rbp), %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end4:
	.size	Proc_2, .Lfunc_end4-Proc_2
	.cfi_endproc
                                        # -- End function
	.globl	Proc_3                  # -- Begin function Proc_3
	.p2align	4, 0x90
	.type	Proc_3,@function
Proc_3:                                 # @Proc_3
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
	subq	$24, %rsp
.Lcfi22:
	.cfi_offset %rbx, -24
	movq	%rdi, %rbx
	movl	$720897, %edi           # imm = 0xB0001
	callq	enqueue_signature
	movq	%rbx, -16(%rbp)
	cmpq	$0, Ptr_Glob
	je	.LBB5_2
# BB#1:
	movl	$720898, %edi           # imm = 0xB0002
	callq	enqueue_signature
	movq	Ptr_Glob, %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rcx
	movq	%rax, (%rcx)
.LBB5_2:
	movl	$720899, %edi           # imm = 0xB0003
	callq	enqueue_signature_with_call
	movl	Int_Glob, %esi
	movq	Ptr_Glob, %rdx
	addq	$12, %rdx
	addq	$4, %rdx
	movl	$10, %edi
	movb	$0, %al
	callq	Proc_7
# BB#3:
	movl	$720900, %edi           # imm = 0xB0004
	callq	enqueue_signature_with_return
	movl	-20(%rbp), %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end5:
	.size	Proc_3, .Lfunc_end5-Proc_3
	.cfi_endproc
                                        # -- End function
	.globl	Proc_6                  # -- Begin function Proc_6
	.p2align	4, 0x90
	.type	Proc_6,@function
Proc_6:                                 # @Proc_6
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
	subq	$32, %rsp
.Lcfi26:
	.cfi_offset %rbx, -32
.Lcfi27:
	.cfi_offset %r14, -24
	movq	%rsi, %r14
	movl	%edi, %ebx
	movl	$786433, %edi           # imm = 0xC0001
	callq	enqueue_signature_with_call
	movl	%ebx, -20(%rbp)
	movq	%r14, -32(%rbp)
	movl	-20(%rbp), %eax
	movq	-32(%rbp), %rcx
	movl	%eax, (%rcx)
	movl	-20(%rbp), %edi
	callq	Func_3
	movl	%eax, %ebx
# BB#1:
	movl	$786434, %edi           # imm = 0xC0002
	callq	enqueue_signature
	cmpl	$0, %ebx
	jne	.LBB6_3
# BB#2:
	movl	$786435, %edi           # imm = 0xC0003
	callq	enqueue_signature
	movq	-32(%rbp), %rax
	movl	$3, (%rax)
.LBB6_3:
	movl	$786436, %edi           # imm = 0xC0004
	callq	enqueue_signature_with_return
	movl	-36(%rbp), %eax
	addq	$32, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end6:
	.size	Proc_6, .Lfunc_end6-Proc_6
	.cfi_endproc
                                        # -- End function
	.globl	Func_3                  # -- Begin function Func_3
	.p2align	4, 0x90
	.type	Func_3,@function
Func_3:                                 # @Func_3
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
	subq	$24, %rsp
.Lcfi31:
	.cfi_offset %rbx, -24
	movl	%edi, %ebx
	movl	$851969, %edi           # imm = 0xD0001
	callq	enqueue_signature
	movl	%ebx, -20(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, -16(%rbp)
	cmpl	$2, -16(%rbp)
	jne	.LBB7_2
# BB#1:
	movl	$851970, %edi           # imm = 0xD0002
	callq	enqueue_signature
	movl	$1, -12(%rbp)
	jmp	.LBB7_3
.LBB7_2:
	movl	$851971, %edi           # imm = 0xD0003
	callq	enqueue_signature
	movl	$0, -12(%rbp)
.LBB7_3:
	movl	$851972, %edi           # imm = 0xD0004
	callq	enqueue_signature_with_return
	movl	-12(%rbp), %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end7:
	.size	Func_3, .Lfunc_end7-Func_3
	.cfi_endproc
                                        # -- End function
	.globl	Proc_7                  # -- Begin function Proc_7
	.p2align	4, 0x90
	.type	Proc_7,@function
Proc_7:                                 # @Proc_7
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
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	subq	$40, %rsp
.Lcfi35:
	.cfi_offset %rbx, -40
.Lcfi36:
	.cfi_offset %r14, -32
.Lcfi37:
	.cfi_offset %r15, -24
	movq	%rdx, %r14
	movl	%esi, %r15d
	movl	%edi, %ebx
	movl	$917505, %edi           # imm = 0xE0001
	callq	enqueue_signature_with_return
	movl	%ebx, -36(%rbp)
	movl	%r15d, -32(%rbp)
	movq	%r14, -48(%rbp)
	movl	-36(%rbp), %eax
	addl	$2, %eax
	movl	%eax, -28(%rbp)
	movl	-32(%rbp), %eax
	addl	-28(%rbp), %eax
	movq	-48(%rbp), %rcx
	movl	%eax, (%rcx)
	movl	-52(%rbp), %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end8:
	.size	Proc_7, .Lfunc_end8-Proc_7
	.cfi_endproc
                                        # -- End function
	.globl	Proc_8                  # -- Begin function Proc_8
	.p2align	4, 0x90
	.type	Proc_8,@function
Proc_8:                                 # @Proc_8
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Lcfi38:
	.cfi_def_cfa_offset 16
.Lcfi39:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Lcfi40:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	subq	$48, %rsp
.Lcfi41:
	.cfi_offset %rbx, -48
.Lcfi42:
	.cfi_offset %r12, -40
.Lcfi43:
	.cfi_offset %r14, -32
.Lcfi44:
	.cfi_offset %r15, -24
	movl	%ecx, %r14d
	movl	%edx, %r15d
	movq	%rsi, %r12
	movq	%rdi, %rbx
	movl	$983041, %edi           # imm = 0xF0001
	callq	enqueue_signature
	movq	%rbx, -48(%rbp)
	movq	%r12, -56(%rbp)
	movl	%r15d, -64(%rbp)
	movl	%r14d, -60(%rbp)
	movl	-64(%rbp), %eax
	addl	$5, %eax
	movl	%eax, -36(%rbp)
	movl	-60(%rbp), %eax
	movq	-48(%rbp), %rcx
	movslq	-36(%rbp), %rdx
	movl	%eax, (%rcx,%rdx,4)
	movq	-48(%rbp), %rax
	movslq	-36(%rbp), %rcx
	movl	(%rax,%rcx,4), %eax
	movq	-48(%rbp), %rcx
	movl	-36(%rbp), %edx
	addl	$1, %edx
	movslq	%edx, %rdx
	movl	%eax, (%rcx,%rdx,4)
	movl	-36(%rbp), %eax
	movq	-48(%rbp), %rcx
	movl	-36(%rbp), %edx
	addl	$30, %edx
	movslq	%edx, %rdx
	movl	%eax, (%rcx,%rdx,4)
	movl	-36(%rbp), %eax
	movl	%eax, -40(%rbp)
.LBB9_1:                                # =>This Inner Loop Header: Depth=1
	movl	$983042, %edi           # imm = 0xF0002
	callq	enqueue_signature
	movl	-40(%rbp), %eax
	movl	-36(%rbp), %ecx
	addl	$1, %ecx
	cmpl	%ecx, %eax
	jg	.LBB9_4
# BB#2:                                 #   in Loop: Header=BB9_1 Depth=1
	movl	$983043, %edi           # imm = 0xF0003
	callq	enqueue_signature
	movl	-36(%rbp), %eax
	movq	-56(%rbp), %rcx
	movslq	-36(%rbp), %rdx
	imulq	$200, %rdx, %rdx
	addq	%rcx, %rdx
	movslq	-40(%rbp), %rcx
	movl	%eax, (%rdx,%rcx,4)
# BB#3:                                 #   in Loop: Header=BB9_1 Depth=1
	movl	$983044, %edi           # imm = 0xF0004
	callq	enqueue_signature
	movl	-40(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -40(%rbp)
	jmp	.LBB9_1
.LBB9_4:
	movl	$983045, %edi           # imm = 0xF0005
	callq	enqueue_signature_with_return
	movq	-56(%rbp), %rax
	movslq	-36(%rbp), %rcx
	imulq	$200, %rcx, %rcx
	addq	%rax, %rcx
	movl	-36(%rbp), %eax
	subl	$1, %eax
	cltq
	movl	(%rcx,%rax,4), %edx
	addl	$1, %edx
	movl	%edx, (%rcx,%rax,4)
	movq	-48(%rbp), %rax
	movslq	-36(%rbp), %rcx
	movl	(%rax,%rcx,4), %eax
	movq	-56(%rbp), %rcx
	movl	-36(%rbp), %edx
	addl	$20, %edx
	movslq	%edx, %rdx
	imulq	$200, %rdx, %rdx
	addq	%rcx, %rdx
	movslq	-36(%rbp), %rcx
	movl	%eax, (%rdx,%rcx,4)
	movl	$5, Int_Glob
	movl	-68(%rbp), %eax
	addq	$48, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end9:
	.size	Proc_8, .Lfunc_end9-Proc_8
	.cfi_endproc
                                        # -- End function
	.globl	Func_1                  # -- Begin function Func_1
	.p2align	4, 0x90
	.type	Func_1,@function
Func_1:                                 # @Func_1
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Lcfi45:
	.cfi_def_cfa_offset 16
.Lcfi46:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Lcfi47:
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	subq	$16, %rsp
.Lcfi48:
	.cfi_offset %rbx, -32
.Lcfi49:
	.cfi_offset %r14, -24
	movl	%esi, %r14d
	movl	%edi, %ebx
	movl	$1048577, %edi          # imm = 0x100001
	callq	enqueue_signature
	movb	%bl, -20(%rbp)
	movb	%r14b, -19(%rbp)
	movb	-20(%rbp), %al
	movb	%al, -17(%rbp)
	movb	-17(%rbp), %al
	movb	%al, -18(%rbp)
	movsbl	-18(%rbp), %eax
	movsbl	-19(%rbp), %ecx
	cmpl	%ecx, %eax
	je	.LBB10_2
# BB#1:
	movl	$1048578, %edi          # imm = 0x100002
	callq	enqueue_signature
	movl	$0, -24(%rbp)
	jmp	.LBB10_3
.LBB10_2:
	movl	$1048579, %edi          # imm = 0x100003
	callq	enqueue_signature
	movb	-17(%rbp), %al
	movb	%al, Ch_1_Glob
	movl	$1, -24(%rbp)
.LBB10_3:
	movl	$1048580, %edi          # imm = 0x100004
	callq	enqueue_signature_with_return
	movl	-24(%rbp), %eax
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end10:
	.size	Func_1, .Lfunc_end10-Func_1
	.cfi_endproc
                                        # -- End function
	.globl	Func_2                  # -- Begin function Func_2
	.p2align	4, 0x90
	.type	Func_2,@function
Func_2:                                 # @Func_2
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Lcfi50:
	.cfi_def_cfa_offset 16
.Lcfi51:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Lcfi52:
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	subq	$32, %rsp
.Lcfi53:
	.cfi_offset %rbx, -32
.Lcfi54:
	.cfi_offset %r14, -24
	movq	%rsi, %r14
	movq	%rdi, %rbx
	movl	$1114113, %edi          # imm = 0x110001
	callq	enqueue_signature
	movq	%rbx, -48(%rbp)
	movq	%r14, -40(%rbp)
	movl	$2, -24(%rbp)
.LBB11_1:                               # =>This Inner Loop Header: Depth=1
	movl	$1114114, %edi          # imm = 0x110002
	callq	enqueue_signature
	cmpl	$2, -24(%rbp)
	jg	.LBB11_6
# BB#2:                                 #   in Loop: Header=BB11_1 Depth=1
	movl	$1114115, %edi          # imm = 0x110003
	callq	enqueue_signature_with_call
	movq	-48(%rbp), %rax
	movslq	-24(%rbp), %rcx
	movsbl	(%rax,%rcx), %edi
	movq	-40(%rbp), %rax
	movl	-24(%rbp), %ecx
	addl	$1, %ecx
	movslq	%ecx, %rcx
	movsbl	(%rax,%rcx), %esi
	callq	Func_1
	movl	%eax, %ebx
# BB#3:                                 #   in Loop: Header=BB11_1 Depth=1
	movl	$1114116, %edi          # imm = 0x110004
	callq	enqueue_signature
	cmpl	$0, %ebx
	jne	.LBB11_5
# BB#4:                                 #   in Loop: Header=BB11_1 Depth=1
	movl	$1114117, %edi          # imm = 0x110005
	callq	enqueue_signature
	movb	$65, -17(%rbp)
	movl	-24(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -24(%rbp)
.LBB11_5:                               #   in Loop: Header=BB11_1 Depth=1
	movl	$1114118, %edi          # imm = 0x110006
	callq	enqueue_signature
	jmp	.LBB11_1
.LBB11_6:
	movl	$1114119, %edi          # imm = 0x110007
	callq	enqueue_signature
	movsbl	-17(%rbp), %eax
	cmpl	$87, %eax
	jl	.LBB11_9
# BB#7:
	movl	$1114120, %edi          # imm = 0x110008
	callq	enqueue_signature
	movsbl	-17(%rbp), %eax
	cmpl	$90, %eax
	jge	.LBB11_9
# BB#8:
	movl	$1114121, %edi          # imm = 0x110009
	callq	enqueue_signature
	movl	$7, -24(%rbp)
.LBB11_9:
	movl	$1114122, %edi          # imm = 0x11000A
	callq	enqueue_signature
	movsbl	-17(%rbp), %eax
	cmpl	$82, %eax
	jne	.LBB11_11
# BB#10:
	movl	$1114123, %edi          # imm = 0x11000B
	callq	enqueue_signature
	movl	$1, -28(%rbp)
	jmp	.LBB11_15
.LBB11_11:
	movl	$1114124, %edi          # imm = 0x11000C
	callq	enqueue_signature
	movq	-48(%rbp), %rdi
	movq	-40(%rbp), %rsi
	callq	strcmp
	movl	%eax, %ebx
# BB#12:
	movl	$1114125, %edi          # imm = 0x11000D
	callq	enqueue_signature
	cmpl	$0, %ebx
	jle	.LBB11_14
# BB#13:
	movl	$1114126, %edi          # imm = 0x11000E
	callq	enqueue_signature
	movl	-24(%rbp), %eax
	addl	$7, %eax
	movl	%eax, -24(%rbp)
	movl	-24(%rbp), %eax
	movl	%eax, Int_Glob
	movl	$1, -28(%rbp)
	jmp	.LBB11_15
.LBB11_14:
	movl	$1114127, %edi          # imm = 0x11000F
	callq	enqueue_signature
	movl	$0, -28(%rbp)
.LBB11_15:
	movl	$1114128, %edi          # imm = 0x110010
	callq	enqueue_signature_with_return
	movl	-28(%rbp), %eax
	addq	$32, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end11:
	.size	Func_2, .Lfunc_end11-Func_2
	.cfi_endproc
                                        # -- End function
	.globl	CallcheckerSet          # -- Begin function CallcheckerSet
	.p2align	4, 0x90
	.type	CallcheckerSet,@function
CallcheckerSet:                         # @CallcheckerSet
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rax
.Lcfi55:
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
.Lfunc_end12:
	.size	CallcheckerSet, .Lfunc_end12-CallcheckerSet
	.cfi_endproc
                                        # -- End function
	.type	Reg,@object             # @Reg
	.bss
	.globl	Reg
	.p2align	2
Reg:
	.long	0                       # 0x0
	.size	Reg, 4

	.type	Next_Ptr_Glob,@object   # @Next_Ptr_Glob
	.comm	Next_Ptr_Glob,8,8
	.type	Ptr_Glob,@object        # @Ptr_Glob
	.comm	Ptr_Glob,8,8
	.type	Arr_2_Glob,@object      # @Arr_2_Glob
	.comm	Arr_2_Glob,10000,16
	.type	Bool_Glob,@object       # @Bool_Glob
	.comm	Bool_Glob,4,4
	.type	Arr_1_Glob,@object      # @Arr_1_Glob
	.comm	Arr_1_Glob,200,16
	.type	Ch_2_Glob,@object       # @Ch_2_Glob
	.comm	Ch_2_Glob,1,1
	.type	Int_Glob,@object        # @Int_Glob
	.comm	Int_Glob,4,4
	.type	End_Time,@object        # @End_Time
	.comm	End_Time,8,8
	.type	Begin_Time,@object      # @Begin_Time
	.comm	Begin_Time,8,8
	.type	User_Time,@object       # @User_Time
	.comm	User_Time,8,8
	.type	Microseconds,@object    # @Microseconds
	.comm	Microseconds,4,4
	.type	Dhrystones_Per_Second,@object # @Dhrystones_Per_Second
	.comm	Dhrystones_Per_Second,4,4
	.type	Ch_1_Glob,@object       # @Ch_1_Glob
	.comm	Ch_1_Glob,1,1
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"DHRYSTONE PROGRAM, SOME STRING"
	.size	.L.str, 31

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"DHRYSTONE PROGRAM, 1'ST STRING"
	.size	.L.str.1, 31

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"DHRYSTONE PROGRAM, 2'ND STRING"
	.size	.L.str.2, 31

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	"DHRYSTONE PROGRAM, 3'RD STRING"
	.size	.L.str.3, 31

	.type	.L.str.4,@object        # @.str.4
.L.str.4:
	.asciz	" [target finished!]\n"
	.size	.L.str.4, 21

	.type	.L.str.5,@object        # @.str.5
.L.str.5:
	.asciz	" [target] Execution time: %ld\n"
	.size	.L.str.5, 31


	.ident	"clang version 5.0.0 (tags/RELEASE_500/final)"
	.ident	"clang version 5.0.0 (tags/RELEASE_500/final)"
	.section	".note.GNU-stack","",@progbits
