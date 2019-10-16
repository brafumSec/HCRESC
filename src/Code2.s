	.file	"CodeSemantics.c"
	.text
	.globl	func
	.type	func, @function
func:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	func, .-func
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$1, -12(%rbp)
	movl	$1, -8(%rbp)
	movl	$1, -4(%rbp)
	cmpl	$0, -12(%rbp)
	jne	.L4
	cmpl	$0, -8(%rbp)
	jne	.L4
	cmpl	$0, -4(%rbp)
	je	.L5
.L4:
	movl	$1, %edi
	call	func
	jmp	.L6
.L5:
	movl	$0, %edi
	call	func
.L6:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 6.3.0-12ubuntu2) 6.3.0 20170406"
	.section	.note.GNU-stack,"",@progbits
