	.file	"split.c"
	.section	.text.l_LoopStudy_step,"ax",@progbits
	.hidden	l_LoopStudy_step                # -- Begin function l_LoopStudy_step
	.globl	l_LoopStudy_step
	.p2align	4
	.type	l_LoopStudy_step,@function
l_LoopStudy_step:                       # @l_LoopStudy_step
	.cfi_startproc
# %bb.0:
	movabsq	$-7046029254386353131, %rax     # imm = 0x9E3779B97F4A7C15
	addq	%rdi, %rax
	xorq	%rsi, %rax
	movabsq	$-4658895280553007687, %rcx     # imm = 0xBF58476D1CE4E5B9
	imulq	%rax, %rcx
	movq	%rcx, %rax
	shrq	$29, %rax
	xorq	%rcx, %rax
	movabsq	$-7723592293110705685, %rcx     # imm = 0x94D049BB133111EB
	imulq	%rax, %rcx
	movq	%rcx, %rax
	shrq	$31, %rax
	xorq	%rcx, %rax
	retq
.Lfunc_end0:
	.size	l_LoopStudy_step, .Lfunc_end0-l_LoopStudy_step
	.cfi_endproc
                                        # -- End function
	.section	.text.l_LoopStudy_step___boxed,"ax",@progbits
	.hidden	l_LoopStudy_step___boxed        # -- Begin function l_LoopStudy_step___boxed
	.globl	l_LoopStudy_step___boxed
	.p2align	4
	.type	l_LoopStudy_step___boxed,@function
l_LoopStudy_step___boxed:               # @l_LoopStudy_step___boxed
	.cfi_startproc
# %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	8(%rdi), %rbx
	movl	(%rdi), %eax
	cmpl	$2, %eax
	jl	.LBB1_2
# %bb.1:
	decl	%eax
	movl	%eax, (%rdi)
.LBB1_4:
	movq	8(%rsi), %r14
	movl	(%rsi), %eax
	cmpl	$2, %eax
	jl	.LBB1_6
# %bb.5:
	decl	%eax
	movl	%eax, (%rsi)
.LBB1_8:
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB1_10
# %bb.9:
	movabsq	$-7046029254386353131, %rcx     # imm = 0x9E3779B97F4A7C15
	addq	%rcx, %rbx
	xorq	%rbx, %r14
	movabsq	$-4658895280553007687, %rcx     # imm = 0xBF58476D1CE4E5B9
	imulq	%r14, %rcx
	movq	%rcx, %rdx
	shrq	$29, %rdx
	xorq	%rcx, %rdx
	movabsq	$-7723592293110705685, %rcx     # imm = 0x94D049BB133111EB
	imulq	%rdx, %rcx
	movq	%rcx, %rdx
	shrq	$31, %rdx
	xorq	%rcx, %rdx
	movabsq	$68719476737, %rcx              # imm = 0x1000000001
	movq	%rcx, (%rax)
	movq	%rdx, 8(%rax)
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.LBB1_2:
	.cfi_def_cfa_offset 32
	testl	%eax, %eax
	je	.LBB1_4
# %bb.3:
	movq	%rsi, %r14
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rsi
	jmp	.LBB1_4
.LBB1_6:
	testl	%eax, %eax
	je	.LBB1_8
# %bb.7:
	movq	%rsi, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB1_8
.LBB1_10:
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end1:
	.size	l_LoopStudy_step___boxed, .Lfunc_end1-l_LoopStudy_step___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.lean_box_uint64,"ax",@progbits
	.p2align	4                               # -- Begin function lean_box_uint64
	.type	lean_box_uint64,@function
lean_box_uint64:                        # @lean_box_uint64
	.cfi_startproc
# %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB2_2
# %bb.1:
	movabsq	$68719476737, %rcx              # imm = 0x1000000001
	movq	%rcx, (%rax)
	movq	%rbx, 8(%rax)
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.LBB2_2:
	.cfi_def_cfa_offset 16
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end2:
	.size	lean_box_uint64, .Lfunc_end2-lean_box_uint64
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___splitProd,"ax",@progbits
	.hidden	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___splitProd # -- Begin function l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___splitProd
	.globl	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___splitProd
	.p2align	4
	.type	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___splitProd,@function
l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___splitProd: # @l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___splitProd
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdx, %rbx
	movq	%rsi, %r14
	cmpq	%rsi, %rdi
	jbe	.LBB3_5
# %bb.1:
	movabsq	$-4658895280553007687, %rax     # imm = 0xBF58476D1CE4E5B9
	movabsq	$-7046029254386353131, %rcx     # imm = 0x9E3779B97F4A7C15
	movabsq	$-7723592293110705685, %rdx     # imm = 0x94D049BB133111EB
	movl	%edi, %r8d
	subl	%r14d, %r8d
	leaq	1(%r14), %rsi
	testb	$1, %r8b
	je	.LBB3_3
# %bb.2:
	addq	%rcx, %r14
	xorq	%rbx, %r14
	imulq	%rax, %r14
	movq	%r14, %r8
	shrq	$29, %r8
	xorq	%r14, %r8
	imulq	%rdx, %r8
	movq	%r8, %rbx
	shrq	$31, %rbx
	xorq	%r8, %rbx
	movq	%rsi, %r14
.LBB3_3:
	cmpq	%rsi, %rdi
	je	.LBB3_4
# %bb.9:
	movq	%rdi, %rsi
	subq	%r14, %rsi
	addq	%r14, %rcx
	.p2align	4
.LBB3_10:                               # =>This Inner Loop Header: Depth=1
	xorq	%rcx, %rbx
	imulq	%rax, %rbx
	movq	%rbx, %r8
	shrq	$29, %r8
	xorq	%rbx, %r8
	imulq	%rdx, %r8
	leaq	1(%rcx), %r9
	xorq	%r8, %r9
	shrq	$31, %r8
	xorq	%r9, %r8
	imulq	%rax, %r8
	movq	%r8, %r9
	shrq	$29, %r9
	xorq	%r8, %r9
	imulq	%rdx, %r9
	movq	%r9, %rbx
	shrq	$31, %rbx
	xorq	%r9, %rbx
	addq	$2, %rcx
	addq	$-2, %rsi
	jne	.LBB3_10
.LBB3_4:
	movq	%rdi, %r14
.LBB3_5:
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB3_11
# %bb.6:
	movq	%rax, %r15
	movabsq	$68719476737, %r12              # imm = 0x1000000001
	movq	%r12, (%rax)
	movq	%r14, 8(%rax)
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB3_11
# %bb.7:
	movq	%rax, %r14
	movq	%r12, (%rax)
	movq	%rbx, 8(%rax)
	callq	lean_inc_heartbeat@PLT
	movl	$24, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB3_11
# %bb.8:
	movabsq	$563053032636417, %rcx          # imm = 0x2001800000001
	movq	%rcx, (%rax)
	movq	%r15, 8(%rax)
	movq	%r14, 16(%rax)
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.LBB3_11:
	.cfi_def_cfa_offset 48
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end3:
	.size	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___splitProd, .Lfunc_end3-l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___splitProd
	.cfi_endproc
                                        # -- End function
	.section	.text.lean_alloc_ctor,"ax",@progbits
	.p2align	4                               # -- Begin function lean_alloc_ctor
	.type	lean_alloc_ctor,@function
lean_alloc_ctor:                        # @lean_alloc_ctor
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
                                        # kill: def $edx killed $edx def $rdx
	movl	%esi, %ebx
	movl	%edi, %ebp
	leal	(%rdx,%rbx,8), %r15d
	addl	$8, %r15d
	movl	%r15d, %eax
	andl	$120, %eax
	xorl	%ecx, %ecx
	testb	$7, %r15b
	setne	%cl
	leaq	(%rax,%rcx,8), %r14
	callq	lean_inc_heartbeat@PLT
	movq	%r14, %rdi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB4_4
# %bb.1:
	movzwl	6(%rax), %ecx
	shll	$16, %ecx
	orl	%r14d, %ecx
	movl	%ecx, 4(%rax)
	cmpl	%r14d, %r15d
	jae	.LBB4_3
# %bb.2:
	movq	$0, -8(%rax,%r14)
	movzwl	4(%rax), %ecx
.LBB4_3:
	movl	$1, (%rax)
	shll	$24, %ebp
	movzwl	%cx, %ecx
	orl	%ebp, %ecx
	shll	$16, %ebx
	orl	%ecx, %ebx
	movl	%ebx, 4(%rax)
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB4_4:
	.cfi_def_cfa_offset 48
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end4:
	.size	lean_alloc_ctor, .Lfunc_end4-lean_alloc_ctor
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___splitProd___boxed,"ax",@progbits
	.hidden	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___splitProd___boxed # -- Begin function l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___splitProd___boxed
	.globl	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___splitProd___boxed
	.p2align	4
	.type	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___splitProd___boxed,@function
l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___splitProd___boxed: # @l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___splitProd___boxed
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rsi, %rbx
	movq	%rdi, %rax
	movq	8(%rdi), %rdi
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB5_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB5_4:
	movq	8(%rbx), %rsi
	movl	(%rbx), %eax
	cmpl	$2, %eax
	jl	.LBB5_6
# %bb.5:
	decl	%eax
	movl	%eax, (%rbx)
.LBB5_8:
	movq	8(%rdx), %rbx
	movl	(%rdx), %eax
	cmpl	$2, %eax
	jl	.LBB5_10
# %bb.9:
	decl	%eax
	movl	%eax, (%rdx)
.LBB5_12:
	movq	%rbx, %rdx
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___splitProd # TAILCALL
.LBB5_2:
	.cfi_def_cfa_offset 32
	testl	%ecx, %ecx
	je	.LBB5_4
# %bb.3:
	movq	%rdi, %r14
	movq	%rax, %rdi
	movq	%rdx, %r15
	callq	lean_dec_ref_cold@PLT
	movq	%r15, %rdx
	movq	%r14, %rdi
	jmp	.LBB5_4
.LBB5_6:
	testl	%eax, %eax
	je	.LBB5_8
# %bb.7:
	movq	%rdi, %r14
	movq	%rbx, %rdi
	movq	%rdx, %rbx
	movq	%rsi, %r15
	callq	lean_dec_ref_cold@PLT
	movq	%r15, %rsi
	movq	%rbx, %rdx
	movq	%r14, %rdi
	jmp	.LBB5_8
.LBB5_10:
	testl	%eax, %eax
	je	.LBB5_12
# %bb.11:
	movq	%rdi, %r14
	movq	%rdx, %rdi
	movq	%rsi, %r15
	callq	lean_dec_ref_cold@PLT
	movq	%r15, %rsi
	movq	%r14, %rdi
	jmp	.LBB5_12
.Lfunc_end5:
	.size	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___splitProd___boxed, .Lfunc_end5-l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___splitProd___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l_LoopStudy_idWhile,"ax",@progbits
	.hidden	l_LoopStudy_idWhile             # -- Begin function l_LoopStudy_idWhile
	.globl	l_LoopStudy_idWhile
	.p2align	4
	.type	l_LoopStudy_idWhile,@function
l_LoopStudy_idWhile:                    # @l_LoopStudy_idWhile
	.cfi_startproc
# %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rsi, %rdx
	xorl	%esi, %esi
	callq	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___splitProd
	movq	16(%rax), %rbx
	testb	$1, %bl
	jne	.LBB6_5
# %bb.1:
	movl	(%rbx), %ecx
	testl	%ecx, %ecx
	jle	.LBB6_3
# %bb.2:
	incl	%ecx
	movl	%ecx, (%rbx)
.LBB6_5:
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB6_7
# %bb.6:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB6_9:
	movq	8(%rbx), %rax
	testb	$1, %bl
	jne	.LBB6_14
# %bb.10:
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB6_12
# %bb.11:
	decl	%ecx
	movl	%ecx, (%rbx)
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.LBB6_7:
	.cfi_def_cfa_offset 16
	testl	%ecx, %ecx
	je	.LBB6_9
# %bb.8:
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB6_9
.LBB6_3:
	cmpl	$-1879048191, %ecx              # imm = 0x90000001
	jb	.LBB6_5
# %bb.4:
	lock		decl	(%rbx)
	jmp	.LBB6_5
.LBB6_12:
	testl	%ecx, %ecx
	je	.LBB6_14
# %bb.13:
	movq	%rbx, %rdi
	movq	%rax, %rbx
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rax
.LBB6_14:
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end6:
	.size	l_LoopStudy_idWhile, .Lfunc_end6-l_LoopStudy_idWhile
	.cfi_endproc
                                        # -- End function
	.section	.text.l_LoopStudy_idWhile___boxed,"ax",@progbits
	.hidden	l_LoopStudy_idWhile___boxed     # -- Begin function l_LoopStudy_idWhile___boxed
	.globl	l_LoopStudy_idWhile___boxed
	.p2align	4
	.type	l_LoopStudy_idWhile___boxed,@function
l_LoopStudy_idWhile___boxed:            # @l_LoopStudy_idWhile___boxed
	.cfi_startproc
# %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdi, %rax
	movq	8(%rdi), %rdi
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB7_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB7_4:
	movq	8(%rsi), %rdx
	movl	(%rsi), %eax
	cmpl	$2, %eax
	jl	.LBB7_6
# %bb.5:
	decl	%eax
	movl	%eax, (%rsi)
.LBB7_8:
	xorl	%esi, %esi
	callq	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___splitProd
	movq	16(%rax), %rbx
	testb	$1, %bl
	jne	.LBB7_13
# %bb.9:
	movl	(%rbx), %ecx
	testl	%ecx, %ecx
	jle	.LBB7_11
# %bb.10:
	incl	%ecx
	movl	%ecx, (%rbx)
.LBB7_13:
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB7_15
# %bb.14:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB7_17:
	movq	8(%rbx), %r14
	testb	$1, %bl
	jne	.LBB7_22
# %bb.18:
	movl	(%rbx), %eax
	cmpl	$2, %eax
	jl	.LBB7_20
# %bb.19:
	decl	%eax
	movl	%eax, (%rbx)
.LBB7_22:
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB7_24
# %bb.23:
	movabsq	$68719476737, %rcx              # imm = 0x1000000001
	movq	%rcx, (%rax)
	movq	%r14, 8(%rax)
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.LBB7_2:
	.cfi_def_cfa_offset 32
	testl	%ecx, %ecx
	je	.LBB7_4
# %bb.3:
	movq	%rdi, %rbx
	movq	%rax, %rdi
	movq	%rsi, %r14
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rsi
	movq	%rbx, %rdi
	jmp	.LBB7_4
.LBB7_6:
	testl	%eax, %eax
	je	.LBB7_8
# %bb.7:
	movq	%rdi, %rbx
	movq	%rsi, %rdi
	movq	%rdx, %r14
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rdx
	movq	%rbx, %rdi
	jmp	.LBB7_8
.LBB7_15:
	testl	%ecx, %ecx
	je	.LBB7_17
# %bb.16:
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB7_17
.LBB7_11:
	cmpl	$-1879048191, %ecx              # imm = 0x90000001
	jb	.LBB7_13
# %bb.12:
	lock		decl	(%rbx)
	jmp	.LBB7_13
.LBB7_20:
	testl	%eax, %eax
	je	.LBB7_22
# %bb.21:
	movq	%rbx, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB7_22
.LBB7_24:
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end7:
	.size	l_LoopStudy_idWhile___boxed, .Lfunc_end7-l_LoopStudy_idWhile___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg,"ax",@progbits
	.hidden	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg # -- Begin function l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg
	.globl	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg
	.p2align	4
	.type	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg,@function
l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg: # @l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg
	.cfi_startproc
# %bb.0:
	movq	8(%rsi), %rax
	movq	16(%rsi), %rcx
	movq	8(%rax), %rsi
	movq	8(%rcx), %rdx
	jmp	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___splitProd # TAILCALL
.Lfunc_end8:
	.size	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg, .Lfunc_end8-l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___boxed,"ax",@progbits
	.hidden	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___boxed # -- Begin function l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___boxed
	.globl	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___boxed
	.p2align	4
	.type	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___boxed,@function
l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___boxed: # @l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___boxed
	.cfi_startproc
# %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rsi, %rbx
	movq	%rdi, %rax
	movq	8(%rdi), %rdi
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB9_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB9_4:
	movq	8(%rbx), %rax
	movq	16(%rbx), %rcx
	movq	8(%rax), %rsi
	movq	8(%rcx), %rdx
	callq	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___splitProd
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB9_6
# %bb.5:
	decl	%ecx
	movl	%ecx, (%rbx)
.LBB9_8:
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.LBB9_2:
	.cfi_def_cfa_offset 32
	testl	%ecx, %ecx
	je	.LBB9_4
# %bb.3:
	movq	%rdi, %r14
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rdi
	jmp	.LBB9_4
.LBB9_6:
	testl	%ecx, %ecx
	je	.LBB9_8
# %bb.7:
	movq	%rbx, %rdi
	movq	%rax, %rbx
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rax
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end9:
	.size	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___boxed, .Lfunc_end9-l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0,"ax",@progbits
	.hidden	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0 # -- Begin function l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0
	.globl	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0
	.p2align	4
	.type	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0,@function
l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0: # @l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0
	.cfi_startproc
# %bb.0:
	movq	8(%rdx), %rax
	movq	16(%rdx), %rcx
	movq	8(%rax), %rsi
	movq	8(%rcx), %rdx
	jmp	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___splitProd # TAILCALL
.Lfunc_end10:
	.size	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0, .Lfunc_end10-l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___boxed,"ax",@progbits
	.hidden	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___boxed # -- Begin function l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___boxed
	.globl	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___boxed
	.p2align	4
	.type	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___boxed,@function
l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___boxed: # @l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___boxed
	.cfi_startproc
# %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdx, %rbx
	movq	%rdi, %rax
	movq	8(%rdi), %rdi
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB11_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB11_4:
	movq	8(%rbx), %rax
	movq	16(%rbx), %rcx
	movq	8(%rax), %rsi
	movq	8(%rcx), %rdx
	callq	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___splitProd
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB11_6
# %bb.5:
	decl	%ecx
	movl	%ecx, (%rbx)
.LBB11_8:
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.LBB11_2:
	.cfi_def_cfa_offset 32
	testl	%ecx, %ecx
	je	.LBB11_4
# %bb.3:
	movq	%rdi, %r14
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rdi
	jmp	.LBB11_4
.LBB11_6:
	testl	%ecx, %ecx
	je	.LBB11_8
# %bb.7:
	movq	%rbx, %rdi
	movq	%rax, %rbx
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rax
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end11:
	.size	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___boxed, .Lfunc_end11-l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg___splitProd,"ax",@progbits
	.hidden	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg___splitProd # -- Begin function l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg___splitProd
	.globl	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg___splitProd
	.p2align	4
	.type	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg___splitProd,@function
l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg___splitProd: # @l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg___splitProd
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdx, %rbx
	movq	%rsi, %r14
	cmpq	%rsi, %rdi
	jbe	.LBB12_5
# %bb.1:
	movabsq	$-4658895280553007687, %rax     # imm = 0xBF58476D1CE4E5B9
	movabsq	$-7046029254386353131, %rcx     # imm = 0x9E3779B97F4A7C15
	movabsq	$-7723592293110705685, %rdx     # imm = 0x94D049BB133111EB
	movl	%edi, %r8d
	subl	%r14d, %r8d
	leaq	1(%r14), %rsi
	testb	$1, %r8b
	je	.LBB12_3
# %bb.2:
	addq	%rcx, %r14
	xorq	%rbx, %r14
	imulq	%rax, %r14
	movq	%r14, %r8
	shrq	$29, %r8
	xorq	%r14, %r8
	imulq	%rdx, %r8
	movq	%r8, %rbx
	shrq	$31, %rbx
	xorq	%r8, %rbx
	movq	%rsi, %r14
.LBB12_3:
	cmpq	%rsi, %rdi
	je	.LBB12_4
# %bb.10:
	movq	%rdi, %rsi
	subq	%r14, %rsi
	addq	%r14, %rcx
	.p2align	4
.LBB12_11:                              # =>This Inner Loop Header: Depth=1
	xorq	%rcx, %rbx
	imulq	%rax, %rbx
	movq	%rbx, %r8
	shrq	$29, %r8
	xorq	%rbx, %r8
	imulq	%rdx, %r8
	leaq	1(%rcx), %r9
	xorq	%r8, %r9
	shrq	$31, %r8
	xorq	%r9, %r8
	imulq	%rax, %r8
	movq	%r8, %r9
	shrq	$29, %r9
	xorq	%r8, %r9
	imulq	%rdx, %r9
	movq	%r9, %rbx
	shrq	$31, %rbx
	xorq	%r9, %rbx
	addq	$2, %rcx
	addq	$-2, %rsi
	jne	.LBB12_11
.LBB12_4:
	movq	%rdi, %r14
.LBB12_5:
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB12_12
# %bb.6:
	movq	%rax, %r15
	movabsq	$68719476737, %r12              # imm = 0x1000000001
	movq	%r12, (%rax)
	movq	%r14, 8(%rax)
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB12_12
# %bb.7:
	movq	%rax, %r14
	movq	%r12, (%rax)
	movq	%rbx, 8(%rax)
	callq	lean_inc_heartbeat@PLT
	movl	$24, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB12_12
