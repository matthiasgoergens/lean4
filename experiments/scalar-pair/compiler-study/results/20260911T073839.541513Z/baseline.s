	.file	"baseline.c"
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
	.section	.text.l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg,"ax",@progbits
	.hidden	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg # -- Begin function l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg
	.globl	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg
	.p2align	4
	.type	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg,@function
l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg: # @l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg
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
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, 8(%rsp)                   # 8-byte Spill
	jmp	.LBB3_1
	.p2align	4
.LBB3_37:                               #   in Loop: Header=BB3_1 Depth=1
	movq	16(%rsp), %rsi                  # 8-byte Reload
	movq	%r12, 16(%rsi)
	movq	%r15, 8(%rsi)
.LBB3_1:                                # =>This Inner Loop Header: Depth=1
	movq	8(%rsi), %r15
	movq	16(%rsi), %r12
	movl	(%rsi), %ebx
	cmpl	$1, %ebx
	movl	%ebx, 4(%rsp)                   # 4-byte Spill
	jne	.LBB3_2
# %bb.19:                               #   in Loop: Header=BB3_1 Depth=1
	movq	8(%r15), %r13
	cmpq	8(%rsp), %r13                   # 8-byte Folded Reload
	jae	.LBB3_26
# %bb.20:                               #   in Loop: Header=BB3_1 Depth=1
	movq	%rsi, 16(%rsp)                  # 8-byte Spill
	leaq	8(%r15), %r14
	movl	%r12d, %eax
	andl	$1, %eax
	movq	8(%r12), %rbx
	movq	%r13, %rbp
	testq	%rax, %rax
	jne	.LBB3_29
	jmp	.LBB3_22
	.p2align	4
.LBB3_2:                                #   in Loop: Header=BB3_1 Depth=1
	testb	$1, %r12b
	jne	.LBB3_7
# %bb.3:                                #   in Loop: Header=BB3_1 Depth=1
	movl	(%r12), %eax
	testl	%eax, %eax
	jle	.LBB3_5
# %bb.4:                                #   in Loop: Header=BB3_1 Depth=1
	incl	%eax
	movl	%eax, (%r12)
.LBB3_7:                                #   in Loop: Header=BB3_1 Depth=1
	testb	$1, %r15b
	jne	.LBB3_12
# %bb.8:                                #   in Loop: Header=BB3_1 Depth=1
	movl	(%r15), %eax
	testl	%eax, %eax
	jle	.LBB3_10
# %bb.9:                                #   in Loop: Header=BB3_1 Depth=1
	incl	%eax
	movl	%eax, (%r15)
.LBB3_12:                               #   in Loop: Header=BB3_1 Depth=1
	testb	$1, %sil
	jne	.LBB3_17
# %bb.13:                               #   in Loop: Header=BB3_1 Depth=1
	movl	(%rsi), %eax
	cmpl	$2, %eax
	jl	.LBB3_15
# %bb.14:                               #   in Loop: Header=BB3_1 Depth=1
	decl	%eax
	movl	%eax, (%rsi)
.LBB3_17:                               #   in Loop: Header=BB3_1 Depth=1
	movq	8(%r15), %r13
	cmpq	8(%rsp), %r13                   # 8-byte Folded Reload
	jae	.LBB3_24
# %bb.18:                               #   in Loop: Header=BB3_1 Depth=1
	movl	%r12d, %eax
	andl	$1, %eax
	leaq	8(%r15), %r14
	movl	$1, %ecx
	movq	%rcx, 16(%rsp)                  # 8-byte Spill
	movq	8(%r12), %rbx
	movq	%r13, %rbp
	testq	%rax, %rax
	jne	.LBB3_29
.LBB3_22:                               #   in Loop: Header=BB3_1 Depth=1
	movl	(%r12), %eax
	cmpl	$2, %eax
	jl	.LBB3_27
# %bb.23:                               #   in Loop: Header=BB3_1 Depth=1
	decl	%eax
	movl	%eax, (%r12)
	movq	%r13, %rbp
.LBB3_29:                               #   in Loop: Header=BB3_1 Depth=1
	testb	$1, %r15b
	jne	.LBB3_34
# %bb.30:                               #   in Loop: Header=BB3_1 Depth=1
	movl	(%r15), %eax
	cmpl	$2, %eax
	jl	.LBB3_32
# %bb.31:                               #   in Loop: Header=BB3_1 Depth=1
	decl	%eax
	movl	%eax, (%r15)
.LBB3_34:                               #   in Loop: Header=BB3_1 Depth=1
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB3_40
# %bb.35:                               #   in Loop: Header=BB3_1 Depth=1
	movq	%rax, %r15
	incq	%rbp
	movabsq	$68719476737, %r14              # imm = 0x1000000001
	movq	%r14, (%rax)
	movq	%rbp, 8(%rax)
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB3_40
# %bb.36:                               #   in Loop: Header=BB3_1 Depth=1
	movq	%rax, %r12
	movabsq	$-7046029254386353131, %rax     # imm = 0x9E3779B97F4A7C15
	addq	%rax, %r13
	xorq	%r13, %rbx
	movabsq	$-4658895280553007687, %rax     # imm = 0xBF58476D1CE4E5B9
	imulq	%rax, %rbx
	movq	%rbx, %rax
	shrq	$29, %rax
	xorq	%rbx, %rax
	movabsq	$-7723592293110705685, %rcx     # imm = 0x94D049BB133111EB
	imulq	%rcx, %rax
	movq	%rax, %rcx
	shrq	$31, %rcx
	xorq	%rax, %rcx
	movq	%r14, (%r12)
	movq	%rcx, 8(%r12)
	cmpl	$1, 4(%rsp)                     # 4-byte Folded Reload
	je	.LBB3_37
# %bb.38:                               #   in Loop: Header=BB3_1 Depth=1
	callq	lean_inc_heartbeat@PLT
	movl	$24, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB3_40
# %bb.39:                               #   in Loop: Header=BB3_1 Depth=1
	movq	%rax, %rsi
	movabsq	$563053032636417, %rax          # imm = 0x2001800000001
	movq	%rax, (%rsi)
	movq	%r15, 8(%rsi)
	movq	%r12, 16(%rsi)
	jmp	.LBB3_1
.LBB3_32:                               #   in Loop: Header=BB3_1 Depth=1
	testl	%eax, %eax
	je	.LBB3_34
# %bb.33:                               #   in Loop: Header=BB3_1 Depth=1
	movq	%r15, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB3_34
.LBB3_27:                               #   in Loop: Header=BB3_1 Depth=1
	movq	%r13, %rbp
	testl	%eax, %eax
	je	.LBB3_29
# %bb.28:                               #   in Loop: Header=BB3_1 Depth=1
	movq	%r12, %rdi
	callq	lean_dec_ref_cold@PLT
	movq	(%r14), %rbp
	jmp	.LBB3_29
.LBB3_5:                                #   in Loop: Header=BB3_1 Depth=1
	cmpl	$-1879048191, %eax              # imm = 0x90000001
	jb	.LBB3_7
# %bb.6:                                #   in Loop: Header=BB3_1 Depth=1
	lock		decl	(%r12)
	jmp	.LBB3_7
.LBB3_10:                               #   in Loop: Header=BB3_1 Depth=1
	cmpl	$-1879048191, %eax              # imm = 0x90000001
	jb	.LBB3_12
# %bb.11:                               #   in Loop: Header=BB3_1 Depth=1
	lock		decl	(%r15)
	jmp	.LBB3_12
.LBB3_15:                               #   in Loop: Header=BB3_1 Depth=1
	testl	%eax, %eax
	je	.LBB3_17
# %bb.16:                               #   in Loop: Header=BB3_1 Depth=1
	movq	%rsi, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB3_17
.LBB3_24:
	callq	lean_inc_heartbeat@PLT
	movl	$24, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB3_40
# %bb.25:
	movq	%rax, %rsi
	movabsq	$563053032636417, %rax          # imm = 0x2001800000001
	movq	%rax, (%rsi)
	movq	%r15, 8(%rsi)
	movq	%r12, 16(%rsi)
.LBB3_26:
	movq	%rsi, %rax
	addq	$24, %rsp
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
.LBB3_40:
	.cfi_def_cfa_offset 80
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end3:
	.size	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg, .Lfunc_end3-l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg
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
	.section	.text.l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___boxed,"ax",@progbits
	.hidden	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___boxed # -- Begin function l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___boxed
	.globl	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___boxed
	.p2align	4
	.type	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___boxed,@function
l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___boxed: # @l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___boxed
	.cfi_startproc
# %bb.0:
	movq	%rdi, %rax
	movq	8(%rdi), %rdi
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB5_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%rax)
	jmp	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg # TAILCALL
.LBB5_2:
	testl	%ecx, %ecx
	je	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg # TAILCALL
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
	jmp	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg # TAILCALL
.Lfunc_end5:
	.size	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___boxed, .Lfunc_end5-l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg___boxed
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
	movq	%rsi, %r15
	movq	%rdi, %rbx
	movq	l_LoopStudy_idWhile___boxed__const__1(%rip), %r12
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB6_17
# %bb.1:
	movq	%rax, %r14
	movabsq	$68719476737, %rax              # imm = 0x1000000001
	movq	%rax, (%r14)
	movq	%r15, 8(%r14)
	callq	lean_inc_heartbeat@PLT
	movl	$24, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB6_17
# %bb.2:
	movabsq	$563053032636417, %rcx          # imm = 0x2001800000001
	movq	%rcx, (%rax)
	movq	%r12, 8(%rax)
	movq	%r14, 16(%rax)
	movq	%rbx, %rdi
	movq	%rax, %rsi
	callq	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg
	movq	16(%rax), %rbx
	testb	$1, %bl
	jne	.LBB6_7
# %bb.3:
	movl	(%rbx), %ecx
	testl	%ecx, %ecx
	jle	.LBB6_5
# %bb.4:
	incl	%ecx
	movl	%ecx, (%rbx)
.LBB6_7:
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB6_9
# %bb.8:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB6_11:
	movq	8(%rbx), %rax
	testb	$1, %bl
	jne	.LBB6_16
# %bb.12:
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB6_14
# %bb.13:
	decl	%ecx
	movl	%ecx, (%rbx)
.LBB6_16:
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
.LBB6_9:
	.cfi_def_cfa_offset 48
	testl	%ecx, %ecx
	je	.LBB6_11
# %bb.10:
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB6_11
.LBB6_5:
	cmpl	$-1879048191, %ecx              # imm = 0x90000001
	jb	.LBB6_7
# %bb.6:
	lock		decl	(%rbx)
	jmp	.LBB6_7
.LBB6_14:
	testl	%ecx, %ecx
	je	.LBB6_16
# %bb.15:
	movq	%rbx, %rdi
	movq	%rax, %rbx
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rax
	jmp	.LBB6_16
.LBB6_17:
	callq	lean_internal_panic_out_of_memory@PLT
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
	movq	8(%rsi), %rbx
	movl	(%rsi), %eax
	cmpl	$2, %eax
	jl	.LBB7_6
# %bb.5:
	decl	%eax
	movl	%eax, (%rsi)
.LBB7_8:
	movq	%rbx, %rsi
	callq	l_LoopStudy_idWhile
	movq	%rax, %rbx
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB7_10
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
	movq	%rdi, %r14
	movq	%rsi, %rdi
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rdi
	jmp	.LBB7_8
.LBB7_10:
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end7:
	.size	l_LoopStudy_idWhile___boxed, .Lfunc_end7-l_LoopStudy_idWhile___boxed
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
	movq	%rdx, %rsi
	jmp	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg # TAILCALL
.Lfunc_end8:
	.size	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0, .Lfunc_end8-l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0
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
	movq	%rdi, %rax
	movq	8(%rdi), %rdi
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB9_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%rax)
	movq	%rdx, %rsi
	jmp	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg # TAILCALL
.LBB9_2:
	testl	%ecx, %ecx
	je	.LBB9_4
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
.LBB9_4:
	movq	%rdx, %rsi
	jmp	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___redArg # TAILCALL
.Lfunc_end9:
	.size	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___boxed, .Lfunc_end9-l___private_Init_While_0__repeatM_erased___at___00LoopStudy_idWhile_spec__0___boxed
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
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rsi, %rbx
	movq	%rdi, 8(%rsp)                   # 8-byte Spill
	jmp	.LBB10_1
	.p2align	4
.LBB10_38:                              #   in Loop: Header=BB10_1 Depth=1
	movq	16(%rsp), %rbx                  # 8-byte Reload
	movq	%r12, 16(%rbx)
	movq	%r15, 8(%rbx)
.LBB10_1:                               # =>This Inner Loop Header: Depth=1
	movq	8(%rbx), %r15
	movq	16(%rbx), %r12
	movl	(%rbx), %ebp
	cmpl	$1, %ebp
	movl	%ebp, 4(%rsp)                   # 4-byte Spill
	jne	.LBB10_2
# %bb.19:                               #   in Loop: Header=BB10_1 Depth=1
	movq	8(%r15), %r13
	cmpq	8(%rsp), %r13                   # 8-byte Folded Reload
	jae	.LBB10_26
# %bb.20:                               #   in Loop: Header=BB10_1 Depth=1
	leaq	8(%r15), %rcx
	movl	%r12d, %eax
	andl	$1, %eax
	movq	8(%r12), %r14
	movq	%r13, %rbp
	testq	%rax, %rax
	jne	.LBB10_30
	jmp	.LBB10_22
	.p2align	4
.LBB10_2:                               #   in Loop: Header=BB10_1 Depth=1
	testb	$1, %r12b
	jne	.LBB10_7
# %bb.3:                                #   in Loop: Header=BB10_1 Depth=1
	movl	(%r12), %eax
	testl	%eax, %eax
	jle	.LBB10_5
# %bb.4:                                #   in Loop: Header=BB10_1 Depth=1
	incl	%eax
	movl	%eax, (%r12)
.LBB10_7:                               #   in Loop: Header=BB10_1 Depth=1
	testb	$1, %r15b
	jne	.LBB10_12
# %bb.8:                                #   in Loop: Header=BB10_1 Depth=1
	movl	(%r15), %eax
	testl	%eax, %eax
	jle	.LBB10_10
# %bb.9:                                #   in Loop: Header=BB10_1 Depth=1
	incl	%eax
	movl	%eax, (%r15)
.LBB10_12:                              #   in Loop: Header=BB10_1 Depth=1
	testb	$1, %bl
	jne	.LBB10_17
