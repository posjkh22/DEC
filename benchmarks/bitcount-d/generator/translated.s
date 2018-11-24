	.text
	.file	"llvm-link"
	.globl	bit_count               # -- Begin function bit_count
	.p2align	4, 0x90
	.type	bit_count,@function
bit_count:                              # @bit_count
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
	subq	$24, %rsp
.Lcfi3:
	.cfi_offset %rbx, -24
	movq	%rdi, %rbx
	movl	$65537, %edi            # imm = 0x10001
	callq	enqueue_signature
	movq	%rbx, -24(%rbp)
	movl	$0, -12(%rbp)
	cmpq	$0, -24(%rbp)
	je	.LBB0_5
# BB#1:
	movl	$65538, %edi            # imm = 0x10002
	callq	enqueue_signature
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	movl	$65539, %edi            # imm = 0x10003
	callq	enqueue_signature
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
# BB#3:                                 #   in Loop: Header=BB0_2 Depth=1
	movl	$65540, %edi            # imm = 0x10004
	callq	enqueue_signature
	xorl	%eax, %eax
	movq	-24(%rbp), %rcx
	movq	-24(%rbp), %rdx
	subq	$1, %rdx
	andq	%rcx, %rdx
	movq	%rdx, -24(%rbp)
	cmpq	%rdx, %rax
	jne	.LBB0_2
# BB#4:
	movl	$65541, %edi            # imm = 0x10005
	callq	enqueue_signature
.LBB0_5:
	movl	$65542, %edi            # imm = 0x10006
	callq	enqueue_signature_with_return
	movl	-12(%rbp), %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end0:
	.size	bit_count, .Lfunc_end0-bit_count
	.cfi_endproc
                                        # -- End function
	.globl	bitcount                # -- Begin function bitcount
	.p2align	4, 0x90
	.type	bitcount,@function
bitcount:                               # @bitcount
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
	pushq	%rbx
	pushq	%rax
.Lcfi7:
	.cfi_offset %rbx, -24
	movq	%rdi, %rbx
	movl	$131073, %edi           # imm = 0x20001
	callq	enqueue_signature_with_return
	movl	$4294901760, %eax       # imm = 0xFFFF0000
	movl	$4278255360, %ecx       # imm = 0xFF00FF00
	movl	$4042322160, %edx       # imm = 0xF0F0F0F0
	movl	$3435973836, %esi       # imm = 0xCCCCCCCC
	movl	$2863311530, %edi       # imm = 0xAAAAAAAA
	movq	%rbx, -16(%rbp)
	andq	-16(%rbp), %rdi
	sarq	$1, %rdi
	movq	-16(%rbp), %rbx
	andq	$1431655765, %rbx       # imm = 0x55555555
	addq	%rdi, %rbx
	movq	%rbx, -16(%rbp)
	andq	-16(%rbp), %rsi
	sarq	$2, %rsi
	movq	-16(%rbp), %rdi
	andq	$858993459, %rdi        # imm = 0x33333333
	addq	%rsi, %rdi
	movq	%rdi, -16(%rbp)
	andq	-16(%rbp), %rdx
	sarq	$4, %rdx
	movq	-16(%rbp), %rsi
	andq	$252645135, %rsi        # imm = 0xF0F0F0F
	addq	%rdx, %rsi
	movq	%rsi, -16(%rbp)
	andq	-16(%rbp), %rcx
	sarq	$8, %rcx
	movq	-16(%rbp), %rdx
	andq	$16711935, %rdx         # imm = 0xFF00FF
	addq	%rcx, %rdx
	movq	%rdx, -16(%rbp)
	andq	-16(%rbp), %rax
	sarq	$16, %rax
	movq	-16(%rbp), %rcx
	andq	$65535, %rcx            # imm = 0xFFFF
	addq	%rax, %rcx
	movq	%rcx, -16(%rbp)
	movq	-16(%rbp), %rax
                                        # kill: %EAX<def> %EAX<kill> %RAX<kill>
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end1:
	.size	bitcount, .Lfunc_end1-bitcount
	.cfi_endproc
                                        # -- End function
	.globl	ntbl_bitcount           # -- Begin function ntbl_bitcount
	.p2align	4, 0x90
	.type	ntbl_bitcount,@function
ntbl_bitcount:                          # @ntbl_bitcount
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
	pushq	%rbx
	pushq	%rax