# %bb.8:
	movq	%rax, %rbx
	movabsq	$563053032636417, %rax          # imm = 0x2001800000001
	movq	%rax, (%rbx)
	movq	%r15, 8(%rbx)
	movq	%r14, 16(%rbx)
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB12_12
# %bb.9:
	movabsq	$281543696187393, %rcx          # imm = 0x1001000000001
	movq	%rcx, (%rax)
	movq	%rbx, 8(%rax)
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.LBB12_12:
	.cfi_def_cfa_offset 48
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end12:
	.size	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg___splitProd, .Lfunc_end12-l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg___splitProd
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg___splitProd___boxed,"ax",@progbits
	.hidden	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg___splitProd___boxed # -- Begin function l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg___splitProd___boxed
	.globl	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg___splitProd___boxed
	.p2align	4
	.type	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg___splitProd___boxed,@function
l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg___splitProd___boxed: # @l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg___splitProd___boxed
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rsi, %rbx
	movq	%rdi, %rax
	movq	8(%rdi), %rdi
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB13_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB13_4:
	movq	8(%rbx), %rsi
	movl	(%rbx), %eax
	cmpl	$2, %eax
	jl	.LBB13_6
# %bb.5:
	decl	%eax
	movl	%eax, (%rbx)
.LBB13_8:
	movq	8(%rdx), %rbx
	movl	(%rdx), %eax
	cmpl	$2, %eax
	jl	.LBB13_10
# %bb.9:
	decl	%eax
	movl	%eax, (%rdx)
.LBB13_12:
	movq	%rbx, %rdx
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg___splitProd # TAILCALL
.LBB13_2:
	.cfi_def_cfa_offset 32
	testl	%ecx, %ecx
	je	.LBB13_4
# %bb.3:
	movq	%rdi, %r14
	movq	%rax, %rdi
	movq	%rdx, %r15
	callq	lean_dec_ref_cold@PLT
	movq	%r15, %rdx
	movq	%r14, %rdi
	jmp	.LBB13_4
.LBB13_6:
	testl	%eax, %eax
	je	.LBB13_8
# %bb.7:
	movq	%rdi, %r14
	movq	%rbx, %rdi
	movq	%rdx, %rbx
	movq	%rsi, %r15
	callq	lean_dec_ref_cold@PLT
	movq	%r15, %rsi
	movq	%rbx, %rdx
	movq	%r14, %rdi
	jmp	.LBB13_8
.LBB13_10:
	testl	%eax, %eax
	je	.LBB13_12
# %bb.11:
	movq	%rdi, %r14
	movq	%rdx, %rdi
	movq	%rsi, %r15
	callq	lean_dec_ref_cold@PLT
	movq	%r15, %rsi
	movq	%r14, %rdi
	jmp	.LBB13_12
.Lfunc_end13:
	.size	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg___splitProd___boxed, .Lfunc_end13-l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg___splitProd___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l_LoopStudy_ioWhile,"ax",@progbits
	.hidden	l_LoopStudy_ioWhile             # -- Begin function l_LoopStudy_ioWhile
	.globl	l_LoopStudy_ioWhile
	.p2align	4
	.type	l_LoopStudy_ioWhile,@function
l_LoopStudy_ioWhile:                    # @l_LoopStudy_ioWhile
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %rbp, -16
	movq	%rsi, %rdx
	xorl	%esi, %esi
	callq	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg___splitProd
	testb	$1, %al
	jne	.LBB14_1
# %bb.2:
	movzbl	7(%rax), %ecx
	movq	8(%rax), %rbx
	movl	(%rax), %ebp
	testl	%ecx, %ecx
	je	.LBB14_4
.LBB14_29:
	cmpl	$1, %ebp
	je	.LBB14_44
# %bb.30:
	testb	$1, %bl
	jne	.LBB14_35
# %bb.31:
	movl	(%rbx), %ecx
	testl	%ecx, %ecx
	jle	.LBB14_33
# %bb.32:
	incl	%ecx
	movl	%ecx, (%rbx)
.LBB14_35:
	testb	$1, %al
	jne	.LBB14_40
# %bb.36:
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB14_38
# %bb.37:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB14_40:
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB14_45
# %bb.41:
	movl	$16842768, %ecx                 # imm = 0x1010010
	movq	%rbx, %r14
	jmp	.LBB14_42
.LBB14_1:
	movq	%rax, %rcx
	shrq	%rcx
	movq	8(%rax), %rbx
	movl	(%rax), %ebp
	testl	%ecx, %ecx
	jne	.LBB14_29
.LBB14_4:
	cmpl	$1, %ebp
	je	.LBB14_16
# %bb.5:
	testb	$1, %bl
	jne	.LBB14_10
# %bb.6:
	movl	(%rbx), %ecx
	testl	%ecx, %ecx
	jle	.LBB14_8
# %bb.7:
	incl	%ecx
	movl	%ecx, (%rbx)
.LBB14_10:
	testb	$1, %al
	jne	.LBB14_15
# %bb.11:
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB14_13
# %bb.12:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB14_15:
	movl	$1, %eax
.LBB14_16:
	movq	16(%rbx), %r14
	testb	$1, %r14b
	jne	.LBB14_21
# %bb.17:
	movl	(%r14), %ecx
	testl	%ecx, %ecx
	jle	.LBB14_19
# %bb.18:
	incl	%ecx
	movl	%ecx, (%r14)
.LBB14_21:
	testb	$1, %bl
	jne	.LBB14_26
# %bb.22:
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB14_24
# %bb.23:
	decl	%ecx
	movl	%ecx, (%rbx)
.LBB14_26:
	cmpl	$1, %ebp
	je	.LBB14_43
# %bb.27:
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB14_45
# %bb.28:
	movl	$65552, %ecx                    # imm = 0x10010
.LBB14_42:
	movl	$1, (%rax)
	movl	%ecx, 4(%rax)
.LBB14_43:
	movq	%r14, 8(%rax)
.LBB14_44:
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB14_19:
	.cfi_def_cfa_offset 32
	cmpl	$-1879048191, %ecx              # imm = 0x90000001
	jb	.LBB14_21
# %bb.20:
	lock		decl	(%r14)
	jmp	.LBB14_21
.LBB14_24:
	testl	%ecx, %ecx
	je	.LBB14_26
# %bb.25:
	movq	%rbx, %rdi
	movq	%rax, %rbx
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rax
	jmp	.LBB14_26
.LBB14_33:
	cmpl	$-1879048191, %ecx              # imm = 0x90000001
	jb	.LBB14_35
# %bb.34:
	lock		decl	(%rbx)
	jmp	.LBB14_35
.LBB14_38:
	testl	%ecx, %ecx
	je	.LBB14_40
# %bb.39:
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB14_40
.LBB14_8:
	cmpl	$-1879048191, %ecx              # imm = 0x90000001
	jb	.LBB14_10
# %bb.9:
	lock		decl	(%rbx)
	jmp	.LBB14_10
.LBB14_13:
	testl	%ecx, %ecx
	je	.LBB14_15
# %bb.14:
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB14_15
.LBB14_45:
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end14:
	.size	l_LoopStudy_ioWhile, .Lfunc_end14-l_LoopStudy_ioWhile
	.cfi_endproc
                                        # -- End function
	.section	.text.l_LoopStudy_ioWhile___boxed,"ax",@progbits
	.hidden	l_LoopStudy_ioWhile___boxed     # -- Begin function l_LoopStudy_ioWhile___boxed
	.globl	l_LoopStudy_ioWhile___boxed
	.p2align	4
	.type	l_LoopStudy_ioWhile___boxed,@function
l_LoopStudy_ioWhile___boxed:            # @l_LoopStudy_ioWhile___boxed
	.cfi_startproc
# %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdi, %rax
	movq	8(%rdi), %rdi
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB15_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB15_4:
	movq	8(%rsi), %rbx
	movl	(%rsi), %eax
	cmpl	$2, %eax
	jl	.LBB15_6
# %bb.5:
	decl	%eax
	movl	%eax, (%rsi)
.LBB15_8:
	movq	%rbx, %rsi
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	jmp	l_LoopStudy_ioWhile             # TAILCALL
.LBB15_2:
	.cfi_def_cfa_offset 32
	testl	%ecx, %ecx
	je	.LBB15_4
# %bb.3:
	movq	%rdi, %rbx
	movq	%rax, %rdi
	movq	%rsi, %r14
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rsi
	movq	%rbx, %rdi
	jmp	.LBB15_4
.LBB15_6:
	testl	%eax, %eax
	je	.LBB15_8
# %bb.7:
	movq	%rdi, %r14
	movq	%rsi, %rdi
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rdi
	jmp	.LBB15_8
.Lfunc_end15:
	.size	l_LoopStudy_ioWhile___boxed, .Lfunc_end15-l_LoopStudy_ioWhile___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg,"ax",@progbits
	.hidden	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg # -- Begin function l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg
	.globl	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg
	.p2align	4
	.type	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg,@function
l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg: # @l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg
	.cfi_startproc
# %bb.0:
	movq	8(%rsi), %rax
	movq	16(%rsi), %rcx
	movq	8(%rax), %rsi
	movq	8(%rcx), %rdx
	jmp	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg___splitProd # TAILCALL
.Lfunc_end16:
	.size	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg, .Lfunc_end16-l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg___boxed,"ax",@progbits
	.hidden	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg___boxed # -- Begin function l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg___boxed
	.globl	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg___boxed
	.p2align	4
	.type	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg___boxed,@function
l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg___boxed: # @l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg___boxed
	.cfi_startproc
# %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rsi, %rbx
	movq	%rdi, %rax
	movq	8(%rdi), %rdi
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB17_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB17_4:
	movq	8(%rbx), %rax
	movq	16(%rbx), %rcx
	movq	8(%rax), %rsi
	movq	8(%rcx), %rdx
	callq	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg___splitProd
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB17_6
# %bb.5:
	decl	%ecx
	movl	%ecx, (%rbx)
.LBB17_8:
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.LBB17_2:
	.cfi_def_cfa_offset 32
	testl	%ecx, %ecx
	je	.LBB17_4
# %bb.3:
	movq	%rdi, %r14
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rdi
	jmp	.LBB17_4
.LBB17_6:
	testl	%ecx, %ecx
	je	.LBB17_8
# %bb.7:
	movq	%rbx, %rdi
	movq	%rax, %rbx
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rax
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end17:
	.size	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg___boxed, .Lfunc_end17-l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0,"ax",@progbits
	.hidden	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0 # -- Begin function l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0
	.globl	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0
	.p2align	4
	.type	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0,@function
l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0: # @l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0
	.cfi_startproc
# %bb.0:
	movq	8(%rdx), %rax
	movq	16(%rdx), %rcx
	movq	8(%rax), %rsi
	movq	8(%rcx), %rdx
	jmp	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg___splitProd # TAILCALL
.Lfunc_end18:
	.size	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0, .Lfunc_end18-l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___boxed,"ax",@progbits
	.hidden	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___boxed # -- Begin function l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___boxed
	.globl	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___boxed
	.p2align	4
	.type	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___boxed,@function
l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___boxed: # @l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___boxed
	.cfi_startproc
# %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdx, %rbx
	movq	%rdi, %rax
	movq	8(%rdi), %rdi
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB19_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB19_4:
	movq	8(%rbx), %rax
	movq	16(%rbx), %rcx
	movq	8(%rax), %rsi
	movq	8(%rcx), %rdx
	callq	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg___splitProd
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB19_6
# %bb.5:
	decl	%ecx
	movl	%ecx, (%rbx)
.LBB19_8:
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.LBB19_2:
	.cfi_def_cfa_offset 32
	testl	%ecx, %ecx
	je	.LBB19_4
# %bb.3:
	movq	%rdi, %r14
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rdi
	jmp	.LBB19_4
.LBB19_6:
	testl	%ecx, %ecx
	je	.LBB19_8
# %bb.7:
	movq	%rbx, %rdi
	movq	%rax, %rbx
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rax
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end19:
	.size	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___boxed, .Lfunc_end19-l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___redArg,"ax",@progbits
	.hidden	l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___redArg # -- Begin function l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___redArg
	.globl	l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___redArg
	.p2align	4
	.type	l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___redArg,@function
l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___redArg: # @l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___redArg
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rsi, %rax
	movq	%rdi, %rbx
	movabsq	$-7046029254386353131, %r12     # imm = 0x9E3779B97F4A7C15
	movabsq	$-4658895280553007687, %r13     # imm = 0xBF58476D1CE4E5B9
	movabsq	$-7723592293110705685, %rbp     # imm = 0x94D049BB133111EB
	.p2align	4
.LBB20_1:                               # =>This Inner Loop Header: Depth=1
	movq	%rdx, %r14
	movq	16(%rbx), %rsi
	movq	24(%rbx), %r15
	testb	$1, %r14b
	je	.LBB20_9
# %bb.2:                                #   in Loop: Header=BB20_1 Depth=1
	testb	$1, %sil
	je	.LBB20_11
# %bb.3:                                #   in Loop: Header=BB20_1 Depth=1
	cmpq	%rsi, %r14
	jae	.LBB20_22
.LBB20_4:                               #   in Loop: Header=BB20_1 Depth=1
	movq	%r14, %rcx
	shrq	%rcx
.LBB20_5:                               #   in Loop: Header=BB20_1 Depth=1
	addq	%r12, %rcx
	xorq	%rax, %rcx
	imulq	%r13, %rcx
	movq	%rcx, %rdx
	shrq	$29, %rdx
	xorq	%rcx, %rdx
	imulq	%rbp, %rdx
	movq	%rdx, %rax
	shrq	$31, %rax
	xorq	%rdx, %rax
	testb	$1, %r14b
	je	.LBB20_12
# %bb.6:                                #   in Loop: Header=BB20_1 Depth=1
	testb	$1, %r15b
	je	.LBB20_14
# %bb.7:                                #   in Loop: Header=BB20_1 Depth=1
	shrq	%r14
	shrq	%r15
	addq	%r14, %r15
	js	.LBB20_15
# %bb.8:                                #   in Loop: Header=BB20_1 Depth=1
	leaq	1(,%r15,2), %rdx
	jmp	.LBB20_1
.LBB20_9:                               #   in Loop: Header=BB20_1 Depth=1
	movq	%rax, (%rsp)                    # 8-byte Spill
	movq	%r14, %rdi
	callq	lean_nat_big_lt@PLT
	testb	%al, %al
	je	.LBB20_19
# %bb.10:                               #   in Loop: Header=BB20_1 Depth=1
	movq	%r14, %rdi
	callq	lean_usize_of_big_nat@PLT
	movq	%rax, %rcx
	movq	(%rsp), %rax                    # 8-byte Reload
	jmp	.LBB20_5
.LBB20_11:                              #   in Loop: Header=BB20_1 Depth=1
	movq	%r14, %rdi
	movq	%rax, (%rsp)                    # 8-byte Spill
	callq	lean_nat_big_lt@PLT
	movl	%eax, %ecx
	movq	(%rsp), %rax                    # 8-byte Reload
	testb	%cl, %cl
	jne	.LBB20_4
	jmp	.LBB20_22
.LBB20_12:                              #   in Loop: Header=BB20_1 Depth=1
	movq	%rax, (%rsp)                    # 8-byte Spill
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	lean_nat_big_add@PLT
	movq	%rax, %rdx
	movl	(%r14), %eax
	cmpl	$2, %eax
	jl	.LBB20_17
# %bb.13:                               #   in Loop: Header=BB20_1 Depth=1
	decl	%eax
	movl	%eax, (%r14)
	movq	(%rsp), %rax                    # 8-byte Reload
	jmp	.LBB20_1
.LBB20_14:                              #   in Loop: Header=BB20_1 Depth=1
	movq	%r14, %rdi
	movq	%r15, %rsi
	movq	%rax, %r14
	callq	lean_nat_big_add@PLT
	jmp	.LBB20_16
.LBB20_15:                              #   in Loop: Header=BB20_1 Depth=1
	movq	%r15, %rdi
	movq	%rax, %r14
	callq	lean_big_usize_to_nat@PLT
.LBB20_16:                              #   in Loop: Header=BB20_1 Depth=1
	movq	%rax, %rdx
	movq	%r14, %rax
	jmp	.LBB20_1
.LBB20_17:                              #   in Loop: Header=BB20_1 Depth=1
	testl	%eax, %eax
	movq	(%rsp), %rax                    # 8-byte Reload
	je	.LBB20_1
# %bb.18:                               #   in Loop: Header=BB20_1 Depth=1
	movq	%r14, %rdi
	movq	%rdx, %r14
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rdx
	movq	(%rsp), %rax                    # 8-byte Reload
	jmp	.LBB20_1
.LBB20_19:
	movl	(%r14), %eax
	cmpl	$2, %eax
	jl	.LBB20_23
# %bb.20:
	decl	%eax
	movl	%eax, (%r14)
.LBB20_21:
	movq	(%rsp), %rax                    # 8-byte Reload
.LBB20_22:
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB20_23:
	.cfi_def_cfa_offset 64
	testl	%eax, %eax
	movq	(%rsp), %rax                    # 8-byte Reload
	je	.LBB20_22
# %bb.24:
	movq	%r14, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB20_21
.Lfunc_end20:
	.size	l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___redArg, .Lfunc_end20-l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___redArg
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___redArg___boxed,"ax",@progbits
	.hidden	l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___redArg___boxed # -- Begin function l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___redArg___boxed
	.globl	l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___redArg___boxed
	.p2align	4
	.type	l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___redArg___boxed,@function
l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___redArg___boxed: # @l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___redArg___boxed
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rsi, %rax
	movq	%rdi, %rbx
	movq	8(%rsi), %rsi
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB21_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB21_4:
	movq	%rbx, %rdi
	callq	l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___redArg
	movq	%rax, %r14
	movl	(%rbx), %eax
	cmpl	$2, %eax
	jl	.LBB21_6
# %bb.5:
	decl	%eax
	movl	%eax, (%rbx)
.LBB21_8:
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB21_10
# %bb.9:
	movabsq	$68719476737, %rcx              # imm = 0x1000000001
	movq	%rcx, (%rax)
	movq	%r14, 8(%rax)
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.LBB21_2:
	.cfi_def_cfa_offset 32
	testl	%ecx, %ecx
	je	.LBB21_4
# %bb.3:
	movq	%rax, %rdi
	movq	%rdx, %r14
	movq	%rsi, %r15
	callq	lean_dec_ref_cold@PLT
	movq	%r15, %rsi
	movq	%r14, %rdx
	jmp	.LBB21_4
.LBB21_6:
	testl	%eax, %eax
	je	.LBB21_8
# %bb.7:
	movq	%rbx, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB21_8
.LBB21_10:
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end21:
	.size	l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___redArg___boxed, .Lfunc_end21-l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___redArg___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l_LoopStudy_forNat,"ax",@progbits
	.hidden	l_LoopStudy_forNat              # -- Begin function l_LoopStudy_forNat
	.globl	l_LoopStudy_forNat
	.p2align	4
	.type	l_LoopStudy_forNat,@function
l_LoopStudy_forNat:                     # @l_LoopStudy_forNat
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rsi, %r14
	testq	%rdi, %rdi
	js	.LBB22_2
# %bb.1:
	leaq	1(,%rdi,2), %r15
.LBB22_3:
	callq	lean_inc_heartbeat@PLT
	movl	$32, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB22_26
# %bb.4:
	movq	%rax, %rbx
	movabsq	$844562369085441, %rax          # imm = 0x3002000000001
	movq	%rax, (%rbx)
	movq	$1, 8(%rbx)
	movq	%r15, 16(%rbx)
	movq	$3, 24(%rbx)
	movl	$1, %edx
	movq	%rbx, %rdi
	movq	%r14, %rsi
	callq	l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___redArg
	movl	(%rbx), %ecx
	cmpl	$1, %ecx
	jne	.LBB22_21
# %bb.5:
	movq	8(%rbx), %rdi
	testb	$1, %dil
	jne	.LBB22_10
# %bb.6:
	movl	(%rdi), %ecx
	cmpl	$2, %ecx
	jl	.LBB22_8
# %bb.7:
	decl	%ecx
	movl	%ecx, (%rdi)
.LBB22_10:
	movq	16(%rbx), %rdi
	testb	$1, %dil
	jne	.LBB22_15
# %bb.11:
	movl	(%rdi), %ecx
	cmpl	$1, %ecx
	jle	.LBB22_12
# %bb.14:
	decl	%ecx
	movl	%ecx, (%rdi)
.LBB22_15:
	movq	%rax, %r14
	movq	24(%rbx), %rdi
	testb	$1, %dil
	jne	.LBB22_20
# %bb.16:
	movl	(%rdi), %eax
	cmpl	$1, %eax
	jle	.LBB22_17
# %bb.19:
	decl	%eax
	movl	%eax, (%rdi)
.LBB22_20:
	movq	%rbx, %rdi
	callq	lean_free_object@PLT
	movq	%r14, %rax
.LBB22_25:
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.LBB22_21:
	.cfi_def_cfa_offset 32
	jle	.LBB22_23
# %bb.22:
	decl	%ecx
	movl	%ecx, (%rbx)
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.LBB22_2:
	.cfi_def_cfa_offset 32
	callq	lean_big_usize_to_nat@PLT
	movq	%rax, %r15
	jmp	.LBB22_3