# %bb.13:                               #   in Loop: Header=BB10_1 Depth=1
	movl	(%rbx), %eax
	cmpl	$2, %eax
	jl	.LBB10_15
# %bb.14:                               #   in Loop: Header=BB10_1 Depth=1
	decl	%eax
	movl	%eax, (%rbx)
.LBB10_17:                              #   in Loop: Header=BB10_1 Depth=1
	movq	8(%r15), %r13
	cmpq	8(%rsp), %r13                   # 8-byte Folded Reload
	jae	.LBB10_24
# %bb.18:                               #   in Loop: Header=BB10_1 Depth=1
	movl	%r12d, %eax
	andl	$1, %eax
	leaq	8(%r15), %rcx
	movl	$1, %ebx
	movq	8(%r12), %r14
	movq	%r13, %rbp
	testq	%rax, %rax
	jne	.LBB10_30
.LBB10_22:                              #   in Loop: Header=BB10_1 Depth=1
	movl	(%r12), %eax
	cmpl	$2, %eax
	jl	.LBB10_28
# %bb.23:                               #   in Loop: Header=BB10_1 Depth=1
	decl	%eax
	movl	%eax, (%r12)
	movq	%r13, %rbp
.LBB10_30:                              #   in Loop: Header=BB10_1 Depth=1
	testb	$1, %r15b
	jne	.LBB10_35
# %bb.31:                               #   in Loop: Header=BB10_1 Depth=1
	movl	(%r15), %eax
	cmpl	$2, %eax
	jl	.LBB10_33
# %bb.32:                               #   in Loop: Header=BB10_1 Depth=1
	decl	%eax
	movl	%eax, (%r15)
.LBB10_35:                              #   in Loop: Header=BB10_1 Depth=1
	movq	%rbx, 16(%rsp)                  # 8-byte Spill
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB10_41
# %bb.36:                               #   in Loop: Header=BB10_1 Depth=1
	movq	%rax, %r15
	incq	%rbp
	movabsq	$68719476737, %rbx              # imm = 0x1000000001
	movq	%rbx, (%rax)
	movq	%rbp, 8(%rax)
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB10_41
# %bb.37:                               #   in Loop: Header=BB10_1 Depth=1
	movq	%rax, %r12
	movabsq	$-7046029254386353131, %rax     # imm = 0x9E3779B97F4A7C15
	addq	%rax, %r13
	xorq	%r13, %r14
	movabsq	$-4658895280553007687, %rax     # imm = 0xBF58476D1CE4E5B9
	imulq	%rax, %r14
	movq	%r14, %rax
	shrq	$29, %rax
	xorq	%r14, %rax
	movabsq	$-7723592293110705685, %rcx     # imm = 0x94D049BB133111EB
	imulq	%rcx, %rax
	movq	%rax, %rcx
	shrq	$31, %rcx
	xorq	%rax, %rcx
	movq	%rbx, (%r12)
	movq	%rcx, 8(%r12)
	cmpl	$1, 4(%rsp)                     # 4-byte Folded Reload
	je	.LBB10_38
# %bb.39:                               #   in Loop: Header=BB10_1 Depth=1
	callq	lean_inc_heartbeat@PLT
	movl	$24, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB10_41
# %bb.40:                               #   in Loop: Header=BB10_1 Depth=1
	movq	%rax, %rbx
	movabsq	$563053032636417, %rax          # imm = 0x2001800000001
	movq	%rax, (%rbx)
	movq	%r15, 8(%rbx)
	movq	%r12, 16(%rbx)
	jmp	.LBB10_1
.LBB10_33:                              #   in Loop: Header=BB10_1 Depth=1
	testl	%eax, %eax
	je	.LBB10_35
# %bb.34:                               #   in Loop: Header=BB10_1 Depth=1
	movq	%r15, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB10_35
.LBB10_28:                              #   in Loop: Header=BB10_1 Depth=1
	movq	%r13, %rbp
	testl	%eax, %eax
	je	.LBB10_30
# %bb.29:                               #   in Loop: Header=BB10_1 Depth=1
	movq	%r12, %rdi
	movq	%rcx, %r12
	callq	lean_dec_ref_cold@PLT
	movq	(%r12), %rbp
	jmp	.LBB10_30
.LBB10_5:                               #   in Loop: Header=BB10_1 Depth=1
	cmpl	$-1879048191, %eax              # imm = 0x90000001
	jb	.LBB10_7
# %bb.6:                                #   in Loop: Header=BB10_1 Depth=1
	lock		decl	(%r12)
	jmp	.LBB10_7
.LBB10_10:                              #   in Loop: Header=BB10_1 Depth=1
	cmpl	$-1879048191, %eax              # imm = 0x90000001
	jb	.LBB10_12
# %bb.11:                               #   in Loop: Header=BB10_1 Depth=1
	lock		decl	(%r15)
	jmp	.LBB10_12
.LBB10_15:                              #   in Loop: Header=BB10_1 Depth=1
	testl	%eax, %eax
	je	.LBB10_17
# %bb.16:                               #   in Loop: Header=BB10_1 Depth=1
	movq	%rbx, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB10_17
.LBB10_24:
	callq	lean_inc_heartbeat@PLT
	movl	$24, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB10_41
# %bb.25:
	movq	%rax, %rbx
	movabsq	$563053032636417, %rax          # imm = 0x2001800000001
	movq	%rax, (%rbx)
	movq	%r15, 8(%rbx)
	movq	%r12, 16(%rbx)
.LBB10_26:
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB10_41
# %bb.27:
	movabsq	$281543696187393, %rcx          # imm = 0x1001000000001
	movq	%rcx, (%rax)
	movq	%rbx, 8(%rax)
	addq	$24, %rsp
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
.LBB10_41:
	.cfi_def_cfa_offset 80
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end10:
	.size	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg, .Lfunc_end10-l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg
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
	movq	%rdi, %rax
	movq	8(%rdi), %rdi
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB11_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%rax)
	jmp	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg # TAILCALL
.LBB11_2:
	testl	%ecx, %ecx
	je	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg # TAILCALL
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
	jmp	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg # TAILCALL
.Lfunc_end11:
	.size	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg___boxed, .Lfunc_end11-l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg___boxed
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
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rsi, %r15
	movq	%rdi, %rbx
	movq	l_LoopStudy_idWhile___boxed__const__1(%rip), %r12
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB12_47
# %bb.1:
	movq	%rax, %r14
	movabsq	$68719476737, %rax              # imm = 0x1000000001
	movq	%rax, (%r14)
	movq	%r15, 8(%r14)
	callq	lean_inc_heartbeat@PLT
	movl	$24, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB12_47
# %bb.2:
	movabsq	$563053032636417, %rcx          # imm = 0x2001800000001
	movq	%rcx, (%rax)
	movq	%r12, 8(%rax)
	movq	%r14, 16(%rax)
	movq	%rbx, %rdi
	movq	%rax, %rsi
	callq	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg
	testb	$1, %al
	jne	.LBB12_3
# %bb.4:
	movzbl	7(%rax), %ecx
	movq	8(%rax), %rbx
	movl	(%rax), %ebp
	testl	%ecx, %ecx
	je	.LBB12_6
.LBB12_31:
	cmpl	$1, %ebp
	je	.LBB12_46
# %bb.32:
	testb	$1, %bl
	jne	.LBB12_37
# %bb.33:
	movl	(%rbx), %ecx
	testl	%ecx, %ecx
	jle	.LBB12_35
# %bb.34:
	incl	%ecx
	movl	%ecx, (%rbx)
.LBB12_37:
	testb	$1, %al
	jne	.LBB12_42
# %bb.38:
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB12_40
# %bb.39:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB12_42:
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB12_47
# %bb.43:
	movl	$16842768, %ecx                 # imm = 0x1010010
	movq	%rbx, %r14
	jmp	.LBB12_44
.LBB12_3:
	movq	%rax, %rcx
	shrq	%rcx
	movq	8(%rax), %rbx
	movl	(%rax), %ebp
	testl	%ecx, %ecx
	jne	.LBB12_31
.LBB12_6:
	cmpl	$1, %ebp
	je	.LBB12_18
# %bb.7:
	testb	$1, %bl
	jne	.LBB12_12
# %bb.8:
	movl	(%rbx), %ecx
	testl	%ecx, %ecx
	jle	.LBB12_10
# %bb.9:
	incl	%ecx
	movl	%ecx, (%rbx)
.LBB12_12:
	testb	$1, %al
	jne	.LBB12_17
# %bb.13:
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB12_15
# %bb.14:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB12_17:
	movl	$1, %eax
.LBB12_18:
	movq	16(%rbx), %r14
	testb	$1, %r14b
	jne	.LBB12_23
# %bb.19:
	movl	(%r14), %ecx
	testl	%ecx, %ecx
	jle	.LBB12_21
# %bb.20:
	incl	%ecx
	movl	%ecx, (%r14)
.LBB12_23:
	testb	$1, %bl
	jne	.LBB12_28
# %bb.24:
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB12_26
# %bb.25:
	decl	%ecx
	movl	%ecx, (%rbx)
.LBB12_28:
	cmpl	$1, %ebp
	je	.LBB12_45
# %bb.29:
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB12_47
# %bb.30:
	movl	$65552, %ecx                    # imm = 0x10010
.LBB12_44:
	movl	$1, (%rax)
	movl	%ecx, 4(%rax)
.LBB12_45:
	movq	%r14, 8(%rax)
.LBB12_46:
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB12_21:
	.cfi_def_cfa_offset 48
	cmpl	$-1879048191, %ecx              # imm = 0x90000001
	jb	.LBB12_23
# %bb.22:
	lock		decl	(%r14)
	jmp	.LBB12_23
.LBB12_26:
	testl	%ecx, %ecx
	je	.LBB12_28
# %bb.27:
	movq	%rbx, %rdi
	movq	%rax, %rbx
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rax
	jmp	.LBB12_28
.LBB12_35:
	cmpl	$-1879048191, %ecx              # imm = 0x90000001
	jb	.LBB12_37
# %bb.36:
	lock		decl	(%rbx)
	jmp	.LBB12_37
.LBB12_40:
	testl	%ecx, %ecx
	je	.LBB12_42
# %bb.41:
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB12_42
.LBB12_10:
	cmpl	$-1879048191, %ecx              # imm = 0x90000001
	jb	.LBB12_12
# %bb.11:
	lock		decl	(%rbx)
	jmp	.LBB12_12
.LBB12_15:
	testl	%ecx, %ecx
	je	.LBB12_17
# %bb.16:
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB12_17
.LBB12_47:
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end12:
	.size	l_LoopStudy_ioWhile, .Lfunc_end12-l_LoopStudy_ioWhile
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
	jl	.LBB13_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB13_4:
	movq	8(%rsi), %rbx
	movl	(%rsi), %eax
	cmpl	$2, %eax
	jl	.LBB13_6
# %bb.5:
	decl	%eax
	movl	%eax, (%rsi)
.LBB13_8:
	movq	%rbx, %rsi
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	jmp	l_LoopStudy_ioWhile             # TAILCALL
.LBB13_2:
	.cfi_def_cfa_offset 32
	testl	%ecx, %ecx
	je	.LBB13_4
# %bb.3:
	movq	%rdi, %rbx
	movq	%rax, %rdi
	movq	%rsi, %r14
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rsi
	movq	%rbx, %rdi
	jmp	.LBB13_4
.LBB13_6:
	testl	%eax, %eax
	je	.LBB13_8
# %bb.7:
	movq	%rdi, %r14
	movq	%rsi, %rdi
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rdi
	jmp	.LBB13_8
.Lfunc_end13:
	.size	l_LoopStudy_ioWhile___boxed, .Lfunc_end13-l_LoopStudy_ioWhile___boxed
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
	movq	%rdx, %rsi
	jmp	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg # TAILCALL
.Lfunc_end14:
	.size	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0, .Lfunc_end14-l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0
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
	movq	%rdi, %rax
	movq	8(%rdi), %rdi
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB15_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%rax)
	movq	%rdx, %rsi
	jmp	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg # TAILCALL
.LBB15_2:
	testl	%ecx, %ecx
	je	.LBB15_4
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
.LBB15_4:
	movq	%rdx, %rsi
	jmp	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___redArg # TAILCALL
.Lfunc_end15:
	.size	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___boxed, .Lfunc_end15-l___private_Init_While_0__repeatM_erased___at___00LoopStudy_ioWhile_spec__0___boxed
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
.LBB16_1:                               # =>This Inner Loop Header: Depth=1
	movq	%rdx, %r14
	movq	16(%rbx), %rsi
	movq	24(%rbx), %r15
	testb	$1, %r14b
	je	.LBB16_9
# %bb.2:                                #   in Loop: Header=BB16_1 Depth=1
	testb	$1, %sil
	je	.LBB16_11
# %bb.3:                                #   in Loop: Header=BB16_1 Depth=1
	cmpq	%rsi, %r14
	jae	.LBB16_22
.LBB16_4:                               #   in Loop: Header=BB16_1 Depth=1
	movq	%r14, %rcx
	shrq	%rcx
.LBB16_5:                               #   in Loop: Header=BB16_1 Depth=1
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
	je	.LBB16_12
# %bb.6:                                #   in Loop: Header=BB16_1 Depth=1
	testb	$1, %r15b
	je	.LBB16_14
# %bb.7:                                #   in Loop: Header=BB16_1 Depth=1
	shrq	%r14
	shrq	%r15
	addq	%r14, %r15
	js	.LBB16_15
# %bb.8:                                #   in Loop: Header=BB16_1 Depth=1
	leaq	1(,%r15,2), %rdx
	jmp	.LBB16_1
.LBB16_9:                               #   in Loop: Header=BB16_1 Depth=1
	movq	%rax, (%rsp)                    # 8-byte Spill
	movq	%r14, %rdi
	callq	lean_nat_big_lt@PLT
	testb	%al, %al
	je	.LBB16_19
# %bb.10:                               #   in Loop: Header=BB16_1 Depth=1
	movq	%r14, %rdi
	callq	lean_usize_of_big_nat@PLT
	movq	%rax, %rcx
	movq	(%rsp), %rax                    # 8-byte Reload
	jmp	.LBB16_5
.LBB16_11:                              #   in Loop: Header=BB16_1 Depth=1
	movq	%r14, %rdi
	movq	%rax, (%rsp)                    # 8-byte Spill
	callq	lean_nat_big_lt@PLT
	movl	%eax, %ecx
	movq	(%rsp), %rax                    # 8-byte Reload
	testb	%cl, %cl
	jne	.LBB16_4
	jmp	.LBB16_22
