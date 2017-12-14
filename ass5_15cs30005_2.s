	.file	"test.c"
	.section	.rodata
.LC0:
	.string	"we will create a 3*2 matrix rows=3 and cols=2\n"
.LC1:
	.string	"Type elements in row major form i.e elements of a particular row first with newline between any two numbers\n:"
.LC2:
	.string	"The matrix input by user\n"
.LC3:
	.string	"\n"
.LC4:
	.string	" "
.LC5:
	.string	"\n\n"
	.text	
	.globl	main
	.type	main, @function
main: 
.LFB0:
	.cfi_startproc
	pushq 	%rbp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movq 	%rsp, %rbp
	.cfi_def_cfa_register 5
	subq	$328, %rsp

	movl	$0, %eax
	movl 	%eax, -32(%rbp)
	movl	-32(%rbp), %eax
	movl 	%eax, -28(%rbp)
	movl	$0, %eax
	movl 	%eax, -40(%rbp)
	movl	-40(%rbp), %eax
	movl 	%eax, -36(%rbp)
	movl	$3, %eax
	movl 	%eax, -112(%rbp)
	movl	$2, %eax
	movl 	%eax, -116(%rbp)
	movq 	$.LC0, -124(%rbp)
	movl 	-124(%rbp), %eax
	movq 	-124(%rbp), %rdi
	call	printStr
	movl	%eax, -128(%rbp)
	movq 	$.LC1, -132(%rbp)
	movl 	-132(%rbp), %eax
	movq 	-132(%rbp), %rdi
	call	printStr
	movl	%eax, -136(%rbp)
	movl	$0, %eax
	movl 	%eax, -140(%rbp)
	movl	-140(%rbp), %eax
	movl 	%eax, -28(%rbp)
.L2: 
	movl	$3, %eax
	movl 	%eax, -148(%rbp)
	movl	-28(%rbp), %eax
	cmpl	-148(%rbp), %eax
	jl .L4
	jmp .L8
.L3: 
	addl 	$1, -28(%rbp)
	jmp .L2
.L4: 
	movl	$0, %eax
	movl 	%eax, -156(%rbp)
	movl	-156(%rbp), %eax
	movl 	%eax, -36(%rbp)
.L5: 
	movl	$2, %eax
	movl 	%eax, -164(%rbp)
	movl	-36(%rbp), %eax
	cmpl	-164(%rbp), %eax
	jl .L7
	jmp .L3
.L6: 
	addl 	$1, -36(%rbp)
	jmp .L5
.L7: 
	leaq	-44(%rbp), %rax
	movq 	%rax, -176(%rbp)
	movl 	-176(%rbp), %eax
	movq 	-176(%rbp), %rdi
	call	readInt
	movl	%eax, -180(%rbp)
	movl	$8, %eax
	movl 	%eax, -184(%rbp)
	movl 	-28(%rbp), %eax
	imull 	-184(%rbp), %eax
	movl 	%eax, -188(%rbp)
	movl	$2, %eax
	movl 	%eax, -192(%rbp)
	movl	-188(%rbp), %eax
	movl 	%eax, -196(%rbp)
	movl 	-196(%rbp), %eax
	imull 	-192(%rbp), %eax
	movl 	%eax, -200(%rbp)
	movl 	-36(%rbp), %eax
	imull 	-184(%rbp), %eax
	movl 	%eax, -204(%rbp)
	movl 	-204(%rbp), %eax
	movl 	-200(%rbp), %edx
	addl 	%edx, %eax
	movl 	%eax, -208(%rbp)
	movl 	-208(%rbp), %eax
	movl 	-184(%rbp), %edx
	addl 	%edx, %eax
	movl 	%eax, -212(%rbp)
	movl	-212(%rbp), %eax
	leaq	-56(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
	movl	-44(%rbp), %edx
	movl	%edx, (%rax)

	jmp .L6
	jmp .L3
.L8: 
	movq 	$.LC2, -216(%rbp)
	movl 	-216(%rbp), %eax
	movq 	-216(%rbp), %rdi
	call	printStr
	movl	%eax, -220(%rbp)
	movl	$0, %eax
	movl 	%eax, -224(%rbp)
	movl	-224(%rbp), %eax
	movl 	%eax, -28(%rbp)
.L9: 
	movl	$3, %eax
	movl 	%eax, -232(%rbp)
	movl	-28(%rbp), %eax
	cmpl	-232(%rbp), %eax
	jl .L11
	jmp .L15
.L10: 
	addl 	$1, -28(%rbp)
	jmp .L9
.L11: 
	movq 	$.LC3, -240(%rbp)
	movl 	-240(%rbp), %eax
	movq 	-240(%rbp), %rdi
	call	printStr
	movl	%eax, -244(%rbp)
	movl	$0, %eax
	movl 	%eax, -248(%rbp)
	movl	-248(%rbp), %eax
	movl 	%eax, -36(%rbp)
.L12: 
	movl	$2, %eax
	movl 	%eax, -256(%rbp)
	movl	-36(%rbp), %eax
	cmpl	-256(%rbp), %eax
	jl .L14
	jmp .L10
.L13: 
	addl 	$1, -36(%rbp)
	jmp .L12
.L14: 
	movl	$8, %eax
	movl 	%eax, -264(%rbp)
	movl 	-28(%rbp), %eax
	imull 	-264(%rbp), %eax
	movl 	%eax, -268(%rbp)
	movl	$2, %eax
	movl 	%eax, -272(%rbp)
	movl	-268(%rbp), %eax
	movl 	%eax, -276(%rbp)
	movl 	-276(%rbp), %eax
	imull 	-272(%rbp), %eax
	movl 	%eax, -280(%rbp)
	movl 	-36(%rbp), %eax
	imull 	-264(%rbp), %eax
	movl 	%eax, -284(%rbp)
	movl 	-284(%rbp), %eax
	movl 	-280(%rbp), %edx
	addl 	%edx, %eax
	movl 	%eax, -288(%rbp)
	movl 	-288(%rbp), %eax
	movl 	-264(%rbp), %edx
	addl 	%edx, %eax
	movl 	%eax, -292(%rbp)
	leaq	-56(%rbp), %rdx
	movl	-292(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -296(%rbp)

	movl	-296(%rbp), %eax
	movl 	%eax, -52(%rbp)
	movl 	-52(%rbp), %eax
	movq 	-52(%rbp), %rdi
	call	printInt
	movl	%eax, -308(%rbp)
	movq 	$.LC4, -312(%rbp)
	movl 	-312(%rbp), %eax
	movq 	-312(%rbp), %rdi
	call	printStr
	movl	%eax, -316(%rbp)
	jmp .L13
	jmp .L10
.L15: 
	movq 	$.LC5, -320(%rbp)
	movl 	-320(%rbp), %eax
	movq 	-320(%rbp), %rdi
	call	printStr
	movl	%eax, -324(%rbp)
	movl	$0, %eax
	movl 	%eax, -328(%rbp)
	movl	-328(%rbp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident		"Compiled by 15cs30005"
	.section	.note.GNU-stack,"",@progbits
