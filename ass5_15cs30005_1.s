	.file	"test.c"
	.section	.rodata
.LC0:
	.string	"value of i:\n"
.LC1:
	.string	"\n"
.LC2:
	.string	"Matrix m:"
.LC3:
	.string	"\n"
.LC4:
	.string	" "
.LC5:
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
	subq	$446, %rsp

	movl	$3, %eax
	movl 	%eax, -32(%rbp)
	movl	-32(%rbp), %eax
	movl 	%eax, -28(%rbp)
	movb	$0, -37(%rbp)
	movl	-37(%rbp), %eax
	movl 	%eax, -36(%rbp)
	movq 	$.LC0, -42(%rbp)
	movl 	-42(%rbp), %eax
	movq 	-42(%rbp), %rdi
	call	printStr
	movl	%eax, -46(%rbp)
	movl 	-28(%rbp), %eax
	movq 	-28(%rbp), %rdi
	call	printInt
	movl	%eax, -54(%rbp)
	movq 	$.LC1, -58(%rbp)
	movl 	-58(%rbp), %eax
	movq 	-58(%rbp), %rdi
	call	printStr
	movl	%eax, -62(%rbp)
	movl	$3, %eax
	movl 	%eax, -146(%rbp)
	movl	$3, %eax
	movl 	%eax, -150(%rbp)
	movl	$8, %eax
	movl 	%eax, -234(%rbp)
	movl	-234(%rbp), %eax
	leaq	-154(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
movl	$11, %edx
	movl	%edx, (%rax)

	movl	$16, %eax
	movl 	%eax, -238(%rbp)
	movl	-238(%rbp), %eax
	leaq	-154(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
movl	$12, %edx
	movl	%edx, (%rax)

	movl	$24, %eax
	movl 	%eax, -242(%rbp)
	movl	-242(%rbp), %eax
	leaq	-154(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
movl	$13, %edx
	movl	%edx, (%rax)

	movl	$32, %eax
	movl 	%eax, -246(%rbp)
	movl	-246(%rbp), %eax
	leaq	-154(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
movl	$14, %edx
	movl	%edx, (%rax)

	movl	$40, %eax
	movl 	%eax, -250(%rbp)
	movl	-250(%rbp), %eax
	leaq	-154(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
movl	$15, %edx
	movl	%edx, (%rax)

	movl	$48, %eax
	movl 	%eax, -254(%rbp)
	movl	-254(%rbp), %eax
	leaq	-154(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
movl	$16, %edx
	movl	%edx, (%rax)

	movl	$56, %eax
	movl 	%eax, -258(%rbp)
	movl	-258(%rbp), %eax
	leaq	-154(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
movl	$17, %edx
	movl	%edx, (%rax)

	movl	$64, %eax
	movl 	%eax, -262(%rbp)
	movl	-262(%rbp), %eax
	leaq	-154(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
movl	$18, %edx
	movl	%edx, (%rax)

	movl	$72, %eax
	movl 	%eax, -266(%rbp)
	movl	-266(%rbp), %eax
	leaq	-154(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
movl	$19, %edx
	movl	%edx, (%rax)

	# result, -66 arg1-154
	movl	$0, %eax
	movl 	%eax, -270(%rbp)
	movl	$1, %eax
	movl 	%eax, -274(%rbp)
	movl	$8, %eax
	movl 	%eax, -278(%rbp)
	movl 	-270(%rbp), %eax
	imull 	-278(%rbp), %eax
	movl 	%eax, -282(%rbp)
	movl	$3, %eax
	movl 	%eax, -286(%rbp)
	movl	-282(%rbp), %eax
	movl 	%eax, -290(%rbp)
	movl 	-290(%rbp), %eax
	imull 	-286(%rbp), %eax
	movl 	%eax, -294(%rbp)
	movl 	-274(%rbp), %eax
	imull 	-278(%rbp), %eax
	movl 	%eax, -298(%rbp)
	movl 	-298(%rbp), %eax
	movl 	-294(%rbp), %edx
	addl 	%edx, %eax
	movl 	%eax, -302(%rbp)
	movl 	-302(%rbp), %eax
	movl 	-278(%rbp), %edx
	addl 	%edx, %eax
	movl 	%eax, -306(%rbp)
	movl	$12221, %eax
	movl 	%eax, -310(%rbp)
	movl	-306(%rbp), %eax
	leaq	-154(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
	movl	-310(%rbp), %edx
	movl	%edx, (%rax)

	movl	$0, %eax
	movl 	%eax, -318(%rbp)
	movl	-318(%rbp), %eax
	movl 	%eax, -314(%rbp)
	movl	$0, %eax
	movl 	%eax, -326(%rbp)
	movl	-326(%rbp), %eax
	movl 	%eax, -322(%rbp)
	movq 	$.LC2, -330(%rbp)
	movl 	-330(%rbp), %eax
	movq 	-330(%rbp), %rdi
	call	printStr
	movl	%eax, -334(%rbp)
	movl	$0, %eax
	movl 	%eax, -338(%rbp)
	movl	-338(%rbp), %eax
	movl 	%eax, -28(%rbp)
.L2: 
	movl	$2, %eax
	movl 	%eax, -346(%rbp)
	movl	-28(%rbp), %eax
	cmpl	-346(%rbp), %eax
	jl .L4
	jmp .L8
.L3: 
	addl 	$1, -28(%rbp)
	jmp .L2
.L4: 
	movq 	$.LC3, -354(%rbp)
	movl 	-354(%rbp), %eax
	movq 	-354(%rbp), %rdi
	call	printStr
	movl	%eax, -358(%rbp)
	movl	$0, %eax
	movl 	%eax, -366(%rbp)
	movl	-366(%rbp), %eax
	movl 	%eax, -362(%rbp)
.L5: 
	movl	$3, %eax
	movl 	%eax, -374(%rbp)
	movl	-362(%rbp), %eax
	cmpl	-374(%rbp), %eax
	jl .L7
	jmp .L3
.L6: 
	addl 	$1, -362(%rbp)
	jmp .L5
.L7: 
	movl	$8, %eax
	movl 	%eax, -386(%rbp)
	movl 	-28(%rbp), %eax
	imull 	-386(%rbp), %eax
	movl 	%eax, -390(%rbp)
	movl	$3, %eax
	movl 	%eax, -394(%rbp)
	movl	-390(%rbp), %eax
	movl 	%eax, -398(%rbp)
	movl 	-398(%rbp), %eax
	imull 	-394(%rbp), %eax
	movl 	%eax, -402(%rbp)
	movl 	-362(%rbp), %eax
	imull 	-386(%rbp), %eax
	movl 	%eax, -406(%rbp)
	movl 	-406(%rbp), %eax
	movl 	-402(%rbp), %edx
	addl 	%edx, %eax
	movl 	%eax, -410(%rbp)
	movl 	-410(%rbp), %eax
	movl 	-386(%rbp), %edx
	addl 	%edx, %eax
	movl 	%eax, -414(%rbp)
	leaq	-154(%rbp), %rdx
	movl	-414(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -418(%rbp)

	movl	-418(%rbp), %eax
	movl 	%eax, -382(%rbp)
	movl 	-382(%rbp), %eax
	movq 	-382(%rbp), %rdi
	call	printInt
	movl	%eax, -426(%rbp)
	movq 	$.LC4, -430(%rbp)
	movl 	-430(%rbp), %eax
	movq 	-430(%rbp), %rdi
	call	printStr
	movl	%eax, -434(%rbp)
	jmp .L6
	jmp .L3
.L8: 
	movq 	$.LC5, -438(%rbp)
	movl 	-438(%rbp), %eax
	movq 	-438(%rbp), %rdi
	call	printStr
	movl	%eax, -442(%rbp)
	movl	$0, %eax
	movl 	%eax, -446(%rbp)
	movl	-446(%rbp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident		"Compiled by 15cs30005"
	.section	.note.GNU-stack,"",@progbits