.Lcfi11:
	.cfi_offset %rbx, -24
	movq	%rdi, %rbx
	movl	$196609, %edi           # imm = 0x30001
	callq	enqueue_signature_with_return
	movl	$4026531840, %eax       # imm = 0xF0000000
	movq	%rbx, -16(%rbp)
	movq	-16(%rbp), %rcx
	andq	$15, %rcx
	movslq	%ecx, %rcx
	movsbl	bits(,%rcx), %ecx
	movq	-16(%rbp), %rdx
	andq	$240, %rdx
	shrq	$4, %rdx
	movslq	%edx, %rdx
	movsbl	bits(,%rdx), %edx
	addl	%ecx, %edx
	movq	-16(%rbp), %rcx
	andq	$3840, %rcx             # imm = 0xF00
	shrq	$8, %rcx
	movslq	%ecx, %rcx
	movsbl	bits(,%rcx), %ecx
	addl	%edx, %ecx
	movq	-16(%rbp), %rdx
	andq	$61440, %rdx            # imm = 0xF000
	shrq	$12, %rdx
	movslq	%edx, %rdx
	movsbl	bits(,%rdx), %edx
	addl	%ecx, %edx
	movq	-16(%rbp), %rcx
	andq	$983040, %rcx           # imm = 0xF0000
	shrq	$16, %rcx
	movslq	%ecx, %rcx
	movsbl	bits(,%rcx), %ecx
	addl	%edx, %ecx
	movq	-16(%rbp), %rdx
	andq	$15728640, %rdx         # imm = 0xF00000
	shrq	$20, %rdx
	movslq	%edx, %rdx
	movsbl	bits(,%rdx), %edx
	addl	%ecx, %edx
	movq	-16(%rbp), %rcx
	andq	$251658240, %rcx        # imm = 0xF000000
	shrq	$24, %rcx
	movslq	%ecx, %rcx
	movsbl	bits(,%rcx), %ecx
	addl	%edx, %ecx
	andq	-16(%rbp), %rax
	shrq	$28, %rax
	cltq
	movsbl	bits(,%rax), %eax
	addl	%ecx, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end2:
	.size	ntbl_bitcount, .Lfunc_end2-ntbl_bitcount
	.cfi_endproc
                                        # -- End function
	.globl	BW_btbl_bitcount        # -- Begin function BW_btbl_bitcount
	.p2align	4, 0x90
	.type	BW_btbl_bitcount,@function
BW_btbl_bitcount:                       # @BW_btbl_bitcount
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Lcfi12:
	.cfi_def_cfa_offset 16
.Lcfi13:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Lcfi14:
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$24, %rsp
.Lcfi15:
	.cfi_offset %rbx, -24
	movq	%rdi, %rbx
	movl	$262145, %edi           # imm = 0x40001
	callq	enqueue_signature_with_return
	movq	%rbx, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movzbl	-16(%rbp), %eax
	movsbl	bits(,%rax), %eax
	movzbl	-15(%rbp), %ecx
	movsbl	bits(,%rcx), %ecx
	addl	%eax, %ecx
	movzbl	-13(%rbp), %eax
	movsbl	bits(,%rax), %edx
	addl	%ecx, %edx
	movzbl	-14(%rbp), %eax
	movsbl	bits(,%rax), %eax
	addl	%edx, %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end3:
	.size	BW_btbl_bitcount, .Lfunc_end3-BW_btbl_bitcount
	.cfi_endproc
                                        # -- End function
	.globl	AR_btbl_bitcount        # -- Begin function AR_btbl_bitcount
	.p2align	4, 0x90
	.type	AR_btbl_bitcount,@function
AR_btbl_bitcount:                       # @AR_btbl_bitcount
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Lcfi16:
	.cfi_def_cfa_offset 16
.Lcfi17:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Lcfi18:
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$24, %rsp
.Lcfi19:
	.cfi_offset %rbx, -24
	movq	%rdi, %rbx
	movl	$327681, %edi           # imm = 0x50001
	callq	enqueue_signature_with_return
	leaq	-32(%rbp), %rax
	movq	%rbx, -32(%rbp)
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, -24(%rbp)
	movzbl	(%rax), %eax
	movsbl	bits(,%rax), %eax
	movl	%eax, -12(%rbp)
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, -24(%rbp)
	movzbl	(%rax), %eax
	movsbl	bits(,%rax), %eax
	addl	-12(%rbp), %eax
	movl	%eax, -12(%rbp)
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, -24(%rbp)
	movzbl	(%rax), %eax
	movsbl	bits(,%rax), %eax
	addl	-12(%rbp), %eax
	movl	%eax, -12(%rbp)
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	bits(,%rax), %eax
	addl	-12(%rbp), %eax
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end4:
	.size	AR_btbl_bitcount, .Lfunc_end4-AR_btbl_bitcount
	.cfi_endproc
                                        # -- End function
	.globl	ntbl_bitcnt             # -- Begin function ntbl_bitcnt
	.p2align	4, 0x90
	.type	ntbl_bitcnt,@function
ntbl_bitcnt:                            # @ntbl_bitcnt
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Lcfi20:
	.cfi_def_cfa_offset 16
.Lcfi21:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Lcfi22:
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$24, %rsp
.Lcfi23:
	.cfi_offset %rbx, -24
	movq	%rdi, %rbx
	movl	$393217, %edi           # imm = 0x60001
	callq	enqueue_signature
	xorl	%eax, %eax
	movq	%rbx, -24(%rbp)
	movq	-24(%rbp), %rcx
	andq	$15, %rcx
	movslq	%ecx, %rcx
	movsbl	bits.1(,%rcx), %ecx
	movl	%ecx, -12(%rbp)
	movq	-24(%rbp), %rcx
	sarq	$4, %rcx
	movq	%rcx, -24(%rbp)
	cmpq	%rcx, %rax
	je	.LBB5_3
# BB#1:
	movl	$393218, %edi           # imm = 0x60002
	callq	enqueue_signature_with_call
	movq	-24(%rbp), %rdi
	callq	ntbl_bitcnt
	movl	%eax, %ebx
