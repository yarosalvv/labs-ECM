	.file	"lab3.cpp"
	.text
	.p2align 4
	.globl	_Z4sumcx
	.def	_Z4sumcx;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z4sumcx
_Z4sumcx:
.LFB11720:
	subq	$24, %rsp
	.seh_stackalloc	24
	.seh_endprologue
	movq	%rcx, %rax
	testq	%rdx, %rdx
	js	.L9
	fldz
	addq	$1, %rdx
	flds	.LC2(%rip)
	xorl	%r8d, %r8d
	movsd	.LC1(%rip), %xmm1
	jmp	.L6
	.p2align 6
	.p2align 4,,10
	.p2align 3
.L11:
	addq	$1, %r8
	faddp	%st, %st(2)
	cmpq	%rdx, %r8
	je	.L12
.L6:
	pxor	%xmm0, %xmm0
	fld	%st(0)
	movapd	%xmm1, %xmm2
	cvtsi2sdq	%r8, %xmm0
	addsd	%xmm0, %xmm0
	addsd	%xmm1, %xmm0
	divsd	%xmm0, %xmm2
	movsd	%xmm2, 8(%rsp)
	fmull	8(%rsp)
	testb	$1, %r8b
	je	.L11
	addq	$1, %r8
	fsubrp	%st, %st(2)
	cmpq	%rdx, %r8
	jne	.L6
	fstp	%st(0)
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L12:
	fstp	%st(0)
.L10:
	fstpt	(%rax)
	addq	$24, %rsp
	ret
	.p2align 4,,10
	.p2align 3
.L9:
	movq	$0, (%rcx)
	movl	$0, 8(%rcx)
	addq	$24, %rsp
	ret
	.seh_endproc
	.section	.text.startup,"x"
	.p2align 4
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
.LFB11721:
	subq	$88, %rsp
	.seh_stackalloc	88
	.seh_endprologue
	call	__main
	movq	.refptr._ZSt3cin(%rip), %rcx
	leaq	72(%rsp), %rdx
	call	_ZNSi10_M_extractIxEERSiRT_
	movq	72(%rsp), %rdx
	testq	%rdx, %rdx
	js	.L18
	fldz
	movsd	.LC1(%rip), %xmm1
	addq	$1, %rdx
	xorl	%eax, %eax
	flds	.LC2(%rip)
	jmp	.L17
	.p2align 6
	.p2align 4,,10
	.p2align 3
.L20:
	addq	$1, %rax
	faddp	%st, %st(2)
	cmpq	%rdx, %rax
	je	.L21
.L17:
	pxor	%xmm0, %xmm0
	fld	%st(0)
	movapd	%xmm1, %xmm2
	cvtsi2sdq	%rax, %xmm0
	addsd	%xmm0, %xmm0
	addsd	%xmm1, %xmm0
	divsd	%xmm0, %xmm2
	movsd	%xmm2, 40(%rsp)
	fmull	40(%rsp)
	testb	$1, %al
	je	.L20
	addq	$1, %rax
	fsubrp	%st, %st(2)
	cmpq	%rdx, %rax
	jne	.L17
	fstp	%st(0)
	jmp	.L14
.L21:
	fstp	%st(0)
.L14:
	movq	.refptr._ZSt4cout(%rip), %rcx
	leaq	48(%rsp), %rdx
	movq	(%rcx), %rax
	movq	-24(%rax), %rax
	movq	$15, 8(%rax,%rcx)
	fstpt	48(%rsp)
	call	_ZNSo9_M_insertIeEERSoT_
	xorl	%eax, %eax
	addq	$88, %rsp
	ret
.L18:
	fldz
	jmp	.L14
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC1:
	.long	0
	.long	1072693248
	.align 4
.LC2:
	.long	1082130432
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (MinGW-W64 x86_64-ucrt-posix-seh, built by Brecht Sanders, r1) 16.2.0"
	.def	_ZNSi10_M_extractIxEERSiRT_;	.scl	2;	.type	32;	.endef
	.def	_ZNSo9_M_insertIeEERSoT_;	.scl	2;	.type	32;	.endef
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