.LBB22_23:
	testl	%ecx, %ecx
	je	.LBB22_25
# %bb.24:
	movq	%rbx, %rdi
	movq	%rax, %rbx
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.LBB22_8:
	.cfi_def_cfa_offset 32
	testl	%ecx, %ecx
	je	.LBB22_10
# %bb.9:
	movq	%rax, %r14
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rax
	jmp	.LBB22_10
.LBB22_12:
	testl	%ecx, %ecx
	je	.LBB22_15
# %bb.13:
	movq	%rax, %r14
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rax
	jmp	.LBB22_15
.LBB22_17:
	testl	%eax, %eax
	je	.LBB22_20
# %bb.18:
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB22_20
.LBB22_26:
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end22:
	.size	l_LoopStudy_forNat, .Lfunc_end22-l_LoopStudy_forNat
	.cfi_endproc
                                        # -- End function
	.section	.text.lean_dec_ref_known,"ax",@progbits
	.p2align	4                               # -- Begin function lean_dec_ref_known
	.type	lean_dec_ref_known,@function
lean_dec_ref_known:                     # @lean_dec_ref_known
	.cfi_startproc
# %bb.0:
	movl	(%rdi), %eax
	cmpl	$1, %eax
	jne	.LBB23_9
# %bb.1:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movl	%esi, %ebx
	xorl	%r14d, %r14d
	jmp	.LBB23_2
	.p2align	4
.LBB23_4:                               #   in Loop: Header=BB23_2 Depth=1
	decl	%ecx
	movl	%ecx, (%rax)
.LBB23_7:                               #   in Loop: Header=BB23_2 Depth=1
	incq	%r14
	cmpq	%r14, %rbx
	je	.LBB23_8
.LBB23_2:                               # =>This Inner Loop Header: Depth=1
	movq	8(%rdi,%r14,8), %rax
	testb	$1, %al
	jne	.LBB23_7
# %bb.3:                                #   in Loop: Header=BB23_2 Depth=1
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jge	.LBB23_4
# %bb.5:                                #   in Loop: Header=BB23_2 Depth=1
	testl	%ecx, %ecx
	je	.LBB23_7
# %bb.6:                                #   in Loop: Header=BB23_2 Depth=1
	movq	%rdi, %r15
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
	movq	%r15, %rdi
	jmp	.LBB23_7
.LBB23_9:
	.cfi_def_cfa_offset 8
	.cfi_restore %rbx
	.cfi_restore %r14
	.cfi_restore %r15
	jle	.LBB23_11
# %bb.10:
	decl	%eax
	movl	%eax, (%rdi)
	retq
.LBB23_8:
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	lean_free_object@PLT            # TAILCALL
.LBB23_11:
	.cfi_restore %rbx
	.cfi_restore %r14
	.cfi_restore %r15
	testl	%eax, %eax
	jne	lean_dec_ref_cold@PLT           # TAILCALL
# %bb.12:
	retq
.Lfunc_end23:
	.size	lean_dec_ref_known, .Lfunc_end23-lean_dec_ref_known
	.cfi_endproc
                                        # -- End function
	.section	.text.l_LoopStudy_forNat___boxed,"ax",@progbits
	.hidden	l_LoopStudy_forNat___boxed      # -- Begin function l_LoopStudy_forNat___boxed
	.globl	l_LoopStudy_forNat___boxed
	.p2align	4
	.type	l_LoopStudy_forNat___boxed,@function
l_LoopStudy_forNat___boxed:             # @l_LoopStudy_forNat___boxed
	.cfi_startproc
# %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdi, %rax
	movq	8(%rdi), %rdi
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB24_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB24_4:
	movq	8(%rsi), %rbx
	movl	(%rsi), %eax
	cmpl	$2, %eax
	jl	.LBB24_6
# %bb.5:
	decl	%eax
	movl	%eax, (%rsi)
.LBB24_8:
	movq	%rbx, %rsi
	callq	l_LoopStudy_forNat
	movq	%rax, %rbx
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB24_10
# %bb.9:
	movabsq	$68719476737, %rcx              # imm = 0x1000000001
	movq	%rcx, (%rax)
	movq	%rbx, 8(%rax)
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.LBB24_2:
	.cfi_def_cfa_offset 32
	testl	%ecx, %ecx
	je	.LBB24_4
# %bb.3:
	movq	%rdi, %rbx
	movq	%rax, %rdi
	movq	%rsi, %r14
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rsi
	movq	%rbx, %rdi
	jmp	.LBB24_4
.LBB24_6:
	testl	%eax, %eax
	je	.LBB24_8
# %bb.7:
	movq	%rdi, %r14
	movq	%rsi, %rdi
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rdi
	jmp	.LBB24_8
.LBB24_10:
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end24:
	.size	l_LoopStudy_forNat___boxed, .Lfunc_end24-l_LoopStudy_forNat___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0,"ax",@progbits
	.hidden	l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0 # -- Begin function l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0
	.globl	l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0
	.p2align	4
	.type	l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0,@function
l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0: # @l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0
	.cfi_startproc
# %bb.0:
	jmp	l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___redArg # TAILCALL
.Lfunc_end25:
	.size	l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0, .Lfunc_end25-l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___boxed,"ax",@progbits
	.hidden	l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___boxed # -- Begin function l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___boxed
	.globl	l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___boxed
	.p2align	4
	.type	l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___boxed,@function
l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___boxed: # @l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___boxed
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rsi, %rax
	movq	%rdi, %rbx
	movq	8(%rsi), %rsi
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB26_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB26_4:
	movq	%rbx, %rdi
	callq	l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___redArg
	movq	%rax, %r14
	movl	(%rbx), %eax
	cmpl	$2, %eax
	jl	.LBB26_6
# %bb.5:
	decl	%eax
	movl	%eax, (%rbx)
.LBB26_8:
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB26_10
# %bb.9:
	movabsq	$68719476737, %rcx              # imm = 0x1000000001
	movq	%rcx, (%rax)
	movq	%r14, 8(%rax)
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.LBB26_2:
	.cfi_def_cfa_offset 32
	testl	%ecx, %ecx
	je	.LBB26_4
# %bb.3:
	movq	%rax, %rdi
	movq	%rdx, %r14
	movq	%rsi, %r15
	callq	lean_dec_ref_cold@PLT
	movq	%r15, %rsi
	movq	%r14, %rdx
	jmp	.LBB26_4
.LBB26_6:
	testl	%eax, %eax
	je	.LBB26_8
# %bb.7:
	movq	%rbx, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB26_8
.LBB26_10:
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end26:
	.size	l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___boxed, .Lfunc_end26-l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0___redArg,"ax",@progbits
	.hidden	l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0___redArg # -- Begin function l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0___redArg
	.globl	l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0___redArg
	.p2align	4
	.type	l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0___redArg,@function
l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0___redArg: # @l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0___redArg
	.cfi_startproc
# %bb.0:
	movq	%rdx, %rax
	cmpq	%rsi, %rdi
	jbe	.LBB27_5
# %bb.1:
	movabsq	$-4658895280553007687, %rcx     # imm = 0xBF58476D1CE4E5B9
	movabsq	$-7046029254386353130, %rdx     # imm = 0x9E3779B97F4A7C16
	movabsq	$-7723592293110705685, %r8      # imm = 0x94D049BB133111EB
	movl	%edi, %r10d
	subl	%esi, %r10d
	leaq	1(%rsi), %r9
	testb	$1, %r10b
	je	.LBB27_3
# %bb.2:
	addq	%rdx, %rsi
	decq	%rsi
	xorq	%rax, %rsi
	imulq	%rcx, %rsi
	movq	%rsi, %r10
	shrq	$29, %r10
	xorq	%rsi, %r10
	imulq	%r8, %r10
	movq	%r10, %rax
	shrq	$31, %rax
	xorq	%r10, %rax
	movq	%r9, %rsi
.LBB27_3:
	cmpq	%r9, %rdi
	je	.LBB27_5
	.p2align	4
.LBB27_4:                               # =>This Inner Loop Header: Depth=1
	leaq	(%rsi,%rdx), %r9
	leaq	(%rsi,%rdx), %r10
	decq	%r10
	xorq	%rax, %r10
	imulq	%rcx, %r10
	movq	%r10, %rax
	shrq	$29, %rax
	xorq	%r10, %rax
	imulq	%r8, %rax
	xorq	%rax, %r9
	shrq	$31, %rax
	xorq	%r9, %rax
	imulq	%rcx, %rax
	movq	%rax, %r9
	shrq	$29, %r9
	xorq	%rax, %r9
	imulq	%r8, %r9
	movq	%r9, %rax
	shrq	$31, %rax
	xorq	%r9, %rax
	addq	$2, %rsi
	cmpq	%rdi, %rsi
	jb	.LBB27_4
.LBB27_5:
	retq
.Lfunc_end27:
	.size	l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0___redArg, .Lfunc_end27-l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0___redArg
	.cfi_endproc
                                        # -- End function
	.section	.text.l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0___redArg___boxed,"ax",@progbits
	.hidden	l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0___redArg___boxed # -- Begin function l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0___redArg___boxed
	.globl	l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0___redArg___boxed
	.p2align	4
	.type	l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0___redArg___boxed,@function
l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0___redArg___boxed: # @l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0___redArg___boxed
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	8(%rdi), %rbx
	movl	(%rdi), %eax
	cmpl	$2, %eax
	jl	.LBB28_2
# %bb.1:
	decl	%eax
	movl	%eax, (%rdi)
.LBB28_4:
	movq	8(%rsi), %r15
	movl	(%rsi), %eax
	cmpl	$2, %eax
	jl	.LBB28_6
# %bb.5:
	decl	%eax
	movl	%eax, (%rsi)
.LBB28_8:
	movq	8(%rdx), %r14
	movl	(%rdx), %eax
	cmpl	$2, %eax
	jl	.LBB28_10
# %bb.9:
	decl	%eax
	movl	%eax, (%rdx)
.LBB28_12:
	cmpq	%r15, %rbx
	jbe	.LBB28_18
# %bb.13:
	movabsq	$-4658895280553007687, %rax     # imm = 0xBF58476D1CE4E5B9
	movabsq	$-7046029254386353131, %rcx     # imm = 0x9E3779B97F4A7C15
	movabsq	$-7723592293110705685, %rdx     # imm = 0x94D049BB133111EB
	movl	%ebx, %edi
	subl	%r15d, %edi
	leaq	1(%r15), %rsi
	testb	$1, %dil
	je	.LBB28_15
# %bb.14:
	addq	%rcx, %r15
	xorq	%r14, %r15
	imulq	%rax, %r15
	movq	%r15, %rdi
	shrq	$29, %rdi
	xorq	%r15, %rdi
	imulq	%rdx, %rdi
	movq	%rdi, %r14
	shrq	$31, %r14
	xorq	%rdi, %r14
	movq	%rsi, %r15
.LBB28_15:
	cmpq	%rsi, %rbx
	je	.LBB28_18
# %bb.16:
	subq	%r15, %rbx
	addq	%r15, %rcx
	.p2align	4
.LBB28_17:                              # =>This Inner Loop Header: Depth=1
	xorq	%rcx, %r14
	imulq	%rax, %r14
	movq	%r14, %rsi
	shrq	$29, %rsi
	xorq	%r14, %rsi
	imulq	%rdx, %rsi
	leaq	1(%rcx), %rdi
	xorq	%rsi, %rdi
	shrq	$31, %rsi
	xorq	%rdi, %rsi
	imulq	%rax, %rsi
	movq	%rsi, %rdi
	shrq	$29, %rdi
	xorq	%rsi, %rdi
	imulq	%rdx, %rdi
	movq	%rdi, %r14
	shrq	$31, %r14
	xorq	%rdi, %r14
	addq	$2, %rcx
	addq	$-2, %rbx
	jne	.LBB28_17
.LBB28_18:
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB28_20
# %bb.19:
	movabsq	$68719476737, %rcx              # imm = 0x1000000001
	movq	%rcx, (%rax)
	movq	%r14, 8(%rax)
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.LBB28_2:
	.cfi_def_cfa_offset 32
	testl	%eax, %eax
	je	.LBB28_4
# %bb.3:
	movq	%rdx, %r14
	movq	%rsi, %r15
	callq	lean_dec_ref_cold@PLT
	movq	%r15, %rsi
	movq	%r14, %rdx
	jmp	.LBB28_4
.LBB28_6:
	testl	%eax, %eax
	je	.LBB28_8
# %bb.7:
	movq	%rsi, %rdi
	movq	%rdx, %r14
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rdx
	jmp	.LBB28_8
.LBB28_10:
	testl	%eax, %eax
	je	.LBB28_12
# %bb.11:
	movq	%rdx, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB28_12
.LBB28_20:
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end28:
	.size	l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0___redArg___boxed, .Lfunc_end28-l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0___redArg___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l_LoopStudy_forUSize,"ax",@progbits
	.hidden	l_LoopStudy_forUSize            # -- Begin function l_LoopStudy_forUSize
	.globl	l_LoopStudy_forUSize
	.p2align	4
	.type	l_LoopStudy_forUSize,@function
l_LoopStudy_forUSize:                   # @l_LoopStudy_forUSize
	.cfi_startproc
# %bb.0:
	movq	%rsi, %rax
	testq	%rdi, %rdi
	je	.LBB29_8
# %bb.1:
	movabsq	$-4658895280553007687, %rdx     # imm = 0xBF58476D1CE4E5B9
	movabsq	$-7046029254386353131, %rsi     # imm = 0x9E3779B97F4A7C15
	movabsq	$-7723592293110705685, %rcx     # imm = 0x94D049BB133111EB
	cmpq	$1, %rdi
	jne	.LBB29_3
# %bb.2:
	xorl	%r8d, %r8d
	jmp	.LBB29_7
.LBB29_3:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %r9
	andq	$-2, %r9
	negq	%r9
	xorl	%r8d, %r8d
	movq	%rsi, %r10
	.p2align	4
.LBB29_4:                               # =>This Inner Loop Header: Depth=1
	xorq	%r10, %rax
	imulq	%rdx, %rax
	movq	%rax, %r11
	shrq	$29, %r11
	xorq	%rax, %r11
	imulq	%rcx, %r11
	leaq	1(%r10), %rax
	xorq	%r11, %rax
	shrq	$31, %r11
	xorq	%rax, %r11
	imulq	%rdx, %r11
	movq	%r11, %rbx
	shrq	$29, %rbx
	xorq	%r11, %rbx
	imulq	%rcx, %rbx
	movq	%rbx, %rax
	shrq	$31, %rax
	xorq	%rbx, %rax
	addq	$-2, %r8
	addq	$2, %r10
	cmpq	%r8, %r9
	jne	.LBB29_4
# %bb.5:
	testb	$1, %dil
	popq	%rbx
	.cfi_def_cfa_offset 8
	.cfi_restore %rbx
	je	.LBB29_8
# %bb.6:
	negq	%r8
.LBB29_7:
	addq	%rsi, %r8
	xorq	%rax, %r8
	imulq	%rdx, %r8
	movq	%r8, %rdx
	shrq	$29, %rdx
	xorq	%r8, %rdx
	imulq	%rcx, %rdx
	movq	%rdx, %rax
	shrq	$31, %rax
	xorq	%rdx, %rax
.LBB29_8:
	retq
.Lfunc_end29:
	.size	l_LoopStudy_forUSize, .Lfunc_end29-l_LoopStudy_forUSize
	.cfi_endproc
                                        # -- End function
	.section	.text.l_LoopStudy_forUSize___boxed,"ax",@progbits
	.hidden	l_LoopStudy_forUSize___boxed    # -- Begin function l_LoopStudy_forUSize___boxed
	.globl	l_LoopStudy_forUSize___boxed
	.p2align	4
	.type	l_LoopStudy_forUSize___boxed,@function
l_LoopStudy_forUSize___boxed:           # @l_LoopStudy_forUSize___boxed
	.cfi_startproc
# %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	8(%rdi), %r14
	movl	(%rdi), %eax
	cmpl	$2, %eax
	jl	.LBB30_2
# %bb.1:
	decl	%eax
	movl	%eax, (%rdi)
.LBB30_4:
	movq	8(%rsi), %rbx
	movl	(%rsi), %eax
	cmpl	$2, %eax
	jl	.LBB30_6
# %bb.5:
	decl	%eax
	movl	%eax, (%rsi)
.LBB30_8:
	testq	%r14, %r14
	je	.LBB30_16
# %bb.9:
	movabsq	$-4658895280553007687, %rcx     # imm = 0xBF58476D1CE4E5B9
	movabsq	$-7046029254386353131, %rdx     # imm = 0x9E3779B97F4A7C15
	movabsq	$-7723592293110705685, %rax     # imm = 0x94D049BB133111EB
	cmpq	$1, %r14
	jne	.LBB30_11
# %bb.10:
	xorl	%esi, %esi
	jmp	.LBB30_15
.LBB30_11:
	movq	%r14, %rdi
	andq	$-2, %rdi
	negq	%rdi
	xorl	%esi, %esi
	movq	%rdx, %r8
	.p2align	4
.LBB30_12:                              # =>This Inner Loop Header: Depth=1
	xorq	%r8, %rbx
	imulq	%rcx, %rbx
	movq	%rbx, %r9
	shrq	$29, %r9
	xorq	%rbx, %r9
	imulq	%rax, %r9
	leaq	1(%r8), %r10
	xorq	%r9, %r10
	shrq	$31, %r9
	xorq	%r10, %r9
	imulq	%rcx, %r9
	movq	%r9, %r10
	shrq	$29, %r10
	xorq	%r9, %r10
	imulq	%rax, %r10
	movq	%r10, %rbx
	shrq	$31, %rbx
	xorq	%r10, %rbx
	addq	$-2, %rsi
	addq	$2, %r8
	cmpq	%rsi, %rdi
	jne	.LBB30_12
# %bb.13:
	testb	$1, %r14b
	je	.LBB30_16
# %bb.14:
	negq	%rsi
.LBB30_15:
	addq	%rdx, %rsi
	xorq	%rbx, %rsi
	imulq	%rcx, %rsi
	movq	%rsi, %rcx
	shrq	$29, %rcx
	xorq	%rsi, %rcx
	imulq	%rax, %rcx
	movq	%rcx, %rbx
	shrq	$31, %rbx
	xorq	%rcx, %rbx
.LBB30_16:
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB30_18
# %bb.17:
	movabsq	$68719476737, %rcx              # imm = 0x1000000001
	movq	%rcx, (%rax)
	movq	%rbx, 8(%rax)
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.LBB30_2:
	.cfi_def_cfa_offset 32
	testl	%eax, %eax
	je	.LBB30_4
# %bb.3:
	movq	%rsi, %rbx
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rsi
	jmp	.LBB30_4
.LBB30_6:
	testl	%eax, %eax
	je	.LBB30_8
# %bb.7:
	movq	%rsi, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB30_8
.LBB30_18:
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end30:
	.size	l_LoopStudy_forUSize___boxed, .Lfunc_end30-l_LoopStudy_forUSize___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0,"ax",@progbits
	.hidden	l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0 # -- Begin function l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0
	.globl	l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0
	.p2align	4
	.type	l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0,@function
l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0: # @l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0
	.cfi_startproc
# %bb.0:
	movq	%r8, %rax
	cmpq	%rcx, %rdi
	jbe	.LBB31_6
# %bb.1:
	movabsq	$-4658895280553007687, %rdx     # imm = 0xBF58476D1CE4E5B9
	movabsq	$-7046029254386353131, %rsi     # imm = 0x9E3779B97F4A7C15
	movabsq	$-7723592293110705685, %r8      # imm = 0x94D049BB133111EB
	movl	%edi, %r10d
	subl	%ecx, %r10d
	leaq	1(%rcx), %r9
	testb	$1, %r10b
	je	.LBB31_3
# %bb.2:
	addq	%rsi, %rcx
	xorq	%rax, %rcx
	imulq	%rdx, %rcx
	movq	%rcx, %r10
	shrq	$29, %r10
	xorq	%rcx, %r10
	imulq	%r8, %r10
	movq	%r10, %rax
	shrq	$31, %rax
	xorq	%r10, %rax
	movq	%r9, %rcx
.LBB31_3:
	cmpq	%r9, %rdi
	je	.LBB31_6
# %bb.4:
	subq	%rcx, %rdi
	addq	%rcx, %rsi
	.p2align	4
.LBB31_5:                               # =>This Inner Loop Header: Depth=1
	xorq	%rsi, %rax
	imulq	%rdx, %rax
	movq	%rax, %rcx
	shrq	$29, %rcx
	xorq	%rax, %rcx
	imulq	%r8, %rcx
	leaq	1(%rsi), %rax
	xorq	%rcx, %rax
	shrq	$31, %rcx
	xorq	%rax, %rcx
	imulq	%rdx, %rcx
	movq	%rcx, %r9
	shrq	$29, %r9
	xorq	%rcx, %r9
	imulq	%r8, %r9
	movq	%r9, %rax
	shrq	$31, %rax
	xorq	%r9, %rax
	addq	$2, %rsi
	addq	$-2, %rdi
	jne	.LBB31_5
.LBB31_6:
	retq
