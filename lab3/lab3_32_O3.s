	.file	"lab3.cpp"
	.text
	.p2align 4
	.globl	__Z4sumcx
	.def	__Z4sumcx;	.scl	2;	.type	32;	.endef
__Z4sumcx:
LFB4663:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	andl	$-8, %esp
	subl	$16, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	12(%ebp), %edi
	movl	8(%ebp), %esi
	testl	%edi, %edi
	js	L6
	addl	$1, %esi
	fldz
	adcl	$0, %edi
	xorl	%eax, %eax
	xorl	%edx, %edx
	jmp	L5
	.p2align 4,,10
	.p2align 3
L10:
	faddp	%st, %st(1)
L4:
	addl	$1, %eax
	adcl	$0, %edx
	movl	%eax, %ecx
	movl	%edx, %ebx
	xorl	%esi, %ecx
	xorl	%edi, %ebx
	orl	%ebx, %ecx
	je	L1
L5:
	movd	%eax, %xmm0
	movd	%edx, %xmm1
	movl	%eax, %ecx
	xorl	%ebx, %ebx
	punpckldq	%xmm1, %xmm0
	andl	$1, %ecx
	movl	%ebx, 4(%esp)
	movq	%xmm0, 8(%esp)
	fildq	8(%esp)
	movl	%ecx, (%esp)
	movl	(%esp), %ecx
	orl	4(%esp), %ecx
	fld	%st(0)
	faddp	%st, %st(1)
	fld1
	fadd	%st, %st(1)
	fdivp	%st, %st(1)
	flds	LC2
	fmulp	%st, %st(1)
	je	L10
	fsubrp	%st, %st(1)
	jmp	L4
	.p2align 4,,10
	.p2align 3
L6:
	fldz
L1:
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE4663:
	.section	.text.startup,"x"
	.p2align 4
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB4664:
	.cfi_startproc
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-8, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	movl	%esp, %ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x70,0x6
	.cfi_escape 0x10,0x7,0x2,0x75,0x7c
	.cfi_escape 0x10,0x6,0x2,0x75,0x78
	.cfi_escape 0x10,0x3,0x2,0x75,0x74
	subl	$36, %esp
	call	___main
	leal	-24(%ebp), %eax
	movl	$__ZSt3cin, %ecx
	movl	%eax, (%esp)
	call	__ZNSi10_M_extractIxEERSiRT_
	movl	-20(%ebp), %edi
	movl	-24(%ebp), %esi
	subl	$4, %esp
	testl	%edi, %edi
	js	L16
	addl	$1, %esi
	fldz
	adcl	$0, %edi
	xorl	%eax, %eax
	xorl	%edx, %edx
	jmp	L15
	.p2align 4,,10
	.p2align 3
L19:
	faddp	%st, %st(1)
L14:
	addl	$1, %eax
	adcl	$0, %edx
	movl	%eax, %ecx
	movl	%edx, %ebx
	xorl	%esi, %ecx
	xorl	%edi, %ebx
	orl	%ebx, %ecx
	je	L12
L15:
	movd	%eax, %xmm0
	movd	%edx, %xmm1
	movl	%eax, %ecx
	xorl	%ebx, %ebx
	punpckldq	%xmm1, %xmm0
	andl	$1, %ecx
	movl	%ebx, -36(%ebp)
	movq	%xmm0, -32(%ebp)
	fildq	-32(%ebp)
	movl	%ecx, -40(%ebp)
	movl	-40(%ebp), %ecx
	orl	-36(%ebp), %ecx
	fld	%st(0)
	faddp	%st, %st(1)
	fld1
	fadd	%st, %st(1)
	fdivp	%st, %st(1)
	flds	LC2
	fmulp	%st, %st(1)
	je	L19
	fsubrp	%st, %st(1)
	jmp	L14
L16:
	fldz
L12:
	movl	__ZSt4cout, %eax
	movl	$__ZSt4cout, %ecx
	movl	-12(%eax), %eax
	movl	$15, __ZSt4cout+4(%eax)
	fstpt	(%esp)
	call	__ZNSo9_M_insertIeEERSoT_
	xorl	%eax, %eax
	subl	$12, %esp
	leal	-16(%ebp), %esp
	popl	%ecx
	.cfi_restore 1
	.cfi_def_cfa 1, 0
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	leal	-4(%ecx), %esp
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE4664:
	.section .rdata,"dr"
	.align 4
LC2:
	.long	1082130432
	.def	___main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (MinGW-W64 x86_64-ucrt-posix-seh, built by Brecht Sanders, r1) 16.2.0"
	.def	__ZNSi10_M_extractIxEERSiRT_;	.scl	2;	.type	32;	.endef
	.def	__ZNSo9_M_insertIeEERSoT_;	.scl	2;	.type	32;	.endef