# BB#2:
	movl	$393219, %edi           # imm = 0x60003
	callq	enqueue_signature
	addl	-12(%rbp), %ebx
	movl	%ebx, -12(%rbp)
.LBB5_3:
	movl	$393220, %edi           # imm = 0x60004
	callq	enqueue_signature_with_return
	movl	-12(%rbp), %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end5:
	.size	ntbl_bitcnt, .Lfunc_end5-ntbl_bitcnt
	.cfi_endproc
                                        # -- End function
	.globl	btbl_bitcnt             # -- Begin function btbl_bitcnt
	.p2align	4, 0x90
	.type	btbl_bitcnt,@function
btbl_bitcnt:                            # @btbl_bitcnt
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Lcfi24:
	.cfi_def_cfa_offset 16
.Lcfi25:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Lcfi26:
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$24, %rsp
.Lcfi27:
	.cfi_offset %rbx, -24
	movq	%rdi, %rbx
	movl	$458753, %edi           # imm = 0x70001
	callq	enqueue_signature
	xorl	%eax, %eax
	movq	%rbx, -24(%rbp)
	movsbl	-24(%rbp), %ecx
	andl	$255, %ecx
	movslq	%ecx, %rcx
	movsbl	bits.1(,%rcx), %ecx
	movl	%ecx, -12(%rbp)
	movq	-24(%rbp), %rcx
	sarq	$8, %rcx
	movq	%rcx, -24(%rbp)
	cmpq	%rcx, %rax
	je	.LBB6_3
# BB#1:
	movl	$458754, %edi           # imm = 0x70002
	callq	enqueue_signature_with_call
	movq	-24(%rbp), %rdi
	callq	btbl_bitcnt
	movl	%eax, %ebx
# BB#2:
	movl	$458755, %edi           # imm = 0x70003
	callq	enqueue_signature
	addl	-12(%rbp), %ebx
	movl	%ebx, -12(%rbp)
.LBB6_3:
	movl	$458756, %edi           # imm = 0x70004
	callq	enqueue_signature_with_return
	movl	-12(%rbp), %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end6:
	.size	btbl_bitcnt, .Lfunc_end6-btbl_bitcnt
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3               # -- Begin function main
.LCPI7_0:
	.quad	9218868437227405311     # double 1.7976931348623157E+308
.LCPI7_1:
	.quad	4696837146684686336     # double 1.0E+6
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
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
	pushq	%r14
	pushq	%rbx
	subq	$144, %rsp
.Lcfi31:
	.cfi_offset %rbx, -32
.Lcfi32:
	.cfi_offset %r14, -24
	movq	%rsi, %r14
	movl	%edi, %ebx
	callq	init_monitor
	movl	$524289, %edi           # imm = 0x80001
	callq	enqueue_signature
	leaq	-152(%rbp), %rdi
	xorps	%xmm0, %xmm0
	movsd	.LCPI7_0(%rip), %xmm1   # xmm1 = mem[0],zero
	movl	$0, -116(%rbp)
	movl	%ebx, -56(%rbp)
	movq	%r14, -104(%rbp)
	movsd	%xmm1, -80(%rbp)
	movsd	%xmm0, -72(%rbp)
	xorl	%esi, %esi
	callq	gettimeofday
# BB#1:
	movl	$524290, %edi           # imm = 0x80002
	callq	enqueue_signature
	cmpl	$2, -56(%rbp)
	jge	.LBB7_5
# BB#2:
	movl	$524291, %edi           # imm = 0x80003
	callq	enqueue_signature
	movabsq	$.L.str.7, %rsi
	movq	stderr, %rdi
	movb	$0, %al
	callq	fprintf
# BB#3:
	movl	$524292, %edi           # imm = 0x80004
	callq	enqueue_signature
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
# BB#4:
	movl	$524293, %edi           # imm = 0x80005
	callq	enqueue_signature_with_return
.LBB7_5:
	movl	$524294, %edi           # imm = 0x80006
	callq	enqueue_signature
	movq	-104(%rbp), %rax
	movq	8(%rax), %rdi
	callq	atoi
	movl	%eax, %ebx
# BB#6:
	movl	$524295, %edi           # imm = 0x80007
	callq	enqueue_signature
	movl	%ebx, -52(%rbp)
	movl	$0, -20(%rbp)
.LBB7_7:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_11 Depth 2
	movl	$524296, %edi           # imm = 0x80008
	callq	enqueue_signature
	cmpl	$7, -20(%rbp)
	jge	.LBB7_22
# BB#8:                                 #   in Loop: Header=BB7_7 Depth=1
	movl	$524297, %edi           # imm = 0x80009
	callq	enqueue_signature
	callq	clock
	movq	%rax, %rbx
# BB#9:                                 #   in Loop: Header=BB7_7 Depth=1
	movl	$524298, %edi           # imm = 0x8000A
	callq	enqueue_signature
	movq	%rbx, -96(%rbp)
	movq	$0, -64(%rbp)
	movq	$0, -48(%rbp)
	callq	rand
	movl	%eax, %ebx
# BB#10:                                #   in Loop: Header=BB7_7 Depth=1
	movl	$524299, %edi           # imm = 0x8000B
	callq	enqueue_signature
	movslq	%ebx, %rax
	movq	%rax, -40(%rbp)