.LBB16_12:                              #   in Loop: Header=BB16_1 Depth=1
	movq	%rax, (%rsp)                    # 8-byte Spill
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	lean_nat_big_add@PLT
	movq	%rax, %rdx
	movl	(%r14), %eax
	cmpl	$2, %eax
	jl	.LBB16_17
# %bb.13:                               #   in Loop: Header=BB16_1 Depth=1
	decl	%eax
	movl	%eax, (%r14)
	movq	(%rsp), %rax                    # 8-byte Reload
	jmp	.LBB16_1
.LBB16_14:                              #   in Loop: Header=BB16_1 Depth=1
	movq	%r14, %rdi
	movq	%r15, %rsi
	movq	%rax, %r14
	callq	lean_nat_big_add@PLT
	jmp	.LBB16_16
.LBB16_15:                              #   in Loop: Header=BB16_1 Depth=1
	movq	%r15, %rdi
	movq	%rax, %r14
	callq	lean_big_usize_to_nat@PLT
.LBB16_16:                              #   in Loop: Header=BB16_1 Depth=1
	movq	%rax, %rdx
	movq	%r14, %rax
	jmp	.LBB16_1
.LBB16_17:                              #   in Loop: Header=BB16_1 Depth=1
	testl	%eax, %eax
	movq	(%rsp), %rax                    # 8-byte Reload
	je	.LBB16_1
# %bb.18:                               #   in Loop: Header=BB16_1 Depth=1
	movq	%r14, %rdi
	movq	%rdx, %r14
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rdx
	movq	(%rsp), %rax                    # 8-byte Reload
	jmp	.LBB16_1
.LBB16_19:
	movl	(%r14), %eax
	cmpl	$2, %eax
	jl	.LBB16_23
# %bb.20:
	decl	%eax
	movl	%eax, (%r14)
.LBB16_21:
	movq	(%rsp), %rax                    # 8-byte Reload
.LBB16_22:
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
.LBB16_23:
	.cfi_def_cfa_offset 64
	testl	%eax, %eax
	movq	(%rsp), %rax                    # 8-byte Reload
	je	.LBB16_22
# %bb.24:
	movq	%r14, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB16_21
.Lfunc_end16:
	.size	l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___redArg, .Lfunc_end16-l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___redArg
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
	jl	.LBB17_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB17_4:
	movq	%rbx, %rdi
	callq	l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___redArg
	movq	%rax, %r14
	movl	(%rbx), %eax
	cmpl	$2, %eax
	jl	.LBB17_6
# %bb.5:
	decl	%eax
	movl	%eax, (%rbx)
.LBB17_8:
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB17_10
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
.LBB17_2:
	.cfi_def_cfa_offset 32
	testl	%ecx, %ecx
	je	.LBB17_4
# %bb.3:
	movq	%rax, %rdi
	movq	%rdx, %r14
	movq	%rsi, %r15
	callq	lean_dec_ref_cold@PLT
	movq	%r15, %rsi
	movq	%r14, %rdx
	jmp	.LBB17_4
.LBB17_6:
	testl	%eax, %eax
	je	.LBB17_8
# %bb.7:
	movq	%rbx, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB17_8
.LBB17_10:
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end17:
	.size	l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___redArg___boxed, .Lfunc_end17-l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___redArg___boxed
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
	js	.LBB18_2
# %bb.1:
	leaq	1(,%rdi,2), %r15
.LBB18_3:
	callq	lean_inc_heartbeat@PLT
	movl	$32, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB18_26
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
	jne	.LBB18_21
# %bb.5:
	movq	8(%rbx), %rdi
	testb	$1, %dil
	jne	.LBB18_10
# %bb.6:
	movl	(%rdi), %ecx
	cmpl	$2, %ecx
	jl	.LBB18_8
# %bb.7:
	decl	%ecx
	movl	%ecx, (%rdi)
.LBB18_10:
	movq	16(%rbx), %rdi
	testb	$1, %dil
	jne	.LBB18_15
# %bb.11:
	movl	(%rdi), %ecx
	cmpl	$1, %ecx
	jle	.LBB18_12
# %bb.14:
	decl	%ecx
	movl	%ecx, (%rdi)
.LBB18_15:
	movq	%rax, %r14
	movq	24(%rbx), %rdi
	testb	$1, %dil
	jne	.LBB18_20
# %bb.16:
	movl	(%rdi), %eax
	cmpl	$1, %eax
	jle	.LBB18_17
# %bb.19:
	decl	%eax
	movl	%eax, (%rdi)
.LBB18_20:
	movq	%rbx, %rdi
	callq	lean_free_object@PLT
	movq	%r14, %rax
.LBB18_25:
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.LBB18_21:
	.cfi_def_cfa_offset 32
	jle	.LBB18_23
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
.LBB18_2:
	.cfi_def_cfa_offset 32
	callq	lean_big_usize_to_nat@PLT
	movq	%rax, %r15
	jmp	.LBB18_3
.LBB18_23:
	testl	%ecx, %ecx
	je	.LBB18_25
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
.LBB18_8:
	.cfi_def_cfa_offset 32
	testl	%ecx, %ecx
	je	.LBB18_10
# %bb.9:
	movq	%rax, %r14
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rax
	jmp	.LBB18_10
.LBB18_12:
	testl	%ecx, %ecx
	je	.LBB18_15
# %bb.13:
	movq	%rax, %r14
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rax
	jmp	.LBB18_15
.LBB18_17:
	testl	%eax, %eax
	je	.LBB18_20
# %bb.18:
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB18_20
.LBB18_26:
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end18:
	.size	l_LoopStudy_forNat, .Lfunc_end18-l_LoopStudy_forNat
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
	jl	.LBB19_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB19_4:
	movq	8(%rsi), %rbx
	movl	(%rsi), %eax
	cmpl	$2, %eax
	jl	.LBB19_6
# %bb.5:
	decl	%eax
	movl	%eax, (%rsi)
.LBB19_8:
	movq	%rbx, %rsi
	callq	l_LoopStudy_forNat
	movq	%rax, %rbx
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB19_10
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
.LBB19_2:
	.cfi_def_cfa_offset 32
	testl	%ecx, %ecx
	je	.LBB19_4
# %bb.3:
	movq	%rdi, %rbx
	movq	%rax, %rdi
	movq	%rsi, %r14
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rsi
	movq	%rbx, %rdi
	jmp	.LBB19_4
.LBB19_6:
	testl	%eax, %eax
	je	.LBB19_8
# %bb.7:
	movq	%rdi, %r14
	movq	%rsi, %rdi
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rdi
	jmp	.LBB19_8
.LBB19_10:
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end19:
	.size	l_LoopStudy_forNat___boxed, .Lfunc_end19-l_LoopStudy_forNat___boxed
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
.Lfunc_end20:
	.size	l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0, .Lfunc_end20-l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0
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
	.size	l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___boxed, .Lfunc_end21-l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00LoopStudy_forNat_spec__0___boxed
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
	jbe	.LBB22_5
# %bb.1:
	movabsq	$-4658895280553007687, %rcx     # imm = 0xBF58476D1CE4E5B9
	movabsq	$-7046029254386353130, %rdx     # imm = 0x9E3779B97F4A7C16
	movabsq	$-7723592293110705685, %r8      # imm = 0x94D049BB133111EB
	movl	%edi, %r10d
	subl	%esi, %r10d
	leaq	1(%rsi), %r9
	testb	$1, %r10b
	je	.LBB22_3
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
.LBB22_3:
	cmpq	%r9, %rdi
	je	.LBB22_5
	.p2align	4
.LBB22_4:                               # =>This Inner Loop Header: Depth=1
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
	jb	.LBB22_4
.LBB22_5:
	retq
.Lfunc_end22:
	.size	l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0___redArg, .Lfunc_end22-l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0___redArg
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
	jl	.LBB23_2
# %bb.1:
	decl	%eax
	movl	%eax, (%rdi)
.LBB23_4:
	movq	8(%rsi), %r15
	movl	(%rsi), %eax
	cmpl	$2, %eax
	jl	.LBB23_6
# %bb.5:
	decl	%eax
	movl	%eax, (%rsi)
.LBB23_8:
	movq	8(%rdx), %r14
	movl	(%rdx), %eax
	cmpl	$2, %eax
	jl	.LBB23_10
# %bb.9:
	decl	%eax
	movl	%eax, (%rdx)
.LBB23_12:
	cmpq	%r15, %rbx
	jbe	.LBB23_18
# %bb.13:
	movabsq	$-4658895280553007687, %rax     # imm = 0xBF58476D1CE4E5B9
	movabsq	$-7046029254386353131, %rcx     # imm = 0x9E3779B97F4A7C15
	movabsq	$-7723592293110705685, %rdx     # imm = 0x94D049BB133111EB
	movl	%ebx, %edi
	subl	%r15d, %edi
	leaq	1(%r15), %rsi
	testb	$1, %dil
	je	.LBB23_15
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
.LBB23_15:
	cmpq	%rsi, %rbx
	je	.LBB23_18
# %bb.16:
	subq	%r15, %rbx
	addq	%r15, %rcx
	.p2align	4
.LBB23_17:                              # =>This Inner Loop Header: Depth=1
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
	jne	.LBB23_17
.LBB23_18:
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB23_20
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
.LBB23_2:
	.cfi_def_cfa_offset 32
	testl	%eax, %eax
	je	.LBB23_4
# %bb.3:
	movq	%rdx, %r14
	movq	%rsi, %r15
	callq	lean_dec_ref_cold@PLT
	movq	%r15, %rsi
	movq	%r14, %rdx
	jmp	.LBB23_4
.LBB23_6:
	testl	%eax, %eax
	je	.LBB23_8
# %bb.7:
	movq	%rsi, %rdi
	movq	%rdx, %r14
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rdx
	jmp	.LBB23_8
.LBB23_10:
	testl	%eax, %eax
	je	.LBB23_12
# %bb.11:
	movq	%rdx, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB23_12
.LBB23_20:
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end23:
	.size	l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0___redArg___boxed, .Lfunc_end23-l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0___redArg___boxed
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
	je	.LBB24_8
# %bb.1:
	movabsq	$-4658895280553007687, %rdx     # imm = 0xBF58476D1CE4E5B9
	movabsq	$-7046029254386353131, %rsi     # imm = 0x9E3779B97F4A7C15
	movabsq	$-7723592293110705685, %rcx     # imm = 0x94D049BB133111EB
	cmpq	$1, %rdi
	jne	.LBB24_3
# %bb.2:
	xorl	%r8d, %r8d
	jmp	.LBB24_7
.LBB24_3:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %r9
	andq	$-2, %r9
	negq	%r9
	xorl	%r8d, %r8d
	movq	%rsi, %r10
	.p2align	4
.LBB24_4:                               # =>This Inner Loop Header: Depth=1
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
	jne	.LBB24_4
# %bb.5:
	testb	$1, %dil
	popq	%rbx
	.cfi_def_cfa_offset 8
	.cfi_restore %rbx
	je	.LBB24_8
# %bb.6:
	negq	%r8
.LBB24_7:
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
.LBB24_8:
	retq
.Lfunc_end24:
	.size	l_LoopStudy_forUSize, .Lfunc_end24-l_LoopStudy_forUSize
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
	jl	.LBB25_2
# %bb.1:
	decl	%eax
	movl	%eax, (%rdi)
.LBB25_4:
	movq	8(%rsi), %rbx
	movl	(%rsi), %eax
	cmpl	$2, %eax
	jl	.LBB25_6
# %bb.5:
	decl	%eax
	movl	%eax, (%rsi)
.LBB25_8:
	testq	%r14, %r14
	je	.LBB25_16
# %bb.9:
	movabsq	$-4658895280553007687, %rcx     # imm = 0xBF58476D1CE4E5B9
	movabsq	$-7046029254386353131, %rdx     # imm = 0x9E3779B97F4A7C15
	movabsq	$-7723592293110705685, %rax     # imm = 0x94D049BB133111EB
	cmpq	$1, %r14
	jne	.LBB25_11
# %bb.10:
	xorl	%esi, %esi
	jmp	.LBB25_15
.LBB25_11:
	movq	%r14, %rdi
	andq	$-2, %rdi
	negq	%rdi
	xorl	%esi, %esi
	movq	%rdx, %r8
	.p2align	4
.LBB25_12:                              # =>This Inner Loop Header: Depth=1
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
	jne	.LBB25_12
# %bb.13:
	testb	$1, %r14b
	je	.LBB25_16
# %bb.14:
	negq	%rsi
.LBB25_15:
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
.LBB25_16:
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB25_18
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
.LBB25_2:
	.cfi_def_cfa_offset 32
	testl	%eax, %eax
	je	.LBB25_4
# %bb.3:
	movq	%rsi, %rbx
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rsi
	jmp	.LBB25_4
.LBB25_6:
	testl	%eax, %eax
	je	.LBB25_8
# %bb.7:
	movq	%rsi, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB25_8
.LBB25_18:
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end25:
	.size	l_LoopStudy_forUSize___boxed, .Lfunc_end25-l_LoopStudy_forUSize___boxed
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
	jbe	.LBB26_6
# %bb.1:
	movabsq	$-4658895280553007687, %rdx     # imm = 0xBF58476D1CE4E5B9
	movabsq	$-7046029254386353131, %rsi     # imm = 0x9E3779B97F4A7C15
	movabsq	$-7723592293110705685, %r8      # imm = 0x94D049BB133111EB
	movl	%edi, %r10d
	subl	%ecx, %r10d
	leaq	1(%rcx), %r9
	testb	$1, %r10b
	je	.LBB26_3
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
.LBB26_3:
	cmpq	%r9, %rdi
	je	.LBB26_6
# %bb.4:
	subq	%rcx, %rdi
	addq	%rcx, %rsi
	.p2align	4
.LBB26_5:                               # =>This Inner Loop Header: Depth=1
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
	jne	.LBB26_5
.LBB26_6:
	retq
.Lfunc_end26:
	.size	l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0, .Lfunc_end26-l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0
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
	jl	.LBB27_2
# %bb.1:
	decl	%eax
	movl	%eax, (%rdi)
.LBB27_4:
	movq	8(%rcx), %r15
	movl	(%rcx), %eax
	cmpl	$2, %eax
	jl	.LBB27_6
