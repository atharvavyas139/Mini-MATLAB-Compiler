	.file	"test.c"
	.section	.rodata
.LC0:
	.string	"printing 2 x 2 block of matrix through loops and conditions\n"
.LC1:
	.string	","
.LC2:
	.string	"\n"
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
	subq	$360, %rsp

	movl	$3, %eax
	movl 	%eax, -108(%rbp)
	movl	$3, %eax
	movl 	%eax, -112(%rbp)
	movl	$8, %eax
	movl 	%eax, -196(%rbp)
	movl	-196(%rbp), %eax
	leaq	-116(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
movl	$1, %edx
	movl	%edx, (%rax)

	movl	$16, %eax
	movl 	%eax, -200(%rbp)
	movl	-200(%rbp), %eax
	leaq	-116(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
movl	$2, %edx
	movl	%edx, (%rax)

	movl	$24, %eax
	movl 	%eax, -204(%rbp)
	movl	-204(%rbp), %eax
	leaq	-116(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
movl	$3, %edx
	movl	%edx, (%rax)

	movl	$32, %eax
	movl 	%eax, -208(%rbp)
	movl	-208(%rbp), %eax
	leaq	-116(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
movl	$4, %edx
	movl	%edx, (%rax)

	movl	$40, %eax
	movl 	%eax, -212(%rbp)
	movl	-212(%rbp), %eax
	leaq	-116(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
movl	$5, %edx
	movl	%edx, (%rax)

	movl	$48, %eax
	movl 	%eax, -216(%rbp)
	movl	-216(%rbp), %eax
	leaq	-116(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
movl	$6, %edx
	movl	%edx, (%rax)

	movl	$56, %eax
	movl 	%eax, -220(%rbp)
	movl	-220(%rbp), %eax
	leaq	-116(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
movl	$7, %edx
	movl	%edx, (%rax)

	movl	$64, %eax
	movl 	%eax, -224(%rbp)
	movl	-224(%rbp), %eax
	leaq	-116(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
movl	$8, %edx
	movl	%edx, (%rax)

	movl	$72, %eax
	movl 	%eax, -228(%rbp)
	movl	-228(%rbp), %eax
	leaq	-116(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
movl	$9, %edx
	movl	%edx, (%rax)

	# result, -28 arg1-116
	movl	$0, %eax
	movl 	%eax, -236(%rbp)
	movl	-236(%rbp), %eax
	movl 	%eax, -232(%rbp)
	movl	$0, %eax
	movl 	%eax, -244(%rbp)
	movl	-244(%rbp), %eax
	movl 	%eax, -240(%rbp)
	movq 	$.LC0, -256(%rbp)
	movl 	-256(%rbp), %eax
	movq 	-256(%rbp), %rdi
	call	printStr
	movl	%eax, -260(%rbp)
.L2: 
	movl	$2, %eax
	movl 	%eax, -264(%rbp)
	movl	-232(%rbp), %eax
	cmpl	-264(%rbp), %eax
	jl .L3
	jmp .L9
.L3: 
	movl	$0, %eax
	movl 	%eax, -272(%rbp)
	movl	-272(%rbp), %eax
	movl 	%eax, -240(%rbp)
.L4: 
	movl	$3, %eax
	movl 	%eax, -280(%rbp)
	movl	-240(%rbp), %eax
	cmpl	-280(%rbp), %eax
	jl .L5
	jmp .L8
.L5: 
	movl	$2, %eax
	movl 	%eax, -288(%rbp)
	movl	-240(%rbp), %eax
	cmpl	-288(%rbp), %eax
	jl .L6
	jmp .L7
.L6: 
	movl	$8, %eax
	movl 	%eax, -296(%rbp)
	movl 	-232(%rbp), %eax
	imull 	-296(%rbp), %eax
	movl 	%eax, -300(%rbp)
	movl	$3, %eax
	movl 	%eax, -304(%rbp)
	movl	-300(%rbp), %eax
	movl 	%eax, -308(%rbp)
	movl 	-308(%rbp), %eax
	imull 	-304(%rbp), %eax
	movl 	%eax, -312(%rbp)
	movl 	-240(%rbp), %eax
	imull 	-296(%rbp), %eax
	movl 	%eax, -316(%rbp)
	movl 	-316(%rbp), %eax
	movl 	-312(%rbp), %edx
	addl 	%edx, %eax
	movl 	%eax, -320(%rbp)
	movl 	-320(%rbp), %eax
	movl 	-296(%rbp), %edx
	addl 	%edx, %eax
	movl 	%eax, -324(%rbp)
	leaq	-116(%rbp), %rdx
	movl	-324(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -328(%rbp)

	movl	-328(%rbp), %eax
	movl 	%eax, -248(%rbp)
	movl 	-248(%rbp), %eax
	movq 	-248(%rbp), %rdi
	call	printInt
	movl	%eax, -340(%rbp)
	movq 	$.LC1, -344(%rbp)
	movl 	-344(%rbp), %eax
	movq 	-344(%rbp), %rdi
	call	printStr
	movl	%eax, -348(%rbp)
	jmp .L7
.L7: 
	addl 	$1, -240(%rbp)
	jmp .L4
.L8: 
	movq 	$.LC2, -352(%rbp)
	movl 	-352(%rbp), %eax
	movq 	-352(%rbp), %rdi
	call	printStr
	movl	%eax, -356(%rbp)
	addl 	$1, -232(%rbp)
	jmp .L2
.L9: 
	movl	$0, %eax
	movl 	%eax, -360(%rbp)
	movl	-360(%rbp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident		"Compiled by 15cs30005"
	.section	.note.GNU-stack,"",@progbits
