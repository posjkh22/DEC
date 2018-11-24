	.text
	.file	"llvm-link"
	.globl	print_path              # -- Begin function print_path
	.p2align	4, 0x90
	.type	print_path,@function
print_path:                             # @print_path
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
	subq	$16, %rsp
.Lcfi3:
	.cfi_offset %rbx, -32
.Lcfi4:
	.cfi_offset %r14, -24
	movl	%esi, %r14d
	movq	%rdi, %rbx
	movl	$65537, %edi            # imm = 0x10001
	callq	enqueue_signature
	movq	%rbx, -32(%rbp)
	movl	%r14d, -20(%rbp)
	movq	-32(%rbp), %rax
	movslq	-20(%rbp), %rcx
	cmpl	$9999, 4(%rax,%rcx,8)   # imm = 0x270F
	je	.LBB0_2
# BB#1:
	movl	$65538, %edi            # imm = 0x10002
	callq	enqueue_signature_with_call
	movq	-32(%rbp), %rdi
	movq	-32(%rbp), %rax
	movslq	-20(%rbp), %rcx
	movl	4(%rax,%rcx,8), %esi
	callq	print_path
.LBB0_2:
	movl	$65539, %edi            # imm = 0x10003
	callq	enqueue_signature_with_return
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end0:
	.size	print_path, .Lfunc_end0-print_path
	.cfi_endproc
                                        # -- End function
	.globl	enqueue                 # -- Begin function enqueue
	.p2align	4, 0x90
	.type	enqueue,@function
enqueue:                                # @enqueue
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
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	subq	$40, %rsp
.Lcfi8:
	.cfi_offset %rbx, -40
.Lcfi9:
	.cfi_offset %r14, -32
.Lcfi10:
	.cfi_offset %r15, -24
	movl	%edx, %r14d
	movl	%esi, %r15d
	movl	%edi, %ebx
	movl	$131073, %edi           # imm = 0x20001
	callq	enqueue_signature
	movl	%ebx, -52(%rbp)
	movl	%r15d, -48(%rbp)
	movl	%r14d, -44(%rbp)
	movl	$24, %edi
	callq	malloc
	movq	%rax, %rbx
