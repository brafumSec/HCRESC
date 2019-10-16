	.text
	.file	"computing-1-calculator.ll"
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
	subq	$16, %rsp
	movl	$0, -12(%rbp)
	jmp	.LBB0_1
	.p2align	4, 0x90
.LBB0_4:                                #   in Loop: Header=BB0_1 Depth=1
	callq	error
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	callq	getPrintableChar
	movb	%al, token(%rip)
	cmpb	$113, %al
	je	.LBB0_5
# BB#2:                                 #   in Loop: Header=BB0_1 Depth=1
	callq	exp
	movsd	%xmm0, -8(%rbp)
	cmpb	$10, token(%rip)
	jne	.LBB0_4
# BB#3:                                 #   in Loop: Header=BB0_1 Depth=1
	movsd	-8(%rbp), %xmm0         # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
	jmp	.LBB0_1
.LBB0_5:
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc

	.globl	getPrintableChar
	.p2align	4, 0x90
	.type	getPrintableChar,@function
getPrintableChar:                       # @getPrintableChar
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
	.p2align	4, 0x90
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	callq	getchar
	movb	%al, -1(%rbp)
	movsbl	-1(%rbp), %edi
	callq	isblank
	testl	%eax, %eax
	jne	.LBB1_1
# BB#2:
	movb	-1(%rbp), %al
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end1:
	.size	getPrintableChar, .Lfunc_end1-getPrintableChar
	.cfi_endproc

	.globl	exp
	.p2align	4, 0x90
	.type	exp,@function
exp:                                    # @exp
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
	subq	$16, %rsp
	callq	term
	jmp	.LBB2_1
	.p2align	4, 0x90
.LBB2_7:                                #   in Loop: Header=BB2_1 Depth=1
	movl	$43, %edi
	callq	match
	callq	term
	addsd	-8(%rbp), %xmm0
.LBB2_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_2 Depth 2
	movsd	%xmm0, -8(%rbp)
	jmp	.LBB2_2
	.p2align	4, 0x90
.LBB2_8:                                #   in Loop: Header=BB2_2 Depth=2
	movl	$45, %edi
	callq	match
	callq	term
	movsd	-8(%rbp), %xmm1         # xmm1 = mem[0],zero
	subsd	%xmm0, %xmm1
	movsd	%xmm1, -8(%rbp)
.LBB2_2:                                #   Parent Loop BB2_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movb	$1, %al
	cmpb	$43, token(%rip)
	je	.LBB2_4
# BB#3:                                 #   in Loop: Header=BB2_2 Depth=2
	cmpb	$45, token(%rip)
	sete	%al
.LBB2_4:                                #   in Loop: Header=BB2_2 Depth=2
	testb	%al, %al
	je	.LBB2_9
# BB#5:                                 #   in Loop: Header=BB2_2 Depth=2
	movsbl	token(%rip), %eax
	cmpl	$45, %eax
	je	.LBB2_8
# BB#6:                                 #   in Loop: Header=BB2_2 Depth=2
	cmpl	$43, %eax
	jne	.LBB2_2
	jmp	.LBB2_7
.LBB2_9:
	movsd	-8(%rbp), %xmm0         # xmm0 = mem[0],zero
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end2:
	.size	exp, .Lfunc_end2-exp
	.cfi_endproc

	.globl	error
	.p2align	4, 0x90
	.type	error,@function
error:                                  # @error
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Lcfi9:
	.cfi_def_cfa_offset 16
.Lcfi10:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Lcfi11:
	.cfi_def_cfa_register %rbp
	movq	stderr(%rip), %rdi
	movl	$.L.str.2, %esi
	xorl	%eax, %eax
	callq	fprintf
	movl	$1, %edi
	callq	exit
.Lfunc_end3:
	.size	error, .Lfunc_end3-error
	.cfi_endproc

	.globl	term
	.p2align	4, 0x90
	.type	term,@function
