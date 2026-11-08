	.file	"lab3.cpp"
	.text
	.section	.text$_ZSt12setprecisioni,"x"
	.linkonce discard
	.globl	_ZSt12setprecisioni
	.def	_ZSt12setprecisioni;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZSt12setprecisioni
_ZSt12setprecisioni:
.LFB3499:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	16(%rbp), %eax
	popq	%rbp
	ret
	.seh_endproc
	.text
	.globl	_Z4sumcx
	.def	_Z4sumcx;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z4sumcx
_Z4sumcx:
.LFB9955:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	fldz
	fstpt	(%rax)
	movq	$0, -8(%rbp)
	jmp	.L4
.L7:
	movq	-8(%rbp), %rax
	andl	$1, %eax
	testq	%rax, %rax
	jne	.L5
	pxor	%xmm0, %xmm0
	cvtsi2sdq	-8(%rbp), %xmm0
	movapd	%xmm0, %xmm1
	addsd	%xmm0, %xmm1
	movsd	.LC1(%rip), %xmm0
	addsd	%xmm0, %xmm1
	movsd	.LC1(%rip), %xmm0
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -24(%rbp)
	fldl	-24(%rbp)
	fldt	.LC2(%rip)
	fmulp	%st, %st(1)
	movq	16(%rbp), %rax
	fldt	(%rax)
	faddp	%st, %st(1)
	movq	16(%rbp), %rax
	fstpt	(%rax)
	jmp	.L6
.L5:
	movq	16(%rbp), %rax
	fldt	(%rax)
	pxor	%xmm0, %xmm0
	cvtsi2sdq	-8(%rbp), %xmm0
	movapd	%xmm0, %xmm1
	addsd	%xmm0, %xmm1
	movsd	.LC1(%rip), %xmm0
	addsd	%xmm0, %xmm1
	movsd	.LC1(%rip), %xmm0
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -24(%rbp)
	fldl	-24(%rbp)
	fldt	.LC2(%rip)
	fmulp	%st, %st(1)
	fsubrp	%st, %st(1)
	movq	16(%rbp), %rax
	fstpt	(%rax)
.L6:
	addq	$1, -8(%rbp)
	.seh_endproc
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
.LFB9956:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$80, %rsp
	.seh_stackalloc	80
	.seh_endprologue
	call	__main
	leaq	-24(%rbp), %rdx
	movq	.refptr._ZSt3cin(%rip), %rax
	movq	%rax, %rcx
	call	_ZNSirsERx
	movq	-24(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	_Z4sumcx
	fldt	-48(%rbp)
	fstpt	-16(%rbp)
	movl	$15, %ecx
	call	_ZSt12setprecisioni
	movl	%eax, %edx
	movq	.refptr._ZSt4cout(%rip), %rax
	movq	%rax, %rcx
	call	_ZStlsIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_St13_Setprecision
	movq	%rax, %rcx
	fldt	-16(%rbp)
	fstpt	-48(%rbp)
	leaq	-48(%rbp), %rax
	movq	%rax, %rdx
	call	_ZNSolsEe
	movl	$0, %eax
	addq	$80, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC1:
	.long	0
	.long	1072693248
	.align 16
.LC2:
	.long	0
	.long	-2147483648
	.long	16385
	.long	0
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (MinGW-W64 x86_64-ucrt-posix-seh, built by Brecht Sanders, r1) 16.2.0"
	.def	_ZNSirsERx;	.scl	2;	.type	32;	.endef
	.def	_ZStlsIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_St13_Setprecision;	.scl	2;	.type	32;	.endef
	.def	_ZNSolsEe;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr._ZSt4cout, "dr"
	.p2align	3, 0
	.globl	.refptr._ZSt4cout
	.linkonce	discard
.refptr._ZSt4cout:
	.quad	_ZSt4cout
	.section	.rdata$.refptr._ZSt3cin, "dr"
	.p2align	3, 0
	.globl	.refptr._ZSt3cin
	.linkonce	discard
.refptr._ZSt3cin:
	.quad	_ZSt3cin
.L4:
	movq	-8(%rbp), %rax
	cmpq	24(%rbp), %rax
	jle	.L7
	movq	16(%rbp), %rax
	fldt	(%rax)
	movq	16(%rbp), %rax
	fstpt	(%rax)
	movq	16(%rbp), %rax
	addq	$32, %rsp
	popq	%rbp
	ret