# %bb.5:
	decl	%eax
	movl	%eax, (%rcx)
.LBB27_8:
	movq	8(%r8), %r14
	movl	(%r8), %eax
	cmpl	$2, %eax
	jl	.LBB27_10
# %bb.9:
	decl	%eax
	movl	%eax, (%r8)
.LBB27_12:
	cmpq	%r15, %rbx
	jbe	.LBB27_18
# %bb.13:
	movabsq	$-4658895280553007687, %rax     # imm = 0xBF58476D1CE4E5B9
	movabsq	$-7046029254386353131, %rcx     # imm = 0x9E3779B97F4A7C15
	movabsq	$-7723592293110705685, %rdx     # imm = 0x94D049BB133111EB
	movl	%ebx, %edi
	subl	%r15d, %edi
	leaq	1(%r15), %rsi
	testb	$1, %dil
	je	.LBB27_15
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
.LBB27_15:
	cmpq	%rsi, %rbx
	je	.LBB27_18
# %bb.16:
	subq	%r15, %rbx
	addq	%r15, %rcx
	.p2align	4
.LBB27_17:                              # =>This Inner Loop Header: Depth=1
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
	jne	.LBB27_17
.LBB27_18:
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB27_20
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
.LBB27_2:
	.cfi_def_cfa_offset 32
	testl	%eax, %eax
	je	.LBB27_4
# %bb.3:
	movq	%r8, %r14
	movq	%rcx, %r15
	callq	lean_dec_ref_cold@PLT
	movq	%r15, %rcx
	movq	%r14, %r8
	jmp	.LBB27_4
.LBB27_6:
	testl	%eax, %eax
	je	.LBB27_8
# %bb.7:
	movq	%rcx, %rdi
	movq	%r8, %r14
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %r8
	jmp	.LBB27_8
.LBB27_10:
	testl	%eax, %eax
	je	.LBB27_12
# %bb.11:
	movq	%r8, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB27_12
.LBB27_20:
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end27:
	.size	l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0___boxed, .Lfunc_end27-l_WellFounded_opaqueFix_u2083___at___00LoopStudy_forUSize_spec__0___boxed
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
	jbe	.LBB28_6
# %bb.1:
	movabsq	$-4658895280553007687, %rcx     # imm = 0xBF58476D1CE4E5B9
	movabsq	$-7046029254386353131, %rdx     # imm = 0x9E3779B97F4A7C15
	movabsq	$-7723592293110705685, %r8      # imm = 0x94D049BB133111EB
	movl	%edi, %r10d
	subl	%esi, %r10d
	leaq	1(%rsi), %r9
	testb	$1, %r10b
	je	.LBB28_3
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
.LBB28_3:
	cmpq	%r9, %rdi
	je	.LBB28_6
# %bb.4:
	addq	%rsi, %rdx
	subq	%rsi, %rdi
	.p2align	4
.LBB28_5:                               # =>This Inner Loop Header: Depth=1
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
	jne	.LBB28_5
.LBB28_6:
	retq
.Lfunc_end28:
	.size	l_LoopStudy_tailScalar, .Lfunc_end28-l_LoopStudy_tailScalar
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
	jl	.LBB29_2
# %bb.1:
	decl	%eax
	movl	%eax, (%rdi)
.LBB29_4:
	movq	8(%rsi), %r15
	movl	(%rsi), %eax
	cmpl	$2, %eax
	jl	.LBB29_6
# %bb.5:
	decl	%eax
	movl	%eax, (%rsi)
.LBB29_8:
	movq	8(%rdx), %r14
	movl	(%rdx), %eax
	cmpl	$2, %eax
	jl	.LBB29_10
# %bb.9:
	decl	%eax
	movl	%eax, (%rdx)
.LBB29_12:
	cmpq	%r15, %rbx
	jbe	.LBB29_18
# %bb.13:
	movabsq	$-4658895280553007687, %rax     # imm = 0xBF58476D1CE4E5B9
	movabsq	$-7046029254386353131, %rcx     # imm = 0x9E3779B97F4A7C15
	movabsq	$-7723592293110705685, %rdx     # imm = 0x94D049BB133111EB
	movl	%ebx, %edi
	subl	%r15d, %edi
	leaq	1(%r15), %rsi
	testb	$1, %dil
	je	.LBB29_15
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
.LBB29_15:
	cmpq	%rsi, %rbx
	je	.LBB29_18
# %bb.16:
	addq	%r15, %rcx
	subq	%r15, %rbx
	.p2align	4
.LBB29_17:                              # =>This Inner Loop Header: Depth=1
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
	jne	.LBB29_17
.LBB29_18:
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB29_20
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
.LBB29_2:
	.cfi_def_cfa_offset 32
	testl	%eax, %eax
	je	.LBB29_4
# %bb.3:
	movq	%rdx, %r14
	movq	%rsi, %r15
	callq	lean_dec_ref_cold@PLT
	movq	%r15, %rsi
	movq	%r14, %rdx
	jmp	.LBB29_4
.LBB29_6:
	testl	%eax, %eax
	je	.LBB29_8
# %bb.7:
	movq	%rsi, %rdi
	movq	%rdx, %r14
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rdx
	jmp	.LBB29_8
.LBB29_10:
	testl	%eax, %eax
	je	.LBB29_12
# %bb.11:
	movq	%rdx, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB29_12
.LBB29_20:
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end29:
	.size	l_LoopStudy_tailScalar___boxed, .Lfunc_end29-l_LoopStudy_tailScalar___boxed
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
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rsi, %rax
	movq	%rdi, 8(%rsp)                   # 8-byte Spill
	movabsq	$68719476737, %rbx              # imm = 0x1000000001
	jmp	.LBB30_1
	.p2align	4
.LBB30_43:                              #   in Loop: Header=BB30_1 Depth=1
	movq	16(%rsp), %rax                  # 8-byte Reload
	movq	%r12, 16(%rax)
	movq	%r14, 8(%rax)
.LBB30_1:                               # =>This Inner Loop Header: Depth=1
	movq	8(%rax), %r12
	movq	16(%rax), %r14
	movl	(%rax), %r13d
	cmpl	$1, %r13d
	jne	.LBB30_3
# %bb.2:                                #   in Loop: Header=BB30_1 Depth=1
	movq	%rax, %rdi
	jmp	.LBB30_18
	.p2align	4
.LBB30_3:                               #   in Loop: Header=BB30_1 Depth=1
	testb	$1, %r14b
	jne	.LBB30_8
# %bb.4:                                #   in Loop: Header=BB30_1 Depth=1
	movl	(%r14), %ecx
	testl	%ecx, %ecx
	jle	.LBB30_6
# %bb.5:                                #   in Loop: Header=BB30_1 Depth=1
	incl	%ecx
	movl	%ecx, (%r14)
.LBB30_8:                               #   in Loop: Header=BB30_1 Depth=1
	testb	$1, %r12b
	jne	.LBB30_13
# %bb.9:                                #   in Loop: Header=BB30_1 Depth=1
	movl	(%r12), %ecx
	testl	%ecx, %ecx
	jle	.LBB30_11
# %bb.10:                               #   in Loop: Header=BB30_1 Depth=1
	incl	%ecx
	movl	%ecx, (%r12)
.LBB30_13:                              #   in Loop: Header=BB30_1 Depth=1
	movl	$1, %edi
	testb	$1, %al
	jne	.LBB30_18
# %bb.14:                               #   in Loop: Header=BB30_1 Depth=1
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB30_16
# %bb.15:                               #   in Loop: Header=BB30_1 Depth=1
	decl	%ecx
	movl	%ecx, (%rax)
.LBB30_18:                              #   in Loop: Header=BB30_1 Depth=1
	movq	8(%r12), %rbp
	cmpq	8(%rsp), %rbp                   # 8-byte Folded Reload
	jae	.LBB30_19
# %bb.31:                               #   in Loop: Header=BB30_1 Depth=1
	testb	$1, %r12b
	jne	.LBB30_36
# %bb.32:                               #   in Loop: Header=BB30_1 Depth=1
	movl	(%r12), %eax
	cmpl	$2, %eax
	jl	.LBB30_34
# %bb.33:                               #   in Loop: Header=BB30_1 Depth=1
	decl	%eax
	movl	%eax, (%r12)
.LBB30_36:                              #   in Loop: Header=BB30_1 Depth=1
	movq	%rdi, 16(%rsp)                  # 8-byte Spill
	movl	%r13d, %r15d
	movq	8(%r14), %r13
	movl	(%r14), %eax
	cmpl	$2, %eax
	jl	.LBB30_38
# %bb.37:                               #   in Loop: Header=BB30_1 Depth=1
	decl	%eax
	movl	%eax, (%r14)
.LBB30_40:                              #   in Loop: Header=BB30_1 Depth=1
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB30_46
# %bb.41:                               #   in Loop: Header=BB30_1 Depth=1
	movq	%rax, %r14
	leaq	1(%rbp), %rax
	movq	%rbx, (%r14)
	movq	%rax, 8(%r14)
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB30_46
# %bb.42:                               #   in Loop: Header=BB30_1 Depth=1
	movq	%rax, %r12
	movabsq	$-7046029254386353131, %rax     # imm = 0x9E3779B97F4A7C15
	addq	%rax, %rbp
	xorq	%rbp, %r13
	movabsq	$-4658895280553007687, %rax     # imm = 0xBF58476D1CE4E5B9
	imulq	%rax, %r13
	movq	%r13, %rax
	shrq	$29, %rax
	xorq	%r13, %rax
	movabsq	$-7723592293110705685, %rcx     # imm = 0x94D049BB133111EB
	imulq	%rcx, %rax
	movq	%rax, %rcx
	shrq	$31, %rcx
	xorq	%rax, %rcx
	movq	%rbx, (%r12)
	movq	%rcx, 8(%r12)
	cmpl	$1, %r15d
	je	.LBB30_43
# %bb.44:                               #   in Loop: Header=BB30_1 Depth=1
	callq	lean_inc_heartbeat@PLT
	movl	$24, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB30_46
# %bb.45:                               #   in Loop: Header=BB30_1 Depth=1
	movabsq	$563053032636417, %rcx          # imm = 0x2001800000001
	movq	%rcx, (%rax)
	movq	%r14, 8(%rax)
	movq	%r12, 16(%rax)
	jmp	.LBB30_1
.LBB30_38:                              #   in Loop: Header=BB30_1 Depth=1
	testl	%eax, %eax
	je	.LBB30_40
# %bb.39:                               #   in Loop: Header=BB30_1 Depth=1
	movq	%r14, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB30_40
.LBB30_34:                              #   in Loop: Header=BB30_1 Depth=1
	testl	%eax, %eax
	je	.LBB30_36
# %bb.35:                               #   in Loop: Header=BB30_1 Depth=1
	movq	%rdi, %r15
	movq	%r12, %rdi
	callq	lean_dec_ref_cold@PLT
	movq	%r15, %rdi
	jmp	.LBB30_36
.LBB30_6:                               #   in Loop: Header=BB30_1 Depth=1
	cmpl	$-1879048191, %ecx              # imm = 0x90000001
	jb	.LBB30_8
# %bb.7:                                #   in Loop: Header=BB30_1 Depth=1
	lock		decl	(%r14)
	jmp	.LBB30_8
.LBB30_11:                              #   in Loop: Header=BB30_1 Depth=1
	cmpl	$-1879048191, %ecx              # imm = 0x90000001
	jb	.LBB30_13
# %bb.12:                               #   in Loop: Header=BB30_1 Depth=1
	lock		decl	(%r12)
	jmp	.LBB30_13
.LBB30_16:                              #   in Loop: Header=BB30_1 Depth=1
	testl	%ecx, %ecx
	je	.LBB30_18
# %bb.17:                               #   in Loop: Header=BB30_1 Depth=1
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
	movl	$1, %edi
	jmp	.LBB30_18
.LBB30_19:
	testb	$1, %dil
	jne	.LBB30_21
# %bb.20:
	callq	lean_free_object@PLT
.LBB30_21:
	testb	$1, %r12b
	jne	.LBB30_26
# %bb.22:
	movl	(%r12), %eax
	cmpl	$2, %eax
	jl	.LBB30_24
# %bb.23:
	decl	%eax
	movl	%eax, (%r12)
.LBB30_26:
	movq	8(%r14), %rax
	movl	(%r14), %ecx
	cmpl	$2, %ecx
	jl	.LBB30_28
# %bb.27:
	decl	%ecx
	movl	%ecx, (%r14)
.LBB30_30:
	addq	$24, %rsp
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
.LBB30_28:
	.cfi_def_cfa_offset 80
	testl	%ecx, %ecx
	je	.LBB30_30
# %bb.29:
	movq	%r14, %rdi
	movq	%rax, %rbx
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rax
	jmp	.LBB30_30
.LBB30_24:
	testl	%eax, %eax
	je	.LBB30_26
# %bb.25:
	movq	%r12, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB30_26
.LBB30_46:
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end30:
	.size	l_LoopStudy_tailPair, .Lfunc_end30-l_LoopStudy_tailPair
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
	movq	%rdi, %rax
	movq	8(%rdi), %rdi
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB31_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB31_4:
	callq	l_LoopStudy_tailPair
	movq	%rax, %rbx
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB31_6
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
.LBB31_2:
	.cfi_def_cfa_offset 32
	testl	%ecx, %ecx
	je	.LBB31_4
# %bb.3:
	movq	%rdi, %rbx
	movq	%rax, %rdi
	movq	%rsi, %r14
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rdi
	movq	%r14, %rsi
	jmp	.LBB31_4
.LBB31_6:
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end31:
	.size	l_LoopStudy_tailPair___boxed, .Lfunc_end31-l_LoopStudy_tailPair___boxed
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
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rsi, %r14
	movq	8(%rsi), %rbp
	movq	%rdi, 8(%rsp)                   # 8-byte Spill
	cmpq	%rdi, 8(%rbp)
	jae	.LBB32_46
# %bb.1:
	leaq	8(%r14), %rbx
	leaq	8(%rbp), %r15
	movabsq	$68719476737, %r13              # imm = 0x1000000001
	jmp	.LBB32_2
	.p2align	4
.LBB32_42:                              #   in Loop: Header=BB32_2 Depth=1
	movq	%r12, 16(%r14)
	movq	%rbp, 8(%r14)
