	.file	"test.c"
	.section	.rodata
.LC0:
	.string	"The sum for row"
.LC1:
	.string	" is:"
.LC2:
	.string	"\n"
	.text	
	.globl	find_sum_row
	.type	find_sum_row, @function
find_sum_row: 
.LFB0:
	.cfi_startproc
	pushq 	%rbp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movq 	%rsp, %rbp
	.cfi_def_cfa_register 5
	subq	$312, %rsp
	movq	%rdi, -20(%rbp)
	movl	$0, %eax
	movl 	%eax, -32(%rbp)
	movl	-32(%rbp), %eax
	movl 	%eax, -28(%rbp)
	movl	$0, %eax
	movl 	%eax, -40(%rbp)
	movl	-40(%rbp), %eax
	movl 	%eax, -36(%rbp)
	movl	$3, %eax
	movl 	%eax, -124(%rbp)
	movl	$3, %eax
	movl 	%eax, -128(%rbp)
	movl	$8, %eax
	movl 	%eax, -212(%rbp)
	movl	-212(%rbp), %eax
	leaq	-132(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
movl	$1, %edx
	movl	%edx, (%rax)

	movl	$16, %eax
	movl 	%eax, -216(%rbp)
	movl	-216(%rbp), %eax
	leaq	-132(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
movl	$2, %edx
	movl	%edx, (%rax)

	movl	$24, %eax
	movl 	%eax, -220(%rbp)
	movl	-220(%rbp), %eax
	leaq	-132(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
movl	$3, %edx
	movl	%edx, (%rax)

	movl	$32, %eax
	movl 	%eax, -224(%rbp)
	movl	-224(%rbp), %eax
	leaq	-132(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
movl	$4, %edx
	movl	%edx, (%rax)

	movl	$40, %eax
	movl 	%eax, -228(%rbp)
	movl	-228(%rbp), %eax
	leaq	-132(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
movl	$5, %edx
	movl	%edx, (%rax)

	movl	$48, %eax
	movl 	%eax, -232(%rbp)
	movl	-232(%rbp), %eax
	leaq	-132(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
movl	$6, %edx
	movl	%edx, (%rax)

	movl	$56, %eax
	movl 	%eax, -236(%rbp)
	movl	-236(%rbp), %eax
	leaq	-132(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
movl	$7, %edx
	movl	%edx, (%rax)

	movl	$64, %eax
	movl 	%eax, -240(%rbp)
	movl	-240(%rbp), %eax
	leaq	-132(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
movl	$8, %edx
	movl	%edx, (%rax)

	movl	$72, %eax
	movl 	%eax, -244(%rbp)
	movl	-244(%rbp), %eax
	leaq	-132(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
movl	$9, %edx
	movl	%edx, (%rax)

	# result, -44 arg1-132
	movl	$0, %eax
	movl 	%eax, -248(%rbp)
	movl	-248(%rbp), %eax
	movl 	%eax, -28(%rbp)
.L2: 
	movl	$3, %eax
	movl 	%eax, -256(%rbp)
	movl	-28(%rbp), %eax
	cmpl	-256(%rbp), %eax
	jl .L4
	jmp .L5
.L3: 
	addl 	$1, -28(%rbp)
	jmp .L2
.L4: 
	movl	$8, %eax
	movl 	%eax, -264(%rbp)
	movl 	-20(%rbp), %eax
	imull 	-264(%rbp), %eax
	movl 	%eax, -268(%rbp)
	movl	$3, %eax
	movl 	%eax, -272(%rbp)
	movl	-268(%rbp), %eax
	movl 	%eax, -276(%rbp)
	movl 	-276(%rbp), %eax
	imull 	-272(%rbp), %eax
	movl 	%eax, -280(%rbp)
	movl 	-28(%rbp), %eax
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
	leaq	-132(%rbp), %rdx
	movl	-292(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -296(%rbp)

	movl 	-36(%rbp), %eax
	movl 	-296(%rbp), %edx
	addl 	%edx, %eax
	movl 	%eax, -304(%rbp)
	movl	-304(%rbp), %eax
	movl 	%eax, -36(%rbp)
	jmp .L3
.L5: 
	movl	-36(%rbp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	find_sum_row, .-find_sum_row
	.globl	main
	.type	main, @function
main: 
.LFB1:
	.cfi_startproc
	pushq 	%rbp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movq 	%rsp, %rbp
	.cfi_def_cfa_register 5
	subq	$104, %rsp

	movl	$0, %eax
	movl 	%eax, -36(%rbp)
	movl	-36(%rbp), %eax
	movl 	%eax, -28(%rbp)
.L8: 
	movl	$3, %eax
	movl 	%eax, -44(%rbp)
	movl	-28(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jl .L10
	jmp .L11
.L9: 
	addl 	$1, -28(%rbp)
	jmp .L8
.L10: 
	movl 	-28(%rbp), %eax
	movq 	-28(%rbp), %rdi
	call	find_sum_row
	movl	%eax, -56(%rbp)
	movl	-56(%rbp), %eax
	movl 	%eax, -32(%rbp)
	movq 	$.LC0, -68(%rbp)
	movl 	-68(%rbp), %eax
	movq 	-68(%rbp), %rdi
	call	printStr
	movl	%eax, -72(%rbp)
	movl 	-28(%rbp), %eax
	movq 	-28(%rbp), %rdi
	call	printInt
	movl	%eax, -80(%rbp)
	movq 	$.LC1, -84(%rbp)
	movl 	-84(%rbp), %eax
	movq 	-84(%rbp), %rdi
	call	printStr
	movl	%eax, -88(%rbp)
	movl 	-32(%rbp), %eax
	movq 	-32(%rbp), %rdi
	call	printInt
	movl	%eax, -92(%rbp)
	movq 	$.LC2, -96(%rbp)
	movl 	-96(%rbp), %eax
	movq 	-96(%rbp), %rdi
	call	printStr
	movl	%eax, -100(%rbp)
	jmp .L9
.L11: 
	movl	$0, %eax
	movl 	%eax, -104(%rbp)
	movl	-104(%rbp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident		"Compiled by 15cs30005"
	.section	.note.GNU-stack,"",@progbits
