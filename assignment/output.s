	.file	"main.c"
	.text
	.def	scanf;	.scl	3;	.type	32;	.endef
	.seh_proc	scanf
scanf:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	leaq	48(%rsp), %rbp
	.seh_setframe	%rbp, 48
	.seh_endprologue
	movq	%rcx, 32(%rbp)
	movq	%rdx, 40(%rbp)
	movq	%r8, 48(%rbp)
	movq	%r9, 56(%rbp)
	leaq	40(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rbx
	movl	$0, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rbx, %r8
	movq	32(%rbp), %rdx
	movq	%rax, %rcx
	call	__mingw_vfscanf
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.def	printf;	.scl	3;	.type	32;	.endef
	.seh_proc	printf
printf:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	leaq	48(%rsp), %rbp
	.seh_setframe	%rbp, 48
	.seh_endprologue
	movq	%rcx, 32(%rbp)
	movq	%rdx, 40(%rbp)
	movq	%r8, 48(%rbp)
	movq	%r9, 56(%rbp)
	leaq	40(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rbx
	movl	$1, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rbx, %r8
	movq	32(%rbp), %rdx
	movq	%rax, %rcx
	call	__mingw_vfprintf
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "\12Error: Please enter another value of Y.\0"
	.text
	.globl	modulus
	.def	modulus;	.scl	2;	.type	32;	.endef
	.seh_proc	modulus
modulus:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	$0, -4(%rbp)
	cmpl	$0, 24(%rbp)
	jne	.L6
	leaq	.LC0(%rip), %rax
	movq	%rax, %rcx
	call	printf
.L6:
	movl	16(%rbp), %eax
	cltd
	idivl	24(%rbp)
	movl	%edx, -4(%rbp)
	movl	-4(%rbp), %eax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	power
	.def	power;	.scl	2;	.type	32;	.endef
	.seh_proc	power
power:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	%edx, 24(%rbp)
	pxor	%xmm0, %xmm0
	cvtsi2sdl	24(%rbp), %xmm0
	pxor	%xmm2, %xmm2
	cvtsi2sdl	16(%rbp), %xmm2
	movq	%xmm2, %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	pow
	cvttsd2sil	%xmm0, %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	Loop
	.data
	.align 4
Loop:
	.long	1
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC1:
	.ascii "\12Please enter first number : \0"
.LC2:
	.ascii "%d\0"
	.align 8
.LC3:
	.ascii "\12Please enter second number : \0"
.LC4:
	.ascii "\12%d\0"
	.align 8
.LC5:
	.ascii "\12Please enter the operation : \0"
.LC6:
	.ascii "\12%c\0"
.LC7:
	.ascii "%u mod %u = %u \12\0"
.LC8:
	.ascii "\12%u to the power %u = %u \12\0"
.LC9:
	.ascii "cls\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	call	__main
	leaq	.LC1(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	-8(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	scanf
	leaq	.LC3(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	-12(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC4(%rip), %rax
	movq	%rax, %rcx
	call	scanf
	jmp	.L11
.L16:
	leaq	.LC5(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	-13(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC6(%rip), %rax
	movq	%rax, %rcx
	call	scanf
	movzbl	-13(%rbp), %eax
	movsbl	%al, %eax
	cmpl	$113, %eax
	je	.L12
	cmpl	$113, %eax
	jg	.L13
	cmpl	$37, %eax
	je	.L14
	cmpl	$94, %eax
	je	.L15
	jmp	.L13
.L14:
	movl	-12(%rbp), %edx
	movl	-8(%rbp), %eax
	movl	%eax, %ecx
	call	modulus
	movl	%eax, -4(%rbp)
	movl	-12(%rbp), %edx
	movl	-8(%rbp), %eax
	movl	-4(%rbp), %ecx
	movl	%ecx, %r9d
	movl	%edx, %r8d
	movl	%eax, %edx
	leaq	.LC7(%rip), %rax
	movq	%rax, %rcx
	call	printf
	jmp	.L11
.L15:
	movl	-12(%rbp), %edx
	movl	-8(%rbp), %eax
	movl	%eax, %ecx
	call	power
	movl	%eax, -4(%rbp)
	movl	-12(%rbp), %edx
	movl	-8(%rbp), %eax
	movl	-4(%rbp), %ecx
	movl	%ecx, %r9d
	movl	%edx, %r8d
	movl	%eax, %edx
	leaq	.LC8(%rip), %rax
	movq	%rax, %rcx
	call	printf
	jmp	.L11
.L12:
	movl	$0, %ecx
	call	exit
.L13:
	leaq	.LC9(%rip), %rax
	movq	%rax, %rcx
	call	system
.L11:
	movl	Loop(%rip), %eax
	testl	%eax, %eax
	jne	.L16
	movl	$0, %eax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (GNU) 11.2.0"
	.def	__mingw_vfscanf;	.scl	2;	.type	32;	.endef
	.def	__mingw_vfprintf;	.scl	2;	.type	32;	.endef
	.def	pow;	.scl	2;	.type	32;	.endef
	.def	exit;	.scl	2;	.type	32;	.endef
	.def	system;	.scl	2;	.type	32;	.endef