.LBB32_45:                              #   in Loop: Header=BB32_2 Depth=1
	movq	%rbp, %r15
	addq	$8, %r15
	leaq	8(%r14), %rbx
	movq	8(%rsp), %rax                   # 8-byte Reload
	cmpq	%rax, (%r15)
	jae	.LBB32_46
.LBB32_2:                               # =>This Inner Loop Header: Depth=1
	movq	16(%r14), %r12
	testb	$1, %r12b
	jne	.LBB32_7
# %bb.3:                                #   in Loop: Header=BB32_2 Depth=1
	movl	(%r12), %eax
	testl	%eax, %eax
	jle	.LBB32_5
# %bb.4:                                #   in Loop: Header=BB32_2 Depth=1
	incl	%eax
	movl	%eax, (%r12)
.LBB32_7:                               #   in Loop: Header=BB32_2 Depth=1
	testb	$1, %bpl
	jne	.LBB32_12
# %bb.8:                                #   in Loop: Header=BB32_2 Depth=1
	movl	(%rbp), %eax
	testl	%eax, %eax
	jle	.LBB32_10
# %bb.9:                                #   in Loop: Header=BB32_2 Depth=1
	incl	%eax
	movl	%eax, (%rbp)
.LBB32_12:                              #   in Loop: Header=BB32_2 Depth=1
	movl	(%r14), %eax
	cmpl	$1, %eax
	movq	%rax, 16(%rsp)                  # 8-byte Spill
	jne	.LBB32_23
# %bb.13:                               #   in Loop: Header=BB32_2 Depth=1
	movq	16(%r14), %rdi
	testb	$1, %dil
	jne	.LBB32_18
# %bb.14:                               #   in Loop: Header=BB32_2 Depth=1
	movl	(%rdi), %eax
	cmpl	$2, %eax
	jl	.LBB32_16
# %bb.15:                               #   in Loop: Header=BB32_2 Depth=1
	decl	%eax
	movl	%eax, (%rdi)
.LBB32_18:                              #   in Loop: Header=BB32_2 Depth=1
	movq	(%rbx), %rdi
	testb	$1, %dil
	jne	.LBB32_29
# %bb.19:                               #   in Loop: Header=BB32_2 Depth=1
	movl	(%rdi), %eax
	cmpl	$2, %eax
	jl	.LBB32_21
# %bb.20:                               #   in Loop: Header=BB32_2 Depth=1
	decl	%eax
	movl	%eax, (%rdi)
	jmp	.LBB32_29
	.p2align	4
.LBB32_23:                              #   in Loop: Header=BB32_2 Depth=1
	testb	$1, %r14b
	jne	.LBB32_28
# %bb.24:                               #   in Loop: Header=BB32_2 Depth=1
	cmpl	$2, %eax
	jl	.LBB32_26
# %bb.25:                               #   in Loop: Header=BB32_2 Depth=1
	decl	%eax
	movl	%eax, (%r14)
.LBB32_28:                              #   in Loop: Header=BB32_2 Depth=1
	movl	$1, %r14d
.LBB32_29:                              #   in Loop: Header=BB32_2 Depth=1
	movq	(%r15), %rbx
	testb	$1, %bpl
	jne	.LBB32_34
# %bb.30:                               #   in Loop: Header=BB32_2 Depth=1
	movl	(%rbp), %eax
	cmpl	$2, %eax
	jl	.LBB32_32
# %bb.31:                               #   in Loop: Header=BB32_2 Depth=1
	decl	%eax
	movl	%eax, (%rbp)
.LBB32_34:                              #   in Loop: Header=BB32_2 Depth=1
	movq	8(%r12), %r15
	testb	$1, %r12b
	jne	.LBB32_39
# %bb.35:                               #   in Loop: Header=BB32_2 Depth=1
	movl	(%r12), %eax
	cmpl	$2, %eax
	jl	.LBB32_37
# %bb.36:                               #   in Loop: Header=BB32_2 Depth=1
	decl	%eax
	movl	%eax, (%r12)
.LBB32_39:                              #   in Loop: Header=BB32_2 Depth=1
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB32_47
# %bb.40:                               #   in Loop: Header=BB32_2 Depth=1
	movq	%rax, %rbp
	leaq	1(%rbx), %rax
	movq	%r13, (%rbp)
	movq	%rax, 8(%rbp)
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB32_47
# %bb.41:                               #   in Loop: Header=BB32_2 Depth=1
	movq	%rax, %r12
	movabsq	$-7046029254386353131, %rax     # imm = 0x9E3779B97F4A7C15
	addq	%rax, %rbx
	xorq	%rbx, %r15
	movabsq	$-4658895280553007687, %rax     # imm = 0xBF58476D1CE4E5B9
	imulq	%rax, %r15
	movq	%r15, %rax
	shrq	$29, %rax
	xorq	%r15, %rax
	movabsq	$-7723592293110705685, %rcx     # imm = 0x94D049BB133111EB
	imulq	%rcx, %rax
	movq	%rax, %rcx
	shrq	$31, %rcx
	xorq	%rax, %rcx
	movq	%r13, (%r12)
	movq	%rcx, 8(%r12)
	cmpl	$1, 16(%rsp)                    # 4-byte Folded Reload
	je	.LBB32_42
# %bb.43:                               #   in Loop: Header=BB32_2 Depth=1
	callq	lean_inc_heartbeat@PLT
	movl	$24, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB32_47
# %bb.44:                               #   in Loop: Header=BB32_2 Depth=1
	movq	%rax, %r14
	movabsq	$563053032636417, %rax          # imm = 0x2001800000001
	movq	%rax, (%r14)
	movq	%rbp, 8(%r14)
	movq	%r12, 16(%r14)
	jmp	.LBB32_45
.LBB32_5:                               #   in Loop: Header=BB32_2 Depth=1
	cmpl	$-1879048191, %eax              # imm = 0x90000001
	jb	.LBB32_7
# %bb.6:                                #   in Loop: Header=BB32_2 Depth=1
	lock		decl	(%r12)
	jmp	.LBB32_7
.LBB32_10:                              #   in Loop: Header=BB32_2 Depth=1
	cmpl	$-1879048191, %eax              # imm = 0x90000001
	jb	.LBB32_12
# %bb.11:                               #   in Loop: Header=BB32_2 Depth=1
	lock		decl	(%rbp)
	jmp	.LBB32_12
.LBB32_32:                              #   in Loop: Header=BB32_2 Depth=1
	testl	%eax, %eax
	je	.LBB32_34
# %bb.33:                               #   in Loop: Header=BB32_2 Depth=1
	movq	%rbp, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB32_34
.LBB32_37:                              #   in Loop: Header=BB32_2 Depth=1
	testl	%eax, %eax
	je	.LBB32_39
# %bb.38:                               #   in Loop: Header=BB32_2 Depth=1
	movq	%r12, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB32_39
.LBB32_16:                              #   in Loop: Header=BB32_2 Depth=1
	testl	%eax, %eax
	je	.LBB32_18
# %bb.17:                               #   in Loop: Header=BB32_2 Depth=1
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB32_18
.LBB32_21:                              #   in Loop: Header=BB32_2 Depth=1
	testl	%eax, %eax
	je	.LBB32_29
# %bb.22:                               #   in Loop: Header=BB32_2 Depth=1
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB32_29
.LBB32_26:                              #   in Loop: Header=BB32_2 Depth=1
	testl	%eax, %eax
	je	.LBB32_28
# %bb.27:                               #   in Loop: Header=BB32_2 Depth=1
	movq	%r14, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB32_28
.LBB32_46:
	movq	%r14, %rax
	addq	$24, %rsp
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
.LBB32_47:
	.cfi_def_cfa_offset 80
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end32:
	.size	l_LoopStudy_tailPairReturn, .Lfunc_end32-l_LoopStudy_tailPairReturn
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
	movq	%rdi, %rax
	movq	8(%rdi), %rdi
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB33_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%rax)
	jmp	l_LoopStudy_tailPairReturn      # TAILCALL
.LBB33_2:
	testl	%ecx, %ecx
	je	l_LoopStudy_tailPairReturn      # TAILCALL
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
	jmp	l_LoopStudy_tailPairReturn      # TAILCALL
.Lfunc_end33:
	.size	l_LoopStudy_tailPairReturn___boxed, .Lfunc_end33-l_LoopStudy_tailPairReturn___boxed
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
	jae	.LBB34_1
# %bb.2:
	movq	%rdi, %rbx
	movq	16(%rsi), %r13
	movabsq	$-7046029254386353131, %rdi     # imm = 0x9E3779B97F4A7C15
	movabsq	$-4658895280553007687, %r15     # imm = 0xBF58476D1CE4E5B9
	movabsq	$-7723592293110705685, %r12     # imm = 0x94D049BB133111EB
	jmp	.LBB34_3
	.p2align	4
.LBB34_13:                              #   in Loop: Header=BB34_3 Depth=1
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
	je	.LBB34_14
.LBB34_3:                               # =>This Inner Loop Header: Depth=1
	movl	(%rsi), %r14d
	cmpl	$1, %r14d
	jne	.LBB34_5
# %bb.4:                                #   in Loop: Header=BB34_3 Depth=1
	movq	%rsi, %rax
	jmp	.LBB34_10
	.p2align	4
.LBB34_5:                               #   in Loop: Header=BB34_3 Depth=1
	movl	$1, %eax
	testb	$1, %sil
	jne	.LBB34_10
# %bb.6:                                #   in Loop: Header=BB34_3 Depth=1
	cmpl	$2, %r14d
	jl	.LBB34_8
# %bb.7:                                #   in Loop: Header=BB34_3 Depth=1
	leal	-1(%r14), %ecx
	movl	%ecx, (%rsi)
.LBB34_10:                              #   in Loop: Header=BB34_3 Depth=1
	cmpl	$1, %r14d
	je	.LBB34_13
# %bb.11:                               #   in Loop: Header=BB34_3 Depth=1
	movq	%rdi, %r14
	callq	lean_inc_heartbeat@PLT
	movl	$24, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB34_15
# %bb.12:                               #   in Loop: Header=BB34_3 Depth=1
	movabsq	$103079215105, %rcx             # imm = 0x1800000001
	movq	%rcx, (%rax)
	movq	%r14, %rdi
	jmp	.LBB34_13
.LBB34_8:                               #   in Loop: Header=BB34_3 Depth=1
	testl	%r14d, %r14d
	je	.LBB34_10
# %bb.9:                                #   in Loop: Header=BB34_3 Depth=1
	movq	%rsi, %rdi
	callq	lean_dec_ref_cold@PLT
	movabsq	$-7046029254386353131, %rdi     # imm = 0x9E3779B97F4A7C15
	movl	$1, %eax
	jmp	.LBB34_10
.LBB34_1:
	movq	%rsi, %rax
.LBB34_14:
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
.LBB34_15:
	.cfi_def_cfa_offset 64
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end34:
	.size	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___redArg, .Lfunc_end34-l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___redArg
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
	jl	.LBB35_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%rax)
	jmp	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___redArg # TAILCALL
.LBB35_2:
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
.Lfunc_end35:
	.size	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___redArg___boxed, .Lfunc_end35-l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___redArg___boxed
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
	je	.LBB36_6
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
	jl	.LBB36_3
# %bb.2:
	decl	%ecx
	movl	%ecx, (%rdi)
.LBB36_5:
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.LBB36_3:
	.cfi_def_cfa_offset 32
	testl	%ecx, %ecx
	je	.LBB36_5
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
.LBB36_6:
	.cfi_def_cfa_offset 32
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end36:
	.size	l_LoopStudy_whileStruct, .Lfunc_end36-l_LoopStudy_whileStruct
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
	jl	.LBB37_2
# %bb.1:
	decl	%eax
	movl	%eax, (%rdi)
.LBB37_4:
	movq	8(%rsi), %r14
	movl	(%rsi), %eax
	cmpl	$2, %eax
	jl	.LBB37_6
# %bb.5:
	decl	%eax
	movl	%eax, (%rsi)
.LBB37_8:
	callq	lean_inc_heartbeat@PLT
	movl	$24, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB37_15
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
	jl	.LBB37_11
# %bb.10:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB37_13:
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB37_15
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
.LBB37_2:
	.cfi_def_cfa_offset 32
	testl	%eax, %eax
	je	.LBB37_4
# %bb.3:
	movq	%rsi, %r14
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rsi
	jmp	.LBB37_4
.LBB37_6:
	testl	%eax, %eax
	je	.LBB37_8
# %bb.7:
	movq	%rsi, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB37_8
.LBB37_11:
	testl	%ecx, %ecx
	je	.LBB37_13
# %bb.12:
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB37_13
.LBB37_15:
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end37:
	.size	l_LoopStudy_whileStruct___boxed, .Lfunc_end37-l_LoopStudy_whileStruct___boxed
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
.Lfunc_end38:
	.size	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0, .Lfunc_end38-l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0
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
	jl	.LBB39_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%rax)
	movq	%rdx, %rsi
	jmp	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___redArg # TAILCALL
.LBB39_2:
	testl	%ecx, %ecx
	je	.LBB39_4
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
.LBB39_4:
	movq	%rdx, %rsi
	jmp	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___redArg # TAILCALL
.Lfunc_end39:
	.size	l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___boxed, .Lfunc_end39-l___private_Init_While_0__repeatM_erased___at___00LoopStudy_whileStruct_spec__0___boxed
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
	jmp	.LBB40_1
	.p2align	4
.LBB40_15:                              #   in Loop: Header=BB40_1 Depth=1
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
.LBB40_1:                               # =>This Inner Loop Header: Depth=1
	movl	(%rsi), %r13d
	cmpl	$1, %r13d
	jne	.LBB40_3
# %bb.2:                                #   in Loop: Header=BB40_1 Depth=1
	movq	%rsi, %rax
	jmp	.LBB40_8
	.p2align	4
.LBB40_3:                               #   in Loop: Header=BB40_1 Depth=1
	movl	$1, %eax
	testb	$1, %sil
	jne	.LBB40_8
# %bb.4:                                #   in Loop: Header=BB40_1 Depth=1
	cmpl	$2, %r13d
	jl	.LBB40_6
# %bb.5:                                #   in Loop: Header=BB40_1 Depth=1
	leal	-1(%r13), %ecx
	movl	%ecx, (%rsi)
.LBB40_8:                               #   in Loop: Header=BB40_1 Depth=1
	cmpq	%rdi, %r15
	jae	.LBB40_9
# %bb.12:                               #   in Loop: Header=BB40_1 Depth=1
	cmpl	$1, %r13d
	je	.LBB40_15