.Lfunc_end31:
	.size	l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0, .Lfunc_end31-l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0
	.cfi_endproc
                                        # -- End function
	.section	.text.l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0___boxed,"ax",@progbits
	.hidden	l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0___boxed # -- Begin function l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0___boxed
	.globl	l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0___boxed
	.p2align	4
	.type	l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0___boxed,@function
l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0___boxed: # @l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0___boxed
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	8(%rdi), %rbx
	movl	(%rdi), %eax
	cmpl	$2, %eax
	jl	.LBB32_2
# %bb.1:
	decl	%eax
	movl	%eax, (%rdi)
.LBB32_4:
	movq	8(%rcx), %r15
	movl	(%rcx), %eax
	cmpl	$2, %eax
	jl	.LBB32_6
# %bb.5:
	decl	%eax
	movl	%eax, (%rcx)
.LBB32_8:
	movq	8(%r8), %r14
	movl	(%r8), %eax
	cmpl	$2, %eax
	jl	.LBB32_10
# %bb.9:
	decl	%eax
	movl	%eax, (%r8)
.LBB32_12:
	cmpq	%r15, %rbx
	jbe	.LBB32_18
# %bb.13:
	movabsq	$-4658895280553007687, %rax     # imm = 0xBF58476D1CE4E5B9
	movabsq	$-7046029254386353131, %rcx     # imm = 0x9E3779B97F4A7C15
	movabsq	$-7723592293110705685, %rdx     # imm = 0x94D049BB133111EB
	movl	%ebx, %edi
	subl	%r15d, %edi
	leaq	1(%r15), %rsi
	testb	$1, %dil
	je	.LBB32_15
# %bb.14:
	addq	%rcx, %r15
	xorq	%r14, %r15
	imulq	%rax, %r15
	movq	%r15, %rdi
	shrq	$29, %rdi
	xorq	%r15, %rdi
	imulq	%rdx, %rdi
	movq	%rdi, %r14
	shrq	$31, %r14
	xorq	%rdi, %r14
	movq	%rsi, %r15
.LBB32_15:
	cmpq	%rsi, %rbx
	je	.LBB32_18
# %bb.16:
	subq	%r15, %rbx
	addq	%r15, %rcx
	.p2align	4
.LBB32_17:                              # =>This Inner Loop Header: Depth=1
	xorq	%rcx, %r14
	imulq	%rax, %r14
	movq	%r14, %rsi
	shrq	$29, %rsi
	xorq	%r14, %rsi
	imulq	%rdx, %rsi
	leaq	1(%rcx), %rdi
	xorq	%rsi, %rdi
	shrq	$31, %rsi
	xorq	%rdi, %rsi
	imulq	%rax, %rsi
	movq	%rsi, %rdi
	shrq	$29, %rdi
	xorq	%rsi, %rdi
	imulq	%rdx, %rdi
	movq	%rdi, %r14
	shrq	$31, %r14
	xorq	%rdi, %r14
	addq	$2, %rcx
	addq	$-2, %rbx
	jne	.LBB32_17
.LBB32_18:
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB32_20
# %bb.19:
	movabsq	$68719476737, %rcx              # imm = 0x1000000001
	movq	%rcx, (%rax)
	movq	%r14, 8(%rax)
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.LBB32_2:
	.cfi_def_cfa_offset 32
	testl	%eax, %eax
	je	.LBB32_4
# %bb.3:
	movq	%r8, %r14
	movq	%rcx, %r15
	callq	lean_dec_ref_cold@PLT
	movq	%r15, %rcx
	movq	%r14, %r8
	jmp	.LBB32_4
.LBB32_6:
	testl	%eax, %eax
	je	.LBB32_8
# %bb.7:
	movq	%rcx, %rdi
	movq	%r8, %r14
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %r8
	jmp	.LBB32_8
.LBB32_10:
	testl	%eax, %eax
	je	.LBB32_12
# %bb.11:
	movq	%r8, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB32_12
.LBB32_20:
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end32:
	.size	l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0___boxed, .Lfunc_end32-l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l_LoopStudy_tailScalar,"ax",@progbits
	.hidden	l_LoopStudy_tailScalar          # -- Begin function l_LoopStudy_tailScalar
	.globl	l_LoopStudy_tailScalar
	.p2align	4
	.type	l_LoopStudy_tailScalar,@function
l_LoopStudy_tailScalar:                 # @l_LoopStudy_tailScalar
	.cfi_startproc
# %bb.0:
	movq	%rdx, %rax
	cmpq	%rsi, %rdi
	jbe	.LBB33_6
# %bb.1:
	movabsq	$-4658895280553007687, %rcx     # imm = 0xBF58476D1CE4E5B9
	movabsq	$-7046029254386353131, %rdx     # imm = 0x9E3779B97F4A7C15
	movabsq	$-7723592293110705685, %r8      # imm = 0x94D049BB133111EB
	movl	%edi, %r10d
	subl	%esi, %r10d
	leaq	1(%rsi), %r9
	testb	$1, %r10b
	je	.LBB33_3
# %bb.2:
	addq	%rdx, %rsi
	xorq	%rax, %rsi
	imulq	%rcx, %rsi
	movq	%rsi, %r10
	shrq	$29, %r10
	xorq	%rsi, %r10
	imulq	%r8, %r10
	movq	%r10, %rax
	shrq	$31, %rax
	xorq	%r10, %rax
	movq	%r9, %rsi
.LBB33_3:
	cmpq	%r9, %rdi
	je	.LBB33_6
# %bb.4:
	addq	%rsi, %rdx
	subq	%rsi, %rdi
	.p2align	4
.LBB33_5:                               # =>This Inner Loop Header: Depth=1
	xorq	%rdx, %rax
	imulq	%rcx, %rax
	movq	%rax, %rsi
	shrq	$29, %rsi
	xorq	%rax, %rsi
	imulq	%r8, %rsi
	leaq	1(%rdx), %rax
	xorq	%rsi, %rax
	shrq	$31, %rsi
	xorq	%rax, %rsi
	imulq	%rcx, %rsi
	movq	%rsi, %r9
	shrq	$29, %r9
	xorq	%rsi, %r9
	imulq	%r8, %r9
	movq	%r9, %rax
	shrq	$31, %rax
	xorq	%r9, %rax
	addq	$2, %rdx
	addq	$-2, %rdi
	jne	.LBB33_5
.LBB33_6:
	retq
.Lfunc_end33:
	.size	l_LoopStudy_tailScalar, .Lfunc_end33-l_LoopStudy_tailScalar
	.cfi_endproc
                                        # -- End function
	.section	.text.l_LoopStudy_tailScalar___boxed,"ax",@progbits
	.hidden	l_LoopStudy_tailScalar___boxed  # -- Begin function l_LoopStudy_tailScalar___boxed
	.globl	l_LoopStudy_tailScalar___boxed
	.p2align	4
	.type	l_LoopStudy_tailScalar___boxed,@function
l_LoopStudy_tailScalar___boxed:         # @l_LoopStudy_tailScalar___boxed
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	8(%rdi), %rbx
	movl	(%rdi), %eax
	cmpl	$2, %eax
	jl	.LBB34_2
# %bb.1:
	decl	%eax
	movl	%eax, (%rdi)
.LBB34_4:
	movq	8(%rsi), %r15
	movl	(%rsi), %eax
	cmpl	$2, %eax
	jl	.LBB34_6
# %bb.5:
	decl	%eax
	movl	%eax, (%rsi)
.LBB34_8:
	movq	8(%rdx), %r14
	movl	(%rdx), %eax
	cmpl	$2, %eax
	jl	.LBB34_10
# %bb.9:
	decl	%eax
	movl	%eax, (%rdx)
.LBB34_12:
	cmpq	%r15, %rbx
	jbe	.LBB34_18
# %bb.13:
	movabsq	$-4658895280553007687, %rax     # imm = 0xBF58476D1CE4E5B9
	movabsq	$-7046029254386353131, %rcx     # imm = 0x9E3779B97F4A7C15
	movabsq	$-7723592293110705685, %rdx     # imm = 0x94D049BB133111EB
	movl	%ebx, %edi
	subl	%r15d, %edi
	leaq	1(%r15), %rsi
	testb	$1, %dil
	je	.LBB34_15
# %bb.14:
	addq	%rcx, %r15
	xorq	%r14, %r15
	imulq	%rax, %r15
	movq	%r15, %rdi
	shrq	$29, %rdi
	xorq	%r15, %rdi
	imulq	%rdx, %rdi
	movq	%rdi, %r14
	shrq	$31, %r14
	xorq	%rdi, %r14
	movq	%rsi, %r15
.LBB34_15:
	cmpq	%rsi, %rbx
	je	.LBB34_18
# %bb.16:
	addq	%r15, %rcx
	subq	%r15, %rbx
	.p2align	4
.LBB34_17:                              # =>This Inner Loop Header: Depth=1
	xorq	%rcx, %r14
	imulq	%rax, %r14
	movq	%r14, %rsi
	shrq	$29, %rsi
	xorq	%r14, %rsi
	imulq	%rdx, %rsi
	leaq	1(%rcx), %rdi
	xorq	%rsi, %rdi
	shrq	$31, %rsi
	xorq	%rdi, %rsi
	imulq	%rax, %rsi
	movq	%rsi, %rdi
	shrq	$29, %rdi
	xorq	%rsi, %rdi
	imulq	%rdx, %rdi
	movq	%rdi, %r14
	shrq	$31, %r14
	xorq	%rdi, %r14
	addq	$2, %rcx
	addq	$-2, %rbx
	jne	.LBB34_17
.LBB34_18:
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB34_20
# %bb.19:
	movabsq	$68719476737, %rcx              # imm = 0x1000000001
	movq	%rcx, (%rax)
	movq	%r14, 8(%rax)
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.LBB34_2:
	.cfi_def_cfa_offset 32
	testl	%eax, %eax
	je	.LBB34_4
# %bb.3:
	movq	%rdx, %r14
	movq	%rsi, %r15
	callq	lean_dec_ref_cold@PLT
	movq	%r15, %rsi
	movq	%r14, %rdx
	jmp	.LBB34_4
.LBB34_6:
	testl	%eax, %eax
	je	.LBB34_8
# %bb.7:
	movq	%rsi, %rdi
	movq	%rdx, %r14
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rdx
	jmp	.LBB34_8
.LBB34_10:
	testl	%eax, %eax
	je	.LBB34_12
# %bb.11:
	movq	%rdx, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB34_12
.LBB34_20:
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end34:
	.size	l_LoopStudy_tailScalar___boxed, .Lfunc_end34-l_LoopStudy_tailScalar___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l_LoopStudy_tailPair___splitProd,"ax",@progbits
	.hidden	l_LoopStudy_tailPair___splitProd # -- Begin function l_LoopStudy_tailPair___splitProd
	.globl	l_LoopStudy_tailPair___splitProd
	.p2align	4
	.type	l_LoopStudy_tailPair___splitProd,@function
l_LoopStudy_tailPair___splitProd:       # @l_LoopStudy_tailPair___splitProd
	.cfi_startproc
# %bb.0:
	movq	%rdx, %rax
	cmpq	%rsi, %rdi
	jbe	.LBB35_6
# %bb.1:
	movabsq	$-4658895280553007687, %rcx     # imm = 0xBF58476D1CE4E5B9
	movabsq	$-7046029254386353131, %rdx     # imm = 0x9E3779B97F4A7C15
	movabsq	$-7723592293110705685, %r8      # imm = 0x94D049BB133111EB
	movl	%edi, %r10d
	subl	%esi, %r10d
	leaq	1(%rsi), %r9
	testb	$1, %r10b
	je	.LBB35_3
# %bb.2:
	addq	%rdx, %rsi
	xorq	%rax, %rsi
	imulq	%rcx, %rsi
	movq	%rsi, %r10
	shrq	$29, %r10
	xorq	%rsi, %r10
	imulq	%r8, %r10
	movq	%r10, %rax
	shrq	$31, %rax
	xorq	%r10, %rax
	movq	%r9, %rsi
.LBB35_3:
	cmpq	%r9, %rdi
	je	.LBB35_6
# %bb.4:
	addq	%rsi, %rdx
	subq	%rsi, %rdi
	.p2align	4
.LBB35_5:                               # =>This Inner Loop Header: Depth=1
	xorq	%rdx, %rax
	imulq	%rcx, %rax
	movq	%rax, %rsi
	shrq	$29, %rsi
	xorq	%rax, %rsi
	imulq	%r8, %rsi
	leaq	1(%rdx), %rax
	xorq	%rsi, %rax
	shrq	$31, %rsi
	xorq	%rax, %rsi
	imulq	%rcx, %rsi
	movq	%rsi, %r9
	shrq	$29, %r9
	xorq	%rsi, %r9
	imulq	%r8, %r9
	movq	%r9, %rax
	shrq	$31, %rax
	xorq	%r9, %rax
	addq	$2, %rdx
	addq	$-2, %rdi
	jne	.LBB35_5
.LBB35_6:
	retq
.Lfunc_end35:
	.size	l_LoopStudy_tailPair___splitProd, .Lfunc_end35-l_LoopStudy_tailPair___splitProd
	.cfi_endproc
                                        # -- End function
	.section	.text.l_LoopStudy_tailPair___splitProd___boxed,"ax",@progbits
	.hidden	l_LoopStudy_tailPair___splitProd___boxed # -- Begin function l_LoopStudy_tailPair___splitProd___boxed
	.globl	l_LoopStudy_tailPair___splitProd___boxed
	.p2align	4
	.type	l_LoopStudy_tailPair___splitProd___boxed,@function
l_LoopStudy_tailPair___splitProd___boxed: # @l_LoopStudy_tailPair___splitProd___boxed
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	8(%rdi), %rbx
	movl	(%rdi), %eax
	cmpl	$2, %eax
	jl	.LBB36_2
# %bb.1:
	decl	%eax
	movl	%eax, (%rdi)
.LBB36_4:
	movq	8(%rsi), %r15
	movl	(%rsi), %eax
	cmpl	$2, %eax
	jl	.LBB36_6
# %bb.5:
	decl	%eax
	movl	%eax, (%rsi)
.LBB36_8:
	movq	8(%rdx), %r14
	movl	(%rdx), %eax
	cmpl	$2, %eax
	jl	.LBB36_10
# %bb.9:
	decl	%eax
	movl	%eax, (%rdx)
.LBB36_12:
	cmpq	%r15, %rbx
	jbe	.LBB36_18
# %bb.13:
	movabsq	$-4658895280553007687, %rax     # imm = 0xBF58476D1CE4E5B9
	movabsq	$-7046029254386353131, %rcx     # imm = 0x9E3779B97F4A7C15
	movabsq	$-7723592293110705685, %rdx     # imm = 0x94D049BB133111EB
	movl	%ebx, %edi
	subl	%r15d, %edi
	leaq	1(%r15), %rsi
	testb	$1, %dil
	je	.LBB36_15
# %bb.14:
	addq	%rcx, %r15
	xorq	%r14, %r15
	imulq	%rax, %r15
	movq	%r15, %rdi
	shrq	$29, %rdi
	xorq	%r15, %rdi
	imulq	%rdx, %rdi
	movq	%rdi, %r14
	shrq	$31, %r14
	xorq	%rdi, %r14
	movq	%rsi, %r15
.LBB36_15:
	cmpq	%rsi, %rbx
	je	.LBB36_18
# %bb.16:
	addq	%r15, %rcx
	subq	%r15, %rbx
	.p2align	4
.LBB36_17:                              # =>This Inner Loop Header: Depth=1
	xorq	%rcx, %r14
	imulq	%rax, %r14
	movq	%r14, %rsi
	shrq	$29, %rsi
	xorq	%r14, %rsi
	imulq	%rdx, %rsi
	leaq	1(%rcx), %rdi
	xorq	%rsi, %rdi
	shrq	$31, %rsi
	xorq	%rdi, %rsi
	imulq	%rax, %rsi
	movq	%rsi, %rdi
	shrq	$29, %rdi
	xorq	%rsi, %rdi
	imulq	%rdx, %rdi
	movq	%rdi, %r14
	shrq	$31, %r14
	xorq	%rdi, %r14
	addq	$2, %rcx
	addq	$-2, %rbx
	jne	.LBB36_17
.LBB36_18:
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB36_20
# %bb.19:
	movabsq	$68719476737, %rcx              # imm = 0x1000000001
	movq	%rcx, (%rax)
	movq	%r14, 8(%rax)
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.LBB36_2:
	.cfi_def_cfa_offset 32
	testl	%eax, %eax
	je	.LBB36_4
# %bb.3:
	movq	%rdx, %r14
	movq	%rsi, %r15
	callq	lean_dec_ref_cold@PLT
	movq	%r15, %rsi
	movq	%r14, %rdx
	jmp	.LBB36_4
.LBB36_6:
	testl	%eax, %eax
	je	.LBB36_8
# %bb.7:
	movq	%rsi, %rdi
	movq	%rdx, %r14
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rdx
	jmp	.LBB36_8
.LBB36_10:
	testl	%eax, %eax
	je	.LBB36_12
# %bb.11:
	movq	%rdx, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB36_12
.LBB36_20:
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end36:
	.size	l_LoopStudy_tailPair___splitProd___boxed, .Lfunc_end36-l_LoopStudy_tailPair___splitProd___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l_LoopStudy_tailPair,"ax",@progbits
	.hidden	l_LoopStudy_tailPair            # -- Begin function l_LoopStudy_tailPair
	.globl	l_LoopStudy_tailPair
	.p2align	4
	.type	l_LoopStudy_tailPair,@function
l_LoopStudy_tailPair:                   # @l_LoopStudy_tailPair
	.cfi_startproc
# %bb.0:
	movq	8(%rsi), %rax
	movq	16(%rsi), %rcx
	movq	8(%rax), %r8
	movq	8(%rcx), %rax
	cmpq	%r8, %rdi
	jbe	.LBB37_6
# %bb.1:
	movabsq	$-4658895280553007687, %rcx     # imm = 0xBF58476D1CE4E5B9
	movabsq	$-7046029254386353131, %rdx     # imm = 0x9E3779B97F4A7C15
	movabsq	$-7723592293110705685, %rsi     # imm = 0x94D049BB133111EB
	movl	%edi, %r10d
	subl	%r8d, %r10d
	leaq	1(%r8), %r9
	testb	$1, %r10b
	je	.LBB37_3
# %bb.2:
	addq	%rdx, %r8
	xorq	%rax, %r8
	imulq	%rcx, %r8
	movq	%r8, %r10
	shrq	$29, %r10
	xorq	%r8, %r10
	imulq	%rsi, %r10
	movq	%r10, %rax
	shrq	$31, %rax
	xorq	%r10, %rax
	movq	%r9, %r8
.LBB37_3:
	cmpq	%r9, %rdi
	je	.LBB37_6
# %bb.4:
	addq	%r8, %rdx
	subq	%r8, %rdi
	.p2align	4
.LBB37_5:                               # =>This Inner Loop Header: Depth=1
	xorq	%rdx, %rax
	imulq	%rcx, %rax
	movq	%rax, %r8
	shrq	$29, %r8
	xorq	%rax, %r8
	imulq	%rsi, %r8
	leaq	1(%rdx), %rax
	xorq	%r8, %rax
	shrq	$31, %r8
	xorq	%rax, %r8
	imulq	%rcx, %r8
	movq	%r8, %r9
	shrq	$29, %r9
	xorq	%r8, %r9
	imulq	%rsi, %r9
	movq	%r9, %rax
	shrq	$31, %rax
	xorq	%r9, %rax
	addq	$2, %rdx
	addq	$-2, %rdi
	jne	.LBB37_5
.LBB37_6:
	retq
.Lfunc_end37:
	.size	l_LoopStudy_tailPair, .Lfunc_end37-l_LoopStudy_tailPair
	.cfi_endproc
                                        # -- End function
	.section	.text.l_LoopStudy_tailPair___boxed,"ax",@progbits
	.hidden	l_LoopStudy_tailPair___boxed    # -- Begin function l_LoopStudy_tailPair___boxed
	.globl	l_LoopStudy_tailPair___boxed
	.p2align	4
	.type	l_LoopStudy_tailPair___boxed,@function
l_LoopStudy_tailPair___boxed:           # @l_LoopStudy_tailPair___boxed
	.cfi_startproc
# %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	8(%rdi), %rbx
	movl	(%rdi), %eax
	cmpl	$2, %eax
	jl	.LBB38_2
# %bb.1:
	decl	%eax
	movl	%eax, (%rdi)
.LBB38_4:
	movq	8(%rsi), %rax
	movq	16(%rsi), %rcx
	movq	8(%rax), %rdi
	movq	8(%rcx), %r14
	cmpq	%rdi, %rbx
	jbe	.LBB38_10
# %bb.5:
	movabsq	$-4658895280553007687, %rax     # imm = 0xBF58476D1CE4E5B9
	movabsq	$-7046029254386353131, %rcx     # imm = 0x9E3779B97F4A7C15
	movabsq	$-7723592293110705685, %rdx     # imm = 0x94D049BB133111EB
	movl	%ebx, %r9d
	subl	%edi, %r9d
	leaq	1(%rdi), %r8
	testb	$1, %r9b
	je	.LBB38_7
