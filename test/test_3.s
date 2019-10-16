	.text
	.file	"./test_3.ll"
	.globl	ok
	.p2align	4, 0x90
	.type	ok,@function
ok:                                     # @ok
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
	movl	%edi, -16(%rbp)
	movl	%esi, -12(%rbp)
	movl	$0, -4(%rbp)
	jmp	.LBB0_1
	.p2align	4, 0x90
.LBB0_4:                                #   in Loop: Header=BB0_1 Depth=1
	incl	-4(%rbp)
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movl	-4(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jge	.LBB0_5
# BB#2:                                 #   in Loop: Header=BB0_1 Depth=1
	movslq	-16(%rbp), %rax
	imulq	$120, %rax, %rax
	movslq	-4(%rbp), %rcx
	movslq	ans(,%rcx,4), %rcx
	cmpl	$0, G(%rax,%rcx,4)
	je	.LBB0_4
# BB#3:
	movl	$0, -8(%rbp)
	jmp	.LBB0_6
.LBB0_5:
	movl	$1, -8(%rbp)
.LBB0_6:
	movl	-8(%rbp), %eax
	popq	%rbp
	retq
.Lfunc_end0:
	.size	ok, .Lfunc_end0-ok
	.cfi_endproc

	.globl	dfs
	.p2align	4, 0x90
	.type	dfs,@function
dfs:                                    # @dfs
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
	movl	%edi, -12(%rbp)
	cmpl	n(%rip), %edi
	jne	.LBB1_4
# BB#1:
	movl	$0, -8(%rbp)
	jmp	.LBB1_2
	.p2align	4, 0x90
.LBB1_3:                                #   in Loop: Header=BB1_2 Depth=1
	movslq	-8(%rbp), %rax
	movl	ans(,%rax,4), %esi
	addl	$65, %esi
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	incl	-8(%rbp)
.LBB1_2:                                # =>This Inner Loop Header: Depth=1
	movl	-8(%rbp), %eax
	cmpl	n(%rip), %eax
	jl	.LBB1_3
# BB#11:
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	incl	counter(%rip)
	jmp	.LBB1_12
.LBB1_4:
	movl	$0, -4(%rbp)
	cmpl	$25, -4(%rbp)
	jle	.LBB1_6
	jmp	.LBB1_12
	.p2align	4, 0x90
.LBB1_10:                               #   in Loop: Header=BB1_6 Depth=1
	incl	-4(%rbp)
	cmpl	$25, -4(%rbp)
	jg	.LBB1_12
.LBB1_6:                                # =>This Inner Loop Header: Depth=1
	movslq	-4(%rbp), %rax
	cmpl	$0, mark(,%rax,4)
	je	.LBB1_10
# BB#7:                                 #   in Loop: Header=BB1_6 Depth=1
	movslq	-4(%rbp), %rax
	cmpl	$0, vis(,%rax,4)
	jne	.LBB1_10
# BB#8:                                 #   in Loop: Header=BB1_6 Depth=1
	movl	-4(%rbp), %edi
	movl	-12(%rbp), %esi
	callq	ok
	testl	%eax, %eax
	je	.LBB1_10
# BB#9:                                 #   in Loop: Header=BB1_6 Depth=1
	movslq	-4(%rbp), %rax
	movl	$1, vis(,%rax,4)
	movl	-4(%rbp), %eax
	movslq	-12(%rbp), %rcx
	movl	%eax, ans(,%rcx,4)
	movl	-12(%rbp), %edi
	incl	%edi
	callq	dfs
	movslq	-4(%rbp), %rax
	movl	$0, vis(,%rax,4)
	jmp	.LBB1_10
.LBB1_12:
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end1:
	.size	dfs, .Lfunc_end1-dfs
	.cfi_endproc

	.globl	main
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
	subq	$1032, %rsp             # imm = 0x408
.Lcfi9:
	.cfi_offset %rbx, -24
	movl	$0, -28(%rbp)
	movl	$.L.str.2, %edi
	callq	puts
	leaq	-1040(%rbp), %rbx
	jmp	.LBB2_1
	.p2align	4, 0x90
.LBB2_15:                               #   in Loop: Header=BB2_1 Depth=1
	movl	$.L.str.4, %edi
	callq	puts
	xorl	%edi, %edi
	callq	dfs
	movl	counter(%rip), %esi
	movl	$.L.str.5, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$.L.str.6, %edi
	callq	puts
.LBB2_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_3 Depth 2
                                        #     Child Loop BB2_8 Depth 2
                                        #       Child Loop BB2_11 Depth 3
	xorl	%eax, %eax
	movq	%rbx, %rdi
	callq	gets
	testl	%eax, %eax
	je	.LBB2_16
# BB#2:                                 #   in Loop: Header=BB2_1 Depth=1
	movl	$0, n(%rip)
	xorps	%xmm0, %xmm0
	movaps	%xmm0, mark+96(%rip)
	movaps	%xmm0, mark+80(%rip)
	movaps	%xmm0, mark+64(%rip)
	movaps	%xmm0, mark+48(%rip)
	movaps	%xmm0, mark+32(%rip)
	movaps	%xmm0, mark+16(%rip)
	movaps	%xmm0, mark(%rip)
	movq	$0, mark+112(%rip)
	movl	$G, %edi
	xorl	%esi, %esi
	movl	$3600, %edx             # imm = 0xE10
	callq	memset
	xorps	%xmm0, %xmm0
	movaps	%xmm0, vis+96(%rip)
	movaps	%xmm0, vis+80(%rip)
	movaps	%xmm0, vis+64(%rip)
	movaps	%xmm0, vis+48(%rip)
	movaps	%xmm0, vis+32(%rip)
	movaps	%xmm0, vis+16(%rip)
	movaps	%xmm0, vis(%rip)
	movq	$0, vis+112(%rip)
	movl	$0, -16(%rbp)
	jmp	.LBB2_3
	.p2align	4, 0x90
.LBB2_6:                                #   in Loop: Header=BB2_3 Depth=2
	incl	-16(%rbp)
.LBB2_3:                                #   Parent Loop BB2_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	-16(%rbp), %rax
	cmpb	$0, -1040(%rbp,%rax)
	je	.LBB2_7
# BB#4:                                 #   in Loop: Header=BB2_3 Depth=2
	movslq	-16(%rbp), %rax
	cmpb	$32, -1040(%rbp,%rax)
	je	.LBB2_6
# BB#5:                                 #   in Loop: Header=BB2_3 Depth=2
	movslq	-16(%rbp), %rax
	movsbq	-1040(%rbp,%rax), %rax
	movl	$1, mark-260(,%rax,4)
	incl	n(%rip)
	jmp	.LBB2_6
	.p2align	4, 0x90
.LBB2_7:                                #   in Loop: Header=BB2_1 Depth=1
	movl	$.L.str.3, %edi
	callq	puts
	xorl	%eax, %eax
	movq	%rbx, %rdi
	callq	gets
	movl	$0, -12(%rbp)
	jmp	.LBB2_8
	.p2align	4, 0x90
.LBB2_14:                               #   in Loop: Header=BB2_8 Depth=2
	incl	-12(%rbp)
.LBB2_8:                                #   Parent Loop BB2_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB2_11 Depth 3
	movslq	-12(%rbp), %rax
	cmpb	$0, -1040(%rbp,%rax)
	je	.LBB2_15
# BB#9:                                 #   in Loop: Header=BB2_8 Depth=2
	movslq	-12(%rbp), %rax
	cmpb	$32, -1040(%rbp,%rax)
	je	.LBB2_14
# BB#10:                                #   in Loop: Header=BB2_8 Depth=2
	movslq	-12(%rbp), %rax
	leal	1(%rax), %ecx
	movl	%ecx, -12(%rbp)
	movsbl	-1040(%rbp,%rax), %eax
	addl	$-65, %eax
	movl	%eax, -24(%rbp)
	jmp	.LBB2_11
	.p2align	4, 0x90
.LBB2_12:                               #   in Loop: Header=BB2_11 Depth=3
	incl	-12(%rbp)
.LBB2_11:                               #   Parent Loop BB2_1 Depth=1
                                        #     Parent Loop BB2_8 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movslq	-12(%rbp), %rax
	cmpb	$32, -1040(%rbp,%rax)
	je	.LBB2_12
# BB#13:                                #   in Loop: Header=BB2_8 Depth=2
	movslq	-12(%rbp), %rax
	movsbl	-1040(%rbp,%rax), %eax
	addl	$-65, %eax
	movl	%eax, -20(%rbp)
	movslq	-24(%rbp), %rax
	imulq	$120, %rax, %rax
	movslq	-20(%rbp), %rcx
	movl	$1, G(%rax,%rcx,4)
	jmp	.LBB2_14
.LBB2_16:
	xorl	%eax, %eax
	addq	$1032, %rsp             # imm = 0x408
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
	.cfi_endproc

	.type	counter,@object         # @counter
	.bss
	.globl	counter
	.p2align	2
counter:
	.long	0                       # 0x0
	.size	counter, 4

	.type	G,@object               # @G
	.comm	G,3600,16
	.type	ans,@object             # @ans
	.comm	ans,120,16
	.type	n,@object               # @n
	.comm	n,4,4
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%c"
	.size	.L.str, 3

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"\n"
	.size	.L.str.1, 2

	.type	mark,@object            # @mark
	.comm	mark,120,16
	.type	vis,@object             # @vis
	.comm	vis,120,16
	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"input the node (such as A C D F):  \n"
	.size	.L.str.2, 37

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	"input the edge (such as AC CB DF):  \n"
	.size	.L.str.3, 38

	.type	.L.str.4,@object        # @.str.4
.L.str.4:
	.asciz	"all the results:  \n"
	.size	.L.str.4, 20

	.type	.L.str.5,@object        # @.str.5
.L.str.5:
	.asciz	"total results:%d\n"
	.size	.L.str.5, 18

	.type	.L.str.6,@object        # @.str.6
.L.str.6:
	.asciz	"\n\n\nplease input new DAG:\n"
	.size	.L.str.6, 26

	.type	cnt,@object             # @cnt
	.comm	cnt,4,4

	.ident	"clang version 4.0.1 (tags/RELEASE_401/final)"
	.section	".note.GNU-stack","",@progbits