# %bb.13:                               #   in Loop: Header=BB40_1 Depth=1
	movq	%rdx, %r13
	callq	lean_inc_heartbeat@PLT
	movl	$24, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB40_16
# %bb.14:                               #   in Loop: Header=BB40_1 Depth=1
	movabsq	$103079215105, %rcx             # imm = 0x1800000001
	movq	%rcx, (%rax)
	movq	%r13, %rdx
	movq	(%rsp), %rdi                    # 8-byte Reload
	jmp	.LBB40_15
.LBB40_6:                               #   in Loop: Header=BB40_1 Depth=1
	testl	%r13d, %r13d
	je	.LBB40_8
# %bb.7:                                #   in Loop: Header=BB40_1 Depth=1
	movq	%rsi, %rdi
	callq	lean_dec_ref_cold@PLT
	movq	(%rsp), %rdi                    # 8-byte Reload
	movabsq	$-7046029254386353131, %rdx     # imm = 0x9E3779B97F4A7C15
	movl	$1, %eax
	jmp	.LBB40_8
.LBB40_9:
	testb	$1, %al
	jne	.LBB40_11
# %bb.10:
	movq	%rax, %rdi
	callq	lean_free_object@PLT
.LBB40_11:
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
.LBB40_16:
	.cfi_def_cfa_offset 64
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end40:
	.size	l_LoopStudy_tailStruct, .Lfunc_end40-l_LoopStudy_tailStruct
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
	jl	.LBB41_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB41_4:
	callq	l_LoopStudy_tailStruct
	movq	%rax, %rbx
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB41_6
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
.LBB41_2:
	.cfi_def_cfa_offset 32
	testl	%ecx, %ecx
	je	.LBB41_4
# %bb.3:
	movq	%rdi, %rbx
	movq	%rax, %rdi
	movq	%rsi, %r14
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rdi
	movq	%r14, %rsi
	jmp	.LBB41_4
.LBB41_6:
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end41:
	.size	l_LoopStudy_tailStruct___boxed, .Lfunc_end41-l_LoopStudy_tailStruct___boxed
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
	jmp	.LBB42_1
.LBB42_10:                              #   in Loop: Header=BB42_1 Depth=1
	decl	%eax
	movl	%eax, (%r14)
.LBB42_13:                              #   in Loop: Header=BB42_1 Depth=1
	movq	%rbp, %rax
	.p2align	4
.LBB42_14:                              #   in Loop: Header=BB42_1 Depth=1
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
.LBB42_1:                               # =>This Inner Loop Header: Depth=1
	testb	$1, %dil
	je	.LBB42_2
# %bb.15:                               #   in Loop: Header=BB42_1 Depth=1
	cmpq	$1, %rdi
	je	.LBB42_16
# %bb.7:                                #   in Loop: Header=BB42_1 Depth=1
	movl	$1, %ebx
	jbe	.LBB42_14
# %bb.8:                                #   in Loop: Header=BB42_1 Depth=1
	addq	$-2, %rdi
	movq	%rdi, %rbx
	jmp	.LBB42_14
.LBB42_2:                               #   in Loop: Header=BB42_1 Depth=1
	movq	%rax, %rbp
	movl	$1, %esi
	movq	%rdi, %r14
	callq	lean_nat_big_eq@PLT
	testb	%al, %al
	jne	.LBB42_3
# %bb.9:                                #   in Loop: Header=BB42_1 Depth=1
	movl	$3, %esi
	movq	%r14, %rdi
	callq	lean_nat_big_sub@PLT
	movq	%rax, %rbx
	movl	(%r14), %eax
	cmpl	$2, %eax
	jge	.LBB42_10
# %bb.11:                               #   in Loop: Header=BB42_1 Depth=1
	testl	%eax, %eax
	je	.LBB42_13
# %bb.12:                               #   in Loop: Header=BB42_1 Depth=1
	movq	%r14, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB42_13
.LBB42_3:
	movl	(%r14), %ecx
	cmpl	$2, %ecx
	movq	%rbp, %rax
	jl	.LBB42_5
# %bb.4:
	decl	%ecx
	movl	%ecx, (%r14)
.LBB42_16:
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
.LBB42_5:
	.cfi_def_cfa_offset 64
	testl	%ecx, %ecx
	je	.LBB42_16
# %bb.6:
	movq	%r14, %rdi
	callq	lean_dec_ref_cold@PLT
	movq	%rbp, %rax
	jmp	.LBB42_16
.Lfunc_end42:
	.size	l_LoopStudy_tailFuel, .Lfunc_end42-l_LoopStudy_tailFuel
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
	jl	.LBB43_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB43_4:
	movq	8(%rdx), %rbx
	movl	(%rdx), %eax
	cmpl	$2, %eax
	jl	.LBB43_6
# %bb.5:
	decl	%eax
	movl	%eax, (%rdx)
.LBB43_8:
	movq	%rbx, %rdx
	callq	l_LoopStudy_tailFuel
	movq	%rax, %rbx
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB43_10
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
.LBB43_2:
	.cfi_def_cfa_offset 32
	testl	%ecx, %ecx
	je	.LBB43_4
# %bb.3:
	movq	%rdi, %rbx
	movq	%rax, %rdi
	movq	%rsi, %r14
	movq	%rdx, %r15
	callq	lean_dec_ref_cold@PLT
	movq	%r15, %rdx
	movq	%rbx, %rdi
	movq	%r14, %rsi
	jmp	.LBB43_4
.LBB43_6:
	testl	%eax, %eax
	je	.LBB43_8
# %bb.7:
	movq	%rdi, %r14
	movq	%rdx, %rdi
	movq	%rsi, %r15
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rdi
	movq	%r15, %rsi
	jmp	.LBB43_8
.LBB43_10:
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end43:
	.size	l_LoopStudy_tailFuel___boxed, .Lfunc_end43-l_LoopStudy_tailFuel___boxed
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
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdx, %rbx
	movq	%rsi, %r14
	leaq	l_LoopStudy_runVariant___closed__0_value(%rip), %rax
	cmpq	%rax, %rdi
	je	.LBB44_3
# %bb.1:
	movq	%rdi, %r15
	cmpq	$9, 8(%rdi)
	jne	.LBB44_8
# %bb.2:
	leaq	l_LoopStudy_runVariant___closed__0_value(%rip), %rsi
	movq	%r15, %rdi
	callq	lean_string_eq_cold@PLT
	testb	%al, %al
	je	.LBB44_8
.LBB44_3:
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	l_LoopStudy_idWhile
.LBB44_4:
	movq	%rax, %r14
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB44_76
# %bb.5:
	movq	%rax, %rbx
	movabsq	$68719476737, %rax              # imm = 0x1000000001
	movq	%rax, (%rbx)
	movq	%r14, 8(%rbx)
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB44_76
# %bb.6:
	movabsq	$281543696187393, %rcx          # imm = 0x1001000000001
	movq	%rcx, (%rax)
.LBB44_7:
	movq	%rbx, 8(%rax)
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.LBB44_8:
	.cfi_def_cfa_offset 32
	leaq	l_LoopStudy_runVariant___closed__1_value(%rip), %rax
	cmpq	%rax, %r15
	je	.LBB44_11
# %bb.9:
	cmpq	$9, 8(%r15)
	jne	.LBB44_12
# %bb.10:
	leaq	l_LoopStudy_runVariant___closed__1_value(%rip), %rsi
	movq	%r15, %rdi
	callq	lean_string_eq_cold@PLT
	testb	%al, %al
	je	.LBB44_12
.LBB44_11:
	movq	%r14, %rdi
	movq	%rbx, %rsi
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	l_LoopStudy_ioWhile             # TAILCALL
.LBB44_12:
	.cfi_def_cfa_offset 32
	leaq	l_LoopStudy_runVariant___closed__2_value(%rip), %rax
	cmpq	%rax, %r15
	je	.LBB44_15
# %bb.13:
	cmpq	$8, 8(%r15)
	jne	.LBB44_16
# %bb.14:
	leaq	l_LoopStudy_runVariant___closed__2_value(%rip), %rsi
	movq	%r15, %rdi
	callq	lean_string_eq_cold@PLT
	testb	%al, %al
	je	.LBB44_16
.LBB44_15:
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	l_LoopStudy_forNat
	jmp	.LBB44_4
.LBB44_16:
	leaq	l_LoopStudy_runVariant___closed__3_value(%rip), %rax
	cmpq	%rax, %r15
	je	.LBB44_19
# %bb.17:
	cmpq	$10, 8(%r15)
	jne	.LBB44_22
# %bb.18:
	leaq	l_LoopStudy_runVariant___closed__3_value(%rip), %rsi
	movq	%r15, %rdi
	callq	lean_string_eq_cold@PLT
	testb	%al, %al
	je	.LBB44_22
.LBB44_19:
	testq	%r14, %r14
	je	.LBB44_38
# %bb.20:
	movabsq	$-4658895280553007687, %rcx     # imm = 0xBF58476D1CE4E5B9
	movabsq	$-7046029254386353131, %rdx     # imm = 0x9E3779B97F4A7C15
	movabsq	$-7723592293110705685, %rax     # imm = 0x94D049BB133111EB
	cmpq	$1, %r14
	jne	.LBB44_33
# %bb.21:
	xorl	%esi, %esi
	jmp	.LBB44_37
.LBB44_22:
	leaq	l_LoopStudy_runVariant___closed__4_value(%rip), %rax
	cmpq	%rax, %r15
	je	.LBB44_25
# %bb.23:
	cmpq	$12, 8(%r15)
	jne	.LBB44_28
# %bb.24:
	leaq	l_LoopStudy_runVariant___closed__4_value(%rip), %rsi
	movq	%r15, %rdi
	callq	lean_string_eq_cold@PLT
	testb	%al, %al
	je	.LBB44_28
.LBB44_25:
	testq	%r14, %r14
	je	.LBB44_54
# %bb.26:
	movabsq	$-4658895280553007687, %rcx     # imm = 0xBF58476D1CE4E5B9
	movabsq	$-7046029254386353131, %rdx     # imm = 0x9E3779B97F4A7C15
	movabsq	$-7723592293110705685, %rax     # imm = 0x94D049BB133111EB
	cmpq	$1, %r14
	jne	.LBB44_50
# %bb.27:
	xorl	%esi, %esi
	jmp	.LBB44_53
.LBB44_28:
	leaq	l_LoopStudy_runVariant___closed__5_value(%rip), %rax
	cmpq	%rax, %r15
	je	.LBB44_31
# %bb.29:
	cmpq	$10, 8(%r15)
	jne	.LBB44_42
# %bb.30:
	leaq	l_LoopStudy_runVariant___closed__5_value(%rip), %rsi
	movq	%r15, %rdi
	callq	lean_string_eq_cold@PLT
	testb	%al, %al
	je	.LBB44_42
.LBB44_31:
	movq	l_LoopStudy_idWhile___boxed__const__1(%rip), %r15
	movq	%rbx, %rdi
	callq	lean_box_uint64
	movq	%rax, %rbx
	xorl	%edi, %edi
	movl	$2, %esi
	xorl	%edx, %edx
	callq	lean_alloc_ctor
	movq	%r15, 8(%rax)
	movq	%rbx, 16(%rax)
	movq	%r14, %rdi
	movq	%rax, %rsi
	callq	l_LoopStudy_tailPair
.LBB44_32:
	movq	%rax, %rdi
	jmp	.LBB44_55
.LBB44_33:
	movq	%r14, %rdi
	andq	$-2, %rdi
	negq	%rdi
	xorl	%esi, %esi
	movq	%rdx, %r8
	.p2align	4
.LBB44_34:                              # =>This Inner Loop Header: Depth=1
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
	jne	.LBB44_34
# %bb.35:
	testb	$1, %r14b
	je	.LBB44_38
# %bb.36:
	negq	%rsi
.LBB44_37:
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
.LBB44_38:
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB44_76
# %bb.39:
	movq	%rax, %r14
	movabsq	$68719476737, %rax              # imm = 0x1000000001
	movq	%rax, (%r14)
	movq	%rbx, 8(%r14)
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB44_76
# %bb.40:
	movabsq	$281543696187393, %rcx          # imm = 0x1001000000001
	movq	%rcx, (%rax)
.LBB44_41:
	movq	%r14, 8(%rax)
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.LBB44_42:
	.cfi_def_cfa_offset 32
	leaq	l_LoopStudy_runVariant___closed__6_value(%rip), %rax
	cmpq	%rax, %r15
	je	.LBB44_45
# %bb.43:
	cmpq	$17, 8(%r15)
	jne	.LBB44_57
# %bb.44:
	leaq	l_LoopStudy_runVariant___closed__6_value(%rip), %rsi
	movq	%r15, %rdi
	callq	lean_string_eq_cold@PLT
	testb	%al, %al
	je	.LBB44_57
.LBB44_45:
	movq	l_LoopStudy_idWhile___boxed__const__1(%rip), %r15
	movq	%rbx, %rdi
	callq	lean_box_uint64
	movq	%rax, %rbx
	xorl	%edi, %edi
	movl	$2, %esi
	xorl	%edx, %edx
	callq	lean_alloc_ctor
	movq	%r15, 8(%rax)
	movq	%rbx, 16(%rax)
	movq	%r14, %rdi
	movq	%rax, %rsi
	callq	l_LoopStudy_tailPairReturn
	movq	16(%rax), %rbx
	testb	$1, %bl
	jne	.LBB44_48
# %bb.46:
	movl	(%rbx), %ecx
	testl	%ecx, %ecx
	jle	.LBB44_74
# %bb.47:
	incl	%ecx
	movl	%ecx, (%rbx)
.LBB44_48:
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB44_72
# %bb.49:
	decl	%ecx
	movl	%ecx, (%rax)
	jmp	.LBB44_56
.LBB44_50:
	movq	%r14, %rdi
	andq	$-2, %rdi
	xorl	%esi, %esi
	movq	%rdx, %r8
	.p2align	4
.LBB44_51:                              # =>This Inner Loop Header: Depth=1
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
	jne	.LBB44_51
# %bb.52:
	testb	$1, %r14b
	je	.LBB44_54
.LBB44_53:
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
.LBB44_54:
	movq	%rbx, %rdi
.LBB44_55:
	callq	lean_box_uint64
	movq	%rax, %rbx
.LBB44_56:
	xorl	%edi, %edi
	movl	$1, %esi
	xorl	%edx, %edx
	callq	lean_alloc_ctor
	jmp	.LBB44_7