# %bb.6:
	addq	%rcx, %rdi
	xorq	%r14, %rdi
	imulq	%rax, %rdi
	movq	%rdi, %r9
	shrq	$29, %r9
	xorq	%rdi, %r9
	imulq	%rdx, %r9
	movq	%r9, %r14
	shrq	$31, %r14
	xorq	%r9, %r14
	movq	%r8, %rdi
.LBB38_7:
	cmpq	%r8, %rbx
	je	.LBB38_10
# %bb.8:
	addq	%rdi, %rcx
	subq	%rdi, %rbx
	.p2align	4
.LBB38_9:                               # =>This Inner Loop Header: Depth=1
	xorq	%rcx, %r14
	imulq	%rax, %r14
	movq	%r14, %rdi
	shrq	$29, %rdi
	xorq	%r14, %rdi
	imulq	%rdx, %rdi
	leaq	1(%rcx), %r8
	xorq	%rdi, %r8
	shrq	$31, %rdi
	xorq	%r8, %rdi
	imulq	%rax, %rdi
	movq	%rdi, %r8
	shrq	$29, %r8
	xorq	%rdi, %r8
	imulq	%rdx, %r8
	movq	%r8, %r14
	shrq	$31, %r14
	xorq	%r8, %r14
	addq	$2, %rcx
	addq	$-2, %rbx
	jne	.LBB38_9
.LBB38_10:
	movl	(%rsi), %eax
	cmpl	$2, %eax
	jl	.LBB38_12
# %bb.11:
	decl	%eax
	movl	%eax, (%rsi)
.LBB38_14:
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB38_16
# %bb.15:
	movabsq	$68719476737, %rcx              # imm = 0x1000000001
	movq	%rcx, (%rax)
	movq	%r14, 8(%rax)
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.LBB38_2:
	.cfi_def_cfa_offset 32
	testl	%eax, %eax
	je	.LBB38_4
# %bb.3:
	movq	%rsi, %r14
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rsi
	jmp	.LBB38_4
.LBB38_12:
	testl	%eax, %eax
	je	.LBB38_14
# %bb.13:
	movq	%rsi, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB38_14
.LBB38_16:
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end38:
	.size	l_LoopStudy_tailPair___boxed, .Lfunc_end38-l_LoopStudy_tailPair___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l_LoopStudy_tailPairReturn___splitProd,"ax",@progbits
	.hidden	l_LoopStudy_tailPairReturn___splitProd # -- Begin function l_LoopStudy_tailPairReturn___splitProd
	.globl	l_LoopStudy_tailPairReturn___splitProd
	.p2align	4
	.type	l_LoopStudy_tailPairReturn___splitProd,@function
l_LoopStudy_tailPairReturn___splitProd: # @l_LoopStudy_tailPairReturn___splitProd
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdx, %r14
	movq	%rsi, %rbx
	cmpq	%rsi, %rdi
	jbe	.LBB39_5
# %bb.1:
	movabsq	$-4658895280553007687, %rax     # imm = 0xBF58476D1CE4E5B9
	movabsq	$-7046029254386353131, %rcx     # imm = 0x9E3779B97F4A7C15
	movabsq	$-7723592293110705685, %rdx     # imm = 0x94D049BB133111EB
	movl	%edi, %r8d
	subl	%ebx, %r8d
	leaq	1(%rbx), %rsi
	testb	$1, %r8b
	je	.LBB39_3
# %bb.2:
	addq	%rcx, %rbx
	xorq	%r14, %rbx
	imulq	%rax, %rbx
	movq	%rbx, %r8
	shrq	$29, %r8
	xorq	%rbx, %r8
	imulq	%rdx, %r8
	movq	%r8, %r14
	shrq	$31, %r14
	xorq	%r8, %r14
	movq	%rsi, %rbx
.LBB39_3:
	cmpq	%rsi, %rdi
	je	.LBB39_4
# %bb.9:
	addq	%rbx, %rcx
	.p2align	4
.LBB39_10:                              # =>This Inner Loop Header: Depth=1
	xorq	%rcx, %r14
	imulq	%rax, %r14
	movq	%r14, %rsi
	shrq	$29, %rsi
	xorq	%r14, %rsi
	imulq	%rdx, %rsi
	addq	$2, %rbx
	leaq	1(%rcx), %r8
	xorq	%rsi, %r8
	shrq	$31, %rsi
	xorq	%r8, %rsi
	imulq	%rax, %rsi
	movq	%rsi, %r8
	shrq	$29, %r8
	xorq	%rsi, %r8
	imulq	%rdx, %r8
	movq	%r8, %r14
	shrq	$31, %r14
	xorq	%r8, %r14
	addq	$2, %rcx
	cmpq	%rbx, %rdi
	jne	.LBB39_10
.LBB39_4:
	movq	%rdi, %rbx
.LBB39_5:
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB39_11
# %bb.6:
	movq	%rax, %r15
	movabsq	$68719476737, %r12              # imm = 0x1000000001
	movq	%r12, (%rax)
	movq	%rbx, 8(%rax)
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB39_11
# %bb.7:
	movq	%rax, %rbx
	movq	%r12, (%rax)
	movq	%r14, 8(%rax)
	callq	lean_inc_heartbeat@PLT
	movl	$24, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB39_11
# %bb.8:
	movabsq	$563053032636417, %rcx          # imm = 0x2001800000001
	movq	%rcx, (%rax)
	movq	%r15, 8(%rax)
	movq	%rbx, 16(%rax)
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.LBB39_11:
	.cfi_def_cfa_offset 48
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end39:
	.size	l_LoopStudy_tailPairReturn___splitProd, .Lfunc_end39-l_LoopStudy_tailPairReturn___splitProd
	.cfi_endproc
                                        # -- End function
	.section	.text.l_LoopStudy_tailPairReturn___splitProd___boxed,"ax",@progbits
	.hidden	l_LoopStudy_tailPairReturn___splitProd___boxed # -- Begin function l_LoopStudy_tailPairReturn___splitProd___boxed
	.globl	l_LoopStudy_tailPairReturn___splitProd___boxed
	.p2align	4
	.type	l_LoopStudy_tailPairReturn___splitProd___boxed,@function
l_LoopStudy_tailPairReturn___splitProd___boxed: # @l_LoopStudy_tailPairReturn___splitProd___boxed
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rsi, %rbx
	movq	%rdi, %rax
	movq	8(%rdi), %rdi
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB40_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB40_4:
	movq	8(%rbx), %rsi
	movl	(%rbx), %eax
	cmpl	$2, %eax
	jl	.LBB40_6
# %bb.5:
	decl	%eax
	movl	%eax, (%rbx)
.LBB40_8:
	movq	8(%rdx), %rbx
	movl	(%rdx), %eax
	cmpl	$2, %eax
	jl	.LBB40_10
# %bb.9:
	decl	%eax
	movl	%eax, (%rdx)
.LBB40_12:
	movq	%rbx, %rdx
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	l_LoopStudy_tailPairReturn___splitProd # TAILCALL
.LBB40_2:
	.cfi_def_cfa_offset 32
	testl	%ecx, %ecx
	je	.LBB40_4
# %bb.3:
	movq	%rdi, %r14
	movq	%rax, %rdi
	movq	%rdx, %r15
	callq	lean_dec_ref_cold@PLT
	movq	%r15, %rdx
	movq	%r14, %rdi
	jmp	.LBB40_4
.LBB40_6:
	testl	%eax, %eax
	je	.LBB40_8
# %bb.7:
	movq	%rdi, %r14
	movq	%rbx, %rdi
	movq	%rdx, %rbx
	movq	%rsi, %r15
	callq	lean_dec_ref_cold@PLT
	movq	%r15, %rsi
	movq	%rbx, %rdx
	movq	%r14, %rdi
	jmp	.LBB40_8
.LBB40_10:
	testl	%eax, %eax
	je	.LBB40_12
# %bb.11:
	movq	%rdi, %r14
	movq	%rdx, %rdi
	movq	%rsi, %r15
	callq	lean_dec_ref_cold@PLT
	movq	%r15, %rsi
	movq	%r14, %rdi
	jmp	.LBB40_12
.Lfunc_end40:
	.size	l_LoopStudy_tailPairReturn___splitProd___boxed, .Lfunc_end40-l_LoopStudy_tailPairReturn___splitProd___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l_LoopStudy_tailPairReturn,"ax",@progbits
	.hidden	l_LoopStudy_tailPairReturn      # -- Begin function l_LoopStudy_tailPairReturn
	.globl	l_LoopStudy_tailPairReturn
	.p2align	4
	.type	l_LoopStudy_tailPairReturn,@function
l_LoopStudy_tailPairReturn:             # @l_LoopStudy_tailPairReturn
	.cfi_startproc
# %bb.0:
	movq	8(%rsi), %rax
	movq	16(%rsi), %rcx
	movq	8(%rax), %rsi
	movq	8(%rcx), %rdx
	jmp	l_LoopStudy_tailPairReturn___splitProd # TAILCALL
.Lfunc_end41:
	.size	l_LoopStudy_tailPairReturn, .Lfunc_end41-l_LoopStudy_tailPairReturn
	.cfi_endproc
                                        # -- End function
	.section	.text.l_LoopStudy_tailPairReturn___boxed,"ax",@progbits
	.hidden	l_LoopStudy_tailPairReturn___boxed # -- Begin function l_LoopStudy_tailPairReturn___boxed
	.globl	l_LoopStudy_tailPairReturn___boxed
	.p2align	4
	.type	l_LoopStudy_tailPairReturn___boxed,@function
l_LoopStudy_tailPairReturn___boxed:     # @l_LoopStudy_tailPairReturn___boxed
	.cfi_startproc
# %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rsi, %rbx
	movq	%rdi, %rax
	movq	8(%rdi), %rdi
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB42_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB42_4:
	movq	8(%rbx), %rax
	movq	16(%rbx), %rcx
	movq	8(%rax), %rsi
	movq	8(%rcx), %rdx
	callq	l_LoopStudy_tailPairReturn___splitProd
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB42_6
# %bb.5:
	decl	%ecx
	movl	%ecx, (%rbx)
.LBB42_8:
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.LBB42_2:
	.cfi_def_cfa_offset 32
	testl	%ecx, %ecx
	je	.LBB42_4
# %bb.3:
	movq	%rdi, %r14
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rdi
	jmp	.LBB42_4
.LBB42_6:
	testl	%ecx, %ecx
	je	.LBB42_8
# %bb.7:
	movq	%rbx, %rdi
	movq	%rax, %rbx
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rax
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end42:
	.size	l_LoopStudy_tailPairReturn___boxed, .Lfunc_end42-l_LoopStudy_tailPairReturn___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___redArg,"ax",@progbits
	.hidden	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___redArg # -- Begin function l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___redArg
	.globl	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___redArg
	.p2align	4
	.type	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___redArg,@function
l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___redArg: # @l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___redArg
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	8(%rsi), %rbp
	cmpq	%rdi, %rbp
	jae	.LBB43_1
# %bb.2:
	movq	%rdi, %rbx
	movq	16(%rsi), %r13
	movabsq	$-7046029254386353131, %rdi     # imm = 0x9E3779B97F4A7C15
	movabsq	$-4658895280553007687, %r15     # imm = 0xBF58476D1CE4E5B9
	movabsq	$-7723592293110705685, %r12     # imm = 0x94D049BB133111EB
	jmp	.LBB43_3
	.p2align	4
.LBB43_13:                              #   in Loop: Header=BB43_3 Depth=1
	leaq	1(%rbp), %rcx
	addq	%rdi, %rbp
	xorq	%r13, %rbp
	imulq	%r15, %rbp
	movq	%rbp, %rdx
	shrq	$29, %rdx
	xorq	%rbp, %rdx
	imulq	%r12, %rdx
	movq	%rdx, %r13
	shrq	$31, %r13
	xorq	%rdx, %r13
	movq	%rcx, 8(%rax)
	movq	%r13, 16(%rax)
	movq	%rcx, %rbp
	movq	%rax, %rsi
	cmpq	%rcx, %rbx
	je	.LBB43_14
.LBB43_3:                               # =>This Inner Loop Header: Depth=1
	movl	(%rsi), %r14d
	cmpl	$1, %r14d
	jne	.LBB43_5
# %bb.4:                                #   in Loop: Header=BB43_3 Depth=1
	movq	%rsi, %rax
	jmp	.LBB43_10
	.p2align	4
.LBB43_5:                               #   in Loop: Header=BB43_3 Depth=1
	movl	$1, %eax
	testb	$1, %sil
	jne	.LBB43_10
# %bb.6:                                #   in Loop: Header=BB43_3 Depth=1
	cmpl	$2, %r14d
	jl	.LBB43_8
# %bb.7:                                #   in Loop: Header=BB43_3 Depth=1
	leal	-1(%r14), %ecx
	movl	%ecx, (%rsi)
.LBB43_10:                              #   in Loop: Header=BB43_3 Depth=1
	cmpl	$1, %r14d
	je	.LBB43_13
# %bb.11:                               #   in Loop: Header=BB43_3 Depth=1
	movq	%rdi, %r14
	callq	lean_inc_heartbeat@PLT
	movl	$24, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB43_15
# %bb.12:                               #   in Loop: Header=BB43_3 Depth=1
	movabsq	$103079215105, %rcx             # imm = 0x1800000001
	movq	%rcx, (%rax)
	movq	%r14, %rdi
	jmp	.LBB43_13
.LBB43_8:                               #   in Loop: Header=BB43_3 Depth=1
	testl	%r14d, %r14d
	je	.LBB43_10
# %bb.9:                                #   in Loop: Header=BB43_3 Depth=1
	movq	%rsi, %rdi
	callq	lean_dec_ref_cold@PLT
	movabsq	$-7046029254386353131, %rdi     # imm = 0x9E3779B97F4A7C15
	movl	$1, %eax
	jmp	.LBB43_10
.LBB43_1:
	movq	%rsi, %rax
.LBB43_14:
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB43_15:
	.cfi_def_cfa_offset 64
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end43:
	.size	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___redArg, .Lfunc_end43-l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___redArg
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___redArg___boxed,"ax",@progbits
	.hidden	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___redArg___boxed # -- Begin function l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___redArg___boxed
	.globl	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___redArg___boxed
	.p2align	4
	.type	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___redArg___boxed,@function
l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___redArg___boxed: # @l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___redArg___boxed
	.cfi_startproc
# %bb.0:
	movq	%rdi, %rax
	movq	8(%rdi), %rdi
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB44_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%rax)
	jmp	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___redArg # TAILCALL
.LBB44_2:
	testl	%ecx, %ecx
	je	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___redArg # TAILCALL
# %bb.3:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdi, %rbx
	movq	%rax, %rdi
	movq	%rsi, %r14
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rdi
	movq	%r14, %rsi
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	.cfi_restore %rbx
	.cfi_restore %r14
	jmp	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___redArg # TAILCALL
.Lfunc_end44:
	.size	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___redArg___boxed, .Lfunc_end44-l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___redArg___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l_LoopStudy_whileStruct,"ax",@progbits
	.hidden	l_LoopStudy_whileStruct         # -- Begin function l_LoopStudy_whileStruct
	.globl	l_LoopStudy_whileStruct
	.p2align	4
	.type	l_LoopStudy_whileStruct,@function
l_LoopStudy_whileStruct:                # @l_LoopStudy_whileStruct
	.cfi_startproc
# %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rsi, %r14
	movq	%rdi, %rbx
	callq	lean_inc_heartbeat@PLT
	movl	$24, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB45_6
# %bb.1:
	movabsq	$103079215105, %rcx             # imm = 0x1800000001
	movq	%rcx, (%rax)
	movq	$0, 8(%rax)
	movq	%r14, 16(%rax)
	movq	%rbx, %rdi
	movq	%rax, %rsi
	callq	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___redArg
	movq	%rax, %rdi
	movq	16(%rax), %rax
	movl	(%rdi), %ecx
	cmpl	$2, %ecx
	jl	.LBB45_3
# %bb.2:
	decl	%ecx
	movl	%ecx, (%rdi)
.LBB45_5:
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.LBB45_3:
	.cfi_def_cfa_offset 32
	testl	%ecx, %ecx
	je	.LBB45_5
# %bb.4:
	movq	%rax, %rbx
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rax
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.LBB45_6:
	.cfi_def_cfa_offset 32
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end45:
	.size	l_LoopStudy_whileStruct, .Lfunc_end45-l_LoopStudy_whileStruct
	.cfi_endproc
                                        # -- End function
	.section	.text.l_LoopStudy_whileStruct___boxed,"ax",@progbits
	.hidden	l_LoopStudy_whileStruct___boxed # -- Begin function l_LoopStudy_whileStruct___boxed
	.globl	l_LoopStudy_whileStruct___boxed
	.p2align	4
	.type	l_LoopStudy_whileStruct___boxed,@function
l_LoopStudy_whileStruct___boxed:        # @l_LoopStudy_whileStruct___boxed
	.cfi_startproc
# %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	8(%rdi), %rbx
	movl	(%rdi), %eax
	cmpl	$2, %eax
	jl	.LBB46_2
# %bb.1:
	decl	%eax
	movl	%eax, (%rdi)
.LBB46_4:
	movq	8(%rsi), %r14
	movl	(%rsi), %eax
	cmpl	$2, %eax
	jl	.LBB46_6
# %bb.5:
	decl	%eax
	movl	%eax, (%rsi)
.LBB46_8:
	callq	lean_inc_heartbeat@PLT
	movl	$24, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB46_15
# %bb.9:
	movabsq	$103079215105, %rcx             # imm = 0x1800000001
	movq	%rcx, (%rax)
	movq	$0, 8(%rax)
	movq	%r14, 16(%rax)
	movq	%rbx, %rdi
	movq	%rax, %rsi
	callq	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___redArg
	movq	16(%rax), %rbx
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB46_11
# %bb.10:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB46_13:
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB46_15
# %bb.14:
	movabsq	$68719476737, %rcx              # imm = 0x1000000001
	movq	%rcx, (%rax)
	movq	%rbx, 8(%rax)
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.LBB46_2:
	.cfi_def_cfa_offset 32
	testl	%eax, %eax
	je	.LBB46_4
# %bb.3:
	movq	%rsi, %r14
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rsi
	jmp	.LBB46_4
.LBB46_6:
	testl	%eax, %eax
	je	.LBB46_8
# %bb.7:
	movq	%rsi, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB46_8
.LBB46_11:
	testl	%ecx, %ecx
	je	.LBB46_13
# %bb.12:
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB46_13
.LBB46_15:
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end46:
	.size	l_LoopStudy_whileStruct___boxed, .Lfunc_end46-l_LoopStudy_whileStruct___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0,"ax",@progbits
	.hidden	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0 # -- Begin function l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0
	.globl	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0
	.p2align	4
	.type	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0,@function
l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0: # @l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0
	.cfi_startproc
# %bb.0:
	movq	%rdx, %rsi
	jmp	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___redArg # TAILCALL
.Lfunc_end47:
	.size	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0, .Lfunc_end47-l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___boxed,"ax",@progbits
	.hidden	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___boxed # -- Begin function l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___boxed
	.globl	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___boxed
	.p2align	4
	.type	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___boxed,@function
l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___boxed: # @l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___boxed
	.cfi_startproc
# %bb.0:
	movq	%rdi, %rax
	movq	8(%rdi), %rdi
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB48_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%rax)
	movq	%rdx, %rsi
	jmp	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___redArg # TAILCALL
.LBB48_2:
	testl	%ecx, %ecx
	je	.LBB48_4
# %bb.3:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdi, %rbx
	movq	%rax, %rdi
	movq	%rdx, %r14
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rdi
	movq	%r14, %rdx
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	.cfi_restore %rbx
	.cfi_restore %r14
.LBB48_4:
	movq	%rdx, %rsi
	jmp	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___redArg # TAILCALL
.Lfunc_end48:
	.size	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___boxed, .Lfunc_end48-l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l_LoopStudy_tailStruct,"ax",@progbits
	.hidden	l_LoopStudy_tailStruct          # -- Begin function l_LoopStudy_tailStruct
	.globl	l_LoopStudy_tailStruct
	.p2align	4
	.type	l_LoopStudy_tailStruct,@function
l_LoopStudy_tailStruct:                 # @l_LoopStudy_tailStruct
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	8(%rsi), %r15
	movq	16(%rsi), %rbx
	movabsq	$-7046029254386353131, %rdx     # imm = 0x9E3779B97F4A7C15
	movabsq	$-4658895280553007687, %rbp     # imm = 0xBF58476D1CE4E5B9
	movabsq	$-7723592293110705685, %r12     # imm = 0x94D049BB133111EB
	movabsq	$7046029254386353132, %r14      # imm = 0x61C8864680B583EC
	movq	%rdi, (%rsp)                    # 8-byte Spill
	jmp	.LBB49_1
	.p2align	4
.LBB49_15:                              #   in Loop: Header=BB49_1 Depth=1
	addq	%rdx, %r15
	xorq	%r15, %rbx
	imulq	%rbp, %rbx
	movq	%rbx, %rcx
	shrq	$29, %rcx
	xorq	%rbx, %rcx
	imulq	%r12, %rcx
	movq	%rcx, %rbx
	shrq	$31, %rbx
	xorq	%rcx, %rbx
	addq	%r14, %r15
	movq	%r15, 8(%rax)
	movq	%rbx, 16(%rax)
	movq	%rax, %rsi
