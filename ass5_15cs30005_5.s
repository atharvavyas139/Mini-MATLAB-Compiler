	.file	"test.c"
	.section	.rodata
.LC0:
	.string	"Matrix mat:"
.LC1:
	.string	"\n"
.LC2:
	.string	" "
.LC3:
	.string	"\n\n"
.LC4:
	.string	"Matrix a:"
.LC5:
	.string	"\n"
.LC6:
	.string	" "
.LC7:
	.string	"\n\n"
.LC8:
	.string	"Matrix p:"
.LC9:
	.string	"\n"
.LC10:
	.string	" "
.LC11:
	.string	"\n\n"
.LC12:
	.string	"addition mat+a:"
.LC13:
	.string	"\n"
.LC14:
	.string	" "
.LC15:
	.string	"\n\n"
.LC16:
	.string	"subtraction mat-a:"
.LC17:
	.string	"\n"
.LC18:
	.string	" "
.LC19:
	.string	"\n\n"
.LC20:
	.string	"multiplication: mat*p"
.LC21:
	.string	"\n"
.LC22:
	.string	" "
.LC23:
	.string	"\n\n"
.LC24:
	.string	"transpose: mat.'"
.LC25:
	.string	"\n"
.LC26:
	.string	" "
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
	subq	$2556, %rsp

	movl	$2, %eax
	movl 	%eax, -84(%rbp)
	movl	$3, %eax
	movl 	%eax, -88(%rbp)
	movl	$8, %eax
	movl 	%eax, -148(%rbp)
	movl	-148(%rbp), %eax
	leaq	-92(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
movl	$1, %edx
	movl	%edx, (%rax)

	movl	$16, %eax
	movl 	%eax, -152(%rbp)
	movl	-152(%rbp), %eax
	leaq	-92(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
movl	$2, %edx
	movl	%edx, (%rax)

	movl	$24, %eax
	movl 	%eax, -156(%rbp)
	movl	-156(%rbp), %eax
	leaq	-92(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
movl	$3, %edx
	movl	%edx, (%rax)

	movl	$32, %eax
	movl 	%eax, -160(%rbp)
	movl	-160(%rbp), %eax
	leaq	-92(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
movl	$4, %edx
	movl	%edx, (%rax)

	movl	$40, %eax
	movl 	%eax, -164(%rbp)
	movl	-164(%rbp), %eax
	leaq	-92(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
movl	$5, %edx
	movl	%edx, (%rax)

	movl	$48, %eax
	movl 	%eax, -168(%rbp)
	movl	-168(%rbp), %eax
	leaq	-92(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
movl	$6, %edx
	movl	%edx, (%rax)

	# result, -28 arg1-92
	movl	$3, %eax
	movl 	%eax, -228(%rbp)
	movl	$2, %eax
	movl 	%eax, -232(%rbp)
	movl	$8, %eax
	movl 	%eax, -292(%rbp)
	movl	-292(%rbp), %eax
	leaq	-236(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
movl	$1, %edx
	movl	%edx, (%rax)

	movl	$16, %eax
	movl 	%eax, -296(%rbp)
	movl	-296(%rbp), %eax
	leaq	-236(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
movl	$3, %edx
	movl	%edx, (%rax)

	movl	$24, %eax
	movl 	%eax, -300(%rbp)
	movl	-300(%rbp), %eax
	leaq	-236(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
movl	$5, %edx
	movl	%edx, (%rax)

	movl	$32, %eax
	movl 	%eax, -304(%rbp)
	movl	-304(%rbp), %eax
	leaq	-236(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
movl	$7, %edx
	movl	%edx, (%rax)

	movl	$40, %eax
	movl 	%eax, -308(%rbp)
	movl	-308(%rbp), %eax
	leaq	-236(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
movl	$9, %edx
	movl	%edx, (%rax)

	movl	$48, %eax
	movl 	%eax, -312(%rbp)
	movl	-312(%rbp), %eax
	leaq	-236(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
movl	$11, %edx
	movl	%edx, (%rax)

	# result, -172 arg1-236
	movl	$2, %eax
	movl 	%eax, -372(%rbp)
	movl	$3, %eax
	movl 	%eax, -376(%rbp)
	movl	$8, %eax
	movl 	%eax, -436(%rbp)
	movl	-436(%rbp), %eax
	leaq	-380(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
movl	$2, %edx
	movl	%edx, (%rax)

	movl	$16, %eax
	movl 	%eax, -440(%rbp)
	movl	-440(%rbp), %eax
	leaq	-380(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
movl	$4, %edx
	movl	%edx, (%rax)

	movl	$24, %eax
	movl 	%eax, -444(%rbp)
	movl	-444(%rbp), %eax
	leaq	-380(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
movl	$6, %edx
	movl	%edx, (%rax)

	movl	$32, %eax
	movl 	%eax, -448(%rbp)
	movl	-448(%rbp), %eax
	leaq	-380(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
movl	$8, %edx
	movl	%edx, (%rax)

	movl	$40, %eax
	movl 	%eax, -452(%rbp)
	movl	-452(%rbp), %eax
	leaq	-380(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
movl	$10, %edx
	movl	%edx, (%rax)

	movl	$48, %eax
	movl 	%eax, -456(%rbp)
	movl	-456(%rbp), %eax
	leaq	-380(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
movl	$12, %edx
	movl	%edx, (%rax)

	# result, -316 arg1-380
	movl	$3, %eax
	movl 	%eax, -516(%rbp)
	movl	$2, %eax
	movl 	%eax, -520(%rbp)
	movl	$2, %eax
	movl 	%eax, -564(%rbp)
	movl	$2, %eax
	movl 	%eax, -568(%rbp)
	movl	$2, %eax
	movl 	%eax, -628(%rbp)
	movl	$3, %eax
	movl 	%eax, -632(%rbp)
	movl	$2, %eax
	movl 	%eax, -692(%rbp)
	movl	$3, %eax
	movl 	%eax, -696(%rbp)
	movl	$0, %eax
	movl 	%eax, -704(%rbp)
	movl	-704(%rbp), %eax
	movl 	%eax, -700(%rbp)
	movl	$0, %eax
	movl 	%eax, -712(%rbp)
	movl	-712(%rbp), %eax
	movl 	%eax, -708(%rbp)
	# result, -720 arg1-92
	# result, -776 arg1-380
	movl	$8, %eax
	movl 	%eax, -892(%rbp)
	leaq	-92(%rbp), %rdx
	movl	-892(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -888(%rbp)

	leaq	-380(%rbp), %rdx
	movl	-892(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -896(%rbp)

	movl 	-896(%rbp), %eax
	movl 	-888(%rbp), %edx
	addl 	%edx, %eax
	movl 	%eax, -900(%rbp)
	movl	-892(%rbp), %eax
	leaq	-832(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
	movl	-900(%rbp), %edx
	movl	%edx, (%rax)

	movl	$16, %eax
	movl 	%eax, -908(%rbp)
	leaq	-92(%rbp), %rdx
	movl	-908(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -904(%rbp)

	leaq	-380(%rbp), %rdx
	movl	-908(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -912(%rbp)

	movl 	-912(%rbp), %eax
	movl 	-904(%rbp), %edx
	addl 	%edx, %eax
	movl 	%eax, -916(%rbp)
	movl	-908(%rbp), %eax
	leaq	-832(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
	movl	-916(%rbp), %edx
	movl	%edx, (%rax)

	movl	$24, %eax
	movl 	%eax, -924(%rbp)
	leaq	-92(%rbp), %rdx
	movl	-924(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -920(%rbp)

	leaq	-380(%rbp), %rdx
	movl	-924(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -928(%rbp)

	movl 	-928(%rbp), %eax
	movl 	-920(%rbp), %edx
	addl 	%edx, %eax
	movl 	%eax, -932(%rbp)
	movl	-924(%rbp), %eax
	leaq	-832(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
	movl	-932(%rbp), %edx
	movl	%edx, (%rax)

	movl	$32, %eax
	movl 	%eax, -940(%rbp)
	leaq	-92(%rbp), %rdx
	movl	-940(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -936(%rbp)

	leaq	-380(%rbp), %rdx
	movl	-940(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -944(%rbp)

	movl 	-944(%rbp), %eax
	movl 	-936(%rbp), %edx
	addl 	%edx, %eax
	movl 	%eax, -948(%rbp)
	movl	-940(%rbp), %eax
	leaq	-832(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
	movl	-948(%rbp), %edx
	movl	%edx, (%rax)

	movl	$40, %eax
	movl 	%eax, -956(%rbp)
	leaq	-92(%rbp), %rdx
	movl	-956(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -952(%rbp)

	leaq	-380(%rbp), %rdx
	movl	-956(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -960(%rbp)

	movl 	-960(%rbp), %eax
	movl 	-952(%rbp), %edx
	addl 	%edx, %eax
	movl 	%eax, -964(%rbp)
	movl	-956(%rbp), %eax
	leaq	-832(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
	movl	-964(%rbp), %edx
	movl	%edx, (%rax)

	movl	$48, %eax
	movl 	%eax, -972(%rbp)
	leaq	-92(%rbp), %rdx
	movl	-972(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -968(%rbp)

	leaq	-380(%rbp), %rdx
	movl	-972(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -976(%rbp)

	movl 	-976(%rbp), %eax
	movl 	-968(%rbp), %edx
	addl 	%edx, %eax
	movl 	%eax, -980(%rbp)
	movl	-972(%rbp), %eax
	leaq	-832(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
	movl	-980(%rbp), %edx
	movl	%edx, (%rax)

	# result, -572 arg2-832
	# result, -984 arg1-92
	# result, -1040 arg1-380
	movl	$8, %eax
	movl 	%eax, -1156(%rbp)
	leaq	-92(%rbp), %rdx
	movl	-1156(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -1152(%rbp)

	leaq	-380(%rbp), %rdx
	movl	-1156(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -1160(%rbp)

	movl 	-1152(%rbp), %eax
	movl 	-1160(%rbp), %edx
	subl 	%edx, %eax
	movl 	%eax, -1164(%rbp)
	movl	-1156(%rbp), %eax
	leaq	-1096(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
	movl	-1164(%rbp), %edx
	movl	%edx, (%rax)

	movl	$16, %eax
	movl 	%eax, -1172(%rbp)
	leaq	-92(%rbp), %rdx
	movl	-1172(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -1168(%rbp)

	leaq	-380(%rbp), %rdx
	movl	-1172(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -1176(%rbp)

	movl 	-1168(%rbp), %eax
	movl 	-1176(%rbp), %edx
	subl 	%edx, %eax
	movl 	%eax, -1180(%rbp)
	movl	-1172(%rbp), %eax
	leaq	-1096(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
	movl	-1180(%rbp), %edx
	movl	%edx, (%rax)

	movl	$24, %eax
	movl 	%eax, -1188(%rbp)
	leaq	-92(%rbp), %rdx
	movl	-1188(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -1184(%rbp)

	leaq	-380(%rbp), %rdx
	movl	-1188(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -1192(%rbp)

	movl 	-1184(%rbp), %eax
	movl 	-1192(%rbp), %edx
	subl 	%edx, %eax
	movl 	%eax, -1196(%rbp)
	movl	-1188(%rbp), %eax
	leaq	-1096(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
	movl	-1196(%rbp), %edx
	movl	%edx, (%rax)

	movl	$32, %eax
	movl 	%eax, -1204(%rbp)
	leaq	-92(%rbp), %rdx
	movl	-1204(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -1200(%rbp)

	leaq	-380(%rbp), %rdx
	movl	-1204(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -1208(%rbp)

	movl 	-1200(%rbp), %eax
	movl 	-1208(%rbp), %edx
	subl 	%edx, %eax
	movl 	%eax, -1212(%rbp)
	movl	-1204(%rbp), %eax
	leaq	-1096(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
	movl	-1212(%rbp), %edx
	movl	%edx, (%rax)

	movl	$40, %eax
	movl 	%eax, -1220(%rbp)
	leaq	-92(%rbp), %rdx
	movl	-1220(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -1216(%rbp)

	leaq	-380(%rbp), %rdx
	movl	-1220(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -1224(%rbp)

	movl 	-1216(%rbp), %eax
	movl 	-1224(%rbp), %edx
	subl 	%edx, %eax
	movl 	%eax, -1228(%rbp)
	movl	-1220(%rbp), %eax
	leaq	-1096(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
	movl	-1228(%rbp), %edx
	movl	%edx, (%rax)

	movl	$48, %eax
	movl 	%eax, -1236(%rbp)
	leaq	-92(%rbp), %rdx
	movl	-1236(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -1232(%rbp)

	leaq	-380(%rbp), %rdx
	movl	-1236(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -1240(%rbp)

	movl 	-1232(%rbp), %eax
	movl 	-1240(%rbp), %edx
	subl 	%edx, %eax
	movl 	%eax, -1244(%rbp)
	movl	-1236(%rbp), %eax
	leaq	-1096(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
	movl	-1244(%rbp), %edx
	movl	%edx, (%rax)

	# result, -636 arg2-1096
	# result, -1248 arg1-92
	movl	$8, %eax
	movl 	%eax, -1344(%rbp)
	movl	$0, %eax
	movl 	%eax, -1348(%rbp)
	movl	-1348(%rbp), %eax
	leaq	-1304(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
	movl	-1348(%rbp), %edx
	movl	%edx, (%rax)

	movl	$8, %eax
	movl 	%eax, -1352(%rbp)
	movl	$8, %eax
	movl 	%eax, -1356(%rbp)
	leaq	-92(%rbp), %rdx
	movl	-1352(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -1360(%rbp)

	leaq	-236(%rbp), %rdx
	movl	-1356(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -1364(%rbp)

	movl 	-1360(%rbp), %eax
	imull 	-1364(%rbp), %eax
	movl 	%eax, -1368(%rbp)
	movl 	-1348(%rbp), %eax
	movl 	-1368(%rbp), %edx
	addl 	%edx, %eax
	movl 	%eax, -1348(%rbp)
	movl	-1344(%rbp), %eax
	leaq	-1304(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
	movl	-1348(%rbp), %edx
	movl	%edx, (%rax)

	movl	$16, %eax
	movl 	%eax, -1372(%rbp)
	movl	$24, %eax
	movl 	%eax, -1376(%rbp)
	leaq	-92(%rbp), %rdx
	movl	-1372(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -1380(%rbp)

	leaq	-236(%rbp), %rdx
	movl	-1376(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -1384(%rbp)

	movl 	-1380(%rbp), %eax
	imull 	-1384(%rbp), %eax
	movl 	%eax, -1388(%rbp)
	movl 	-1348(%rbp), %eax
	movl 	-1388(%rbp), %edx
	addl 	%edx, %eax
	movl 	%eax, -1348(%rbp)
	movl	-1344(%rbp), %eax
	leaq	-1304(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
	movl	-1348(%rbp), %edx
	movl	%edx, (%rax)

	movl	$24, %eax
	movl 	%eax, -1392(%rbp)
	movl	$40, %eax
	movl 	%eax, -1396(%rbp)
	leaq	-92(%rbp), %rdx
	movl	-1392(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -1400(%rbp)

	leaq	-236(%rbp), %rdx
	movl	-1396(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -1404(%rbp)

	movl 	-1400(%rbp), %eax
	imull 	-1404(%rbp), %eax
	movl 	%eax, -1408(%rbp)
	movl 	-1348(%rbp), %eax
	movl 	-1408(%rbp), %edx
	addl 	%edx, %eax
	movl 	%eax, -1348(%rbp)
	movl	-1344(%rbp), %eax
	leaq	-1304(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
	movl	-1348(%rbp), %edx
	movl	%edx, (%rax)

	movl	$16, %eax
	movl 	%eax, -1412(%rbp)
	movl	$0, %eax
	movl 	%eax, -1416(%rbp)
	movl	-1416(%rbp), %eax
	leaq	-1304(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
	movl	-1416(%rbp), %edx
	movl	%edx, (%rax)

	movl	$8, %eax
	movl 	%eax, -1420(%rbp)
	movl	$16, %eax
	movl 	%eax, -1424(%rbp)
	leaq	-92(%rbp), %rdx
	movl	-1420(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -1428(%rbp)

	leaq	-236(%rbp), %rdx
	movl	-1424(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -1432(%rbp)

	movl 	-1428(%rbp), %eax
	imull 	-1432(%rbp), %eax
	movl 	%eax, -1436(%rbp)
	movl 	-1416(%rbp), %eax
	movl 	-1436(%rbp), %edx
	addl 	%edx, %eax
	movl 	%eax, -1416(%rbp)
	movl	-1412(%rbp), %eax
	leaq	-1304(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
	movl	-1416(%rbp), %edx
	movl	%edx, (%rax)

	movl	$16, %eax
	movl 	%eax, -1440(%rbp)
	movl	$32, %eax
	movl 	%eax, -1444(%rbp)
	leaq	-92(%rbp), %rdx
	movl	-1440(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -1448(%rbp)

	leaq	-236(%rbp), %rdx
	movl	-1444(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -1452(%rbp)

	movl 	-1448(%rbp), %eax
	imull 	-1452(%rbp), %eax
	movl 	%eax, -1456(%rbp)
	movl 	-1416(%rbp), %eax
	movl 	-1456(%rbp), %edx
	addl 	%edx, %eax
	movl 	%eax, -1416(%rbp)
	movl	-1412(%rbp), %eax
	leaq	-1304(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
	movl	-1416(%rbp), %edx
	movl	%edx, (%rax)

	movl	$24, %eax
	movl 	%eax, -1460(%rbp)
	movl	$48, %eax
	movl 	%eax, -1464(%rbp)
	leaq	-92(%rbp), %rdx
	movl	-1460(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -1468(%rbp)

	leaq	-236(%rbp), %rdx
	movl	-1464(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -1472(%rbp)

	movl 	-1468(%rbp), %eax
	imull 	-1472(%rbp), %eax
	movl 	%eax, -1476(%rbp)
	movl 	-1416(%rbp), %eax
	movl 	-1476(%rbp), %edx
	addl 	%edx, %eax
	movl 	%eax, -1416(%rbp)
	movl	-1412(%rbp), %eax
	leaq	-1304(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
	movl	-1416(%rbp), %edx
	movl	%edx, (%rax)

	movl	$24, %eax
	movl 	%eax, -1480(%rbp)
	movl	$0, %eax
	movl 	%eax, -1484(%rbp)
	movl	-1484(%rbp), %eax
	leaq	-1304(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
	movl	-1484(%rbp), %edx
	movl	%edx, (%rax)

	movl	$32, %eax
	movl 	%eax, -1488(%rbp)
	movl	$8, %eax
	movl 	%eax, -1492(%rbp)
	leaq	-92(%rbp), %rdx
	movl	-1488(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -1496(%rbp)

	leaq	-236(%rbp), %rdx
	movl	-1492(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -1500(%rbp)

	movl 	-1496(%rbp), %eax
	imull 	-1500(%rbp), %eax
	movl 	%eax, -1504(%rbp)
	movl 	-1484(%rbp), %eax
	movl 	-1504(%rbp), %edx
	addl 	%edx, %eax
	movl 	%eax, -1484(%rbp)
	movl	-1480(%rbp), %eax
	leaq	-1304(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
	movl	-1484(%rbp), %edx
	movl	%edx, (%rax)

	movl	$40, %eax
	movl 	%eax, -1508(%rbp)
	movl	$24, %eax
	movl 	%eax, -1512(%rbp)
	leaq	-92(%rbp), %rdx
	movl	-1508(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -1516(%rbp)

	leaq	-236(%rbp), %rdx
	movl	-1512(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -1520(%rbp)

	movl 	-1516(%rbp), %eax
	imull 	-1520(%rbp), %eax
	movl 	%eax, -1524(%rbp)
	movl 	-1484(%rbp), %eax
	movl 	-1524(%rbp), %edx
	addl 	%edx, %eax
	movl 	%eax, -1484(%rbp)
	movl	-1480(%rbp), %eax
	leaq	-1304(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
	movl	-1484(%rbp), %edx
	movl	%edx, (%rax)

	movl	$48, %eax
	movl 	%eax, -1528(%rbp)
	movl	$40, %eax
	movl 	%eax, -1532(%rbp)
	leaq	-92(%rbp), %rdx
	movl	-1528(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -1536(%rbp)

	leaq	-236(%rbp), %rdx
	movl	-1532(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -1540(%rbp)

	movl 	-1536(%rbp), %eax
	imull 	-1540(%rbp), %eax
	movl 	%eax, -1544(%rbp)
	movl 	-1484(%rbp), %eax
	movl 	-1544(%rbp), %edx
	addl 	%edx, %eax
	movl 	%eax, -1484(%rbp)
	movl	-1480(%rbp), %eax
	leaq	-1304(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
	movl	-1484(%rbp), %edx
	movl	%edx, (%rax)

	movl	$32, %eax
	movl 	%eax, -1548(%rbp)
	movl	$0, %eax
	movl 	%eax, -1552(%rbp)
	movl	-1552(%rbp), %eax
	leaq	-1304(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
	movl	-1552(%rbp), %edx
	movl	%edx, (%rax)

	movl	$32, %eax
	movl 	%eax, -1556(%rbp)
	movl	$16, %eax
	movl 	%eax, -1560(%rbp)
	leaq	-92(%rbp), %rdx
	movl	-1556(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -1564(%rbp)

	leaq	-236(%rbp), %rdx
	movl	-1560(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -1568(%rbp)

	movl 	-1564(%rbp), %eax
	imull 	-1568(%rbp), %eax
	movl 	%eax, -1572(%rbp)
	movl 	-1552(%rbp), %eax
	movl 	-1572(%rbp), %edx
	addl 	%edx, %eax
	movl 	%eax, -1552(%rbp)
	movl	-1548(%rbp), %eax
	leaq	-1304(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
	movl	-1552(%rbp), %edx
	movl	%edx, (%rax)

	movl	$40, %eax
	movl 	%eax, -1576(%rbp)
	movl	$32, %eax
	movl 	%eax, -1580(%rbp)
	leaq	-92(%rbp), %rdx
	movl	-1576(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -1584(%rbp)

	leaq	-236(%rbp), %rdx
	movl	-1580(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -1588(%rbp)

	movl 	-1584(%rbp), %eax
	imull 	-1588(%rbp), %eax
	movl 	%eax, -1592(%rbp)
	movl 	-1552(%rbp), %eax
	movl 	-1592(%rbp), %edx
	addl 	%edx, %eax
	movl 	%eax, -1552(%rbp)
	movl	-1548(%rbp), %eax
	leaq	-1304(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
	movl	-1552(%rbp), %edx
	movl	%edx, (%rax)

	movl	$48, %eax
	movl 	%eax, -1596(%rbp)
	movl	$48, %eax
	movl 	%eax, -1600(%rbp)
	leaq	-92(%rbp), %rdx
	movl	-1596(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -1604(%rbp)

	leaq	-236(%rbp), %rdx
	movl	-1600(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -1608(%rbp)

	movl 	-1604(%rbp), %eax
	imull 	-1608(%rbp), %eax
	movl 	%eax, -1612(%rbp)
	movl 	-1552(%rbp), %eax
	movl 	-1612(%rbp), %edx
	addl 	%edx, %eax
	movl 	%eax, -1552(%rbp)
	movl	-1548(%rbp), %eax
	leaq	-1304(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
	movl	-1552(%rbp), %edx
	movl	%edx, (%rax)

	# result, -524 arg2-1304
	movl	$8, %eax
	movl 	%eax, -1676(%rbp)
	leaq	-92(%rbp), %rdx
	movl	-1676(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -1672(%rbp)

	movl	$8, %eax
	movl 	%eax, -1680(%rbp)
	movl	-1680(%rbp), %eax
	leaq	-1616(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
	movl	-1672(%rbp), %edx
	movl	%edx, (%rax)

	movl	$16, %eax
	movl 	%eax, -1688(%rbp)
	leaq	-92(%rbp), %rdx
	movl	-1688(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -1684(%rbp)

	movl	$24, %eax
	movl 	%eax, -1692(%rbp)
	movl	-1692(%rbp), %eax
	leaq	-1616(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
	movl	-1684(%rbp), %edx
	movl	%edx, (%rax)

	movl	$24, %eax
	movl 	%eax, -1700(%rbp)
	leaq	-92(%rbp), %rdx
	movl	-1700(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -1696(%rbp)

	movl	$40, %eax
	movl 	%eax, -1704(%rbp)
	movl	-1704(%rbp), %eax
	leaq	-1616(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
	movl	-1696(%rbp), %edx
	movl	%edx, (%rax)

	movl	$32, %eax
	movl 	%eax, -1712(%rbp)
	leaq	-92(%rbp), %rdx
	movl	-1712(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -1708(%rbp)

	movl	$16, %eax
	movl 	%eax, -1716(%rbp)
	movl	-1716(%rbp), %eax
	leaq	-1616(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
	movl	-1708(%rbp), %edx
	movl	%edx, (%rax)

	movl	$40, %eax
	movl 	%eax, -1724(%rbp)
	leaq	-92(%rbp), %rdx
	movl	-1724(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -1720(%rbp)

	movl	$32, %eax
	movl 	%eax, -1728(%rbp)
	movl	-1728(%rbp), %eax
	leaq	-1616(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
	movl	-1720(%rbp), %edx
	movl	%edx, (%rax)

	movl	$48, %eax
	movl 	%eax, -1736(%rbp)
	leaq	-92(%rbp), %rdx
	movl	-1736(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -1732(%rbp)

	movl	$48, %eax
	movl 	%eax, -1740(%rbp)
	movl	-1740(%rbp), %eax
	leaq	-1616(%rbp), %rdx
	leaq	(%rdx,%rax), %rax
	movl	-1732(%rbp), %edx
	movl	%edx, (%rax)

	# result, -1744 arg1-1616
	# result, -460 arg2-1616
	movq 	$.LC0, -1804(%rbp)
	movl 	-1804(%rbp), %eax
	movq 	-1804(%rbp), %rdi
	call	printStr
	movl	%eax, -1808(%rbp)
	movl	$0, %eax
	movl 	%eax, -1812(%rbp)
	movl	-1812(%rbp), %eax
	movl 	%eax, -700(%rbp)
.L2: 
	movl	$2, %eax
	movl 	%eax, -1820(%rbp)
	movl	-700(%rbp), %eax
	cmpl	-1820(%rbp), %eax
	jl .L4
	jmp .L8
.L3: 
	addl 	$1, -700(%rbp)
	jmp .L2
.L4: 
	movq 	$.LC1, -1828(%rbp)
	movl 	-1828(%rbp), %eax
	movq 	-1828(%rbp), %rdi
	call	printStr
	movl	%eax, -1832(%rbp)
	movl	$0, %eax
	movl 	%eax, -1836(%rbp)
	movl	-1836(%rbp), %eax
	movl 	%eax, -708(%rbp)
.L5: 
	movl	$3, %eax
	movl 	%eax, -1844(%rbp)
	movl	-708(%rbp), %eax
	cmpl	-1844(%rbp), %eax
	jl .L7
	jmp .L3
.L6: 
	addl 	$1, -708(%rbp)
	jmp .L5
.L7: 
	movl	$8, %eax
	movl 	%eax, -1852(%rbp)
	movl 	-700(%rbp), %eax
	imull 	-1852(%rbp), %eax
	movl 	%eax, -1856(%rbp)
	movl	$3, %eax
	movl 	%eax, -1860(%rbp)
	movl	-1856(%rbp), %eax
	movl 	%eax, -1864(%rbp)
	movl 	-1864(%rbp), %eax
	imull 	-1860(%rbp), %eax
	movl 	%eax, -1868(%rbp)
	movl 	-708(%rbp), %eax
	imull 	-1852(%rbp), %eax
	movl 	%eax, -1872(%rbp)
	movl 	-1872(%rbp), %eax
	movl 	-1868(%rbp), %edx
	addl 	%edx, %eax
	movl 	%eax, -1876(%rbp)
	movl 	-1876(%rbp), %eax
	movl 	-1852(%rbp), %edx
	addl 	%edx, %eax
	movl 	%eax, -1880(%rbp)
	leaq	-92(%rbp), %rdx
	movl	-1880(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -1884(%rbp)

	movl	-1884(%rbp), %eax
	movl 	%eax, -716(%rbp)
	movl 	-716(%rbp), %eax
	movq 	-716(%rbp), %rdi
	call	printInt
	movl	%eax, -1896(%rbp)
	movq 	$.LC2, -1900(%rbp)
	movl 	-1900(%rbp), %eax
	movq 	-1900(%rbp), %rdi
	call	printStr
	movl	%eax, -1904(%rbp)
	jmp .L6
	jmp .L3
.L8: 
	movq 	$.LC3, -1908(%rbp)
	movl 	-1908(%rbp), %eax
	movq 	-1908(%rbp), %rdi
	call	printStr
	movl	%eax, -1912(%rbp)
	movq 	$.LC4, -1916(%rbp)
	movl 	-1916(%rbp), %eax
	movq 	-1916(%rbp), %rdi
	call	printStr
	movl	%eax, -1920(%rbp)
	movl	$0, %eax
	movl 	%eax, -1924(%rbp)
	movl	-1924(%rbp), %eax
	movl 	%eax, -700(%rbp)
.L9: 
	movl	$2, %eax
	movl 	%eax, -1932(%rbp)
	movl	-700(%rbp), %eax
	cmpl	-1932(%rbp), %eax
	jl .L11
	jmp .L15
.L10: 
	addl 	$1, -700(%rbp)
	jmp .L9
.L11: 
	movq 	$.LC5, -1940(%rbp)
	movl 	-1940(%rbp), %eax
	movq 	-1940(%rbp), %rdi
	call	printStr
	movl	%eax, -1944(%rbp)
	movl	$0, %eax
	movl 	%eax, -1948(%rbp)
	movl	-1948(%rbp), %eax
	movl 	%eax, -708(%rbp)
.L12: 
	movl	$3, %eax
	movl 	%eax, -1956(%rbp)
	movl	-708(%rbp), %eax
	cmpl	-1956(%rbp), %eax
	jl .L14
	jmp .L10
.L13: 
	addl 	$1, -708(%rbp)
	jmp .L12
.L14: 
	movl	$8, %eax
	movl 	%eax, -1964(%rbp)
	movl 	-700(%rbp), %eax
	imull 	-1964(%rbp), %eax
	movl 	%eax, -1968(%rbp)
	movl	$3, %eax
	movl 	%eax, -1972(%rbp)
	movl	-1968(%rbp), %eax
	movl 	%eax, -1976(%rbp)
	movl 	-1976(%rbp), %eax
	imull 	-1972(%rbp), %eax
	movl 	%eax, -1980(%rbp)
	movl 	-708(%rbp), %eax
	imull 	-1964(%rbp), %eax
	movl 	%eax, -1984(%rbp)
	movl 	-1984(%rbp), %eax
	movl 	-1980(%rbp), %edx
	addl 	%edx, %eax
	movl 	%eax, -1988(%rbp)
	movl 	-1988(%rbp), %eax
	movl 	-1964(%rbp), %edx
	addl 	%edx, %eax
	movl 	%eax, -1992(%rbp)
	leaq	-380(%rbp), %rdx
	movl	-1992(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -1996(%rbp)

	movl	-1996(%rbp), %eax
	movl 	%eax, -716(%rbp)
	movl 	-716(%rbp), %eax
	movq 	-716(%rbp), %rdi
	call	printInt
	movl	%eax, -2004(%rbp)
	movq 	$.LC6, -2008(%rbp)
	movl 	-2008(%rbp), %eax
	movq 	-2008(%rbp), %rdi
	call	printStr
	movl	%eax, -2012(%rbp)
	jmp .L13
	jmp .L10
.L15: 
	movq 	$.LC7, -2016(%rbp)
	movl 	-2016(%rbp), %eax
	movq 	-2016(%rbp), %rdi
	call	printStr
	movl	%eax, -2020(%rbp)
	movq 	$.LC8, -2024(%rbp)
	movl 	-2024(%rbp), %eax
	movq 	-2024(%rbp), %rdi
	call	printStr
	movl	%eax, -2028(%rbp)
	movl	$0, %eax
	movl 	%eax, -2032(%rbp)
	movl	-2032(%rbp), %eax
	movl 	%eax, -700(%rbp)
.L16: 
	movl	$3, %eax
	movl 	%eax, -2040(%rbp)
	movl	-700(%rbp), %eax
	cmpl	-2040(%rbp), %eax
	jl .L18
	jmp .L22
.L17: 
	addl 	$1, -700(%rbp)
	jmp .L16
.L18: 
	movq 	$.LC9, -2048(%rbp)
	movl 	-2048(%rbp), %eax
	movq 	-2048(%rbp), %rdi
	call	printStr
	movl	%eax, -2052(%rbp)
	movl	$0, %eax
	movl 	%eax, -2056(%rbp)
	movl	-2056(%rbp), %eax
	movl 	%eax, -708(%rbp)
.L19: 
	movl	$2, %eax
	movl 	%eax, -2064(%rbp)
	movl	-708(%rbp), %eax
	cmpl	-2064(%rbp), %eax
	jl .L21
	jmp .L17
.L20: 
	addl 	$1, -708(%rbp)
	jmp .L19
.L21: 
	movl	$8, %eax
	movl 	%eax, -2072(%rbp)
	movl 	-700(%rbp), %eax
	imull 	-2072(%rbp), %eax
	movl 	%eax, -2076(%rbp)
	movl	$2, %eax
	movl 	%eax, -2080(%rbp)
	movl	-2076(%rbp), %eax
	movl 	%eax, -2084(%rbp)
	movl 	-2084(%rbp), %eax
	imull 	-2080(%rbp), %eax
	movl 	%eax, -2088(%rbp)
	movl 	-708(%rbp), %eax
	imull 	-2072(%rbp), %eax
	movl 	%eax, -2092(%rbp)
	movl 	-2092(%rbp), %eax
	movl 	-2088(%rbp), %edx
	addl 	%edx, %eax
	movl 	%eax, -2096(%rbp)
	movl 	-2096(%rbp), %eax
	movl 	-2072(%rbp), %edx
	addl 	%edx, %eax
	movl 	%eax, -2100(%rbp)
	leaq	-236(%rbp), %rdx
	movl	-2100(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -2104(%rbp)

	movl	-2104(%rbp), %eax
	movl 	%eax, -716(%rbp)
	movl 	-716(%rbp), %eax
	movq 	-716(%rbp), %rdi
	call	printInt
	movl	%eax, -2112(%rbp)
	movq 	$.LC10, -2116(%rbp)
	movl 	-2116(%rbp), %eax
	movq 	-2116(%rbp), %rdi
	call	printStr
	movl	%eax, -2120(%rbp)
	jmp .L20
	jmp .L17
.L22: 
	movq 	$.LC11, -2124(%rbp)
	movl 	-2124(%rbp), %eax
	movq 	-2124(%rbp), %rdi
	call	printStr
	movl	%eax, -2128(%rbp)
	movq 	$.LC12, -2132(%rbp)
	movl 	-2132(%rbp), %eax
	movq 	-2132(%rbp), %rdi
	call	printStr
	movl	%eax, -2136(%rbp)
	movl	$0, %eax
	movl 	%eax, -2140(%rbp)
	movl	-2140(%rbp), %eax
	movl 	%eax, -700(%rbp)
.L23: 
	movl	$2, %eax
	movl 	%eax, -2148(%rbp)
	movl	-700(%rbp), %eax
	cmpl	-2148(%rbp), %eax
	jl .L25
	jmp .L29
.L24: 
	addl 	$1, -700(%rbp)
	jmp .L23
.L25: 
	movq 	$.LC13, -2156(%rbp)
	movl 	-2156(%rbp), %eax
	movq 	-2156(%rbp), %rdi
	call	printStr
	movl	%eax, -2160(%rbp)
	movl	$0, %eax
	movl 	%eax, -2164(%rbp)
	movl	-2164(%rbp), %eax
	movl 	%eax, -708(%rbp)
.L26: 
	movl	$3, %eax
	movl 	%eax, -2172(%rbp)
	movl	-708(%rbp), %eax
	cmpl	-2172(%rbp), %eax
	jl .L28
	jmp .L24
.L27: 
	addl 	$1, -708(%rbp)
	jmp .L26
.L28: 
	movl	$8, %eax
	movl 	%eax, -2180(%rbp)
	movl 	-700(%rbp), %eax
	imull 	-2180(%rbp), %eax
	movl 	%eax, -2184(%rbp)
	movl	$3, %eax
	movl 	%eax, -2188(%rbp)
	movl	-2184(%rbp), %eax
	movl 	%eax, -2192(%rbp)
	movl 	-2192(%rbp), %eax
	imull 	-2188(%rbp), %eax
	movl 	%eax, -2196(%rbp)
	movl 	-708(%rbp), %eax
	imull 	-2180(%rbp), %eax
	movl 	%eax, -2200(%rbp)
	movl 	-2200(%rbp), %eax
	movl 	-2196(%rbp), %edx
	addl 	%edx, %eax
	movl 	%eax, -2204(%rbp)
	movl 	-2204(%rbp), %eax
	movl 	-2180(%rbp), %edx
	addl 	%edx, %eax
	movl 	%eax, -2208(%rbp)
	leaq	-832(%rbp), %rdx
	movl	-2208(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -2212(%rbp)

	movl	-2212(%rbp), %eax
	movl 	%eax, -716(%rbp)
	movl 	-716(%rbp), %eax
	movq 	-716(%rbp), %rdi
	call	printInt
	movl	%eax, -2220(%rbp)
	movq 	$.LC14, -2224(%rbp)
	movl 	-2224(%rbp), %eax
	movq 	-2224(%rbp), %rdi
	call	printStr
	movl	%eax, -2228(%rbp)
	jmp .L27
	jmp .L24
.L29: 
	movq 	$.LC15, -2232(%rbp)
	movl 	-2232(%rbp), %eax
	movq 	-2232(%rbp), %rdi
	call	printStr
	movl	%eax, -2236(%rbp)
	movq 	$.LC16, -2240(%rbp)
	movl 	-2240(%rbp), %eax
	movq 	-2240(%rbp), %rdi
	call	printStr
	movl	%eax, -2244(%rbp)
	movl	$0, %eax
	movl 	%eax, -2248(%rbp)
	movl	-2248(%rbp), %eax
	movl 	%eax, -700(%rbp)
.L30: 
	movl	$2, %eax
	movl 	%eax, -2256(%rbp)
	movl	-700(%rbp), %eax
	cmpl	-2256(%rbp), %eax
	jl .L32
	jmp .L36
.L31: 
	addl 	$1, -700(%rbp)
	jmp .L30
.L32: 
	movq 	$.LC17, -2264(%rbp)
	movl 	-2264(%rbp), %eax
	movq 	-2264(%rbp), %rdi
	call	printStr
	movl	%eax, -2268(%rbp)
	movl	$0, %eax
	movl 	%eax, -2272(%rbp)
	movl	-2272(%rbp), %eax
	movl 	%eax, -708(%rbp)
.L33: 
	movl	$3, %eax
	movl 	%eax, -2280(%rbp)
	movl	-708(%rbp), %eax
	cmpl	-2280(%rbp), %eax
	jl .L35
	jmp .L31
.L34: 
	addl 	$1, -708(%rbp)
	jmp .L33
.L35: 
	movl	$8, %eax
	movl 	%eax, -2288(%rbp)
	movl 	-700(%rbp), %eax
	imull 	-2288(%rbp), %eax
	movl 	%eax, -2292(%rbp)
	movl	$3, %eax
	movl 	%eax, -2296(%rbp)
	movl	-2292(%rbp), %eax
	movl 	%eax, -2300(%rbp)
	movl 	-2300(%rbp), %eax
	imull 	-2296(%rbp), %eax
	movl 	%eax, -2304(%rbp)
	movl 	-708(%rbp), %eax
	imull 	-2288(%rbp), %eax
	movl 	%eax, -2308(%rbp)
	movl 	-2308(%rbp), %eax
	movl 	-2304(%rbp), %edx
	addl 	%edx, %eax
	movl 	%eax, -2312(%rbp)
	movl 	-2312(%rbp), %eax
	movl 	-2288(%rbp), %edx
	addl 	%edx, %eax
	movl 	%eax, -2316(%rbp)
	leaq	-1096(%rbp), %rdx
	movl	-2316(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -2320(%rbp)

	movl	-2320(%rbp), %eax
	movl 	%eax, -716(%rbp)
	movl 	-716(%rbp), %eax
	movq 	-716(%rbp), %rdi
	call	printInt
	movl	%eax, -2328(%rbp)
	movq 	$.LC18, -2332(%rbp)
	movl 	-2332(%rbp), %eax
	movq 	-2332(%rbp), %rdi
	call	printStr
	movl	%eax, -2336(%rbp)
	jmp .L34
	jmp .L31
.L36: 
	movq 	$.LC19, -2340(%rbp)
	movl 	-2340(%rbp), %eax
	movq 	-2340(%rbp), %rdi
	call	printStr
	movl	%eax, -2344(%rbp)
	movq 	$.LC20, -2348(%rbp)
	movl 	-2348(%rbp), %eax
	movq 	-2348(%rbp), %rdi
	call	printStr
	movl	%eax, -2352(%rbp)
	movl	$0, %eax
	movl 	%eax, -2356(%rbp)
	movl	-2356(%rbp), %eax
	movl 	%eax, -700(%rbp)
.L37: 
	movl	$2, %eax
	movl 	%eax, -2364(%rbp)
	movl	-700(%rbp), %eax
	cmpl	-2364(%rbp), %eax
	jl .L39
	jmp .L43
.L38: 
	addl 	$1, -700(%rbp)
	jmp .L37
.L39: 
	movq 	$.LC21, -2372(%rbp)
	movl 	-2372(%rbp), %eax
	movq 	-2372(%rbp), %rdi
	call	printStr
	movl	%eax, -2376(%rbp)
	movl	$0, %eax
	movl 	%eax, -2380(%rbp)
	movl	-2380(%rbp), %eax
	movl 	%eax, -708(%rbp)
.L40: 
	movl	$2, %eax
	movl 	%eax, -2388(%rbp)
	movl	-708(%rbp), %eax
	cmpl	-2388(%rbp), %eax
	jl .L42
	jmp .L38
.L41: 
	addl 	$1, -708(%rbp)
	jmp .L40
.L42: 
	movl	$8, %eax
	movl 	%eax, -2396(%rbp)
	movl 	-700(%rbp), %eax
	imull 	-2396(%rbp), %eax
	movl 	%eax, -2400(%rbp)
	movl	$2, %eax
	movl 	%eax, -2404(%rbp)
	movl	-2400(%rbp), %eax
	movl 	%eax, -2408(%rbp)
	movl 	-2408(%rbp), %eax
	imull 	-2404(%rbp), %eax
	movl 	%eax, -2412(%rbp)
	movl 	-708(%rbp), %eax
	imull 	-2396(%rbp), %eax
	movl 	%eax, -2416(%rbp)
	movl 	-2416(%rbp), %eax
	movl 	-2412(%rbp), %edx
	addl 	%edx, %eax
	movl 	%eax, -2420(%rbp)
	movl 	-2420(%rbp), %eax
	movl 	-2396(%rbp), %edx
	addl 	%edx, %eax
	movl 	%eax, -2424(%rbp)
	leaq	-1304(%rbp), %rdx
	movl	-2424(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -2428(%rbp)

	movl	-2428(%rbp), %eax
	movl 	%eax, -716(%rbp)
	movl 	-716(%rbp), %eax
	movq 	-716(%rbp), %rdi
	call	printInt
	movl	%eax, -2436(%rbp)
	movq 	$.LC22, -2440(%rbp)
	movl 	-2440(%rbp), %eax
	movq 	-2440(%rbp), %rdi
	call	printStr
	movl	%eax, -2444(%rbp)
	jmp .L41
	jmp .L38
.L43: 
	movq 	$.LC23, -2448(%rbp)
	movl 	-2448(%rbp), %eax
	movq 	-2448(%rbp), %rdi
	call	printStr
	movl	%eax, -2452(%rbp)
	movq 	$.LC24, -2456(%rbp)
	movl 	-2456(%rbp), %eax
	movq 	-2456(%rbp), %rdi
	call	printStr
	movl	%eax, -2460(%rbp)
	movl	$0, %eax
	movl 	%eax, -2464(%rbp)
	movl	-2464(%rbp), %eax
	movl 	%eax, -700(%rbp)
.L44: 
	movl	$3, %eax
	movl 	%eax, -2472(%rbp)
	movl	-700(%rbp), %eax
	cmpl	-2472(%rbp), %eax
	jl .L46
	jmp .L50
.L45: 
	addl 	$1, -700(%rbp)
	jmp .L44
.L46: 
	movq 	$.LC25, -2480(%rbp)
	movl 	-2480(%rbp), %eax
	movq 	-2480(%rbp), %rdi
	call	printStr
	movl	%eax, -2484(%rbp)
	movl	$0, %eax
	movl 	%eax, -2488(%rbp)
	movl	-2488(%rbp), %eax
	movl 	%eax, -708(%rbp)
.L47: 
	movl	$2, %eax
	movl 	%eax, -2496(%rbp)
	movl	-708(%rbp), %eax
	cmpl	-2496(%rbp), %eax
	jl .L49
	jmp .L45
.L48: 
	addl 	$1, -708(%rbp)
	jmp .L47
.L49: 
	movl	$8, %eax
	movl 	%eax, -2504(%rbp)
	movl 	-700(%rbp), %eax
	imull 	-2504(%rbp), %eax
	movl 	%eax, -2508(%rbp)
	movl	$2, %eax
	movl 	%eax, -2512(%rbp)
	movl	-2508(%rbp), %eax
	movl 	%eax, -2516(%rbp)
	movl 	-2516(%rbp), %eax
	imull 	-2512(%rbp), %eax
	movl 	%eax, -2520(%rbp)
	movl 	-708(%rbp), %eax
	imull 	-2504(%rbp), %eax
	movl 	%eax, -2524(%rbp)
	movl 	-2524(%rbp), %eax
	movl 	-2520(%rbp), %edx
	addl 	%edx, %eax
	movl 	%eax, -2528(%rbp)
	movl 	-2528(%rbp), %eax
	movl 	-2504(%rbp), %edx
	addl 	%edx, %eax
	movl 	%eax, -2532(%rbp)
	leaq	-1616(%rbp), %rdx
	movl	-2532(%rbp), %eax
	movl	(%rdx,%rax), %eax
	movl	%eax, -2536(%rbp)

	movl	-2536(%rbp), %eax
	movl 	%eax, -716(%rbp)
	movl 	-716(%rbp), %eax
	movq 	-716(%rbp), %rdi
	call	printInt
	movl	%eax, -2544(%rbp)
	movq 	$.LC26, -2548(%rbp)
	movl 	-2548(%rbp), %eax
	movq 	-2548(%rbp), %rdi
	call	printStr
	movl	%eax, -2552(%rbp)
	jmp .L48
	jmp .L45
.L50: 
	movl	$0, %eax
	movl 	%eax, -2556(%rbp)
	movl	-2556(%rbp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident		"Compiled by 15cs30005"
	.section	.note.GNU-stack,"",@progbits