.LBB44_57:
	leaq	l_LoopStudy_runVariant___closed__7_value(%rip), %rax
	cmpq	%rax, %r15
	je	.LBB44_60
# %bb.58:
	cmpq	$13, 8(%r15)
	jne	.LBB44_61
# %bb.59:
	leaq	l_LoopStudy_runVariant___closed__7_value(%rip), %rsi
	movq	%r15, %rdi
	callq	lean_string_eq_cold@PLT
	testb	%al, %al
	je	.LBB44_61
.LBB44_60:
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	l_LoopStudy_whileStruct
	jmp	.LBB44_32
.LBB44_61:
	leaq	l_LoopStudy_runVariant___closed__8_value(%rip), %rax
	cmpq	%rax, %r15
	je	.LBB44_64
# %bb.62:
	cmpq	$12, 8(%r15)
	jne	.LBB44_65
# %bb.63:
	leaq	l_LoopStudy_runVariant___closed__8_value(%rip), %rsi
	movq	%r15, %rdi
	callq	lean_string_eq_cold@PLT
	testb	%al, %al
	je	.LBB44_65
.LBB44_64:
	xorl	%edi, %edi
	xorl	%esi, %esi
	movl	$16, %edx
	callq	lean_alloc_ctor
	movq	$0, 8(%rax)
	movq	%rbx, 16(%rax)
	movq	%r14, %rdi
	movq	%rax, %rsi
	callq	l_LoopStudy_tailStruct
	jmp	.LBB44_32
.LBB44_65:
	leaq	l_LoopStudy_runVariant___closed__9_value(%rip), %rax
	cmpq	%rax, %r15
	je	.LBB44_68
# %bb.66:
	cmpq	$10, 8(%r15)
	jne	.LBB44_71
# %bb.67:
	leaq	l_LoopStudy_runVariant___closed__9_value(%rip), %rsi
	movq	%r15, %rdi
	callq	lean_string_eq_cold@PLT
	testb	%al, %al
	je	.LBB44_71
.LBB44_68:
	testq	%r14, %r14
	js	.LBB44_77
# %bb.69:
	leaq	1(,%r14,2), %rdi
.LBB44_70:
	xorl	%esi, %esi
	movq	%rbx, %rdx
	callq	l_LoopStudy_tailFuel
	jmp	.LBB44_32
.LBB44_71:
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
	movl	$1, %esi
	xorl	%edx, %edx
	callq	lean_alloc_ctor
	jmp	.LBB44_41
.LBB44_72:
	testl	%ecx, %ecx
	je	.LBB44_56
# %bb.73:
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB44_56
.LBB44_74:
	cmpl	$-1879048191, %ecx              # imm = 0x90000001
	jb	.LBB44_48
# %bb.75:
	lock		decl	(%rbx)
	jmp	.LBB44_48
.LBB44_76:
	callq	lean_internal_panic_out_of_memory@PLT
.LBB44_77:
	movq	%r14, %rdi
	callq	lean_big_usize_to_nat@PLT
	movq	%rax, %rdi
	jmp	.LBB44_70
.Lfunc_end44:
	.size	l_LoopStudy_runVariant, .Lfunc_end44-l_LoopStudy_runVariant
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
	jl	.LBB45_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB45_4:
	movq	8(%rdx), %r14
	movl	(%rdx), %eax
	cmpl	$2, %eax
	jl	.LBB45_6
# %bb.5:
	decl	%eax
	movl	%eax, (%rdx)
.LBB45_8:
	movq	%rbx, %rdi
	movq	%r14, %rdx
	callq	l_LoopStudy_runVariant
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB45_10
# %bb.9:
	decl	%ecx
	movl	%ecx, (%rbx)
.LBB45_12:
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.LBB45_2:
	.cfi_def_cfa_offset 32
	testl	%ecx, %ecx
	je	.LBB45_4
# %bb.3:
	movq	%rax, %rdi
	movq	%rsi, %r14
	movq	%rdx, %r15
	callq	lean_dec_ref_cold@PLT
	movq	%r15, %rdx
	movq	%r14, %rsi
	jmp	.LBB45_4
.LBB45_6:
	testl	%eax, %eax
	je	.LBB45_8
# %bb.7:
	movq	%rdx, %rdi
	movq	%rsi, %r15
	callq	lean_dec_ref_cold@PLT
	movq	%r15, %rsi
	jmp	.LBB45_8
.LBB45_10:
	testl	%ecx, %ecx
	je	.LBB45_12
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
.Lfunc_end45:
	.size	l_LoopStudy_runVariant___boxed, .Lfunc_end45-l_LoopStudy_runVariant___boxed
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
	je	.LBB46_170
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
	jne	.LBB46_18
# %bb.2:
	movq	8(%r15), %rdi
	testb	$1, %dil
	jne	.LBB46_7
# %bb.3:
	movl	(%rdi), %eax
	cmpl	$2, %eax
	jl	.LBB46_5
# %bb.4:
	decl	%eax
	movl	%eax, (%rdi)
.LBB46_7:
	movq	16(%r15), %rdi
	testb	$1, %dil
	jne	.LBB46_12
# %bb.8:
	movl	(%rdi), %eax
	cmpl	$1, %eax
	jle	.LBB46_9
# %bb.11:
	decl	%eax
	movl	%eax, (%rdi)
.LBB46_12:
	movq	24(%r15), %rdi
	testb	$1, %dil
	jne	.LBB46_17
# %bb.13:
	movl	(%rdi), %eax
	cmpl	$1, %eax
	jle	.LBB46_14
# %bb.16:
	decl	%eax
	movl	%eax, (%rdi)
.LBB46_17:
	movq	%r15, %rdi
	callq	lean_free_object@PLT
	jmp	.LBB46_22
.LBB46_18:
	jle	.LBB46_20
# %bb.19:
	decl	%eax
	movl	%eax, (%r15)
.LBB46_22:
	testb	$1, %r12b
	jne	.LBB46_23
# %bb.24:
	movq	%r12, %rdi
	callq	lean_usize_of_big_nat@PLT
	movq	%rax, %r15
	movl	(%r12), %eax
	cmpl	$2, %eax
	jl	.LBB46_26
# %bb.25:
	decl	%eax
	movl	%eax, (%r12)
	jmp	.LBB46_28
.LBB46_23:
	shrq	%r12
	movq	%r12, %r15
.LBB46_28:
	leaq	l_main___closed__1_value(%rip), %rdx
	movl	$5, %esi
	movq	%r14, %rdi
	callq	l_List_getD___redArg@PLT
	movq	%rax, %r13
	testb	$1, %r14b
	jne	.LBB46_33
# %bb.29:
	movl	(%r14), %eax
	cmpl	$2, %eax
	jl	.LBB46_31
# %bb.30:
	decl	%eax
	movl	%eax, (%r14)
.LBB46_33:
	movq	8(%r13), %r14
	callq	lean_inc_heartbeat@PLT
	movl	$32, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB46_170
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
	jne	.LBB46_51
# %bb.35:
	movq	8(%r12), %rdi
	testb	$1, %dil
	jne	.LBB46_40
# %bb.36:
	movl	(%rdi), %eax
	cmpl	$2, %eax
	jl	.LBB46_38
# %bb.37:
	decl	%eax
	movl	%eax, (%rdi)
.LBB46_40:
	movq	16(%r12), %rdi
	testb	$1, %dil
	jne	.LBB46_45
# %bb.41:
	movl	(%rdi), %eax
	cmpl	$1, %eax
	jle	.LBB46_42
# %bb.44:
	decl	%eax
	movl	%eax, (%rdi)
.LBB46_45:
	movq	24(%r12), %rdi
	testb	$1, %dil
	jne	.LBB46_50
# %bb.46:
	movl	(%rdi), %eax
	cmpl	$1, %eax
	jle	.LBB46_47
# %bb.49:
	decl	%eax
	movl	%eax, (%rdi)
.LBB46_50:
	movq	%r12, %rdi
	callq	lean_free_object@PLT
	jmp	.LBB46_55
.LBB46_51:
	jle	.LBB46_53
# %bb.52:
	decl	%eax
	movl	%eax, (%r12)
.LBB46_55:
	testb	$1, %r14b
	jne	.LBB46_56
# %bb.57:
	movq	%r14, %rdi
	callq	lean_uint64_of_big_nat@PLT
	movq	%rax, %r13
	movl	(%r14), %eax
	cmpl	$2, %eax
	jl	.LBB46_59
# %bb.58:
	decl	%eax
	movl	%eax, (%r14)
	jmp	.LBB46_61
.LBB46_56:
	shrq	%r14
	movq	%r14, %r13
.LBB46_61:
	movq	%r15, %rsi
	shrq	%rsi
	movq	%rbx, %rdi
	movq	%r13, %rdx
	callq	l_LoopStudy_runVariant
	testb	$1, %al
	jne	.LBB46_62
# %bb.63:
	movzbl	7(%rax), %ecx
	testl	%ecx, %ecx
	je	.LBB46_65
.LBB46_171:
	testb	$1, %bl
	jne	.LBB46_158
# %bb.172:
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB46_174
# %bb.173:
	decl	%ecx
	movl	%ecx, (%rbx)
	jmp	.LBB46_158
.LBB46_62:
	movq	%rax, %rcx
	shrq	%rcx
	testl	%ecx, %ecx
	jne	.LBB46_171
.LBB46_65:
	movq	8(%rax), %r14
	testb	$1, %r14b
	jne	.LBB46_70
# %bb.66:
	movl	(%r14), %ecx
	testl	%ecx, %ecx
	jle	.LBB46_68
# %bb.67:
	incl	%ecx
	movl	%ecx, (%r14)
.LBB46_70:
	movl	(%rax), %ecx
	cmpl	$1, %ecx
	jne	.LBB46_77
# %bb.71:
	movq	8(%rax), %rdi
	testb	$1, %dil
	jne	.LBB46_76
# %bb.72:
	movl	(%rdi), %ecx
	cmpl	$2, %ecx
	jl	.LBB46_74
# %bb.73:
	decl	%ecx
	movl	%ecx, (%rdi)
.LBB46_76:
	movq	%rax, %rdi
	callq	lean_free_object@PLT
	jmp	.LBB46_81
.LBB46_77:
	jle	.LBB46_79
# %bb.78:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB46_81:
	xorl	%eax, %eax
	callq	lean_io_mono_nanos_now@PLT
	movq	%rax, %r12
	movq	%rbx, %rdi
	movq	%r15, %rsi
	movq	%r13, %rdx
	callq	l_LoopStudy_runVariant
	testb	$1, %bl
	jne	.LBB46_86
# %bb.82:
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB46_84
# %bb.83:
	decl	%ecx
	movl	%ecx, (%rbx)
.LBB46_86:
	testb	$1, %al
	jne	.LBB46_87
# %bb.88:
	movzbl	7(%rax), %ecx
	testl	%ecx, %ecx
	je	.LBB46_90
.LBB46_147:
	testb	$1, %r12b
	jne	.LBB46_152
# %bb.148:
	movl	(%r12), %ecx
	cmpl	$2, %ecx
	jl	.LBB46_150
# %bb.149:
	decl	%ecx
	movl	%ecx, (%r12)
.LBB46_152:
	testb	$1, %r14b
	jne	.LBB46_158
# %bb.153:
	movl	(%r14), %ecx
	cmpl	$2, %ecx
	jl	.LBB46_155
# %bb.154:
	decl	%ecx
	movl	%ecx, (%r14)
.LBB46_158:
	cmpl	$1, (%rax)
	je	.LBB46_177
# %bb.159:
	movq	8(%rax), %rbx
	testb	$1, %bl
	jne	.LBB46_164
# %bb.160:
	movl	(%rbx), %ecx
	testl	%ecx, %ecx
	jle	.LBB46_162
# %bb.161:
	incl	%ecx
	movl	%ecx, (%rbx)
.LBB46_164:
	testb	$1, %al
	jne	.LBB46_169
# %bb.165:
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB46_167
# %bb.166:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB46_169:
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB46_170
# %bb.176:
	movabsq	$72339137734115329, %rcx        # imm = 0x101001000000001
	movq	%rcx, (%rax)
	movq	%rbx, 8(%rax)
.LBB46_177:
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
.LBB46_87:
	.cfi_def_cfa_offset 64
	movq	%rax, %rcx
	shrq	%rcx
	testl	%ecx, %ecx
	jne	.LBB46_147
.LBB46_90:
	movq	8(%rax), %rbx
	testb	$1, %bl
	jne	.LBB46_95
# %bb.91:
	movl	(%rbx), %ecx
	testl	%ecx, %ecx
	jle	.LBB46_93
# %bb.92:
	incl	%ecx
	movl	%ecx, (%rbx)
.LBB46_95:
	movl	(%rax), %ecx
	cmpl	$1, %ecx
	jne	.LBB46_102
# %bb.96:
	movq	8(%rax), %rdi
	testb	$1, %dil
	jne	.LBB46_101
# %bb.97:
	movl	(%rdi), %ecx
	cmpl	$2, %ecx
	jl	.LBB46_99
# %bb.98:
	decl	%ecx
	movl	%ecx, (%rdi)
.LBB46_101:
	movq	%rax, %rdi
	callq	lean_free_object@PLT
	jmp	.LBB46_106
.LBB46_102:
	jle	.LBB46_104
# %bb.103:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB46_106:
	xorl	%eax, %eax
	callq	lean_io_mono_nanos_now@PLT
	testb	$1, %al
	je	.LBB46_111
# %bb.107:
	testb	$1, %r12b
	je	.LBB46_108
# %bb.109:
	shrq	%rax
	shrq	%r12
	movl	$1, %edi
	subq	%r12, %rax
	jb	.LBB46_122
# %bb.110:
	leaq	1(,%rax,2), %rdi
.LBB46_122:
	callq	l_Nat_reprFast@PLT
	leaq	l_main___closed__2_value(%rip), %rsi
	movq	%rax, %rdi
	callq	lean_string_append@PLT
	movq	%rax, %r15
	movq	8(%rbx), %rdi
	testb	$1, %bl
	jne	.LBB46_127
# %bb.123:
	movl	(%rbx), %eax
	cmpl	$2, %eax
	jl	.LBB46_125
# %bb.124:
	decl	%eax
	movl	%eax, (%rbx)
.LBB46_127:
	testq	%rdi, %rdi
	js	.LBB46_129