.LBB49_1:                               # =>This Inner Loop Header: Depth=1
	movl	(%rsi), %r13d
	cmpl	$1, %r13d
	jne	.LBB49_3
# %bb.2:                                #   in Loop: Header=BB49_1 Depth=1
	movq	%rsi, %rax
	jmp	.LBB49_8
	.p2align	4
.LBB49_3:                               #   in Loop: Header=BB49_1 Depth=1
	movl	$1, %eax
	testb	$1, %sil
	jne	.LBB49_8
# %bb.4:                                #   in Loop: Header=BB49_1 Depth=1
	cmpl	$2, %r13d
	jl	.LBB49_6
# %bb.5:                                #   in Loop: Header=BB49_1 Depth=1
	leal	-1(%r13), %ecx
	movl	%ecx, (%rsi)
.LBB49_8:                               #   in Loop: Header=BB49_1 Depth=1
	cmpq	%rdi, %r15
	jae	.LBB49_9
# %bb.12:                               #   in Loop: Header=BB49_1 Depth=1
	cmpl	$1, %r13d
	je	.LBB49_15
# %bb.13:                               #   in Loop: Header=BB49_1 Depth=1
	movq	%rdx, %r13
	callq	lean_inc_heartbeat@PLT
	movl	$24, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB49_16
# %bb.14:                               #   in Loop: Header=BB49_1 Depth=1
	movabsq	$103079215105, %rcx             # imm = 0x1800000001
	movq	%rcx, (%rax)
	movq	%r13, %rdx
	movq	(%rsp), %rdi                    # 8-byte Reload
	jmp	.LBB49_15
.LBB49_6:                               #   in Loop: Header=BB49_1 Depth=1
	testl	%r13d, %r13d
	je	.LBB49_8
# %bb.7:                                #   in Loop: Header=BB49_1 Depth=1
	movq	%rsi, %rdi
	callq	lean_dec_ref_cold@PLT
	movq	(%rsp), %rdi                    # 8-byte Reload
	movabsq	$-7046029254386353131, %rdx     # imm = 0x9E3779B97F4A7C15
	movl	$1, %eax
	jmp	.LBB49_8
.LBB49_9:
	testb	$1, %al
	jne	.LBB49_11
# %bb.10:
	movq	%rax, %rdi
	callq	lean_free_object@PLT
.LBB49_11:
	movq	%rbx, %rax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB49_16:
	.cfi_def_cfa_offset 64
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end49:
	.size	l_LoopStudy_tailStruct, .Lfunc_end49-l_LoopStudy_tailStruct
	.cfi_endproc
                                        # -- End function
	.section	.text.l_LoopStudy_tailStruct___boxed,"ax",@progbits
	.hidden	l_LoopStudy_tailStruct___boxed  # -- Begin function l_LoopStudy_tailStruct___boxed
	.globl	l_LoopStudy_tailStruct___boxed
	.p2align	4
	.type	l_LoopStudy_tailStruct___boxed,@function
l_LoopStudy_tailStruct___boxed:         # @l_LoopStudy_tailStruct___boxed
	.cfi_startproc
# %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdi, %rax
	movq	8(%rdi), %rdi
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB50_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB50_4:
	callq	l_LoopStudy_tailStruct
	movq	%rax, %rbx
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB50_6
# %bb.5:
	movabsq	$68719476737, %rcx              # imm = 0x1000000001
	movq	%rcx, (%rax)
	movq	%rbx, 8(%rax)
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.LBB50_2:
	.cfi_def_cfa_offset 32
	testl	%ecx, %ecx
	je	.LBB50_4
# %bb.3:
	movq	%rdi, %rbx
	movq	%rax, %rdi
	movq	%rsi, %r14
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rdi
	movq	%r14, %rsi
	jmp	.LBB50_4
.LBB50_6:
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end50:
	.size	l_LoopStudy_tailStruct___boxed, .Lfunc_end50-l_LoopStudy_tailStruct___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l_LoopStudy_tailFuel,"ax",@progbits
	.hidden	l_LoopStudy_tailFuel            # -- Begin function l_LoopStudy_tailFuel
	.globl	l_LoopStudy_tailFuel
	.p2align	4
	.type	l_LoopStudy_tailFuel,@function
l_LoopStudy_tailFuel:                   # @l_LoopStudy_tailFuel
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdx, %rax
	movabsq	$-7046029254386353131, %r15     # imm = 0x9E3779B97F4A7C15
	addq	%rsi, %r15
	movabsq	$-4658895280553007687, %r12     # imm = 0xBF58476D1CE4E5B9
	movabsq	$-7723592293110705685, %r13     # imm = 0x94D049BB133111EB
	jmp	.LBB51_1
.LBB51_10:                              #   in Loop: Header=BB51_1 Depth=1
	decl	%eax
	movl	%eax, (%r14)
.LBB51_13:                              #   in Loop: Header=BB51_1 Depth=1
	movq	%rbp, %rax
	.p2align	4
.LBB51_14:                              #   in Loop: Header=BB51_1 Depth=1
	xorq	%r15, %rax
	imulq	%r12, %rax
	movq	%rax, %rcx
	shrq	$29, %rcx
	xorq	%rax, %rcx
	imulq	%r13, %rcx
	movq	%rcx, %rax
	shrq	$31, %rax
	xorq	%rcx, %rax
	incq	%r15
	movq	%rbx, %rdi
.LBB51_1:                               # =>This Inner Loop Header: Depth=1
	testb	$1, %dil
	je	.LBB51_2
# %bb.15:                               #   in Loop: Header=BB51_1 Depth=1
	cmpq	$1, %rdi
	je	.LBB51_16
# %bb.7:                                #   in Loop: Header=BB51_1 Depth=1
	movl	$1, %ebx
	jbe	.LBB51_14
# %bb.8:                                #   in Loop: Header=BB51_1 Depth=1
	addq	$-2, %rdi
	movq	%rdi, %rbx
	jmp	.LBB51_14
.LBB51_2:                               #   in Loop: Header=BB51_1 Depth=1
	movq	%rax, %rbp
	movl	$1, %esi
	movq	%rdi, %r14
	callq	lean_nat_big_eq@PLT
	testb	%al, %al
	jne	.LBB51_3
# %bb.9:                                #   in Loop: Header=BB51_1 Depth=1
	movl	$3, %esi
	movq	%r14, %rdi
	callq	lean_nat_big_sub@PLT
	movq	%rax, %rbx
	movl	(%r14), %eax
	cmpl	$2, %eax
	jge	.LBB51_10
# %bb.11:                               #   in Loop: Header=BB51_1 Depth=1
	testl	%eax, %eax
	je	.LBB51_13
# %bb.12:                               #   in Loop: Header=BB51_1 Depth=1
	movq	%r14, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB51_13
.LBB51_3:
	movl	(%r14), %ecx
	cmpl	$2, %ecx
	movq	%rbp, %rax
	jl	.LBB51_5
# %bb.4:
	decl	%ecx
	movl	%ecx, (%r14)
.LBB51_16:
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB51_5:
	.cfi_def_cfa_offset 64
	testl	%ecx, %ecx
	je	.LBB51_16
# %bb.6:
	movq	%r14, %rdi
	callq	lean_dec_ref_cold@PLT
	movq	%rbp, %rax
	jmp	.LBB51_16
.Lfunc_end51:
	.size	l_LoopStudy_tailFuel, .Lfunc_end51-l_LoopStudy_tailFuel
	.cfi_endproc
                                        # -- End function
	.section	.text.l_LoopStudy_tailFuel___boxed,"ax",@progbits
	.hidden	l_LoopStudy_tailFuel___boxed    # -- Begin function l_LoopStudy_tailFuel___boxed
	.globl	l_LoopStudy_tailFuel___boxed
	.p2align	4
	.type	l_LoopStudy_tailFuel___boxed,@function
l_LoopStudy_tailFuel___boxed:           # @l_LoopStudy_tailFuel___boxed
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rsi, %rax
	movq	8(%rsi), %rsi
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB52_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB52_4:
	movq	8(%rdx), %rbx
	movl	(%rdx), %eax
	cmpl	$2, %eax
	jl	.LBB52_6
# %bb.5:
	decl	%eax
	movl	%eax, (%rdx)
.LBB52_8:
	movq	%rbx, %rdx
	callq	l_LoopStudy_tailFuel
	movq	%rax, %rbx
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB52_10
# %bb.9:
	movabsq	$68719476737, %rcx              # imm = 0x1000000001
	movq	%rcx, (%rax)
	movq	%rbx, 8(%rax)
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.LBB52_2:
	.cfi_def_cfa_offset 32
	testl	%ecx, %ecx
	je	.LBB52_4
# %bb.3:
	movq	%rdi, %rbx
	movq	%rax, %rdi
	movq	%rsi, %r14
	movq	%rdx, %r15
	callq	lean_dec_ref_cold@PLT
	movq	%r15, %rdx
	movq	%rbx, %rdi
	movq	%r14, %rsi
	jmp	.LBB52_4
.LBB52_6:
	testl	%eax, %eax
	je	.LBB52_8
# %bb.7:
	movq	%rdi, %r14
	movq	%rdx, %rdi
	movq	%rsi, %r15
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rdi
	movq	%r15, %rsi
	jmp	.LBB52_8
.LBB52_10:
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end52:
	.size	l_LoopStudy_tailFuel___boxed, .Lfunc_end52-l_LoopStudy_tailFuel___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l_LoopStudy_runVariant,"ax",@progbits
	.hidden	l_LoopStudy_runVariant          # -- Begin function l_LoopStudy_runVariant
	.globl	l_LoopStudy_runVariant
	.p2align	4
	.type	l_LoopStudy_runVariant,@function
l_LoopStudy_runVariant:                 # @l_LoopStudy_runVariant
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdx, %rbx
	movq	%rsi, %r14
	leaq	l_LoopStudy_runVariant___closed__0_value(%rip), %rax
	cmpq	%rax, %rdi
	je	.LBB53_3
# %bb.1:
	movq	%rdi, %r15
	cmpq	$9, 8(%rdi)
	jne	.LBB53_11
# %bb.2:
	leaq	l_LoopStudy_runVariant___closed__0_value(%rip), %rsi
	movq	%r15, %rdi
	callq	lean_string_eq_cold@PLT
	testb	%al, %al
	je	.LBB53_11
.LBB53_3:
	movq	%r14, %rdi
	xorl	%esi, %esi
	movq	%rbx, %rdx
	callq	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___splitProd
	movq	16(%rax), %rbx
	testb	$1, %bl
	jne	.LBB53_6
# %bb.4:
	movl	(%rbx), %ecx
	testl	%ecx, %ecx
	jle	.LBB53_82
# %bb.5:
	incl	%ecx
	movl	%ecx, (%rbx)
.LBB53_6:
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB53_80
# %bb.7:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB53_8:
	movq	8(%rbx), %r14
	testb	$1, %bl
	jne	.LBB53_19
# %bb.9:
	movl	(%rbx), %eax
	cmpl	$2, %eax
	jl	.LBB53_84
# %bb.10:
	decl	%eax
	movl	%eax, (%rbx)
	jmp	.LBB53_19
.LBB53_11:
	leaq	l_LoopStudy_runVariant___closed__1_value(%rip), %rax
	cmpq	%rax, %r15
	je	.LBB53_14
# %bb.12:
	cmpq	$9, 8(%r15)
	jne	.LBB53_15
# %bb.13:
	leaq	l_LoopStudy_runVariant___closed__1_value(%rip), %rsi
	movq	%r15, %rdi
	callq	lean_string_eq_cold@PLT
	testb	%al, %al
	je	.LBB53_15
.LBB53_14:
	movq	%r14, %rdi
	movq	%rbx, %rsi
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	l_LoopStudy_ioWhile             # TAILCALL
.LBB53_15:
	.cfi_def_cfa_offset 48
	leaq	l_LoopStudy_runVariant___closed__2_value(%rip), %rax
	cmpq	%rax, %r15
	je	.LBB53_18
# %bb.16:
	cmpq	$8, 8(%r15)
	jne	.LBB53_24
# %bb.17:
	leaq	l_LoopStudy_runVariant___closed__2_value(%rip), %rsi
	movq	%r15, %rdi
	callq	lean_string_eq_cold@PLT
	testb	%al, %al
	je	.LBB53_24
.LBB53_18:
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	l_LoopStudy_forNat
	movq	%rax, %r14
.LBB53_19:
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB53_90
# %bb.20:
	movq	%rax, %rbx
	movabsq	$68719476737, %rax              # imm = 0x1000000001
	movq	%rax, (%rbx)
	movq	%r14, 8(%rbx)
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB53_90
# %bb.21:
	movabsq	$281543696187393, %rcx          # imm = 0x1001000000001
	movq	%rcx, (%rax)
.LBB53_22:
	movq	%rbx, 8(%rax)
.LBB53_23:
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.LBB53_24:
	.cfi_def_cfa_offset 48
	leaq	l_LoopStudy_runVariant___closed__3_value(%rip), %rax
	cmpq	%rax, %r15
	je	.LBB53_27
# %bb.25:
	cmpq	$10, 8(%r15)
	jne	.LBB53_30
# %bb.26:
	leaq	l_LoopStudy_runVariant___closed__3_value(%rip), %rsi
	movq	%r15, %rdi
	callq	lean_string_eq_cold@PLT
	testb	%al, %al
	je	.LBB53_30
.LBB53_27:
	testq	%r14, %r14
	je	.LBB53_45
# %bb.28:
	movabsq	$-4658895280553007687, %rcx     # imm = 0xBF58476D1CE4E5B9
	movabsq	$-7046029254386353131, %rdx     # imm = 0x9E3779B97F4A7C15
	movabsq	$-7723592293110705685, %rax     # imm = 0x94D049BB133111EB
	cmpq	$1, %r14
	jne	.LBB53_40
# %bb.29:
	xorl	%esi, %esi
	jmp	.LBB53_44
.LBB53_30:
	leaq	l_LoopStudy_runVariant___closed__4_value(%rip), %rax
	cmpq	%rax, %r15
	je	.LBB53_33
# %bb.31:
	cmpq	$12, 8(%r15)
	jne	.LBB53_36
# %bb.32:
	leaq	l_LoopStudy_runVariant___closed__4_value(%rip), %rsi
	movq	%r15, %rdi
	callq	lean_string_eq_cold@PLT
	testb	%al, %al
	je	.LBB53_36
.LBB53_33:
	testq	%r14, %r14
	je	.LBB53_62
# %bb.34:
	movabsq	$-4658895280553007687, %rcx     # imm = 0xBF58476D1CE4E5B9
	movabsq	$-7046029254386353131, %rdx     # imm = 0x9E3779B97F4A7C15
	movabsq	$-7723592293110705685, %rax     # imm = 0x94D049BB133111EB
	cmpq	$1, %r14
	jne	.LBB53_58
# %bb.35:
	xorl	%esi, %esi
	jmp	.LBB53_61
.LBB53_36:
	leaq	l_LoopStudy_runVariant___closed__5_value(%rip), %rax
	cmpq	%rax, %r15
	je	.LBB53_39
# %bb.37:
	cmpq	$10, 8(%r15)
	jne	.LBB53_48
# %bb.38:
	leaq	l_LoopStudy_runVariant___closed__5_value(%rip), %rsi
	movq	%r15, %rdi
	callq	lean_string_eq_cold@PLT
	testb	%al, %al
	je	.LBB53_48
.LBB53_39:
	movq	l_LoopStudy_runVariant___boxed__const__1(%rip), %r12
	movq	%rbx, %rdi
	callq	lean_box_uint64
	movq	%rax, %rbx
	xorl	%edi, %edi
	movl	$2, %esi
	xorl	%edx, %edx
	callq	lean_alloc_ctor
	movq	%rax, %r15
	movq	%r12, 8(%rax)
	movq	%rbx, 16(%rax)
	movq	%r14, %rdi
	movq	%rax, %rsi
	callq	l_LoopStudy_tailPair
	movq	%rax, %rbx
	movq	%r15, %rdi
	movl	$2, %esi
	callq	lean_dec_ref_known
	jmp	.LBB53_62
.LBB53_40:
	movq	%r14, %rdi
	andq	$-2, %rdi
	negq	%rdi
	xorl	%esi, %esi
	movq	%rdx, %r8
	.p2align	4
.LBB53_41:                              # =>This Inner Loop Header: Depth=1
	xorq	%r8, %rbx
	imulq	%rcx, %rbx
	movq	%rbx, %r9
	shrq	$29, %r9
	xorq	%rbx, %r9
	imulq	%rax, %r9
	leaq	1(%r8), %r10
	xorq	%r9, %r10
	shrq	$31, %r9
	xorq	%r10, %r9
	imulq	%rcx, %r9
	movq	%r9, %r10
	shrq	$29, %r10
	xorq	%r9, %r10
	imulq	%rax, %r10
	movq	%r10, %rbx
	shrq	$31, %rbx
	xorq	%r10, %rbx
	addq	$-2, %rsi
	addq	$2, %r8
	cmpq	%rsi, %rdi
	jne	.LBB53_41
# %bb.42:
	testb	$1, %r14b
	je	.LBB53_45
# %bb.43:
	negq	%rsi
.LBB53_44:
	addq	%rdx, %rsi
	xorq	%rbx, %rsi
	imulq	%rcx, %rsi
	movq	%rsi, %rcx
	shrq	$29, %rcx
	xorq	%rsi, %rcx
	imulq	%rax, %rcx
	movq	%rcx, %rbx
	shrq	$31, %rbx
	xorq	%rcx, %rbx
.LBB53_45:
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB53_90
# %bb.46:
	movq	%rax, %r14
	movabsq	$68719476737, %rax              # imm = 0x1000000001
	movq	%rax, (%r14)
	movq	%rbx, 8(%r14)
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB53_90
# %bb.47:
	movabsq	$281543696187393, %rcx          # imm = 0x1001000000001
	movq	%rcx, (%rax)
	movq	%r14, 8(%rax)
	jmp	.LBB53_23
.LBB53_48:
	leaq	l_LoopStudy_runVariant___closed__6_value(%rip), %rax
	cmpq	%rax, %r15
	je	.LBB53_51
# %bb.49:
	cmpq	$17, 8(%r15)
	jne	.LBB53_64
# %bb.50:
	leaq	l_LoopStudy_runVariant___closed__6_value(%rip), %rsi
	movq	%r15, %rdi
	callq	lean_string_eq_cold@PLT
	testb	%al, %al
	je	.LBB53_64
.LBB53_51:
	movq	l_LoopStudy_runVariant___boxed__const__1(%rip), %r12
	movq	%rbx, %rdi
	callq	lean_box_uint64
	movq	%rax, %rbx
	xorl	%edi, %edi
	movl	$2, %esi
	xorl	%edx, %edx
	callq	lean_alloc_ctor
	movq	%rax, %r15
	movq	%r12, 8(%rax)
	movq	%rbx, 16(%rax)
	movq	8(%r12), %rsi
	movq	8(%rbx), %rdx
	movq	%r14, %rdi
	callq	l_LoopStudy_tailPairReturn___splitProd
	movq	%rax, %rbx
	movq	%r15, %rdi
	movl	$2, %esi
	callq	lean_dec_ref_known
	movq	16(%rbx), %r14
	testb	$1, %r14b
	jne	.LBB53_54
# %bb.52:
	movl	(%r14), %eax
	testl	%eax, %eax
	jle	.LBB53_88
# %bb.53:
	incl	%eax
	movl	%eax, (%r14)
.LBB53_54:
	movl	(%rbx), %eax
	cmpl	$2, %eax
	jl	.LBB53_86
# %bb.55:
	decl	%eax
	movl	%eax, (%rbx)
.LBB53_56:
	xorl	%edi, %edi
.LBB53_57:
	movl	$1, %esi
	xorl	%edx, %edx
	callq	lean_alloc_ctor
	movq	%r14, 8(%rax)
	jmp	.LBB53_23
.LBB53_58:
	movq	%r14, %rdi
	andq	$-2, %rdi
	xorl	%esi, %esi
	movq	%rdx, %r8
	.p2align	4
.LBB53_59:                              # =>This Inner Loop Header: Depth=1
	xorq	%r8, %rbx
	imulq	%rcx, %rbx
	movq	%rbx, %r9
	shrq	$29, %r9
	xorq	%rbx, %r9
	imulq	%rax, %r9
	addq	$2, %rsi
	leaq	1(%r8), %r10
	xorq	%r9, %r10
	shrq	$31, %r9
	xorq	%r10, %r9
	imulq	%rcx, %r9
	movq	%r9, %r10
	shrq	$29, %r10
	xorq	%r9, %r10
	imulq	%rax, %r10
	movq	%r10, %rbx
	shrq	$31, %rbx
	xorq	%r10, %rbx
	addq	$2, %r8
	cmpq	%rsi, %rdi
	jne	.LBB53_59
# %bb.60:
	testb	$1, %r14b
	je	.LBB53_62
.LBB53_61:
	addq	%rdx, %rsi
	xorq	%rbx, %rsi
	imulq	%rcx, %rsi
	movq	%rsi, %rcx
	shrq	$29, %rcx
	xorq	%rsi, %rcx
	imulq	%rax, %rcx
	movq	%rcx, %rbx
	shrq	$31, %rbx
	xorq	%rcx, %rbx
