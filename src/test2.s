	.text
	.file	"./test.ll"
	.globl	func
	.p2align	4, 0x90
	.type	func,@function
func:                                   # @func
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
	movl	%edi, -4(%rbp)
	movl	%edi, %eax
	popq	%rbp
	retq
.Lfunc_end0:
	.size	func, .Lfunc_end0-func
	.cfi_endproc

	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
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
	movl	$0, -4(%rbp)
	movl	$1, -16(%rbp)
	movl	$1, -12(%rbp)
	movl	$1, -8(%rbp)
	cmpl	$0, -16(%rbp)
	jne	.LBB1_3
# BB#1:
	cmpl	$0, -12(%rbp)
	jne	.LBB1_3
# BB#2:
	cmpl	$0, -8(%rbp)
	je	.LBB1_4
.LBB1_3:
	movl	$1, %edi
.LBB1_5:
	callq	func
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	retq
.LBB1_4:
	xorl	%edi, %edi
	jmp	.LBB1_5
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc


	.ident	"clang version 4.0.1 (tags/RELEASE_401/final)"
	.section	".note.GNU-stack","",@progbits
