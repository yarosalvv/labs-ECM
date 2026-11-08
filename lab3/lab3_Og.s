	.file	"lab3.cpp"
	.text
	.globl	_Z4sumcx
	.def	_Z4sumcx;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z4sumcx
_Z4sumcx:
.LFB11720:
	subq	$24, %rsp
	.seh_stackalloc	24
	.seh_endprologue
	movq	%rcx, %rax
	fldz
	fstpt	(%rcx)
	movl	$0, %r8d
	jmp	.L2
.L3:
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%r8, %xmm0
	addsd	%xmm0, %xmm0
	movsd	.LC1(%rip), %xmm1
	addsd	%xmm1, %xmm0
	divsd	%xmm0, %xmm1
	movsd	%xmm1, 8(%rsp)
	flds	.LC2(%rip)
	fmull	8(%rsp)
	fldt	(%rax)
	fsubp	%st, %st(1)
	fstpt	(%rax)
.L4:
	addq	$1, %r8
.L2:
	cmpq	%rdx, %r8
	jg	.L6
	testb	$1, %r8b
	jne	.L3
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%r8, %xmm0
	addsd	%xmm0, %xmm0
	movsd	.LC1(%rip), %xmm1
	addsd	%xmm1, %xmm0
	divsd	%xmm0, %xmm1
	movsd	%xmm1, 8(%rsp)
	flds	.LC2(%rip)
	fmull	8(%rsp)
	fldt	(%rax)
	faddp	%st, %st(1)
	fstpt	(%rax)
	jmp	.L4
.L6:
	addq	$24, %rsp
	ret
	.seh_endproc
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
.LFB11721:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	call	__main
	leaq	56(%rsp), %rdx
	movq	.refptr._ZSt3cin(%rip), %rcx
	call	_ZNSi10_M_extractIxEERSiRT_
	leaq	32(%rsp), %rbx
	movq	56(%rsp), %rdx
	movq	%rbx, %rcx
	call	_Z4sumcx
	fldt	32(%rsp)
	movq	.refptr._ZSt4cout(%rip), %rcx
	movq	(%rcx), %rax
	movq	%rcx, %rdx
	addq	-24(%rax), %rdx
	movq	$15, 8(%rdx)
	fstpt	32(%rsp)
	movq	%rbx, %rdx
	call	_ZNSo9_M_insertIeEERSoT_
	movl	$0, %eax
	addq	$64, %rsp
	popq	%rbx
	ret
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