.LBB53_62:
	movq	%rbx, %rdi
.LBB53_63:
	callq	lean_box_uint64
	movq	%rax, %rbx
	xorl	%edi, %edi
	movl	$1, %esi
	xorl	%edx, %edx
	callq	lean_alloc_ctor
	jmp	.LBB53_22
.LBB53_64:
	leaq	l_LoopStudy_runVariant___closed__7_value(%rip), %rax
	cmpq	%rax, %r15
	je	.LBB53_67
# %bb.65:
	cmpq	$13, 8(%r15)
	jne	.LBB53_68
# %bb.66:
	leaq	l_LoopStudy_runVariant___closed__7_value(%rip), %rsi
	movq	%r15, %rdi
	callq	lean_string_eq_cold@PLT
	testb	%al, %al
	je	.LBB53_68
.LBB53_67:
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	l_LoopStudy_whileStruct
	jmp	.LBB53_78
.LBB53_68:
	leaq	l_LoopStudy_runVariant___closed__8_value(%rip), %rax
	cmpq	%rax, %r15
	je	.LBB53_71
# %bb.69:
	cmpq	$12, 8(%r15)
	jne	.LBB53_72
# %bb.70:
	leaq	l_LoopStudy_runVariant___closed__8_value(%rip), %rsi
	movq	%r15, %rdi
	callq	lean_string_eq_cold@PLT
	testb	%al, %al
	je	.LBB53_72
.LBB53_71:
	xorl	%edi, %edi
	xorl	%esi, %esi
	movl	$16, %edx
	callq	lean_alloc_ctor
	movq	$0, 8(%rax)
	movq	%rbx, 16(%rax)
	movq	%r14, %rdi
	movq	%rax, %rsi
	callq	l_LoopStudy_tailStruct
	jmp	.LBB53_78
.LBB53_72:
	leaq	l_LoopStudy_runVariant___closed__9_value(%rip), %rax
	cmpq	%rax, %r15
	je	.LBB53_75
# %bb.73:
	cmpq	$10, 8(%r15)
	jne	.LBB53_79
# %bb.74:
	leaq	l_LoopStudy_runVariant___closed__9_value(%rip), %rsi
	movq	%r15, %rdi
	callq	lean_string_eq_cold@PLT
	testb	%al, %al
	je	.LBB53_79
.LBB53_75:
	testq	%r14, %r14
	js	.LBB53_91
# %bb.76:
	leaq	1(,%r14,2), %rdi
.LBB53_77:
	xorl	%esi, %esi
	movq	%rbx, %rdx
	callq	l_LoopStudy_tailFuel
.LBB53_78:
	movq	%rax, %rdi
	jmp	.LBB53_63
.LBB53_79:
	leaq	l_LoopStudy_runVariant___closed__10_value(%rip), %rdi
	movq	%r15, %rsi
	callq	lean_string_append@PLT
	movq	%rax, %rbx
	movl	$18, %edi
	movl	$1, %esi
	xorl	%edx, %edx
	callq	lean_alloc_ctor
	movq	%rax, %r14
	movq	%rbx, 8(%rax)
	movl	$1, %edi
	jmp	.LBB53_57
.LBB53_80:
	testl	%ecx, %ecx
	je	.LBB53_8
# %bb.81:
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB53_8
.LBB53_82:
	cmpl	$-1879048191, %ecx              # imm = 0x90000001
	jb	.LBB53_6
# %bb.83:
	lock		decl	(%rbx)
	jmp	.LBB53_6
.LBB53_84:
	testl	%eax, %eax
	je	.LBB53_19
# %bb.85:
	movq	%rbx, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB53_19
.LBB53_86:
	testl	%eax, %eax
	je	.LBB53_56
# %bb.87:
	movq	%rbx, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB53_56
.LBB53_88:
	cmpl	$-1879048191, %eax              # imm = 0x90000001
	jb	.LBB53_54
# %bb.89:
	lock		decl	(%r14)
	jmp	.LBB53_54
.LBB53_90:
	callq	lean_internal_panic_out_of_memory@PLT
.LBB53_91:
	movq	%r14, %rdi
	callq	lean_big_usize_to_nat@PLT
	movq	%rax, %rdi
	jmp	.LBB53_77
.Lfunc_end53:
	.size	l_LoopStudy_runVariant, .Lfunc_end53-l_LoopStudy_runVariant
	.cfi_endproc
                                        # -- End function
	.section	.text.l_LoopStudy_runVariant___boxed,"ax",@progbits
	.hidden	l_LoopStudy_runVariant___boxed  # -- Begin function l_LoopStudy_runVariant___boxed
	.globl	l_LoopStudy_runVariant___boxed
	.p2align	4
	.type	l_LoopStudy_runVariant___boxed,@function
l_LoopStudy_runVariant___boxed:         # @l_LoopStudy_runVariant___boxed
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rsi, %rax
	movq	%rdi, %rbx
	movq	8(%rsi), %rsi
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB54_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB54_4:
	movq	8(%rdx), %r14
	movl	(%rdx), %eax
	cmpl	$2, %eax
	jl	.LBB54_6
# %bb.5:
	decl	%eax
	movl	%eax, (%rdx)
.LBB54_8:
	movq	%rbx, %rdi
	movq	%r14, %rdx
	callq	l_LoopStudy_runVariant
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB54_10
# %bb.9:
	decl	%ecx
	movl	%ecx, (%rbx)
.LBB54_12:
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.LBB54_2:
	.cfi_def_cfa_offset 32
	testl	%ecx, %ecx
	je	.LBB54_4
# %bb.3:
	movq	%rax, %rdi
	movq	%rsi, %r14
	movq	%rdx, %r15
	callq	lean_dec_ref_cold@PLT
	movq	%r15, %rdx
	movq	%r14, %rsi
	jmp	.LBB54_4
.LBB54_6:
	testl	%eax, %eax
	je	.LBB54_8
# %bb.7:
	movq	%rdx, %rdi
	movq	%rsi, %r15
	callq	lean_dec_ref_cold@PLT
	movq	%r15, %rsi
	jmp	.LBB54_8
.LBB54_10:
	testl	%ecx, %ecx
	je	.LBB54_12
# %bb.11:
	movq	%rbx, %rdi
	movq	%rax, %rbx
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end54:
	.size	l_LoopStudy_runVariant___boxed, .Lfunc_end54-l_LoopStudy_runVariant___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text._lean_main,"ax",@progbits
	.hidden	_lean_main                      # -- Begin function _lean_main
	.globl	_lean_main
	.p2align	4
	.type	_lean_main,@function
_lean_main:                             # @_lean_main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, %r14
	leaq	l_LoopStudy_runVariant___closed__0_value(%rip), %rdx
	movl	$1, %esi
	callq	l_List_getD___redArg@PLT
	movq	%rax, %rbx
	leaq	l_main___closed__0_value(%rip), %rdx
	movl	$3, %esi
	movq	%r14, %rdi
	callq	l_List_getD___redArg@PLT
	movq	%rax, %r12
	movq	8(%rax), %r13
	callq	lean_inc_heartbeat@PLT
	movl	$32, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB55_170
# %bb.1:
	movq	%rax, %r15
	leaq	-1(,%r13,2), %rax
	movabsq	$844562369085441, %rbp          # imm = 0x3002000000001
	movq	%rbp, (%r15)
	movq	%r12, 8(%r15)
	movq	$1, 16(%r15)
	movq	%rax, 24(%r15)
	movq	%r15, %rdi
	callq	l_String_Slice_toNat_x21@PLT
	movq	%rax, %r12
	movl	(%r15), %eax
	cmpl	$1, %eax
	jne	.LBB55_18
# %bb.2:
	movq	8(%r15), %rdi
	testb	$1, %dil
	jne	.LBB55_7
# %bb.3:
	movl	(%rdi), %eax
	cmpl	$2, %eax
	jl	.LBB55_5
# %bb.4:
	decl	%eax
	movl	%eax, (%rdi)
.LBB55_7:
	movq	16(%r15), %rdi
	testb	$1, %dil
	jne	.LBB55_12
# %bb.8:
	movl	(%rdi), %eax
	cmpl	$1, %eax
	jle	.LBB55_9
# %bb.11:
	decl	%eax
	movl	%eax, (%rdi)
.LBB55_12:
	movq	24(%r15), %rdi
	testb	$1, %dil
	jne	.LBB55_17
# %bb.13:
	movl	(%rdi), %eax
	cmpl	$1, %eax
	jle	.LBB55_14
# %bb.16:
	decl	%eax
	movl	%eax, (%rdi)
.LBB55_17:
	movq	%r15, %rdi
	callq	lean_free_object@PLT
	jmp	.LBB55_22
.LBB55_18:
	jle	.LBB55_20
# %bb.19:
	decl	%eax
	movl	%eax, (%r15)
.LBB55_22:
	testb	$1, %r12b
	jne	.LBB55_23
# %bb.24:
	movq	%r12, %rdi
	callq	lean_usize_of_big_nat@PLT
	movq	%rax, %r15
	movl	(%r12), %eax
	cmpl	$2, %eax
	jl	.LBB55_26
# %bb.25:
	decl	%eax
	movl	%eax, (%r12)
	jmp	.LBB55_28
.LBB55_23:
	shrq	%r12
	movq	%r12, %r15
.LBB55_28:
	leaq	l_main___closed__1_value(%rip), %rdx
	movl	$5, %esi
	movq	%r14, %rdi
	callq	l_List_getD___redArg@PLT
	movq	%rax, %r13
	testb	$1, %r14b
	jne	.LBB55_33
# %bb.29:
	movl	(%r14), %eax
	cmpl	$2, %eax
	jl	.LBB55_31
# %bb.30:
	decl	%eax
	movl	%eax, (%r14)
.LBB55_33:
	movq	8(%r13), %r14
	callq	lean_inc_heartbeat@PLT
	movl	$32, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB55_170
# %bb.34:
	movq	%rax, %r12
	leaq	-1(,%r14,2), %rax
	movq	%rbp, (%r12)
	movq	%r13, 8(%r12)
	movq	$1, 16(%r12)
	movq	%rax, 24(%r12)
	movq	%r12, %rdi
	callq	l_String_Slice_toNat_x21@PLT
	movq	%rax, %r14
	movl	(%r12), %eax
	cmpl	$1, %eax
	jne	.LBB55_51
# %bb.35:
	movq	8(%r12), %rdi
	testb	$1, %dil
	jne	.LBB55_40
# %bb.36:
	movl	(%rdi), %eax
	cmpl	$2, %eax
	jl	.LBB55_38
# %bb.37:
	decl	%eax
	movl	%eax, (%rdi)
.LBB55_40:
	movq	16(%r12), %rdi
	testb	$1, %dil
	jne	.LBB55_45
# %bb.41:
	movl	(%rdi), %eax
	cmpl	$1, %eax
	jle	.LBB55_42
# %bb.44:
	decl	%eax
	movl	%eax, (%rdi)
.LBB55_45:
	movq	24(%r12), %rdi
	testb	$1, %dil
	jne	.LBB55_50
# %bb.46:
	movl	(%rdi), %eax
	cmpl	$1, %eax
	jle	.LBB55_47
# %bb.49:
	decl	%eax
	movl	%eax, (%rdi)
.LBB55_50:
	movq	%r12, %rdi
	callq	lean_free_object@PLT
	jmp	.LBB55_55
.LBB55_51:
	jle	.LBB55_53
# %bb.52:
	decl	%eax
	movl	%eax, (%r12)
.LBB55_55:
	testb	$1, %r14b
	jne	.LBB55_56
# %bb.57:
	movq	%r14, %rdi
	callq	lean_uint64_of_big_nat@PLT
	movq	%rax, %r13
	movl	(%r14), %eax
	cmpl	$2, %eax
	jl	.LBB55_59
# %bb.58:
	decl	%eax
	movl	%eax, (%r14)
	jmp	.LBB55_61
.LBB55_56:
	shrq	%r14
	movq	%r14, %r13
.LBB55_61:
	movq	%r15, %rsi
	shrq	%rsi
	movq	%rbx, %rdi
	movq	%r13, %rdx
	callq	l_LoopStudy_runVariant
	testb	$1, %al
	jne	.LBB55_62
# %bb.63:
	movzbl	7(%rax), %ecx
	testl	%ecx, %ecx
	je	.LBB55_65
.LBB55_171:
	testb	$1, %bl
	jne	.LBB55_158
# %bb.172:
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB55_174
# %bb.173:
	decl	%ecx
	movl	%ecx, (%rbx)
	jmp	.LBB55_158
.LBB55_62:
	movq	%rax, %rcx
	shrq	%rcx
	testl	%ecx, %ecx
	jne	.LBB55_171
.LBB55_65:
	movq	8(%rax), %r14
	testb	$1, %r14b
	jne	.LBB55_70
# %bb.66:
	movl	(%r14), %ecx
	testl	%ecx, %ecx
	jle	.LBB55_68
# %bb.67:
	incl	%ecx
	movl	%ecx, (%r14)
.LBB55_70:
	movl	(%rax), %ecx
	cmpl	$1, %ecx
	jne	.LBB55_77
# %bb.71:
	movq	8(%rax), %rdi
	testb	$1, %dil
	jne	.LBB55_76
# %bb.72:
	movl	(%rdi), %ecx
	cmpl	$2, %ecx
	jl	.LBB55_74
# %bb.73:
	decl	%ecx
	movl	%ecx, (%rdi)
.LBB55_76:
	movq	%rax, %rdi
	callq	lean_free_object@PLT
	jmp	.LBB55_81
.LBB55_77:
	jle	.LBB55_79
# %bb.78:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB55_81:
	xorl	%eax, %eax
	callq	lean_io_mono_nanos_now@PLT
	movq	%rax, %r12
	movq	%rbx, %rdi
	movq	%r15, %rsi
	movq	%r13, %rdx
	callq	l_LoopStudy_runVariant
	testb	$1, %bl
	jne	.LBB55_86
# %bb.82:
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB55_84
# %bb.83:
	decl	%ecx
	movl	%ecx, (%rbx)
.LBB55_86:
	testb	$1, %al
	jne	.LBB55_87
# %bb.88:
	movzbl	7(%rax), %ecx
	testl	%ecx, %ecx
	je	.LBB55_90
.LBB55_147:
	testb	$1, %r12b
	jne	.LBB55_152
# %bb.148:
	movl	(%r12), %ecx
	cmpl	$2, %ecx
	jl	.LBB55_150
# %bb.149:
	decl	%ecx
	movl	%ecx, (%r12)
.LBB55_152:
	testb	$1, %r14b
	jne	.LBB55_158
# %bb.153:
	movl	(%r14), %ecx
	cmpl	$2, %ecx
	jl	.LBB55_155
# %bb.154:
	decl	%ecx
	movl	%ecx, (%r14)
.LBB55_158:
	cmpl	$1, (%rax)
	je	.LBB55_177
# %bb.159:
	movq	8(%rax), %rbx
	testb	$1, %bl
	jne	.LBB55_164
# %bb.160:
	movl	(%rbx), %ecx
	testl	%ecx, %ecx
	jle	.LBB55_162
# %bb.161:
	incl	%ecx
	movl	%ecx, (%rbx)
.LBB55_164:
	testb	$1, %al
	jne	.LBB55_169
# %bb.165:
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB55_167
# %bb.166:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB55_169:
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB55_170
# %bb.176:
	movabsq	$72339137734115329, %rcx        # imm = 0x101001000000001
	movq	%rcx, (%rax)
	movq	%rbx, 8(%rax)
.LBB55_177:
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB55_87:
	.cfi_def_cfa_offset 64
	movq	%rax, %rcx
	shrq	%rcx
	testl	%ecx, %ecx
	jne	.LBB55_147
.LBB55_90:
	movq	8(%rax), %rbx
	testb	$1, %bl
	jne	.LBB55_95
# %bb.91:
	movl	(%rbx), %ecx
	testl	%ecx, %ecx
	jle	.LBB55_93
# %bb.92:
	incl	%ecx
	movl	%ecx, (%rbx)
.LBB55_95:
	movl	(%rax), %ecx
	cmpl	$1, %ecx
	jne	.LBB55_102
# %bb.96:
	movq	8(%rax), %rdi
	testb	$1, %dil
	jne	.LBB55_101
# %bb.97:
	movl	(%rdi), %ecx
	cmpl	$2, %ecx
	jl	.LBB55_99
# %bb.98:
	decl	%ecx
	movl	%ecx, (%rdi)
.LBB55_101:
	movq	%rax, %rdi
	callq	lean_free_object@PLT
	jmp	.LBB55_106
.LBB55_102:
	jle	.LBB55_104
# %bb.103:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB55_106:
	xorl	%eax, %eax
	callq	lean_io_mono_nanos_now@PLT
	testb	$1, %al
	je	.LBB55_111
# %bb.107:
	testb	$1, %r12b
	je	.LBB55_108
# %bb.109:
	shrq	%rax
	shrq	%r12
	movl	$1, %edi
	subq	%r12, %rax
	jb	.LBB55_122
# %bb.110:
	leaq	1(,%rax,2), %rdi
.LBB55_122:
	callq	l_Nat_reprFast@PLT
	leaq	l_main___closed__2_value(%rip), %rsi
	movq	%rax, %rdi
	callq	lean_string_append@PLT
	movq	%rax, %r15
	movq	8(%rbx), %rdi
	testb	$1, %bl
	jne	.LBB55_127
# %bb.123:
	movl	(%rbx), %eax
	cmpl	$2, %eax
	jl	.LBB55_125
# %bb.124:
	decl	%eax
	movl	%eax, (%rbx)
.LBB55_127:
	testq	%rdi, %rdi
	js	.LBB55_129
# %bb.128:
	leaq	1(,%rdi,2), %rdi
.LBB55_130:
	callq	l_Nat_reprFast@PLT
	movq	%rax, %rbx
	movq	%r15, %rdi
	movq	%rax, %rsi
	callq	lean_string_append@PLT
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB55_132
# %bb.131:
	decl	%ecx
	movl	%ecx, (%rbx)
.LBB55_134:
	leaq	l_main___closed__2_value(%rip), %rsi
	movq	%rax, %rdi
	callq	lean_string_append@PLT
	movq	%rax, %rbx
	movq	8(%r14), %rdi
	testb	$1, %r14b
	jne	.LBB55_139
# %bb.135:
	movl	(%r14), %eax
	cmpl	$2, %eax
	jl	.LBB55_137
# %bb.136:
	decl	%eax
	movl	%eax, (%r14)
.LBB55_139:
	testq	%rdi, %rdi
	js	.LBB55_141
# %bb.140:
	leaq	1(,%rdi,2), %rdi
.LBB55_142:
	callq	l_Nat_reprFast@PLT
	movq	%rax, %r14
	movq	%rbx, %rdi
	movq	%rax, %rsi
	callq	lean_string_append@PLT
	movl	(%r14), %ecx
	cmpl	$2, %ecx
	jl	.LBB55_144
# %bb.143:
	decl	%ecx
	movl	%ecx, (%r14)
.LBB55_146:
	movq	%rax, %rdi
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	l_IO_println___at___00__private_Lean_Shell_0__Lean_ShellOptions_process_spec__3@PLT # TAILCALL
.LBB55_20:
	.cfi_def_cfa_offset 64
	testl	%eax, %eax
	je	.LBB55_22
# %bb.21:
	movq	%r15, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB55_22
.LBB55_26:
	testl	%eax, %eax
	je	.LBB55_28
# %bb.27:
	movq	%r12, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB55_28
.LBB55_31:
	testl	%eax, %eax
	je	.LBB55_33
# %bb.32:
	movq	%r14, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB55_33
.LBB55_53:
	testl	%eax, %eax
	je	.LBB55_55
# %bb.54:
	movq	%r12, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB55_55
.LBB55_59:
	testl	%eax, %eax
	je	.LBB55_61
# %bb.60:
	movq	%r14, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB55_61
.LBB55_174:
	testl	%ecx, %ecx
	je	.LBB55_158
# %bb.175:
	movq	%rbx, %rdi
	jmp	.LBB55_157
.LBB55_5:
	testl	%eax, %eax
	je	.LBB55_7
# %bb.6:
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB55_7
.LBB55_9:
	testl	%eax, %eax
	je	.LBB55_12
# %bb.10:
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB55_12
.LBB55_14:
	testl	%eax, %eax
	je	.LBB55_17
# %bb.15:
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB55_17
.LBB55_38:
	testl	%eax, %eax
	je	.LBB55_40
# %bb.39:
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB55_40
.LBB55_42:
	testl	%eax, %eax
	je	.LBB55_45
# %bb.43:
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB55_45
.LBB55_47:
	testl	%eax, %eax
	je	.LBB55_50
# %bb.48:
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB55_50
.LBB55_162:
	cmpl	$-1879048191, %ecx              # imm = 0x90000001
	jb	.LBB55_164
# %bb.163:
	lock		decl	(%rbx)
	jmp	.LBB55_164
.LBB55_167:
	testl	%ecx, %ecx
	je	.LBB55_169
# %bb.168:
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB55_169
.LBB55_68:
	cmpl	$-1879048191, %ecx              # imm = 0x90000001
	jb	.LBB55_70