.LBB7_11:                               #   Parent Loop BB7_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	$524300, %edi           # imm = 0x8000C
	callq	enqueue_signature
	movq	-48(%rbp), %rax
	movslq	-52(%rbp), %rcx
	cmpq	%rcx, %rax
	jge	.LBB7_15
# BB#12:                                #   in Loop: Header=BB7_11 Depth=2
	movl	$524301, %edi           # imm = 0x8000D
	callq	enqueue_signature
	movslq	-20(%rbp), %rax
	movq	main.pBitCntFunc(,%rax,8), %rax
	movq	-40(%rbp), %rdi
	callq	*%rax
	movl	%eax, %ebx
# BB#13:                                #   in Loop: Header=BB7_11 Depth=2
	movl	$524302, %edi           # imm = 0x8000E
	callq	enqueue_signature
	movslq	%ebx, %rax
	addq	-64(%rbp), %rax
	movq	%rax, -64(%rbp)
# BB#14:                                #   in Loop: Header=BB7_11 Depth=2
	movl	$524303, %edi           # imm = 0x8000F
	callq	enqueue_signature
	movq	-48(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -48(%rbp)
	movq	-40(%rbp), %rax
	addq	$13, %rax
	movq	%rax, -40(%rbp)
	jmp	.LBB7_11
.LBB7_15:                               #   in Loop: Header=BB7_7 Depth=1
	movl	$524304, %edi           # imm = 0x80010
	callq	enqueue_signature
	callq	clock
	movq	%rax, %rbx
# BB#16:                                #   in Loop: Header=BB7_7 Depth=1
	movl	$524305, %edi           # imm = 0x80011
	callq	enqueue_signature
	movsd	.LCPI7_1(%rip), %xmm0   # xmm0 = mem[0],zero
	movq	%rbx, -88(%rbp)
	movq	-88(%rbp), %rax
	subq	-96(%rbp), %rax
	cvtsi2sdq	%rax, %xmm1
	divsd	%xmm0, %xmm1
	movsd	%xmm1, -32(%rbp)
	movsd	-32(%rbp), %xmm0        # xmm0 = mem[0],zero
	movsd	-80(%rbp), %xmm1        # xmm1 = mem[0],zero
	ucomisd	%xmm0, %xmm1
	jbe	.LBB7_18
# BB#17:                                #   in Loop: Header=BB7_7 Depth=1
	movl	$524306, %edi           # imm = 0x80012
	callq	enqueue_signature
	movsd	-32(%rbp), %xmm0        # xmm0 = mem[0],zero
	movsd	%xmm0, -80(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, -112(%rbp)
.LBB7_18:                               #   in Loop: Header=BB7_7 Depth=1
	movl	$524307, %edi           # imm = 0x80013
	callq	enqueue_signature
	movsd	-32(%rbp), %xmm0        # xmm0 = mem[0],zero
	ucomisd	-72(%rbp), %xmm0
	jbe	.LBB7_20
# BB#19:                                #   in Loop: Header=BB7_7 Depth=1
	movl	$524308, %edi           # imm = 0x80014
	callq	enqueue_signature
	movsd	-32(%rbp), %xmm0        # xmm0 = mem[0],zero
	movsd	%xmm0, -72(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, -108(%rbp)
.LBB7_20:                               #   in Loop: Header=BB7_7 Depth=1
	movl	$524309, %edi           # imm = 0x80015
	callq	enqueue_signature
# BB#21:                                #   in Loop: Header=BB7_7 Depth=1
	movl	$524310, %edi           # imm = 0x80016
	callq	enqueue_signature
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	.LBB7_7
.LBB7_22:
	movl	$524311, %edi           # imm = 0x80017
	callq	enqueue_signature
	movabsq	$.L.str.8, %rdi
	movb	$0, %al
	callq	printf
# BB#23:
	movl	$524312, %edi           # imm = 0x80018
	callq	enqueue_signature
	leaq	-136(%rbp), %rdi
	xorl	%esi, %esi
	callq	gettimeofday
# BB#24:
	movl	$524313, %edi           # imm = 0x80019
	callq	enqueue_signature
	movabsq	$.L.str.9, %rdi
	movq	-136(%rbp), %rax
	subq	-152(%rbp), %rax
	imulq	$1000000, %rax, %rax    # imm = 0xF4240
	movq	-128(%rbp), %rsi
	subq	-144(%rbp), %rsi
	addq	%rax, %rsi
	movb	$0, %al
	callq	printf
# BB#25:
	movl	$524314, %edi           # imm = 0x8001A
	callq	enqueue_signature_with_remainder_process
	movl	$1, is_signature_queue_full
	xorl	%eax, %eax
	addq	$144, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end7:
	.size	main, .Lfunc_end7-main
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function bit_shifter
	.type	bit_shifter,@function
bit_shifter:                            # @bit_shifter
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Lcfi33:
	.cfi_def_cfa_offset 16
.Lcfi34:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Lcfi35:
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$24, %rsp
.Lcfi36:
	.cfi_offset %rbx, -24
	movq	%rdi, %rbx
	movl	$1048577, %edi          # imm = 0x100001
	callq	enqueue_signature
	movq	%rbx, -24(%rbp)
	movl	$0, -12(%rbp)
	movl	$0, -16(%rbp)
.LBB8_1:                                # =>This Inner Loop Header: Depth=1
	movl	$1048578, %edi          # imm = 0x100002
	callq	enqueue_signature
	xorl	%ebx, %ebx
	cmpq	$0, -24(%rbp)
	je	.LBB8_3
# BB#2:                                 #   in Loop: Header=BB8_1 Depth=1
	movl	$1048579, %edi          # imm = 0x100003
	callq	enqueue_signature
	movslq	-16(%rbp), %rax
	cmpq	$64, %rax
	setb	%bl
.LBB8_3:                                #   in Loop: Header=BB8_1 Depth=1
	movl	$1048580, %edi          # imm = 0x100004
	callq	enqueue_signature
	testb	$1, %bl
	jne	.LBB8_4
	jmp	.LBB8_6
.LBB8_4:                                #   in Loop: Header=BB8_1 Depth=1
	movl	$1048581, %edi          # imm = 0x100005
	callq	enqueue_signature
	movq	-24(%rbp), %rax
	andq	$1, %rax
	addl	-12(%rbp), %eax
	movl	%eax, -12(%rbp)
# BB#5:                                 #   in Loop: Header=BB8_1 Depth=1
	movl	$1048582, %edi          # imm = 0x100006
	callq	enqueue_signature
	movl	-16(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -16(%rbp)
	movq	-24(%rbp), %rax
	sarq	$1, %rax
	movq	%rax, -24(%rbp)
	jmp	.LBB8_1
.LBB8_6:
	movl	$1048583, %edi          # imm = 0x100007
	callq	enqueue_signature_with_return
	movl	-12(%rbp), %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end8:
	.size	bit_shifter, .Lfunc_end8-bit_shifter
	.cfi_endproc
                                        # -- End function
	.globl	bfopen                  # -- Begin function bfopen
	.p2align	4, 0x90
	.type	bfopen,@function
bfopen:                                 # @bfopen
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Lcfi37:
	.cfi_def_cfa_offset 16
.Lcfi38:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Lcfi39:
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	subq	$32, %rsp
.Lcfi40:
	.cfi_offset %rbx, -32
.Lcfi41:
	.cfi_offset %r14, -24
	movq	%rsi, %r14
	movq	%rdi, %rbx
	movl	$1114113, %edi          # imm = 0x110001
	callq	enqueue_signature
	movq	%rbx, -48(%rbp)
	movq	%r14, -40(%rbp)
	movl	$16, %edi
	callq	malloc
	movq	%rax, %rbx
# BB#1:
	movl	$1114114, %edi          # imm = 0x110002
	callq	enqueue_signature
	xorl	%eax, %eax
	movq	%rbx, -24(%rbp)
	cmpq	-24(%rbp), %rax
	jne	.LBB9_3
# BB#2:
	movl	$1114115, %edi          # imm = 0x110003
	callq	enqueue_signature
	movq	$0, -32(%rbp)
	jmp	.LBB9_8
.LBB9_3:
	movl	$1114116, %edi          # imm = 0x110004
	callq	enqueue_signature
	movq	-48(%rbp), %rdi
	movq	-40(%rbp), %rsi
	callq	fopen
	movq	%rax, %rbx
# BB#4:
	movl	$1114117, %edi          # imm = 0x110005
	callq	enqueue_signature
	xorl	%eax, %eax
	movq	-24(%rbp), %rcx
	movq	%rbx, (%rcx)
	movq	-24(%rbp), %rcx
	cmpq	(%rcx), %rax
	jne	.LBB9_7
# BB#5:
	movl	$1114118, %edi          # imm = 0x110006
	callq	enqueue_signature
	movq	-24(%rbp), %rdi
	callq	free
# BB#6:
	movl	$1114119, %edi          # imm = 0x110007
	callq	enqueue_signature
	movq	$0, -32(%rbp)
	jmp	.LBB9_8
.LBB9_7:
	movl	$1114120, %edi          # imm = 0x110008
	callq	enqueue_signature
	movq	-24(%rbp), %rax
	movb	$0, 9(%rax)
	movq	-24(%rbp), %rax
	movb	$0, 11(%rax)
	movq	-24(%rbp), %rax
	movq	%rax, -32(%rbp)
.LBB9_8:
	movl	$1114121, %edi          # imm = 0x110009
	callq	enqueue_signature_with_return
	movq	-32(%rbp), %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end9:
	.size	bfopen, .Lfunc_end9-bfopen
	.cfi_endproc
                                        # -- End function
	.globl	bfread                  # -- Begin function bfread
	.p2align	4, 0x90
	.type	bfread,@function
bfread:                                 # @bfread
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Lcfi42:
	.cfi_def_cfa_offset 16
.Lcfi43:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Lcfi44:
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
.Lcfi45:
	.cfi_offset %rbx, -24
	movq	%rdi, %rbx
	movl	$1376257, %edi          # imm = 0x150001
	callq	enqueue_signature
	xorl	%eax, %eax
	movq	%rbx, -16(%rbp)
	movq	-16(%rbp), %rcx
	movsbl	9(%rcx), %ecx
	cmpl	%ecx, %eax
	jne	.LBB10_3
# BB#1:
	movl	$1376258, %edi          # imm = 0x150002
	callq	enqueue_signature
	movq	-16(%rbp), %rax
	movq	(%rax), %rdi
	callq	fgetc
	movl	%eax, %ebx
# BB#2:
	movl	$1376259, %edi          # imm = 0x150003
	callq	enqueue_signature
	movq	-16(%rbp), %rax
	movb	%bl, 8(%rax)
	movq	-16(%rbp), %rax
	movb	$8, 9(%rax)
.LBB10_3:
	movl	$1376260, %edi          # imm = 0x150004
	callq	enqueue_signature_with_return
	movl	$1, %eax
	movq	-16(%rbp), %rcx
	movb	9(%rcx), %dl
	addb	$-1, %dl
	movb	%dl, 9(%rcx)
	movq	-16(%rbp), %rcx
	movsbl	8(%rcx), %edx
	movq	-16(%rbp), %rcx
	movsbl	9(%rcx), %ecx
                                        # kill: %CL<def> %ECX<kill>
	shll	%cl, %eax
	andl	%edx, %eax
	cmpl	$0, %eax
	setne	%al
	andb	$1, %al
	movzbl	%al, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end10:
	.size	bfread, .Lfunc_end10-bfread
	.cfi_endproc
                                        # -- End function
	.globl	bfwrite                 # -- Begin function bfwrite
	.p2align	4, 0x90
	.type	bfwrite,@function
bfwrite:                                # @bfwrite
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Lcfi46:
	.cfi_def_cfa_offset 16
.Lcfi47:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Lcfi48:
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	subq	$16, %rsp
.Lcfi49:
	.cfi_offset %rbx, -32
.Lcfi50:
	.cfi_offset %r14, -24
	movq	%rsi, %r14
	movl	%edi, %ebx
	movl	$1507329, %edi          # imm = 0x170001
	callq	enqueue_signature
	movl	$8, %eax
	movl	%ebx, -28(%rbp)
	movq	%r14, -24(%rbp)
	movq	-24(%rbp), %rcx
	movsbl	11(%rcx), %ecx
	cmpl	%ecx, %eax
	jne	.LBB11_3
# BB#1:
	movl	$1507330, %edi          # imm = 0x170002
	callq	enqueue_signature
	movq	-24(%rbp), %rax
	movsbl	10(%rax), %edi
	movq	-24(%rbp), %rax
	movq	(%rax), %rsi
	callq	fputc
# BB#2:
	movl	$1507331, %edi          # imm = 0x170003
	callq	enqueue_signature
	movq	-24(%rbp), %rax
	movb	$0, 11(%rax)
.LBB11_3:
	movl	$1507332, %edi          # imm = 0x170004
	callq	enqueue_signature_with_return
	movq	-24(%rbp), %rax
	movb	11(%rax), %cl
	addb	$1, %cl
	movb	%cl, 11(%rax)
	movq	-24(%rbp), %rax
	movsbl	10(%rax), %ecx
	shll	$1, %ecx
	movb	%cl, 10(%rax)
	movl	-28(%rbp), %eax
	andl	$1, %eax
	movq	-24(%rbp), %rcx
	movsbl	10(%rcx), %edx
	orl	%eax, %edx
	movb	%dl, 10(%rcx)
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end11:
	.size	bfwrite, .Lfunc_end11-bfwrite
	.cfi_endproc
                                        # -- End function
	.globl	bfclose                 # -- Begin function bfclose
	.p2align	4, 0x90
	.type	bfclose,@function
bfclose:                                # @bfclose
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Lcfi51:
	.cfi_def_cfa_offset 16
.Lcfi52:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Lcfi53:
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
.Lcfi54:
	.cfi_offset %rbx, -24
	movq	%rdi, %rbx
	movl	$1638401, %edi          # imm = 0x190001
	callq	enqueue_signature
	movq	%rbx, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	(%rax), %rdi
	callq	fclose
# BB#1:
	movl	$1638402, %edi          # imm = 0x190002
	callq	enqueue_signature
	movq	-16(%rbp), %rdi
	callq	free
# BB#2:
	movl	$1638403, %edi          # imm = 0x190003
	callq	enqueue_signature_with_return
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end12:
	.size	bfclose, .Lfunc_end12-bfclose
	.cfi_endproc
                                        # -- End function
	.globl	bitstring               # -- Begin function bitstring
	.p2align	4, 0x90
	.type	bitstring,@function
bitstring:                              # @bitstring
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Lcfi55:
	.cfi_def_cfa_offset 16
.Lcfi56:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Lcfi57:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	subq	$48, %rsp
.Lcfi58:
	.cfi_offset %rbx, -48
.Lcfi59:
	.cfi_offset %r12, -40
.Lcfi60:
	.cfi_offset %r14, -32
.Lcfi61:
	.cfi_offset %r15, -24
	movl	%ecx, %r14d
	movl	%edx, %r15d
	movq	%rsi, %r12
	movq	%rdi, %rbx
	movl	$1769473, %edi          # imm = 0x1B0001
	callq	enqueue_signature
	movl	$1, %r8d
	xorl	%esi, %esi
	movl	$4, %edi
	movq	%rbx, -48(%rbp)
	movq	%r12, -72(%rbp)
	movl	%r15d, -36(%rbp)
	movl	%r14d, -60(%rbp)
	movl	-60(%rbp), %ebx
	movl	-36(%rbp), %eax
	movl	-36(%rbp), %ecx
	sarl	$2, %ecx
	addl	%eax, %ecx
	movl	-36(%rbp), %eax
	cltd
	idivl	%edi
	cmpl	$0, %edx
	cmovel	%r8d, %esi
	subl	%esi, %ecx
	subl	%ecx, %ebx
	movl	%ebx, -56(%rbp)
	movl	$0, -52(%rbp)
.LBB13_1:                               # =>This Inner Loop Header: Depth=1
	movl	$1769474, %edi          # imm = 0x1B0002
	callq	enqueue_signature
	movl	-52(%rbp), %eax
	cmpl	-56(%rbp), %eax
	jge	.LBB13_4
# BB#2:                                 #   in Loop: Header=BB13_1 Depth=1
	movl	$1769475, %edi          # imm = 0x1B0003
	callq	enqueue_signature
	movq	-48(%rbp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, -48(%rbp)
	movb	$32, (%rax)
# BB#3:                                 #   in Loop: Header=BB13_1 Depth=1
	movl	$1769476, %edi          # imm = 0x1B0004
	callq	enqueue_signature
	movl	-52(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -52(%rbp)
	jmp	.LBB13_1
.LBB13_4:
	movl	$1769477, %edi          # imm = 0x1B0005
	callq	enqueue_signature
.LBB13_5:                               # =>This Inner Loop Header: Depth=1
	movl	$1769478, %edi          # imm = 0x1B0006
	callq	enqueue_signature
	movl	-36(%rbp), %eax
	addl	$-1, %eax
	movl	%eax, -36(%rbp)
	cmpl	$0, %eax
	jl	.LBB13_10
# BB#6:                                 #   in Loop: Header=BB13_5 Depth=1
	movl	$1769479, %edi          # imm = 0x1B0007
	callq	enqueue_signature
	movl	$4, %esi
	movq	-72(%rbp), %rax
	movl	-36(%rbp), %ecx
                                        # kill: %CL<def> %RCX<kill>
	sarq	%cl, %rax
	andq	$1, %rax
	addq	$48, %rax
	movq	-48(%rbp), %rcx
	leaq	1(%rcx), %rdx
	movq	%rdx, -48(%rbp)
	movb	%al, (%rcx)
	movl	-36(%rbp), %eax
	cltd
	idivl	%esi
	cmpl	$0, %edx
	jne	.LBB13_9
# BB#7:                                 #   in Loop: Header=BB13_5 Depth=1
	movl	$1769480, %edi          # imm = 0x1B0008
	callq	enqueue_signature
	cmpl	$0, -36(%rbp)
	je	.LBB13_9
# BB#8:                                 #   in Loop: Header=BB13_5 Depth=1
	movl	$1769481, %edi          # imm = 0x1B0009
	callq	enqueue_signature
	movq	-48(%rbp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, -48(%rbp)
	movb	$32, (%rax)
.LBB13_9:                               #   in Loop: Header=BB13_5 Depth=1
	movl	$1769482, %edi          # imm = 0x1B000A
	callq	enqueue_signature
	jmp	.LBB13_5
.LBB13_10:
	movl	$1769483, %edi          # imm = 0x1B000B
	callq	enqueue_signature_with_return
	movq	-48(%rbp), %rax
	movb	$0, (%rax)
	addq	$48, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end13:
	.size	bitstring, .Lfunc_end13-bitstring
	.cfi_endproc
                                        # -- End function
	.globl	bstr_i                  # -- Begin function bstr_i
	.p2align	4, 0x90
	.type	bstr_i,@function
bstr_i:                                 # @bstr_i
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Lcfi62:
	.cfi_def_cfa_offset 16
.Lcfi63:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Lcfi64:
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$24, %rsp
.Lcfi65:
	.cfi_offset %rbx, -24
	movq	%rdi, %rbx
	movl	$1835009, %edi          # imm = 0x1C0001
	callq	enqueue_signature
	movq	%rbx, -24(%rbp)
	movl	$0, -12(%rbp)
.LBB14_1:                               # =>This Inner Loop Header: Depth=1
	movl	$1835010, %edi          # imm = 0x1C0002
	callq	enqueue_signature
	xorl	%ebx, %ebx
	cmpq	$0, -24(%rbp)
	je	.LBB14_5
# BB#2:                                 #   in Loop: Header=BB14_1 Depth=1
	movl	$1835011, %edi          # imm = 0x1C0003
	callq	enqueue_signature
	xorl	%ebx, %ebx
	movq	-24(%rbp), %rax
	movsbl	(%rax), %eax
	cmpl	$0, %eax
	je	.LBB14_5
# BB#3:                                 #   in Loop: Header=BB14_1 Depth=1
	movl	$1835012, %edi          # imm = 0x1C0004
	callq	enqueue_signature
	movabsq	$.L.str, %rdi
	movq	-24(%rbp), %rax
	movsbl	(%rax), %esi
	callq	strchr
	movq	%rax, %rbx
# BB#4:                                 #   in Loop: Header=BB14_1 Depth=1
	movl	$1835013, %edi          # imm = 0x1C0005
	callq	enqueue_signature
	cmpq	$0, %rbx
	setne	%bl
.LBB14_5:                               #   in Loop: Header=BB14_1 Depth=1
	movl	$1835014, %edi          # imm = 0x1C0006
	callq	enqueue_signature
	testb	$1, %bl
	jne	.LBB14_6
	jmp	.LBB14_7
.LBB14_6:                               #   in Loop: Header=BB14_1 Depth=1
	movl	$1835015, %edi          # imm = 0x1C0007
	callq	enqueue_signature
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, -24(%rbp)
	movsbl	(%rax), %eax
	subl	$48, %eax
	movl	%eax, -28(%rbp)
	movl	-12(%rbp), %eax
	shll	$1, %eax
	movl	%eax, -12(%rbp)
	movl	-28(%rbp), %eax
	andl	$1, %eax
	orl	-12(%rbp), %eax
	movl	%eax, -12(%rbp)
	jmp	.LBB14_1
.LBB14_7:
	movl	$1835016, %edi          # imm = 0x1C0008
	callq	enqueue_signature_with_return
	movl	-12(%rbp), %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end14:
	.size	bstr_i, .Lfunc_end14-bstr_i
	.cfi_endproc
                                        # -- End function
	.globl	CallcheckerSet          # -- Begin function CallcheckerSet
	.p2align	4, 0x90
	.type	CallcheckerSet,@function
CallcheckerSet:                         # @CallcheckerSet
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rax
.Lcfi66:
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
.Lfunc_end15:
	.size	CallcheckerSet, .Lfunc_end15-CallcheckerSet
	.cfi_endproc
                                        # -- End function
	.type	bits,@object            # @bits
	.data
	.p2align	4
bits:
	.ascii	"\000\001\001\002\001\002\002\003\001\002\002\003\002\003\003\004\001\002\002\003\002\003\003\004\002\003\003\004\003\004\004\005\001\002\002\003\002\003\003\004\002\003\003\004\003\004\004\005\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\001\002\002\003\002\003\003\004\002\003\003\004\003\004\004\005\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\003\004\004\005\004\005\005\006\004\005\005\006\005\006\006\007\001\002\002\003\002\003\003\004\002\003\003\004\003\004\004\005\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\003\004\004\005\004\005\005\006\004\005\005\006\005\006\006\007\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\003\004\004\005\004\005\005\006\004\005\005\006\005\006\006\007\003\004\004\005\004\005\005\006\004\005\005\006\005\006\006\007\004\005\005\006\005\006\006\007\005\006\006\007\006\007\007\b"
	.size	bits, 256

	.type	bits.1,@object          # @bits.1
	.p2align	4
bits.1:
	.ascii	"\000\001\001\002\001\002\002\003\001\002\002\003\002\003\003\004\001\002\002\003\002\003\003\004\002\003\003\004\003\004\004\005\001\002\002\003\002\003\003\004\002\003\003\004\003\004\004\005\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\001\002\002\003\002\003\003\004\002\003\003\004\003\004\004\005\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\003\004\004\005\004\005\005\006\004\005\005\006\005\006\006\007\001\002\002\003\002\003\003\004\002\003\003\004\003\004\004\005\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\003\004\004\005\004\005\005\006\004\005\005\006\005\006\006\007\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\003\004\004\005\004\005\005\006\004\005\005\006\005\006\006\007\003\004\004\005\004\005\005\006\004\005\005\006\005\006\006\007\004\005\005\006\005\006\006\007\005\006\006\007\006\007\007\b"
	.size	bits.1, 256

	.type	.L.str.7,@object        # @.str.7
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.7:
	.asciz	"Usage: bitcnts <iterations>\n"
	.size	.L.str.7, 29

	.type	main.pBitCntFunc,@object # @main.pBitCntFunc
	.data
	.p2align	4
main.pBitCntFunc:
	.quad	bit_count
	.quad	bitcount
	.quad	ntbl_bitcnt
	.quad	ntbl_bitcount
	.quad	BW_btbl_bitcount
	.quad	AR_btbl_bitcount
	.quad	bit_shifter
	.size	main.pBitCntFunc, 56

	.type	.L.str.8,@object        # @.str.8
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.8:
	.asciz	" [target finished!]\n"
	.size	.L.str.8, 21

	.type	.L.str.9,@object        # @.str.9
.L.str.9:
	.asciz	" [target] Execution Time: %ld\n"
	.size	.L.str.9, 31

	.type	.L.str,@object          # @.str
.L.str:
	.asciz	"01"
	.size	.L.str, 3


	.ident	"clang version 5.0.0 (tags/RELEASE_500/final)"
	.ident	"clang version 5.0.0 (tags/RELEASE_500/final)"
	.ident	"clang version 5.0.0 (tags/RELEASE_500/final)"
	.ident	"clang version 5.0.0 (tags/RELEASE_500/final)"
	.ident	"clang version 5.0.0 (tags/RELEASE_500/final)"
	.ident	"clang version 5.0.0 (tags/RELEASE_500/final)"
	.ident	"clang version 5.0.0 (tags/RELEASE_500/final)"
	.ident	"clang version 5.0.0 (tags/RELEASE_500/final)"
	.section	".note.GNU-stack","",@progbits
