	.file	"lab3.cpp"
	.text
	.section	.text$_ZSt12setprecisioni,"x"
	.linkonce discard
	.globl	__ZSt12setprecisioni
	.def	__ZSt12setprecisioni;	.scl	2;	.type	32;	.endef
__ZSt12setprecisioni:
LFB3476:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	8(%ebp), %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE3476:
	.text
	.globl	__Z4sumcx
	.def	__Z4sumcx;	.scl	2;	.type	32;	.endef
__Z4sumcx:
LFB4582:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-8, %esp
	subl	$32, %esp
	movl	8(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	fldz
	fstpt	20(%esp)
	movl	$0, 8(%esp)
	movl	$0, 12(%esp)
	jmp	L4
L7:
	movl	8(%esp), %eax
	movl	12(%esp), %edx
	andl	$1, %eax
	movl	$0, %edx
	movl	%eax, %ecx
	orl	%edx, %ecx
	jne	L5
	fildq	8(%esp)
	fld	%st(0)
	faddp	%st, %st(1)
	fld1
	faddp	%st, %st(1)
	fld1
	fdivp	%st, %st(1)
	fldt	LC2
	fmulp	%st, %st(1)
	fldt	20(%esp)
	faddp	%st, %st(1)
	fstpt	20(%esp)
	jmp	L6
L5:
	fildq	8(%esp)
	fld	%st(0)
	faddp	%st, %st(1)
	fld1
	faddp	%st, %st(1)
	fld1
	fdivp	%st, %st(1)
	fldt	LC2
	fmulp	%st, %st(1)
	fldt	20(%esp)
	fsubp	%st, %st(1)
	fstpt	20(%esp)
L6:
	addl	$1, 8(%esp)
	adcl	$0, 12(%esp)
L4:
	movl	8(%esp), %eax
	movl	12(%esp), %edx
	movl	4(%esp), %ecx
	cmpl	%eax, (%esp)
	sbbl	%edx, %ecx
	jge	L7
	fldt	20(%esp)
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE4582:
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB4583:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$32, %esp
	call	___main
	leal	-20(%ebp), %eax
	movl	%eax, (%esp)
	movl	$__ZSt3cin, %ecx
	call	__ZNSirsERx
	subl	$4, %esp
	movl	-20(%ebp), %eax
	movl	-16(%ebp), %edx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	__Z4sumcx
	fstpt	-12(%ebp)
	movl	$15, (%esp)
	call	__ZSt12setprecisioni
	movl	%eax, 4(%esp)
	movl	$__ZSt4cout, (%esp)
	call	__ZStlsIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_St13_Setprecision
	fldt	-12(%ebp)
	fstpt	(%esp)
	movl	%eax, %ecx
	call	__ZNSolsEe
	subl	$12, %esp
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE4583:
	.section .rdata,"dr"
	.align 16
LC2:
	.long	0
	.long	-2147483648
	.long	16385
	.def	___main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (MinGW-W64 x86_64-ucrt-posix-seh, built by Brecht Sanders, r1) 16.2.0"
	.def	__ZNSirsERx;	.scl	2;	.type	32;	.endef
	.def	__ZStlsIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_St13_Setprecision;	.scl	2;	.type	32;	.endef
	.def	__ZNSolsEe;	.scl	2;	.type	32;	.endef