# %bb.69:
	lock		decl	(%r14)
	jmp	.LBB55_70
.LBB55_79:
	testl	%ecx, %ecx
	je	.LBB55_81
# %bb.80:
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB55_81
.LBB55_84:
	testl	%ecx, %ecx
	je	.LBB55_86
# %bb.85:
	movq	%rbx, %rdi
	movq	%rax, %rbx
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rax
	jmp	.LBB55_86
.LBB55_111:
	movq	%rax, %rdi
	movq	%r12, %rsi
	movq	%rax, %r15
	callq	lean_nat_big_sub@PLT
	movq	%rax, %rdi
	movq	%r15, %rax
	testb	$1, %r12b
	je	.LBB55_112
	jmp	.LBB55_117
.LBB55_129:
	callq	lean_big_uint64_to_nat@PLT
	movq	%rax, %rdi
	jmp	.LBB55_130
.LBB55_132:
	testl	%ecx, %ecx
	je	.LBB55_134
# %bb.133:
	movq	%rbx, %rdi
	movq	%rax, %rbx
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rax
	jmp	.LBB55_134
.LBB55_141:
	callq	lean_big_uint64_to_nat@PLT
	movq	%rax, %rdi
	jmp	.LBB55_142
.LBB55_144:
	testl	%ecx, %ecx
	je	.LBB55_146
# %bb.145:
	movq	%r14, %rdi
	movq	%rax, %rbx
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rax
	jmp	.LBB55_146
.LBB55_108:
	movq	%rax, %rdi
	movq	%r12, %rsi
	movq	%rax, %r15
	callq	lean_nat_big_sub@PLT
	movq	%rax, %rdi
	movq	%r15, %rax
.LBB55_112:
	movq	%rdi, %r15
	movq	%rax, %r13
	movl	(%r12), %eax
	cmpl	$2, %eax
	jl	.LBB55_114
# %bb.113:
	decl	%eax
	movl	%eax, (%r12)
.LBB55_116:
	movq	%r13, %rax
	testb	$1, %al
	movq	%r15, %rdi
	jne	.LBB55_122
.LBB55_117:
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB55_119
# %bb.118:
	decl	%ecx
	movl	%ecx, (%rax)
	jmp	.LBB55_122
.LBB55_150:
	testl	%ecx, %ecx
	je	.LBB55_152
# %bb.151:
	movq	%r12, %rdi
	movq	%rax, %rbx
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rax
	jmp	.LBB55_152
.LBB55_155:
	testl	%ecx, %ecx
	je	.LBB55_158
# %bb.156:
	movq	%r14, %rdi
.LBB55_157:
	movq	%rax, %rbx
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rax
	jmp	.LBB55_158
.LBB55_74:
	testl	%ecx, %ecx
	je	.LBB55_76
# %bb.75:
	movq	%rax, %r12
	callq	lean_dec_ref_cold@PLT
	movq	%r12, %rax
	jmp	.LBB55_76
.LBB55_93:
	cmpl	$-1879048191, %ecx              # imm = 0x90000001
	jb	.LBB55_95
# %bb.94:
	lock		decl	(%rbx)
	jmp	.LBB55_95
.LBB55_104:
	testl	%ecx, %ecx
	je	.LBB55_106
# %bb.105:
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB55_106
.LBB55_125:
	testl	%eax, %eax
	je	.LBB55_127
# %bb.126:
	movq	%rdi, %r12
	movq	%rbx, %rdi
	callq	lean_dec_ref_cold@PLT
	movq	%r12, %rdi
	jmp	.LBB55_127
.LBB55_137:
	testl	%eax, %eax
	je	.LBB55_139
# %bb.138:
	movq	%rdi, %r15
	movq	%r14, %rdi
	callq	lean_dec_ref_cold@PLT
	movq	%r15, %rdi
	jmp	.LBB55_139
.LBB55_99:
	testl	%ecx, %ecx
	je	.LBB55_101
# %bb.100:
	movq	%rax, %r15
	callq	lean_dec_ref_cold@PLT
	movq	%r15, %rax
	jmp	.LBB55_101
.LBB55_170:
	callq	lean_internal_panic_out_of_memory@PLT
.LBB55_114:
	testl	%eax, %eax
	je	.LBB55_116
# %bb.115:
	movq	%r12, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB55_116
.LBB55_119:
	movq	%rdi, %r15
	testl	%ecx, %ecx
	je	.LBB55_121
# %bb.120:
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
.LBB55_121:
	movq	%r15, %rdi
	jmp	.LBB55_122
.Lfunc_end55:
	.size	_lean_main, .Lfunc_end55-_lean_main
	.cfi_endproc
                                        # -- End function
	.section	.text.l_main___boxed,"ax",@progbits
	.hidden	l_main___boxed                  # -- Begin function l_main___boxed
	.globl	l_main___boxed
	.p2align	4
	.type	l_main___boxed,@function
l_main___boxed:                         # @l_main___boxed
	.cfi_startproc
# %bb.0:
	jmp	_lean_main                      # TAILCALL
.Lfunc_end56:
	.size	l_main___boxed, .Lfunc_end56-l_main___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.initialize_build_Kernels,"ax",@progbits
	.hidden	initialize_build_Kernels        # -- Begin function initialize_build_Kernels
	.globl	initialize_build_Kernels
	.p2align	4
	.type	initialize_build_Kernels,@function
initialize_build_Kernels:               # @initialize_build_Kernels
	.cfi_startproc
# %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	cmpb	$1, _G_initialized(%rip)
	jne	.LBB57_3
.LBB57_1:
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB57_2
# %bb.23:
	movabsq	$281543696187393, %rcx          # imm = 0x1001000000001
	movq	%rcx, (%rax)
	movq	$1, 8(%rax)
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.LBB57_3:
	.cfi_def_cfa_offset 16
	movb	$1, _G_initialized(%rip)
	movzbl	%dil, %ebx
	movl	%ebx, %edi
	callq	initialize_Init@PLT
	movzbl	7(%rax), %ecx
	shll	$24, %ecx
	cmpl	$16777216, %ecx                 # imm = 0x1000000
	je	.LBB57_24
# %bb.4:
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB57_6
# %bb.5:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB57_8:
	movl	%ebx, %edi
	callq	initialize_Init@PLT
	movzbl	7(%rax), %ecx
	shll	$24, %ecx
	cmpl	$16777216, %ecx                 # imm = 0x1000000
	je	.LBB57_24
# %bb.9:
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB57_11
# %bb.10:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB57_13:
	movl	%ebx, %edi
	callq	initialize_Std@PLT
	movzbl	7(%rax), %ecx
	shll	$24, %ecx
	cmpl	$16777216, %ecx                 # imm = 0x1000000
	je	.LBB57_24
# %bb.14:
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB57_16
# %bb.15:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB57_18:
	movl	%ebx, %edi
	callq	initialize_SplitProd@PLT
	movzbl	7(%rax), %ecx
	shll	$24, %ecx
	cmpl	$16777216, %ecx                 # imm = 0x1000000
	jne	.LBB57_19
.LBB57_24:
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.LBB57_19:
	.cfi_def_cfa_offset 16
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB57_21
# %bb.20:
	decl	%ecx
	movl	%ecx, (%rax)
	jmp	.LBB57_1
.LBB57_6:
	testl	%ecx, %ecx
	je	.LBB57_8
# %bb.7:
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB57_8
.LBB57_11:
	testl	%ecx, %ecx
	je	.LBB57_13
# %bb.12:
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB57_13
.LBB57_16:
	testl	%ecx, %ecx
	je	.LBB57_18
# %bb.17:
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB57_18
.LBB57_21:
	testl	%ecx, %ecx
	je	.LBB57_1
# %bb.22:
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB57_1
.LBB57_2:
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end57:
	.size	initialize_build_Kernels, .Lfunc_end57-initialize_build_Kernels
	.cfi_endproc
                                        # -- End function
	.section	.text.run_main,"ax",@progbits
	.hidden	run_main                        # -- Begin function run_main
	.globl	run_main
	.p2align	4
	.type	run_main,@function
run_main:                               # @run_main
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r13
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r13, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movl	$1, %r14d
	cmpl	$2, %edi
	jl	.LBB58_4
# %bb.1:
	movq	%rsi, %rbx
	movl	%edi, %r15d
	incq	%r15
	movl	$1, %r13d
	movabsq	$72620647070564353, %r12        # imm = 0x102001800000001
	.p2align	4
.LBB58_2:                               # =>This Inner Loop Header: Depth=1
	callq	lean_inc_heartbeat@PLT
	movl	$24, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB58_5
# %bb.3:                                #   in Loop: Header=BB58_2 Depth=1
	movq	%rax, %r14
	movq	%r12, (%rax)
	movq	-16(%rbx,%r15,8), %rdi
	callq	lean_mk_string@PLT
	movq	%rax, 8(%r14)
	movq	%r13, 16(%r14)
	decq	%r15
	movq	%r14, %r13
	cmpq	$2, %r15
	jg	.LBB58_2
.LBB58_4:
	movq	%r14, %rdi
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	_lean_main                      # TAILCALL
.LBB58_5:
	.cfi_def_cfa_offset 48
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end58:
	.size	run_main, .Lfunc_end58-run_main
	.cfi_endproc
                                        # -- End function
	.section	.text.main,"ax",@progbits
	.hidden	main                            # -- Begin function main
	.globl	main
	.p2align	4
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %rbp, -16
	movl	%edi, %ebp
	callq	lean_setup_args@PLT
	movq	%rax, %r14
	xorl	%eax, %eax
	callq	lean_initialize@PLT
	movl	$1, %edi
	callq	initialize_build_Kernels
	movq	%rax, %rbx
	callq	lean_io_mark_end_initialization@PLT
	cmpl	$16777215, 4(%rbx)              # imm = 0xFFFFFF
	ja	.LBB59_6
# %bb.1:
	movl	(%rbx), %eax
	cmpl	$2, %eax
	jl	.LBB59_3
# %bb.2:
	decl	%eax
	movl	%eax, (%rbx)
.LBB59_5:
	callq	lean_init_task_manager@PLT
	leaq	run_main(%rip), %rdi
	movl	%ebp, %esi
	movq	%r14, %rdx
	callq	lean_run_main@PLT
	movq	%rax, %rbx
.LBB59_6:
	callq	lean_finalize_task_manager@PLT
	cmpl	$16777215, 4(%rbx)              # imm = 0xFFFFFF
	ja	.LBB59_11
# %bb.7:
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB59_9
# %bb.8:
	decl	%ecx
	movl	%ecx, (%rbx)
	xorl	%eax, %eax
.LBB59_16:
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB59_11:
	.cfi_def_cfa_offset 32
	movq	%rbx, %rdi
	callq	lean_io_result_show_error@PLT
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB59_13
# %bb.12:
	decl	%ecx
	movl	%ecx, (%rbx)
.LBB59_15:
	movl	$1, %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB59_3:
	.cfi_def_cfa_offset 32
	testl	%eax, %eax
	je	.LBB59_5
# %bb.4:
	movq	%rbx, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB59_5
.LBB59_9:
	xorl	%eax, %eax
	testl	%ecx, %ecx
	je	.LBB59_16
# %bb.10:
	movq	%rbx, %rdi
	callq	lean_dec_ref_cold@PLT
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB59_13:
	.cfi_def_cfa_offset 32
	movl	$1, %eax
	testl	%ecx, %ecx
	je	.LBB59_16
# %bb.14:
	movq	%rbx, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB59_15
.Lfunc_end59:
	.size	main, .Lfunc_end59-main
	.cfi_endproc
                                        # -- End function
	.hidden	l_LoopStudy_runVariant___boxed__const__1 # @l_LoopStudy_runVariant___boxed__const__1
	.type	l_LoopStudy_runVariant___boxed__const__1,@object
	.section	.data.l_LoopStudy_runVariant___boxed__const__1,"aw",@progbits
	.globl	l_LoopStudy_runVariant___boxed__const__1
	.p2align	3, 0x0
l_LoopStudy_runVariant___boxed__const__1:
	.quad	l_LoopStudy_runVariant___boxed__const__1_value
	.size	l_LoopStudy_runVariant___boxed__const__1, 8

	.type	_G_initialized,@object          # @_G_initialized
	.section	.bss._G_initialized,"aw",@nobits
_G_initialized:
	.byte	0                               # 0x0
	.size	_G_initialized, 1

	.type	l_LoopStudy_runVariant___boxed__const__1_value,@object # @l_LoopStudy_runVariant___boxed__const__1_value
	.section	.rodata.l_LoopStudy_runVariant___boxed__const__1_value,"a",@progbits
	.p2align	3, 0x0
l_LoopStudy_runVariant___boxed__const__1_value:
	.long	0                               # 0x0
	.byte	16                              # 0x10
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.zero	8
	.size	l_LoopStudy_runVariant___boxed__const__1_value, 16

	.type	l_LoopStudy_runVariant___closed__0_value,@object # @l_LoopStudy_runVariant___closed__0_value
	.section	.rodata.l_LoopStudy_runVariant___closed__0_value,"a",@progbits
	.p2align	3, 0x0
l_LoopStudy_runVariant___closed__0_value:
	.long	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	249                             # 0xf9
	.quad	9                               # 0x9
	.quad	9                               # 0x9
	.quad	8                               # 0x8
	.asciz	"id-while"
	.size	l_LoopStudy_runVariant___closed__0_value, 41

	.type	l_LoopStudy_runVariant___closed__1_value,@object # @l_LoopStudy_runVariant___closed__1_value
	.section	.rodata.l_LoopStudy_runVariant___closed__1_value,"a",@progbits
	.p2align	3, 0x0
l_LoopStudy_runVariant___closed__1_value:
	.long	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	249                             # 0xf9
	.quad	9                               # 0x9
	.quad	9                               # 0x9
	.quad	8                               # 0x8
	.asciz	"io-while"
	.size	l_LoopStudy_runVariant___closed__1_value, 41

	.type	l_LoopStudy_runVariant___closed__2_value,@object # @l_LoopStudy_runVariant___closed__2_value
	.section	.rodata.l_LoopStudy_runVariant___closed__2_value,"a",@progbits
	.p2align	3, 0x0
l_LoopStudy_runVariant___closed__2_value:
	.long	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	249                             # 0xf9
	.quad	8                               # 0x8
	.quad	8                               # 0x8
	.quad	7                               # 0x7
	.asciz	"for-nat"
	.size	l_LoopStudy_runVariant___closed__2_value, 40

	.type	l_LoopStudy_runVariant___closed__3_value,@object # @l_LoopStudy_runVariant___closed__3_value
	.section	.rodata.l_LoopStudy_runVariant___closed__3_value,"a",@progbits
	.p2align	3, 0x0
l_LoopStudy_runVariant___closed__3_value:
	.long	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	249                             # 0xf9
	.quad	10                              # 0xa
	.quad	10                              # 0xa
	.quad	9                               # 0x9
	.asciz	"for-usize"
	.size	l_LoopStudy_runVariant___closed__3_value, 42

	.type	l_LoopStudy_runVariant___closed__4_value,@object # @l_LoopStudy_runVariant___closed__4_value
	.section	.rodata.l_LoopStudy_runVariant___closed__4_value,"a",@progbits
	.p2align	3, 0x0
l_LoopStudy_runVariant___closed__4_value:
	.long	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	249                             # 0xf9
	.quad	12                              # 0xc
	.quad	12                              # 0xc
	.quad	11                              # 0xb
	.asciz	"tail-scalar"
	.size	l_LoopStudy_runVariant___closed__4_value, 44

	.type	l_LoopStudy_runVariant___closed__5_value,@object # @l_LoopStudy_runVariant___closed__5_value
	.section	.rodata.l_LoopStudy_runVariant___closed__5_value,"a",@progbits
	.p2align	3, 0x0
l_LoopStudy_runVariant___closed__5_value:
	.long	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	249                             # 0xf9
	.quad	10                              # 0xa
	.quad	10                              # 0xa
	.quad	9                               # 0x9
	.asciz	"tail-pair"
	.size	l_LoopStudy_runVariant___closed__5_value, 42

	.type	l_LoopStudy_runVariant___closed__6_value,@object # @l_LoopStudy_runVariant___closed__6_value
	.section	.rodata.l_LoopStudy_runVariant___closed__6_value,"a",@progbits
	.p2align	3, 0x0
l_LoopStudy_runVariant___closed__6_value:
	.long	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	249                             # 0xf9
	.quad	17                              # 0x11
	.quad	17                              # 0x11
	.quad	16                              # 0x10
	.asciz	"tail-pair-return"
	.size	l_LoopStudy_runVariant___closed__6_value, 49

	.type	l_LoopStudy_runVariant___closed__7_value,@object # @l_LoopStudy_runVariant___closed__7_value
	.section	.rodata.l_LoopStudy_runVariant___closed__7_value,"a",@progbits
	.p2align	3, 0x0
l_LoopStudy_runVariant___closed__7_value:
	.long	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	249                             # 0xf9
	.quad	13                              # 0xd
	.quad	13                              # 0xd
	.quad	12                              # 0xc
	.asciz	"while-struct"
	.size	l_LoopStudy_runVariant___closed__7_value, 45

	.type	l_LoopStudy_runVariant___closed__8_value,@object # @l_LoopStudy_runVariant___closed__8_value
	.section	.rodata.l_LoopStudy_runVariant___closed__8_value,"a",@progbits
	.p2align	3, 0x0
l_LoopStudy_runVariant___closed__8_value:
	.long	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	249                             # 0xf9
	.quad	12                              # 0xc
	.quad	12                              # 0xc
	.quad	11                              # 0xb
	.asciz	"tail-struct"
	.size	l_LoopStudy_runVariant___closed__8_value, 44

	.type	l_LoopStudy_runVariant___closed__9_value,@object # @l_LoopStudy_runVariant___closed__9_value
	.section	.rodata.l_LoopStudy_runVariant___closed__9_value,"a",@progbits
	.p2align	3, 0x0
l_LoopStudy_runVariant___closed__9_value:
	.long	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	249                             # 0xf9
	.quad	10                              # 0xa
	.quad	10                              # 0xa
	.quad	9                               # 0x9
	.asciz	"tail-fuel"
	.size	l_LoopStudy_runVariant___closed__9_value, 42

	.type	l_LoopStudy_runVariant___closed__10_value,@object # @l_LoopStudy_runVariant___closed__10_value
	.section	.rodata.l_LoopStudy_runVariant___closed__10_value,"a",@progbits
	.p2align	3, 0x0
l_LoopStudy_runVariant___closed__10_value:
	.long	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	249                             # 0xf9
	.quad	18                              # 0x12
	.quad	18                              # 0x12
	.quad	17                              # 0x11
	.asciz	"unknown variant: "
	.size	l_LoopStudy_runVariant___closed__10_value, 50

	.type	l_main___closed__0_value,@object # @l_main___closed__0_value
	.section	.rodata.l_main___closed__0_value,"a",@progbits
	.p2align	3, 0x0
l_main___closed__0_value:
	.long	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	249                             # 0xf9
	.quad	5                               # 0x5
	.quad	5                               # 0x5
	.quad	4                               # 0x4
	.asciz	"1000"
	.size	l_main___closed__0_value, 37

	.type	l_main___closed__1_value,@object # @l_main___closed__1_value
	.section	.rodata.l_main___closed__1_value,"a",@progbits
	.p2align	3, 0x0
l_main___closed__1_value:
	.long	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	249                             # 0xf9
	.quad	20                              # 0x14
	.quad	20                              # 0x14
	.quad	19                              # 0x13
	.asciz	"2611923443488327891"
	.size	l_main___closed__1_value, 52

	.type	l_main___closed__2_value,@object # @l_main___closed__2_value
	.section	.rodata.l_main___closed__2_value,"a",@progbits
	.p2align	3, 0x0
l_main___closed__2_value:
	.long	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	249                             # 0xf9
	.quad	2                               # 0x2
	.quad	2                               # 0x2
	.quad	1                               # 0x1
	.asciz	" "
	.size	l_main___closed__2_value, 34

	.ident	"clang version 22.1.4 (https://github.com/llvm/llvm-project 35990504507d79e0b9deb809c8ee5e1b34ceef20)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym run_main
	.addrsig_sym l_LoopStudy_runVariant___boxed__const__1_value
	.addrsig_sym l_LoopStudy_runVariant___closed__0_value
	.addrsig_sym l_LoopStudy_runVariant___closed__1_value
	.addrsig_sym l_LoopStudy_runVariant___closed__2_value
	.addrsig_sym l_LoopStudy_runVariant___closed__3_value
	.addrsig_sym l_LoopStudy_runVariant___closed__4_value
	.addrsig_sym l_LoopStudy_runVariant___closed__5_value
	.addrsig_sym l_LoopStudy_runVariant___closed__6_value
	.addrsig_sym l_LoopStudy_runVariant___closed__7_value
	.addrsig_sym l_LoopStudy_runVariant___closed__8_value
	.addrsig_sym l_LoopStudy_runVariant___closed__9_value
	.addrsig_sym l_LoopStudy_runVariant___closed__10_value
	.addrsig_sym l_main___closed__0_value
	.addrsig_sym l_main___closed__1_value
	.addrsig_sym l_main___closed__2_value
