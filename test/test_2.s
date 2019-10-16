	.text
	.file	"./test_2.ll"
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
	movl	$0, -4(%rbp)
	movl	$1, -20(%rbp)
	movl	$1, -8(%rbp)
	movl	$1, -16(%rbp)
	cmpl	$0, -20(%rbp)
	jne	.LBB0_3
# BB#1:
	cmpl	$0, -8(%rbp)
	jne	.LBB0_3
# BB#2:
	cmpl	$0, -16(%rbp)
	je	.LBB0_6
.LBB0_3:
	movl	-8(%rbp), %eax
	movl	%eax, -12(%rbp)
	incl	%eax
	movl	%eax, -12(%rbp)
	cmpl	$2, %eax
	jl	.LBB0_5
# BB#4:
	movl	$2, -4(%rbp)
	jmp	.LBB0_7
.LBB0_5:
	movl	$1, -4(%rbp)
.LBB0_7:
	movl	-4(%rbp), %eax
	popq	%rbp
	retq
.LBB0_6:
	movl	$0, -4(%rbp)
	jmp	.LBB0_7
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc


	.ident	"clang version 4.0.1 (tags/RELEASE_401/final)"
	.section	".note.GNU-stack","",@progbits