term:                                   # @term
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
	subq	$16, %rsp
	callq	factor
	jmp	.LBB4_1
	.p2align	4, 0x90
.LBB4_7:                                #   in Loop: Header=BB4_1 Depth=1
	movl	$42, %edi
	callq	match
	callq	factor
	mulsd	-8(%rbp), %xmm0
.LBB4_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_2 Depth 2
	movsd	%xmm0, -8(%rbp)
	jmp	.LBB4_2
	.p2align	4, 0x90
.LBB4_8:                                #   in Loop: Header=BB4_2 Depth=2
	movl	$47, %edi
	callq	match
	callq	factor
	movsd	-8(%rbp), %xmm1         # xmm1 = mem[0],zero
	divsd	%xmm0, %xmm1
	movsd	%xmm1, -8(%rbp)
.LBB4_2:                                #   Parent Loop BB4_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movb	$1, %al
	cmpb	$42, token(%rip)
	je	.LBB4_4
# BB#3:                                 #   in Loop: Header=BB4_2 Depth=2
	cmpb	$47, token(%rip)
	sete	%al
.LBB4_4:                                #   in Loop: Header=BB4_2 Depth=2
	testb	%al, %al
	je	.LBB4_9
# BB#5:                                 #   in Loop: Header=BB4_2 Depth=2
	movsbl	token(%rip), %eax
	cmpl	$47, %eax
	je	.LBB4_8
# BB#6:                                 #   in Loop: Header=BB4_2 Depth=2
	cmpl	$42, %eax
	jne	.LBB4_2
	jmp	.LBB4_7
.LBB4_9:
	movsd	-8(%rbp), %xmm0         # xmm0 = mem[0],zero
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end4:
	.size	term, .Lfunc_end4-term
	.cfi_endproc

	.globl	match
	.p2align	4, 0x90
	.type	match,@function
match:                                  # @match
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
	subq	$16, %rsp
	movb	%dil, -1(%rbp)
	movsbl	-1(%rbp), %eax
	movsbl	token(%rip), %ecx
	cmpl	%ecx, %eax
	jne	.LBB5_2
# BB#1:
	callq	getPrintableChar
	movb	%al, token(%rip)
	jmp	.LBB5_3
.LBB5_2:
	callq	error
.LBB5_3:
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end5:
	.size	match, .Lfunc_end5-match
	.cfi_endproc

	.globl	factor
	.p2align	4, 0x90
	.type	factor,@function
factor:                                 # @factor
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Lcfi18:
	.cfi_def_cfa_offset 16
.Lcfi19:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Lcfi20:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	cmpb	$40, token(%rip)
	jne	.LBB6_2
# BB#1:
	movl	$40, %edi
	callq	match
	callq	exp
	movsd	%xmm0, -8(%rbp)
	movl	$41, %edi
	callq	match
	jmp	.LBB6_5
.LBB6_2:
	movsbl	token(%rip), %edi
	callq	isdigit
	testl	%eax, %eax
	je	.LBB6_4
# BB#3:
	movsbl	token(%rip), %edi
	movq	stdin(%rip), %rsi
	callq	ungetc
	leaq	-8(%rbp), %rsi
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	__isoc99_scanf
	callq	getPrintableChar
	movb	%al, token(%rip)
	jmp	.LBB6_5
.LBB6_4:
	callq	error
.LBB6_5:
	movsd	-8(%rbp), %xmm0         # xmm0 = mem[0],zero
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end6:
	.size	factor, .Lfunc_end6-factor
	.cfi_endproc

	.type	token,@object           # @token
	.comm	token,1,1
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Result is: %g\n"
	.size	.L.str, 15

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"%lf"
	.size	.L.str.1, 4

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"Error!\n"
	.size	.L.str.2, 8


	.ident	"clang version 4.0.1 (tags/RELEASE_401/final)"
	.section	".note.GNU-stack","",@progbits