# BB#1:
	movl	$131074, %edi           # imm = 0x20002
	callq	enqueue_signature
	movq	%rbx, -32(%rbp)
	movq	qHead, %rax
	movq	%rax, -40(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.LBB1_3
# BB#2:
	movl	$131075, %edi           # imm = 0x20003
	callq	enqueue_signature
	movabsq	$.L.str, %rsi
	movq	stderr, %rdi
	movb	$0, %al
	callq	fprintf
.LBB1_3:
	movl	$131076, %edi           # imm = 0x20004
	callq	enqueue_signature
	movl	-52(%rbp), %eax
	movq	-32(%rbp), %rcx
	movl	%eax, (%rcx)
	movl	-48(%rbp), %eax
	movq	-32(%rbp), %rcx
	movl	%eax, 4(%rcx)
	movl	-44(%rbp), %eax
	movq	-32(%rbp), %rcx
	movl	%eax, 8(%rcx)
	movq	-32(%rbp), %rax
	movq	$0, 16(%rax)
	cmpq	$0, -40(%rbp)
	jne	.LBB1_5
# BB#4:
	movl	$131077, %edi           # imm = 0x20005
	callq	enqueue_signature
	movq	-32(%rbp), %rax
	movq	%rax, qHead
	jmp	.LBB1_9
.LBB1_5:
	movl	$131078, %edi           # imm = 0x20006
	callq	enqueue_signature
.LBB1_6:                                # =>This Inner Loop Header: Depth=1
	movl	$131079, %edi           # imm = 0x20007
	callq	enqueue_signature
	movq	-40(%rbp), %rax
	cmpq	$0, 16(%rax)
	je	.LBB1_8
# BB#7:                                 #   in Loop: Header=BB1_6 Depth=1
	movl	$131080, %edi           # imm = 0x20008
	callq	enqueue_signature
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -40(%rbp)
	jmp	.LBB1_6
.LBB1_8:
	movl	$131081, %edi           # imm = 0x20009
	callq	enqueue_signature
	movq	-32(%rbp), %rax
	movq	-40(%rbp), %rcx
	movq	%rax, 16(%rcx)
.LBB1_9:
	movl	$131082, %edi           # imm = 0x2000A
	callq	enqueue_signature_with_return
	movl	g_qCount, %eax
	addl	$1, %eax
	movl	%eax, g_qCount
	addq	$40, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end1:
	.size	enqueue, .Lfunc_end1-enqueue
	.cfi_endproc
                                        # -- End function
	.globl	dequeue                 # -- Begin function dequeue
	.p2align	4, 0x90
	.type	dequeue,@function
dequeue:                                # @dequeue
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
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	subq	$40, %rsp
.Lcfi14:
	.cfi_offset %rbx, -40
.Lcfi15:
	.cfi_offset %r14, -32
.Lcfi16:
	.cfi_offset %r15, -24
	movq	%rdx, %r14
	movq	%rsi, %r15
	movq	%rdi, %rbx
	movl	$327681, %edi           # imm = 0x50001
	callq	enqueue_signature
	movq	%rbx, -56(%rbp)
	movq	%r15, -48(%rbp)
	movq	%r14, -40(%rbp)
	movq	qHead, %rax
	movq	%rax, -32(%rbp)
	cmpq	$0, qHead
	je	.LBB2_3
# BB#1:
	movl	$327682, %edi           # imm = 0x50002
	callq	enqueue_signature
	movq	qHead, %rax
	movl	(%rax), %eax
	movq	-56(%rbp), %rcx
	movl	%eax, (%rcx)
	movq	qHead, %rax
	movl	4(%rax), %eax
	movq	-48(%rbp), %rcx
	movl	%eax, (%rcx)
	movq	qHead, %rax
	movl	8(%rax), %eax
	movq	-40(%rbp), %rcx
	movl	%eax, (%rcx)
	movq	qHead, %rax
	movq	16(%rax), %rax
	movq	%rax, qHead
	movq	-32(%rbp), %rdi
	movb	$0, %al
	callq	free
# BB#2:
	movl	$327683, %edi           # imm = 0x50003
	callq	enqueue_signature
	movl	g_qCount, %eax
	addl	$-1, %eax
	movl	%eax, g_qCount
.LBB2_3:
	movl	$327684, %edi           # imm = 0x50004
	callq	enqueue_signature_with_return
	addq	$40, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end2:
	.size	dequeue, .Lfunc_end2-dequeue
	.cfi_endproc
                                        # -- End function
	.globl	qcount                  # -- Begin function qcount
	.p2align	4, 0x90
	.type	qcount,@function
qcount:                                 # @qcount
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
	movl	$458753, %edi           # imm = 0x70001
	callq	enqueue_signature_with_return
	movl	g_qCount, %eax
	popq	%rbp
	retq
.Lfunc_end3:
	.size	qcount, .Lfunc_end3-qcount
	.cfi_endproc
                                        # -- End function
	.globl	dijkstra                # -- Begin function dijkstra
	.p2align	4, 0x90
	.type	dijkstra,@function
dijkstra:                               # @dijkstra
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
	pushq	%r14
	pushq	%rbx
	subq	$16, %rsp
.Lcfi23:
	.cfi_offset %rbx, -32
.Lcfi24:
	.cfi_offset %r14, -24
	movl	%esi, %r14d
	movl	%edi, %ebx
	movl	$524289, %edi           # imm = 0x80001
	callq	enqueue_signature
	movl	%ebx, -20(%rbp)
	movl	%r14d, -24(%rbp)
	movl	$0, ch
.LBB4_1:                                # =>This Inner Loop Header: Depth=1
	movl	$524290, %edi           # imm = 0x80002
	callq	enqueue_signature
	cmpl	$100, ch
	jge	.LBB4_4
# BB#2:                                 #   in Loop: Header=BB4_1 Depth=1
	movl	$524291, %edi           # imm = 0x80003
	callq	enqueue_signature
	movslq	ch, %rax
	movl	$9999, rgnNodes(,%rax,8) # imm = 0x270F
	movslq	ch, %rax
	movl	$9999, rgnNodes+4(,%rax,8) # imm = 0x270F
# BB#3:                                 #   in Loop: Header=BB4_1 Depth=1
	movl	$524292, %edi           # imm = 0x80004
	callq	enqueue_signature
	movl	ch, %eax
	addl	$1, %eax
	movl	%eax, ch
	jmp	.LBB4_1
.LBB4_4:
	movl	$524293, %edi           # imm = 0x80005
	callq	enqueue_signature
	movl	-20(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jne	.LBB4_6
# BB#5:
	movl	$524294, %edi           # imm = 0x80006
	callq	enqueue_signature
	movabsq	$.L.str.1, %rdi
	movb	$0, %al
	callq	printf
	jmp	.LBB4_21
.LBB4_6:
	movl	$524295, %edi           # imm = 0x80007
	callq	enqueue_signature_with_call
	movslq	-20(%rbp), %rax
	movl	$0, rgnNodes(,%rax,8)
	movslq	-20(%rbp), %rax
	movl	$9999, rgnNodes+4(,%rax,8) # imm = 0x270F
	movl	-20(%rbp), %edi
	xorl	%esi, %esi
	movl	$9999, %edx             # imm = 0x270F
	callq	enqueue
.LBB4_7:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_11 Depth 2
	movl	$524296, %edi           # imm = 0x80008
	callq	enqueue_signature_with_call
	callq	qcount
	movl	%eax, %ebx
# BB#8:                                 #   in Loop: Header=BB4_7 Depth=1
	movl	$524297, %edi           # imm = 0x80009
	callq	enqueue_signature
	cmpl	$0, %ebx
	jle	.LBB4_20
# BB#9:                                 #   in Loop: Header=BB4_7 Depth=1
	movl	$524298, %edi           # imm = 0x8000A
	callq	enqueue_signature_with_call
	movabsq	$iNode, %rdi
	movabsq	$iDist, %rsi
	movabsq	$iPrev, %rdx
	callq	dequeue
# BB#10:                                #   in Loop: Header=BB4_7 Depth=1
	movl	$524299, %edi           # imm = 0x8000B
	callq	enqueue_signature
	movl	$0, i
.LBB4_11:                               #   Parent Loop BB4_7 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	$524300, %edi           # imm = 0x8000C
	callq	enqueue_signature
	cmpl	$100, i
	jge	.LBB4_19
# BB#12:                                #   in Loop: Header=BB4_11 Depth=2
	movl	$524301, %edi           # imm = 0x8000D
	callq	enqueue_signature
	movabsq	$AdjMatrix, %rax
	movslq	iNode, %rcx
	imulq	$400, %rcx, %rcx        # imm = 0x190
	addq	%rax, %rcx
	movslq	i, %rax
	movl	(%rcx,%rax,4), %eax
	movl	%eax, iCost
	cmpl	$9999, %eax             # imm = 0x270F
	je	.LBB4_17
# BB#13:                                #   in Loop: Header=BB4_11 Depth=2
	movl	$524302, %edi           # imm = 0x8000E
	callq	enqueue_signature
	movl	$9999, %eax             # imm = 0x270F
	movslq	i, %rcx
	cmpl	rgnNodes(,%rcx,8), %eax
	je	.LBB4_15
# BB#14:                                #   in Loop: Header=BB4_11 Depth=2
	movl	$524303, %edi           # imm = 0x8000F
	callq	enqueue_signature
	movslq	i, %rax
	movl	rgnNodes(,%rax,8), %eax
	movl	iCost, %ecx
	addl	iDist, %ecx
	cmpl	%ecx, %eax
	jle	.LBB4_16
.LBB4_15:                               #   in Loop: Header=BB4_11 Depth=2
	movl	$524304, %edi           # imm = 0x80010
	callq	enqueue_signature_with_call
	movl	iDist, %eax
	addl	iCost, %eax
	movslq	i, %rcx
	movl	%eax, rgnNodes(,%rcx,8)
	movl	iNode, %eax
	movslq	i, %rcx
	movl	%eax, rgnNodes+4(,%rcx,8)
	movl	i, %edi
	movl	iDist, %esi
	addl	iCost, %esi
	movl	iNode, %edx
	callq	enqueue
.LBB4_16:                               #   in Loop: Header=BB4_11 Depth=2
	movl	$524305, %edi           # imm = 0x80011
	callq	enqueue_signature
.LBB4_17:                               #   in Loop: Header=BB4_11 Depth=2
	movl	$524306, %edi           # imm = 0x80012
	callq	enqueue_signature
# BB#18:                                #   in Loop: Header=BB4_11 Depth=2
	movl	$524307, %edi           # imm = 0x80013
	callq	enqueue_signature
	movl	i, %eax
	addl	$1, %eax
	movl	%eax, i
	jmp	.LBB4_11
.LBB4_19:                               #   in Loop: Header=BB4_7 Depth=1
	movl	$524308, %edi           # imm = 0x80014
	callq	enqueue_signature
	jmp	.LBB4_7
.LBB4_20:
	movl	$524309, %edi           # imm = 0x80015
	callq	enqueue_signature
.LBB4_21:
	movl	$524310, %edi           # imm = 0x80016
	callq	enqueue_signature_with_return
	movl	-28(%rbp), %eax
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end4:
	.size	dijkstra, .Lfunc_end4-dijkstra
	.cfi_endproc
                                        # -- End function
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Lcfi25:
	.cfi_def_cfa_offset 16
.Lcfi26:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Lcfi27:
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	subq	$80, %rsp
.Lcfi28:
	.cfi_offset %rbx, -32
.Lcfi29:
	.cfi_offset %r14, -24
	movq	%rsi, %r14
	movl	%edi, %ebx
	callq	init_monitor
	movl	$655361, %edi           # imm = 0xA0001
	callq	enqueue_signature
	leaq	-80(%rbp), %rdi
	movl	$0, -32(%rbp)
	movl	%ebx, -44(%rbp)
	movq	%r14, -88(%rbp)
	xorl	%esi, %esi
	callq	gettimeofday
# BB#1:
	movl	$655362, %edi           # imm = 0xA0002
	callq	enqueue_signature
	movabsq	$.L.str.2, %rdi
	movabsq	$.L.str.3, %rsi
	callq	fopen
	movq	%rax, %rbx
# BB#2:
	movl	$655363, %edi           # imm = 0xA0003
	callq	enqueue_signature
	movq	%rbx, -40(%rbp)
	movl	$0, -24(%rbp)
.LBB5_3:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_5 Depth 2
	movl	$655364, %edi           # imm = 0xA0004
	callq	enqueue_signature
	cmpl	$100, -24(%rbp)
	jge	.LBB5_11
# BB#4:                                 #   in Loop: Header=BB5_3 Depth=1
	movl	$655365, %edi           # imm = 0xA0005
	callq	enqueue_signature
	movl	$0, -20(%rbp)
.LBB5_5:                                #   Parent Loop BB5_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	$655366, %edi           # imm = 0xA0006
	callq	enqueue_signature
	cmpl	$100, -20(%rbp)
	jge	.LBB5_9
# BB#6:                                 #   in Loop: Header=BB5_5 Depth=2
	movl	$655367, %edi           # imm = 0xA0007
	callq	enqueue_signature
	movabsq	$.L.str.4, %rsi
	leaq	-28(%rbp), %rdx
	movq	-40(%rbp), %rdi
	movb	$0, %al
	callq	__isoc99_fscanf
# BB#7:                                 #   in Loop: Header=BB5_5 Depth=2
	movl	$655368, %edi           # imm = 0xA0008
	callq	enqueue_signature
	movabsq	$AdjMatrix, %rax
	movl	-28(%rbp), %ecx
	movslq	-24(%rbp), %rdx
	imulq	$400, %rdx, %rdx        # imm = 0x190
	addq	%rax, %rdx
	movslq	-20(%rbp), %rax
	movl	%ecx, (%rdx,%rax,4)
# BB#8:                                 #   in Loop: Header=BB5_5 Depth=2
	movl	$655369, %edi           # imm = 0xA0009
	callq	enqueue_signature
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	.LBB5_5
.LBB5_9:                                #   in Loop: Header=BB5_3 Depth=1
	movl	$655370, %edi           # imm = 0xA000A
	callq	enqueue_signature
# BB#10:                                #   in Loop: Header=BB5_3 Depth=1
	movl	$655371, %edi           # imm = 0xA000B
	callq	enqueue_signature
	movl	-24(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -24(%rbp)
	jmp	.LBB5_3
.LBB5_11:
	movl	$655372, %edi           # imm = 0xA000C
	callq	enqueue_signature
	movl	$0, -24(%rbp)
	movl	$50, -20(%rbp)
.LBB5_12:                               # =>This Inner Loop Header: Depth=1
	movl	$655373, %edi           # imm = 0xA000D
	callq	enqueue_signature
	cmpl	$20, -24(%rbp)
	jge	.LBB5_15
# BB#13:                                #   in Loop: Header=BB5_12 Depth=1
	movl	$655374, %edi           # imm = 0xA000E
	callq	enqueue_signature_with_call
	movl	$100, %ecx
	movl	-20(%rbp), %eax
	cltd
	idivl	%ecx
	movl	%edx, -20(%rbp)
	movl	-24(%rbp), %edi
	movl	-20(%rbp), %esi
	callq	dijkstra
# BB#14:                                #   in Loop: Header=BB5_12 Depth=1
	movl	$655375, %edi           # imm = 0xA000F
	callq	enqueue_signature
	movl	-24(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -24(%rbp)
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	.LBB5_12
.LBB5_15:
	movl	$655376, %edi           # imm = 0xA0010
	callq	enqueue_signature
	leaq	-64(%rbp), %rdi
	xorl	%esi, %esi
	callq	gettimeofday
# BB#16:
	movl	$655377, %edi           # imm = 0xA0011
	callq	enqueue_signature
	movabsq	$.L.str.5, %rdi
	movb	$0, %al
	callq	printf
# BB#17:
	movl	$655378, %edi           # imm = 0xA0012
	callq	enqueue_signature
	movabsq	$.L.str.6, %rdi
	movq	-64(%rbp), %rax
	subq	-80(%rbp), %rax
	imulq	$1000000, %rax, %rax    # imm = 0xF4240
	movq	-56(%rbp), %rsi
	subq	-72(%rbp), %rsi
	addq	%rax, %rsi
	movb	$0, %al
	callq	printf
# BB#18:
	movl	$655379, %edi           # imm = 0xA0013
	callq	enqueue_signature_with_remainder_process
	movl	-32(%rbp), %eax
	addq	$80, %rsp
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
.Lcfi30:
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
	.type	qHead,@object           # @qHead
	.bss
	.globl	qHead
	.p2align	3
qHead:
	.quad	0
	.size	qHead, 8

	.type	g_qCount,@object        # @g_qCount
	.globl	g_qCount
	.p2align	2
g_qCount:
	.long	0                       # 0x0
	.size	g_qCount, 4

	.type	ch,@object              # @ch
	.comm	ch,4,4
	.type	rgnNodes,@object        # @rgnNodes
	.comm	rgnNodes,800,16
	.type	iNode,@object           # @iNode
	.comm	iNode,4,4
	.type	iDist,@object           # @iDist
	.comm	iDist,4,4
	.type	iPrev,@object           # @iPrev
	.comm	iPrev,4,4
	.type	i,@object               # @i
	.comm	i,4,4
	.type	AdjMatrix,@object       # @AdjMatrix
	.comm	AdjMatrix,40000,16
	.type	iCost,@object           # @iCost
	.comm	iCost,4,4
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Out of memory.\n"
	.size	.L.str, 16

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"Shortest path is 0 in cost. Just stay where you are.\n"
	.size	.L.str.1, 54

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"./input.dat"
	.size	.L.str.2, 12

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	"r"
	.size	.L.str.3, 2

	.type	.L.str.4,@object        # @.str.4
.L.str.4:
	.asciz	"%d"
	.size	.L.str.4, 3

	.type	.L.str.5,@object        # @.str.5
.L.str.5:
	.asciz	" [target has finished!]\n"
	.size	.L.str.5, 25

	.type	.L.str.6,@object        # @.str.6
.L.str.6:
	.asciz	" [target] Execution time: %ld\n"
	.size	.L.str.6, 31


	.ident	"clang version 5.0.0 (tags/RELEASE_500/final)"
	.section	".note.GNU-stack","",@progbits