# %bb.128:
	leaq	1(,%rdi,2), %rdi
.LBB46_130:
	callq	l_Nat_reprFast@PLT
	movq	%rax, %rbx
	movq	%r15, %rdi
	movq	%rax, %rsi
	callq	lean_string_append@PLT
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB46_132
# %bb.131:
	decl	%ecx
	movl	%ecx, (%rbx)
.LBB46_134:
	leaq	l_main___closed__2_value(%rip), %rsi
	movq	%rax, %rdi
	callq	lean_string_append@PLT
	movq	%rax, %rbx
	movq	8(%r14), %rdi
	testb	$1, %r14b
	jne	.LBB46_139
# %bb.135:
	movl	(%r14), %eax
	cmpl	$2, %eax
	jl	.LBB46_137
# %bb.136:
	decl	%eax
	movl	%eax, (%r14)
.LBB46_139:
	testq	%rdi, %rdi
	js	.LBB46_141
# %bb.140:
	leaq	1(,%rdi,2), %rdi
.LBB46_142:
	callq	l_Nat_reprFast@PLT
	movq	%rax, %r14
	movq	%rbx, %rdi
	movq	%rax, %rsi
	callq	lean_string_append@PLT
	movl	(%r14), %ecx
	cmpl	$2, %ecx
	jl	.LBB46_144
# %bb.143:
	decl	%ecx
	movl	%ecx, (%r14)
.LBB46_146:
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
.LBB46_20:
	.cfi_def_cfa_offset 64
	testl	%eax, %eax
	je	.LBB46_22
# %bb.21:
	movq	%r15, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB46_22
.LBB46_26:
	testl	%eax, %eax
	je	.LBB46_28
# %bb.27:
	movq	%r12, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB46_28
.LBB46_31:
	testl	%eax, %eax
	je	.LBB46_33
# %bb.32:
	movq	%r14, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB46_33
.LBB46_53:
	testl	%eax, %eax
	je	.LBB46_55
# %bb.54:
	movq	%r12, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB46_55
.LBB46_59:
	testl	%eax, %eax
	je	.LBB46_61
# %bb.60:
	movq	%r14, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB46_61
.LBB46_174:
	testl	%ecx, %ecx
	je	.LBB46_158
# %bb.175:
	movq	%rbx, %rdi
	jmp	.LBB46_157
.LBB46_5:
	testl	%eax, %eax
	je	.LBB46_7
# %bb.6:
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB46_7
.LBB46_9:
	testl	%eax, %eax
	je	.LBB46_12
# %bb.10:
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB46_12
.LBB46_14:
	testl	%eax, %eax
	je	.LBB46_17
# %bb.15:
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB46_17
.LBB46_38:
	testl	%eax, %eax
	je	.LBB46_40
# %bb.39:
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB46_40
.LBB46_42:
	testl	%eax, %eax
	je	.LBB46_45
# %bb.43:
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB46_45
.LBB46_47:
	testl	%eax, %eax
	je	.LBB46_50
# %bb.48:
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB46_50
.LBB46_162:
	cmpl	$-1879048191, %ecx              # imm = 0x90000001
	jb	.LBB46_164
# %bb.163:
	lock		decl	(%rbx)
	jmp	.LBB46_164
.LBB46_167:
	testl	%ecx, %ecx
	je	.LBB46_169
# %bb.168:
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB46_169
.LBB46_68:
	cmpl	$-1879048191, %ecx              # imm = 0x90000001
	jb	.LBB46_70
# %bb.69:
	lock		decl	(%r14)
	jmp	.LBB46_70
.LBB46_79:
	testl	%ecx, %ecx
	je	.LBB46_81
# %bb.80:
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB46_81
.LBB46_84:
	testl	%ecx, %ecx
	je	.LBB46_86
# %bb.85:
	movq	%rbx, %rdi
	movq	%rax, %rbx
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rax
	jmp	.LBB46_86
.LBB46_111:
	movq	%rax, %rdi
	movq	%r12, %rsi
	movq	%rax, %r15
	callq	lean_nat_big_sub@PLT
	movq	%rax, %rdi
	movq	%r15, %rax
	testb	$1, %r12b
	je	.LBB46_112
	jmp	.LBB46_117
.LBB46_129:
	callq	lean_big_uint64_to_nat@PLT
	movq	%rax, %rdi
	jmp	.LBB46_130
.LBB46_132:
	testl	%ecx, %ecx
	je	.LBB46_134
# %bb.133:
	movq	%rbx, %rdi
	movq	%rax, %rbx
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rax
	jmp	.LBB46_134
.LBB46_141:
	callq	lean_big_uint64_to_nat@PLT
	movq	%rax, %rdi
	jmp	.LBB46_142
.LBB46_144:
	testl	%ecx, %ecx
	je	.LBB46_146
# %bb.145:
	movq	%r14, %rdi
	movq	%rax, %rbx
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rax
	jmp	.LBB46_146
.LBB46_108:
	movq	%rax, %rdi
	movq	%r12, %rsi
	movq	%rax, %r15
	callq	lean_nat_big_sub@PLT
	movq	%rax, %rdi
	movq	%r15, %rax
.LBB46_112:
	movq	%rdi, %r15
	movq	%rax, %r13
	movl	(%r12), %eax
	cmpl	$2, %eax
	jl	.LBB46_114
# %bb.113:
	decl	%eax
	movl	%eax, (%r12)
.LBB46_116:
	movq	%r13, %rax
	testb	$1, %al
	movq	%r15, %rdi
	jne	.LBB46_122
.LBB46_117:
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB46_119
# %bb.118:
	decl	%ecx
	movl	%ecx, (%rax)
	jmp	.LBB46_122
.LBB46_150:
	testl	%ecx, %ecx
	je	.LBB46_152
# %bb.151:
	movq	%r12, %rdi
	movq	%rax, %rbx
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rax
	jmp	.LBB46_152
.LBB46_155:
	testl	%ecx, %ecx
	je	.LBB46_158
# %bb.156:
	movq	%r14, %rdi
.LBB46_157:
	movq	%rax, %rbx
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rax
	jmp	.LBB46_158
.LBB46_74:
	testl	%ecx, %ecx
	je	.LBB46_76
# %bb.75:
	movq	%rax, %r12
	callq	lean_dec_ref_cold@PLT
	movq	%r12, %rax
	jmp	.LBB46_76
.LBB46_93:
	cmpl	$-1879048191, %ecx              # imm = 0x90000001
	jb	.LBB46_95
# %bb.94:
	lock		decl	(%rbx)
	jmp	.LBB46_95
.LBB46_104:
	testl	%ecx, %ecx
	je	.LBB46_106
# %bb.105:
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB46_106
.LBB46_125:
	testl	%eax, %eax
	je	.LBB46_127
# %bb.126:
	movq	%rdi, %r12
	movq	%rbx, %rdi
	callq	lean_dec_ref_cold@PLT
	movq	%r12, %rdi
	jmp	.LBB46_127
.LBB46_137:
	testl	%eax, %eax
	je	.LBB46_139
# %bb.138:
	movq	%rdi, %r15
	movq	%r14, %rdi
	callq	lean_dec_ref_cold@PLT
	movq	%r15, %rdi
	jmp	.LBB46_139
.LBB46_99:
	testl	%ecx, %ecx
	je	.LBB46_101
# %bb.100:
	movq	%rax, %r15
	callq	lean_dec_ref_cold@PLT
	movq	%r15, %rax
	jmp	.LBB46_101
.LBB46_170:
	callq	lean_internal_panic_out_of_memory@PLT
.LBB46_114:
	testl	%eax, %eax
	je	.LBB46_116
# %bb.115:
	movq	%r12, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB46_116
.LBB46_119:
	movq	%rdi, %r15
	testl	%ecx, %ecx
	je	.LBB46_121
# %bb.120:
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
.LBB46_121:
	movq	%r15, %rdi
	jmp	.LBB46_122
.Lfunc_end46:
	.size	_lean_main, .Lfunc_end46-_lean_main
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
.Lfunc_end47:
	.size	l_main___boxed, .Lfunc_end47-l_main___boxed
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
	jne	.LBB48_3
.LBB48_1:
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB48_2
# %bb.23:
	movabsq	$281543696187393, %rcx          # imm = 0x1001000000001
	movq	%rcx, (%rax)
	movq	$1, 8(%rax)
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.LBB48_3:
	.cfi_def_cfa_offset 16
	movb	$1, _G_initialized(%rip)
	movzbl	%dil, %ebx
	movl	%ebx, %edi
	callq	initialize_Init@PLT
	movzbl	7(%rax), %ecx
	shll	$24, %ecx
	cmpl	$16777216, %ecx                 # imm = 0x1000000
	je	.LBB48_24
# %bb.4:
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB48_6
# %bb.5:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB48_8:
	movl	%ebx, %edi
	callq	initialize_Init@PLT
	movzbl	7(%rax), %ecx
	shll	$24, %ecx
	cmpl	$16777216, %ecx                 # imm = 0x1000000
	je	.LBB48_24
# %bb.9:
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB48_11
# %bb.10:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB48_13:
	movl	%ebx, %edi
	callq	initialize_Std@PLT
	movzbl	7(%rax), %ecx
	shll	$24, %ecx
	cmpl	$16777216, %ecx                 # imm = 0x1000000
	je	.LBB48_24
# %bb.14:
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB48_16
# %bb.15:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB48_18:
	movl	%ebx, %edi
	callq	initialize_SplitProd@PLT
	movzbl	7(%rax), %ecx
	shll	$24, %ecx
	cmpl	$16777216, %ecx                 # imm = 0x1000000
	jne	.LBB48_19
.LBB48_24:
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.LBB48_19:
	.cfi_def_cfa_offset 16
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB48_21
# %bb.20:
	decl	%ecx
	movl	%ecx, (%rax)
	jmp	.LBB48_1
.LBB48_6:
	testl	%ecx, %ecx
	je	.LBB48_8
# %bb.7:
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB48_8
.LBB48_11:
	testl	%ecx, %ecx
	je	.LBB48_13
# %bb.12:
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB48_13
.LBB48_16:
	testl	%ecx, %ecx
	je	.LBB48_18
# %bb.17:
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB48_18
.LBB48_21:
	testl	%ecx, %ecx
	je	.LBB48_1
# %bb.22:
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB48_1
.LBB48_2:
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end48:
	.size	initialize_build_Kernels, .Lfunc_end48-initialize_build_Kernels
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
	jl	.LBB49_4
# %bb.1:
	movq	%rsi, %rbx
	movl	%edi, %r15d
	incq	%r15
	movl	$1, %r13d
	movabsq	$72620647070564353, %r12        # imm = 0x102001800000001
	.p2align	4
.LBB49_2:                               # =>This Inner Loop Header: Depth=1
	callq	lean_inc_heartbeat@PLT
	movl	$24, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB49_5
# %bb.3:                                #   in Loop: Header=BB49_2 Depth=1
	movq	%rax, %r14
	movq	%r12, (%rax)
	movq	-16(%rbx,%r15,8), %rdi
	callq	lean_mk_string@PLT
	movq	%rax, 8(%r14)
	movq	%r13, 16(%r14)
	decq	%r15
	movq	%r14, %r13
	cmpq	$2, %r15
	jg	.LBB49_2
.LBB49_4:
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
.LBB49_5:
	.cfi_def_cfa_offset 48
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end49:
	.size	run_main, .Lfunc_end49-run_main
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
	ja	.LBB50_6
# %bb.1:
	movl	(%rbx), %eax
	cmpl	$2, %eax
	jl	.LBB50_3
# %bb.2:
	decl	%eax
	movl	%eax, (%rbx)
.LBB50_5:
	callq	lean_init_task_manager@PLT
	leaq	run_main(%rip), %rdi
	movl	%ebp, %esi
	movq	%r14, %rdx
	callq	lean_run_main@PLT
	movq	%rax, %rbx
.LBB50_6:
	callq	lean_finalize_task_manager@PLT
	cmpl	$16777215, 4(%rbx)              # imm = 0xFFFFFF
	ja	.LBB50_11
# %bb.7:
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB50_9
# %bb.8:
	decl	%ecx
	movl	%ecx, (%rbx)
	xorl	%eax, %eax
.LBB50_16:
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB50_11:
	.cfi_def_cfa_offset 32
	movq	%rbx, %rdi
	callq	lean_io_result_show_error@PLT
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB50_13
# %bb.12:
	decl	%ecx
	movl	%ecx, (%rbx)
.LBB50_15:
	movl	$1, %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB50_3:
	.cfi_def_cfa_offset 32
	testl	%eax, %eax
	je	.LBB50_5
# %bb.4:
	movq	%rbx, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB50_5
.LBB50_9:
	xorl	%eax, %eax
	testl	%ecx, %ecx
	je	.LBB50_16
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
.LBB50_13:
	.cfi_def_cfa_offset 32
	movl	$1, %eax
	testl	%ecx, %ecx
	je	.LBB50_16
# %bb.14:
	movq	%rbx, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB50_15
.Lfunc_end50:
	.size	main, .Lfunc_end50-main
	.cfi_endproc
                                        # -- End function
	.hidden	l_LoopStudy_idWhile___boxed__const__1 # @l_LoopStudy_idWhile___boxed__const__1
	.type	l_LoopStudy_idWhile___boxed__const__1,@object
	.section	.data.l_LoopStudy_idWhile___boxed__const__1,"aw",@progbits
	.globl	l_LoopStudy_idWhile___boxed__const__1
	.p2align	3, 0x0
l_LoopStudy_idWhile___boxed__const__1:
	.quad	l_LoopStudy_idWhile___boxed__const__1_value
	.size	l_LoopStudy_idWhile___boxed__const__1, 8

	.type	_G_initialized,@object          # @_G_initialized
	.section	.bss._G_initialized,"aw",@nobits
_G_initialized:
	.byte	0                               # 0x0
	.size	_G_initialized, 1

	.type	l_LoopStudy_idWhile___boxed__const__1_value,@object # @l_LoopStudy_idWhile___boxed__const__1_value
	.section	.rodata.l_LoopStudy_idWhile___boxed__const__1_value,"a",@progbits
	.p2align	3, 0x0
l_LoopStudy_idWhile___boxed__const__1_value:
	.long	0                               # 0x0
	.byte	16                              # 0x10
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.zero	8
	.size	l_LoopStudy_idWhile___boxed__const__1_value, 16

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
	.addrsig_sym l_LoopStudy_idWhile___boxed__const__1_value
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
