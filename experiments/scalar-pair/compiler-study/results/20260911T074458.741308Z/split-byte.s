	.file	"split-byte.c"
	.section	.text.l_CompilerStudy_ByteWork_checksumByte,"ax",@progbits
	.hidden	l_CompilerStudy_ByteWork_checksumByte # -- Begin function l_CompilerStudy_ByteWork_checksumByte
	.globl	l_CompilerStudy_ByteWork_checksumByte
	.p2align	4
	.type	l_CompilerStudy_ByteWork_checksumByte,@function
l_CompilerStudy_ByteWork_checksumByte:  # @l_CompilerStudy_ByteWork_checksumByte
	.cfi_startproc
# %bb.0:
	movl	%esi, %eax
	addq	%rdi, %rax
	movabsq	$1099511628211, %rcx            # imm = 0x100000001B3
	imulq	%rax, %rcx
	movabsq	$3997430708598723931, %rax      # imm = 0x3779BA0CD843D55B
	addq	%rcx, %rax
	retq
.Lfunc_end0:
	.size	l_CompilerStudy_ByteWork_checksumByte, .Lfunc_end0-l_CompilerStudy_ByteWork_checksumByte
	.cfi_endproc
                                        # -- End function
	.section	.text.l_CompilerStudy_ByteWork_checksumByte___boxed,"ax",@progbits
	.hidden	l_CompilerStudy_ByteWork_checksumByte___boxed # -- Begin function l_CompilerStudy_ByteWork_checksumByte___boxed
	.globl	l_CompilerStudy_ByteWork_checksumByte___boxed
	.p2align	4
	.type	l_CompilerStudy_ByteWork_checksumByte___boxed,@function
l_CompilerStudy_ByteWork_checksumByte___boxed: # @l_CompilerStudy_ByteWork_checksumByte___boxed
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
	movq	8(%rdi), %r14
	movl	(%rdi), %eax
	cmpl	$2, %eax
	jl	.LBB1_2
# %bb.1:
	decl	%eax
	movl	%eax, (%rdi)
.LBB1_4:
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB1_6
# %bb.5:
	shrl	%ebx
	movzbl	%bl, %ecx
	addq	%rcx, %r14
	movabsq	$1099511628211, %rcx            # imm = 0x100000001B3
	imulq	%r14, %rcx
	movabsq	$3997430708598723931, %rdx      # imm = 0x3779BA0CD843D55B
	addq	%rcx, %rdx
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
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB1_4
.LBB1_6:
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end1:
	.size	l_CompilerStudy_ByteWork_checksumByte___boxed, .Lfunc_end1-l_CompilerStudy_ByteWork_checksumByte___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l_CompilerStudy_ByteWork_finishRound,"ax",@progbits
	.hidden	l_CompilerStudy_ByteWork_finishRound # -- Begin function l_CompilerStudy_ByteWork_finishRound
	.globl	l_CompilerStudy_ByteWork_finishRound
	.p2align	4
	.type	l_CompilerStudy_ByteWork_finishRound,@function
l_CompilerStudy_ByteWork_finishRound:   # @l_CompilerStudy_ByteWork_finishRound
	.cfi_startproc
# %bb.0:
	movq	%rdi, %rax
	shrq	$33, %rax
	xorq	%rdi, %rax
	retq
.Lfunc_end2:
	.size	l_CompilerStudy_ByteWork_finishRound, .Lfunc_end2-l_CompilerStudy_ByteWork_finishRound
	.cfi_endproc
                                        # -- End function
	.section	.text.l_CompilerStudy_ByteWork_finishRound___boxed,"ax",@progbits
	.hidden	l_CompilerStudy_ByteWork_finishRound___boxed # -- Begin function l_CompilerStudy_ByteWork_finishRound___boxed
	.globl	l_CompilerStudy_ByteWork_finishRound___boxed
	.p2align	4
	.type	l_CompilerStudy_ByteWork_finishRound___boxed,@function
l_CompilerStudy_ByteWork_finishRound___boxed: # @l_CompilerStudy_ByteWork_finishRound___boxed
	.cfi_startproc
# %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	8(%rdi), %rbx
	movl	(%rdi), %eax
	cmpl	$2, %eax
	jl	.LBB3_2
# %bb.1:
	decl	%eax
	movl	%eax, (%rdi)
.LBB3_4:
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB3_6
# %bb.5:
	movq	%rbx, %rcx
	shrq	$33, %rcx
	xorq	%rbx, %rcx
	movabsq	$68719476737, %rdx              # imm = 0x1000000001
	movq	%rdx, (%rax)
	movq	%rcx, 8(%rax)
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.LBB3_2:
	.cfi_def_cfa_offset 16
	testl	%eax, %eax
	je	.LBB3_4
# %bb.3:
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB3_4
.LBB3_6:
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end3:
	.size	l_CompilerStudy_ByteWork_finishRound___boxed, .Lfunc_end3-l_CompilerStudy_ByteWork_finishRound___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0___redArg,"ax",@progbits
	.hidden	l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0___redArg # -- Begin function l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0___redArg
	.globl	l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0___redArg
	.p2align	4
	.type	l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0___redArg,@function
l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0___redArg: # @l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0___redArg
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
	movq	%rsi, %rbx
	movq	%rdi, %r14
	.p2align	4
.LBB4_1:                                # =>This Inner Loop Header: Depth=1
	movq	%rdx, %r15
	movq	16(%r14), %rsi
	movq	24(%r14), %r12
	testb	$1, %r15b
	je	.LBB4_8
# %bb.2:                                #   in Loop: Header=BB4_1 Depth=1
	testb	$1, %sil
	je	.LBB4_3
# %bb.45:                               #   in Loop: Header=BB4_1 Depth=1
	cmpq	%rsi, %r15
	jae	.LBB4_46
.LBB4_4:                                #   in Loop: Header=BB4_1 Depth=1
	movq	%r15, %rdi
	shrq	%rdi
	movq	%r15, %rax
	je	.LBB4_15
# %bb.5:                                #   in Loop: Header=BB4_1 Depth=1
	movq	%rdi, %rax
	movl	$31, %ecx
	mulq	%rcx
	seto	%cl
	testq	%rax, %rax
	js	.LBB4_13
# %bb.6:                                #   in Loop: Header=BB4_1 Depth=1
	testb	%cl, %cl
	je	.LBB4_7
.LBB4_13:                               #   in Loop: Header=BB4_1 Depth=1
	movl	$31, %esi
	callq	lean_nat_overflow_mul@PLT
	testb	$1, %al
	jne	.LBB4_16
	jmp	.LBB4_19
.LBB4_7:                                #   in Loop: Header=BB4_1 Depth=1
	leaq	1(,%rax,2), %rax
	.p2align	4
.LBB4_15:                               #   in Loop: Header=BB4_1 Depth=1
	testb	$1, %al
	je	.LBB4_19
.LBB4_16:                               #   in Loop: Header=BB4_1 Depth=1
	shrq	%rax
	addq	$7, %rax
	js	.LBB4_18
# %bb.17:                               #   in Loop: Header=BB4_1 Depth=1
	leaq	1(,%rax,2), %r13
.LBB4_23:                               #   in Loop: Header=BB4_1 Depth=1
	testb	$1, %r13b
	je	.LBB4_25
# %bb.24:                               #   in Loop: Header=BB4_1 Depth=1
	andl	$511, %r13d                     # imm = 0x1FF
	movq	%r13, %rbp
.LBB4_29:                               #   in Loop: Header=BB4_1 Depth=1
	testb	$1, %bpl
	jne	.LBB4_30
# %bb.31:                               #   in Loop: Header=BB4_1 Depth=1
	movq	%rbp, %rdi
	callq	lean_uint8_of_big_nat@PLT
	movl	(%rbp), %ecx
	cmpl	$2, %ecx
	jl	.LBB4_33
# %bb.32:                               #   in Loop: Header=BB4_1 Depth=1
	decl	%ecx
	movl	%ecx, (%rbp)
	jmp	.LBB4_35
	.p2align	4
.LBB4_30:                               #   in Loop: Header=BB4_1 Depth=1
	shrl	%ebp
	movl	%ebp, %eax
.LBB4_35:                               #   in Loop: Header=BB4_1 Depth=1
	movzbl	%al, %esi
	movq	%rbx, %rdi
	callq	lean_byte_array_push@PLT
	movq	%rax, %rbx
	testb	$1, %r15b
	je	.LBB4_41
# %bb.36:                               #   in Loop: Header=BB4_1 Depth=1
	testb	$1, %r12b
	je	.LBB4_40
# %bb.37:                               #   in Loop: Header=BB4_1 Depth=1
	shrq	%r15
	shrq	%r12
	addq	%r15, %r12
	js	.LBB4_39
# %bb.38:                               #   in Loop: Header=BB4_1 Depth=1
	leaq	1(,%r12,2), %rdx
	jmp	.LBB4_1
.LBB4_8:                                #   in Loop: Header=BB4_1 Depth=1
	movq	%r15, %rdi
	callq	lean_nat_big_lt@PLT
	testb	%al, %al
	je	.LBB4_9
# %bb.14:                               #   in Loop: Header=BB4_1 Depth=1
	movl	$63, %esi
	movq	%r15, %rdi
	callq	lean_nat_big_mul@PLT
	testb	$1, %al
	jne	.LBB4_16
.LBB4_19:                               #   in Loop: Header=BB4_1 Depth=1
	movl	$15, %esi
	movq	%rax, %rdi
	movq	%rax, %rbp
	callq	lean_nat_big_add@PLT
	movq	%rax, %r13
	movl	(%rbp), %eax
	cmpl	$2, %eax
	jl	.LBB4_21
# %bb.20:                               #   in Loop: Header=BB4_1 Depth=1
	decl	%eax
	movl	%eax, (%rbp)
	jmp	.LBB4_23
.LBB4_3:                                #   in Loop: Header=BB4_1 Depth=1
	movq	%r15, %rdi
	callq	lean_nat_big_lt@PLT
	testb	%al, %al
	jne	.LBB4_4
	jmp	.LBB4_46
.LBB4_25:                               #   in Loop: Header=BB4_1 Depth=1
	movl	$513, %esi                      # imm = 0x201
	movq	%r13, %rdi
	callq	lean_nat_big_mod@PLT
	movq	%rax, %rbp
	movl	(%r13), %eax
	cmpl	$2, %eax
	jl	.LBB4_27
# %bb.26:                               #   in Loop: Header=BB4_1 Depth=1
	decl	%eax
	movl	%eax, (%r13)
	jmp	.LBB4_29
.LBB4_41:                               #   in Loop: Header=BB4_1 Depth=1
	movq	%r15, %rdi
	movq	%r12, %rsi
	callq	lean_nat_big_add@PLT
	movq	%rax, %rdx
	movl	(%r15), %eax
	cmpl	$2, %eax
	jl	.LBB4_43
# %bb.42:                               #   in Loop: Header=BB4_1 Depth=1
	decl	%eax
	movl	%eax, (%r15)
	jmp	.LBB4_1
.LBB4_18:                               #   in Loop: Header=BB4_1 Depth=1
	movq	%rax, %rdi
	callq	lean_big_usize_to_nat@PLT
	movq	%rax, %r13
	jmp	.LBB4_23
.LBB4_40:                               #   in Loop: Header=BB4_1 Depth=1
	movq	%r15, %rdi
	movq	%r12, %rsi
	callq	lean_nat_big_add@PLT
	movq	%rax, %rdx
	jmp	.LBB4_1
.LBB4_39:                               #   in Loop: Header=BB4_1 Depth=1
	movq	%r12, %rdi
	callq	lean_big_usize_to_nat@PLT
	movq	%rax, %rdx
	jmp	.LBB4_1
.LBB4_33:                               #   in Loop: Header=BB4_1 Depth=1
	testl	%ecx, %ecx
	je	.LBB4_35
# %bb.34:                               #   in Loop: Header=BB4_1 Depth=1
	movq	%rbp, %rdi
	movl	%eax, %ebp
	callq	lean_dec_ref_cold@PLT
	movl	%ebp, %eax
	jmp	.LBB4_35
.LBB4_21:                               #   in Loop: Header=BB4_1 Depth=1
	testl	%eax, %eax
	je	.LBB4_23
# %bb.22:                               #   in Loop: Header=BB4_1 Depth=1
	movq	%rbp, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB4_23
.LBB4_27:                               #   in Loop: Header=BB4_1 Depth=1
	testl	%eax, %eax
	je	.LBB4_29
# %bb.28:                               #   in Loop: Header=BB4_1 Depth=1
	movq	%r13, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB4_29
.LBB4_43:                               #   in Loop: Header=BB4_1 Depth=1
	testl	%eax, %eax
	je	.LBB4_1
# %bb.44:                               #   in Loop: Header=BB4_1 Depth=1
	movq	%r15, %rdi
	movq	%rdx, %r15
	callq	lean_dec_ref_cold@PLT
	movq	%r15, %rdx
	jmp	.LBB4_1
.LBB4_9:
	movl	(%r15), %eax
	cmpl	$2, %eax
	jl	.LBB4_11
# %bb.10:
	decl	%eax
	movl	%eax, (%r15)
.LBB4_46:
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
.LBB4_11:
	.cfi_def_cfa_offset 64
	testl	%eax, %eax
	je	.LBB4_46
# %bb.12:
	movq	%r15, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB4_46
.Lfunc_end4:
	.size	l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0___redArg, .Lfunc_end4-l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0___redArg
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0___redArg___boxed,"ax",@progbits
	.hidden	l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0___redArg___boxed # -- Begin function l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0___redArg___boxed
	.globl	l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0___redArg___boxed
	.p2align	4
	.type	l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0___redArg___boxed,@function
l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0___redArg___boxed: # @l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0___redArg___boxed
	.cfi_startproc
# %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	callq	l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0___redArg
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB5_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%rbx)
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.LBB5_2:
	.cfi_def_cfa_offset 16
	testl	%ecx, %ecx
	je	.LBB5_4
# %bb.3:
	movq	%rbx, %rdi
	movq	%rax, %rbx
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rax
.LBB5_4:
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end5:
	.size	l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0___redArg___boxed, .Lfunc_end5-l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0___redArg___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l_CompilerStudy_ByteWork_makeBuf,"ax",@progbits
	.hidden	l_CompilerStudy_ByteWork_makeBuf # -- Begin function l_CompilerStudy_ByteWork_makeBuf
	.globl	l_CompilerStudy_ByteWork_makeBuf
	.p2align	4
	.type	l_CompilerStudy_ByteWork_makeBuf,@function
l_CompilerStudy_ByteWork_makeBuf:       # @l_CompilerStudy_ByteWork_makeBuf
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
	movq	%rdi, %r15
	movq	l_ByteArray_empty@GOTPCREL(%rip), %rax
	movq	(%rax), %r14
	callq	lean_inc_heartbeat@PLT
	movl	$32, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB6_23
# %bb.1:
	movq	%rax, %rbx
	movabsq	$844562369085441, %rax          # imm = 0x3002000000001
	movq	%rax, (%rbx)
	movq	$1, 8(%rbx)
	movq	%r15, 16(%rbx)
	movq	$3, 24(%rbx)
	movl	$1, %edx
	movq	%rbx, %rdi
	movq	%r14, %rsi
	callq	l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0___redArg
	movl	(%rbx), %ecx
	cmpl	$1, %ecx
	jne	.LBB6_18
# %bb.2:
	movq	8(%rbx), %rdi
	testb	$1, %dil
	jne	.LBB6_7
# %bb.3:
	movl	(%rdi), %ecx
	cmpl	$2, %ecx
	jl	.LBB6_5
# %bb.4:
	decl	%ecx
	movl	%ecx, (%rdi)
.LBB6_7:
	movq	16(%rbx), %rdi
	testb	$1, %dil
	jne	.LBB6_12
# %bb.8:
	movl	(%rdi), %ecx
	cmpl	$1, %ecx
	jle	.LBB6_9
# %bb.11:
	decl	%ecx
	movl	%ecx, (%rdi)
.LBB6_12:
	movq	%rax, %r14
	movq	24(%rbx), %rdi
	testb	$1, %dil
	jne	.LBB6_17
# %bb.13:
	movl	(%rdi), %eax
	cmpl	$1, %eax
	jle	.LBB6_14
# %bb.16:
	decl	%eax
	movl	%eax, (%rdi)
.LBB6_17:
	movq	%rbx, %rdi
	callq	lean_free_object@PLT
	movq	%r14, %rax
.LBB6_22:
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.LBB6_18:
	.cfi_def_cfa_offset 32
	jle	.LBB6_20
# %bb.19:
	decl	%ecx
	movl	%ecx, (%rbx)
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.LBB6_20:
	.cfi_def_cfa_offset 32
	testl	%ecx, %ecx
	je	.LBB6_22
# %bb.21:
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
.LBB6_5:
	.cfi_def_cfa_offset 32
	testl	%ecx, %ecx
	je	.LBB6_7
# %bb.6:
	movq	%rax, %r14
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rax
	jmp	.LBB6_7
.LBB6_9:
	testl	%ecx, %ecx
	je	.LBB6_12
# %bb.10:
	movq	%rax, %r14
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rax
	jmp	.LBB6_12
.LBB6_14:
	testl	%eax, %eax
	je	.LBB6_17
# %bb.15:
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB6_17
.LBB6_23:
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end6:
	.size	l_CompilerStudy_ByteWork_makeBuf, .Lfunc_end6-l_CompilerStudy_ByteWork_makeBuf
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
	je	.LBB7_4
# %bb.1:
	movzwl	6(%rax), %ecx
	shll	$16, %ecx
	orl	%r14d, %ecx
	movl	%ecx, 4(%rax)
	cmpl	%r14d, %r15d
	jae	.LBB7_3
# %bb.2:
	movq	$0, -8(%rax,%r14)
	movzwl	4(%rax), %ecx
.LBB7_3:
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
.LBB7_4:
	.cfi_def_cfa_offset 48
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end7:
	.size	lean_alloc_ctor, .Lfunc_end7-lean_alloc_ctor
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0,"ax",@progbits
	.hidden	l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0 # -- Begin function l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0
	.globl	l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0
	.p2align	4
	.type	l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0,@function
l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0: # @l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0
	.cfi_startproc
# %bb.0:
	jmp	l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0___redArg # TAILCALL
.Lfunc_end8:
	.size	l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0, .Lfunc_end8-l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0___boxed,"ax",@progbits
	.hidden	l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0___boxed # -- Begin function l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0___boxed
	.globl	l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0___boxed
	.p2align	4
	.type	l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0___boxed,@function
l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0___boxed: # @l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0___boxed
	.cfi_startproc
# %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	callq	l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0___redArg
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB9_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%rbx)
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.LBB9_2:
	.cfi_def_cfa_offset 16
	testl	%ecx, %ecx
	je	.LBB9_4
# %bb.3:
	movq	%rbx, %rdi
	movq	%rax, %rbx
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rax
.LBB9_4:
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end9:
	.size	l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0___boxed, .Lfunc_end9-l___private_Init_Data_Range_Basic_0__Std_Legacy_Range_forIn_x27_loop___at___00CompilerStudy_ByteWork_makeBuf_spec__0___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0___redArg,"ax",@progbits
	.hidden	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0___redArg # -- Begin function l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0___redArg
	.globl	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0___redArg
	.p2align	4
	.type	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0___redArg,@function
l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0___redArg: # @l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0___redArg
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
	jmp	.LBB10_1
	.p2align	4
.LBB10_39:                              #   in Loop: Header=BB10_1 Depth=1
	movq	16(%rsp), %rax                  # 8-byte Reload
	movq	%r13, 16(%rax)
	movq	%r15, 8(%rax)
	movq	8(%rsp), %rdi                   # 8-byte Reload
.LBB10_1:                               # =>This Inner Loop Header: Depth=1
	movq	8(%rax), %r13
	movq	16(%rax), %rbp
	movl	(%rax), %r12d
	cmpl	$1, %r12d
	jne	.LBB10_3
# %bb.2:                                #   in Loop: Header=BB10_1 Depth=1
	movq	%rax, %r14
	jmp	.LBB10_18
	.p2align	4
.LBB10_3:                               #   in Loop: Header=BB10_1 Depth=1
	testb	$1, %bpl
	jne	.LBB10_8
# %bb.4:                                #   in Loop: Header=BB10_1 Depth=1
	movl	(%rbp), %ecx
	testl	%ecx, %ecx
	jle	.LBB10_6
# %bb.5:                                #   in Loop: Header=BB10_1 Depth=1
	incl	%ecx
	movl	%ecx, (%rbp)
.LBB10_8:                               #   in Loop: Header=BB10_1 Depth=1
	testb	$1, %r13b
	jne	.LBB10_13
# %bb.9:                                #   in Loop: Header=BB10_1 Depth=1
	movl	(%r13), %ecx
	testl	%ecx, %ecx
	jle	.LBB10_11
# %bb.10:                               #   in Loop: Header=BB10_1 Depth=1
	incl	%ecx
	movl	%ecx, (%r13)
.LBB10_13:                              #   in Loop: Header=BB10_1 Depth=1
	movl	$1, %r14d
	testb	$1, %al
	jne	.LBB10_18
# %bb.14:                               #   in Loop: Header=BB10_1 Depth=1
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB10_16
# %bb.15:                               #   in Loop: Header=BB10_1 Depth=1
	decl	%ecx
	movl	%ecx, (%rax)
.LBB10_18:                              #   in Loop: Header=BB10_1 Depth=1
	movq	8(%rdi), %rax
	leaq	1(,%rax,2), %rsi
	testb	$1, %bpl
	je	.LBB10_22
# %bb.19:                               #   in Loop: Header=BB10_1 Depth=1
	cmpq	%rsi, %rbp
	jae	.LBB10_23
.LBB10_20:                              #   in Loop: Header=BB10_1 Depth=1
	movq	%r14, 16(%rsp)                  # 8-byte Spill
	movq	%rbp, %r15
	shrq	%r15
	movzbl	24(%rdi,%r15), %ebx
	movq	8(%r13), %r14
	movl	(%r13), %eax
	cmpl	$2, %eax
	jl	.LBB10_27
# %bb.21:                               #   in Loop: Header=BB10_1 Depth=1
	decl	%eax
	movl	%eax, (%r13)
.LBB10_29:                              #   in Loop: Header=BB10_1 Depth=1
	testb	$1, %bpl
	je	.LBB10_33
# %bb.30:                               #   in Loop: Header=BB10_1 Depth=1
	incq	%r15
	js	.LBB10_32
# %bb.31:                               #   in Loop: Header=BB10_1 Depth=1
	leaq	1(,%r15,2), %r13
.LBB10_37:                              #   in Loop: Header=BB10_1 Depth=1
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB10_26
# %bb.38:                               #   in Loop: Header=BB10_1 Depth=1
	movq	%rax, %r15
	addq	%rbx, %r14
	movabsq	$1099511628211, %rax            # imm = 0x100000001B3
	imulq	%rax, %r14
	movabsq	$3997430708598723931, %rax      # imm = 0x3779BA0CD843D55B
	addq	%rax, %r14
	movabsq	$68719476737, %rax              # imm = 0x1000000001
	movq	%rax, (%r15)
	movq	%r14, 8(%r15)
	cmpl	$1, %r12d
	je	.LBB10_39
# %bb.40:                               #   in Loop: Header=BB10_1 Depth=1
	callq	lean_inc_heartbeat@PLT
	movl	$24, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	movq	8(%rsp), %rdi                   # 8-byte Reload
	je	.LBB10_26
# %bb.41:                               #   in Loop: Header=BB10_1 Depth=1
	movabsq	$563053032636417, %rcx          # imm = 0x2001800000001
	movq	%rcx, (%rax)
	movq	%r15, 8(%rax)
	movq	%r13, 16(%rax)
	jmp	.LBB10_1
.LBB10_22:                              #   in Loop: Header=BB10_1 Depth=1
	movq	%rdi, %rbx
	movq	%rbp, %rdi
	callq	lean_nat_big_lt@PLT
	movq	%rbx, %rdi
	testb	%al, %al
	jne	.LBB10_20
	jmp	.LBB10_23
.LBB10_27:                              #   in Loop: Header=BB10_1 Depth=1
	testl	%eax, %eax
	je	.LBB10_29
# %bb.28:                               #   in Loop: Header=BB10_1 Depth=1
	movq	%r13, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB10_29
.LBB10_33:                              #   in Loop: Header=BB10_1 Depth=1
	movl	$3, %esi
	movq	%rbp, %rdi
	callq	lean_nat_big_add@PLT
	movq	%rax, %r13
	movl	(%rbp), %eax
	cmpl	$2, %eax
	jl	.LBB10_35
# %bb.34:                               #   in Loop: Header=BB10_1 Depth=1
	decl	%eax
	movl	%eax, (%rbp)
	jmp	.LBB10_37
.LBB10_32:                              #   in Loop: Header=BB10_1 Depth=1
	movabsq	$-9223372036854775808, %rdi     # imm = 0x8000000000000000
	callq	lean_big_usize_to_nat@PLT
	movq	%rax, %r13
	jmp	.LBB10_37
.LBB10_6:                               #   in Loop: Header=BB10_1 Depth=1
	cmpl	$-1879048191, %ecx              # imm = 0x90000001
	jb	.LBB10_8
# %bb.7:                                #   in Loop: Header=BB10_1 Depth=1
	lock		decl	(%rbp)
	jmp	.LBB10_8
.LBB10_11:                              #   in Loop: Header=BB10_1 Depth=1
	cmpl	$-1879048191, %ecx              # imm = 0x90000001
	jb	.LBB10_13
# %bb.12:                               #   in Loop: Header=BB10_1 Depth=1
	lock		decl	(%r13)
	jmp	.LBB10_13
.LBB10_16:                              #   in Loop: Header=BB10_1 Depth=1
	testl	%ecx, %ecx
	je	.LBB10_18
# %bb.17:                               #   in Loop: Header=BB10_1 Depth=1
	movq	%rdi, %rbx
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rdi
	jmp	.LBB10_18
.LBB10_35:                              #   in Loop: Header=BB10_1 Depth=1
	testl	%eax, %eax
	je	.LBB10_37
# %bb.36:                               #   in Loop: Header=BB10_1 Depth=1
	movq	%rbp, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB10_37
.LBB10_23:
	testb	$1, %r14b
	jne	.LBB10_25
# %bb.24:
	movq	%r14, %rdi
	callq	lean_free_object@PLT
.LBB10_25:
	callq	lean_inc_heartbeat@PLT
	movl	$24, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB10_26
# %bb.42:
	movabsq	$563053032636417, %rcx          # imm = 0x2001800000001
	movq	%rcx, (%rax)
	movq	%r13, 8(%rax)
	movq	%rbp, 16(%rax)
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
.LBB10_26:
	.cfi_def_cfa_offset 80
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end10:
	.size	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0___redArg, .Lfunc_end10-l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0___redArg
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0___redArg___boxed,"ax",@progbits
	.hidden	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0___redArg___boxed # -- Begin function l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0___redArg___boxed
	.globl	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0___redArg___boxed
	.p2align	4
	.type	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0___redArg___boxed,@function
l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0___redArg___boxed: # @l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0___redArg___boxed
	.cfi_startproc
# %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	callq	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0___redArg
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB11_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%rbx)
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.LBB11_2:
	.cfi_def_cfa_offset 16
	testl	%ecx, %ecx
	je	.LBB11_4
# %bb.3:
	movq	%rbx, %rdi
	movq	%rax, %rbx
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rax
.LBB11_4:
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end11:
	.size	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0___redArg___boxed, .Lfunc_end11-l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0___redArg___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1___redArg,"ax",@progbits
	.hidden	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1___redArg # -- Begin function l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1___redArg
	.globl	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1___redArg
	.p2align	4
	.type	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1___redArg,@function
l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1___redArg: # @l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1___redArg
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
	movq	%rdx, %r12
	movq	%rsi, 8(%rsp)                   # 8-byte Spill
	movq	%rdi, (%rsp)                    # 8-byte Spill
                                        # kill: def $edi killed $edi killed $rdi def $rdi
	andl	$1, %edi
	movq	%rdi, 16(%rsp)                  # 8-byte Spill
	jmp	.LBB12_1
	.p2align	4
.LBB12_61:                              #   in Loop: Header=BB12_1 Depth=1
	movq	%r13, 16(%r12)
	movq	%rbp, 8(%r12)
.LBB12_1:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %r13
	movq	16(%r12), %r15
	movl	(%r12), %ebp
	cmpl	$1, %ebp
	jne	.LBB12_3
# %bb.2:                                #   in Loop: Header=BB12_1 Depth=1
	movl	%r13d, %ebx
	andl	$1, %ebx
	testl	%r13d, 16(%rsp)                 # 4-byte Folded Reload
	je	.LBB12_23
.LBB12_20:                              #   in Loop: Header=BB12_1 Depth=1
	cmpq	(%rsp), %r13                    # 8-byte Folded Reload
	jae	.LBB12_24
.LBB12_21:                              #   in Loop: Header=BB12_1 Depth=1
	cmpl	$1, %ebp
	jne	.LBB12_28
# %bb.22:                               #   in Loop: Header=BB12_1 Depth=1
	movq	$1, 16(%r12)
	movq	%r15, 8(%r12)
	jmp	.LBB12_30
	.p2align	4
.LBB12_3:                               #   in Loop: Header=BB12_1 Depth=1
	testb	$1, %r15b
	jne	.LBB12_8
# %bb.4:                                #   in Loop: Header=BB12_1 Depth=1
	movl	(%r15), %eax
	testl	%eax, %eax
	jle	.LBB12_6
# %bb.5:                                #   in Loop: Header=BB12_1 Depth=1
	incl	%eax
	movl	%eax, (%r15)
.LBB12_8:                               #   in Loop: Header=BB12_1 Depth=1
	testb	$1, %r13b
	jne	.LBB12_13
# %bb.9:                                #   in Loop: Header=BB12_1 Depth=1
	movl	(%r13), %eax
	testl	%eax, %eax
	jle	.LBB12_11
# %bb.10:                               #   in Loop: Header=BB12_1 Depth=1
	incl	%eax
	movl	%eax, (%r13)
.LBB12_13:                              #   in Loop: Header=BB12_1 Depth=1
	movl	%r13d, %ebx
	andl	$1, %ebx
	testb	$1, %r12b
	jne	.LBB12_18
# %bb.14:                               #   in Loop: Header=BB12_1 Depth=1
	movl	(%r12), %eax
	cmpl	$2, %eax
	jl	.LBB12_16
# %bb.15:                               #   in Loop: Header=BB12_1 Depth=1
	decl	%eax
	movl	%eax, (%r12)
.LBB12_18:                              #   in Loop: Header=BB12_1 Depth=1
	movl	$1, %r12d
	testl	%r13d, 16(%rsp)                 # 4-byte Folded Reload
	jne	.LBB12_20
.LBB12_23:                              #   in Loop: Header=BB12_1 Depth=1
	movq	%r13, %rdi
	movq	(%rsp), %rsi                    # 8-byte Reload
	callq	lean_nat_big_lt@PLT
	testb	%al, %al
	jne	.LBB12_21
	jmp	.LBB12_24
	.p2align	4
.LBB12_28:                              #   in Loop: Header=BB12_1 Depth=1
	callq	lean_inc_heartbeat@PLT
	movl	$24, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB12_64
# %bb.29:                               #   in Loop: Header=BB12_1 Depth=1
	movq	%rax, %r12
	movabsq	$563053032636417, %rax          # imm = 0x2001800000001
	movq	%rax, (%r12)
	movq	%r15, 8(%r12)
	movq	$1, 16(%r12)
.LBB12_30:                              #   in Loop: Header=BB12_1 Depth=1
	movq	8(%rsp), %rdi                   # 8-byte Reload
	movq	%r12, %rsi
	callq	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0___redArg
	movq	%rax, %r12
	movq	8(%rax), %rbp
	movl	(%rax), %r15d
	cmpl	$1, %r15d
	jne	.LBB12_36
# %bb.31:                               #   in Loop: Header=BB12_1 Depth=1
	movq	16(%r12), %rdi
	testb	$1, %dil
	jne	.LBB12_47
# %bb.32:                               #   in Loop: Header=BB12_1 Depth=1
	movl	(%rdi), %eax
	cmpl	$2, %eax
	jl	.LBB12_34
# %bb.33:                               #   in Loop: Header=BB12_1 Depth=1
	decl	%eax
	movl	%eax, (%rdi)
	jmp	.LBB12_47
	.p2align	4
.LBB12_36:                              #   in Loop: Header=BB12_1 Depth=1
	testb	$1, %bpl
	jne	.LBB12_41
# %bb.37:                               #   in Loop: Header=BB12_1 Depth=1
	movl	(%rbp), %eax
	testl	%eax, %eax
	jle	.LBB12_39
# %bb.38:                               #   in Loop: Header=BB12_1 Depth=1
	incl	%eax
	movl	%eax, (%rbp)
.LBB12_41:                              #   in Loop: Header=BB12_1 Depth=1
	testb	$1, %r12b
	jne	.LBB12_46
# %bb.42:                               #   in Loop: Header=BB12_1 Depth=1
	movl	(%r12), %eax
	cmpl	$2, %eax
	jl	.LBB12_44
# %bb.43:                               #   in Loop: Header=BB12_1 Depth=1
	decl	%eax
	movl	%eax, (%r12)
.LBB12_46:                              #   in Loop: Header=BB12_1 Depth=1
	movl	$1, %r12d
.LBB12_47:                              #   in Loop: Header=BB12_1 Depth=1
	movq	8(%rbp), %r14
	movl	(%rbp), %eax
	cmpl	$2, %eax
	jl	.LBB12_49
# %bb.48:                               #   in Loop: Header=BB12_1 Depth=1
	decl	%eax
	movl	%eax, (%rbp)
.LBB12_51:                              #   in Loop: Header=BB12_1 Depth=1
	testq	%rbx, %rbx
	je	.LBB12_55
# %bb.52:                               #   in Loop: Header=BB12_1 Depth=1
	shrq	%r13
	incq	%r13
	js	.LBB12_54
# %bb.53:                               #   in Loop: Header=BB12_1 Depth=1
	leaq	1(,%r13,2), %rbp
.LBB12_59:                              #   in Loop: Header=BB12_1 Depth=1
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB12_64
# %bb.60:                               #   in Loop: Header=BB12_1 Depth=1
	movq	%rax, %r13
	movq	%r14, %rax
	shrq	$33, %rax
	xorq	%r14, %rax
	movabsq	$68719476737, %rcx              # imm = 0x1000000001
	movq	%rcx, (%r13)
	movq	%rax, 8(%r13)
	cmpl	$1, %r15d
	je	.LBB12_61
# %bb.62:                               #   in Loop: Header=BB12_1 Depth=1
	callq	lean_inc_heartbeat@PLT
	movl	$24, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB12_64
# %bb.63:                               #   in Loop: Header=BB12_1 Depth=1
	movq	%rax, %r12
	movabsq	$563053032636417, %rax          # imm = 0x2001800000001
	movq	%rax, (%r12)
	movq	%rbp, 8(%r12)
	movq	%r13, 16(%r12)
	jmp	.LBB12_1
.LBB12_49:                              #   in Loop: Header=BB12_1 Depth=1
	testl	%eax, %eax
	je	.LBB12_51
# %bb.50:                               #   in Loop: Header=BB12_1 Depth=1
	movq	%rbp, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB12_51
.LBB12_55:                              #   in Loop: Header=BB12_1 Depth=1
	movl	$3, %esi
	movq	%r13, %rdi
	callq	lean_nat_big_add@PLT
	movq	%rax, %rbp
	movl	(%r13), %eax
	cmpl	$2, %eax
	jl	.LBB12_57
# %bb.56:                               #   in Loop: Header=BB12_1 Depth=1
	decl	%eax
	movl	%eax, (%r13)
	jmp	.LBB12_59
.LBB12_54:                              #   in Loop: Header=BB12_1 Depth=1
	movabsq	$-9223372036854775808, %rdi     # imm = 0x8000000000000000
	callq	lean_big_usize_to_nat@PLT
	movq	%rax, %rbp
	jmp	.LBB12_59
.LBB12_6:                               #   in Loop: Header=BB12_1 Depth=1
	cmpl	$-1879048191, %eax              # imm = 0x90000001
	jb	.LBB12_8
# %bb.7:                                #   in Loop: Header=BB12_1 Depth=1
	lock		decl	(%r15)
	jmp	.LBB12_8
.LBB12_11:                              #   in Loop: Header=BB12_1 Depth=1
	cmpl	$-1879048191, %eax              # imm = 0x90000001
	jb	.LBB12_13
# %bb.12:                               #   in Loop: Header=BB12_1 Depth=1
	lock		decl	(%r13)
	jmp	.LBB12_13
.LBB12_16:                              #   in Loop: Header=BB12_1 Depth=1
	testl	%eax, %eax
	je	.LBB12_18
# %bb.17:                               #   in Loop: Header=BB12_1 Depth=1
	movq	%r12, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB12_18
.LBB12_34:                              #   in Loop: Header=BB12_1 Depth=1
	testl	%eax, %eax
	je	.LBB12_47
# %bb.35:                               #   in Loop: Header=BB12_1 Depth=1
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB12_47
.LBB12_39:                              #   in Loop: Header=BB12_1 Depth=1
	cmpl	$-1879048191, %eax              # imm = 0x90000001
	jb	.LBB12_41
# %bb.40:                               #   in Loop: Header=BB12_1 Depth=1
	lock		decl	(%rbp)
	jmp	.LBB12_41
.LBB12_44:                              #   in Loop: Header=BB12_1 Depth=1
	testl	%eax, %eax
	je	.LBB12_46
# %bb.45:                               #   in Loop: Header=BB12_1 Depth=1
	movq	%r12, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB12_46
.LBB12_57:                              #   in Loop: Header=BB12_1 Depth=1
	testl	%eax, %eax
	je	.LBB12_59
# %bb.58:                               #   in Loop: Header=BB12_1 Depth=1
	movq	%r13, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB12_59
.LBB12_24:
	cmpl	$1, %ebp
	je	.LBB12_27
# %bb.25:
	callq	lean_inc_heartbeat@PLT
	movl	$24, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB12_64
# %bb.26:
	movq	%rax, %r12
	movabsq	$563053032636417, %rax          # imm = 0x2001800000001
	movq	%rax, (%r12)
	movq	%r13, 8(%r12)
	movq	%r15, 16(%r12)
.LBB12_27:
	movq	%r12, %rax
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
.LBB12_64:
	.cfi_def_cfa_offset 80
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end12:
	.size	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1___redArg, .Lfunc_end12-l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1___redArg
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1___redArg___boxed,"ax",@progbits
	.hidden	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1___redArg___boxed # -- Begin function l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1___redArg___boxed
	.globl	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1___redArg___boxed
	.p2align	4
	.type	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1___redArg___boxed,@function
l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1___redArg___boxed: # @l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1___redArg___boxed
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
	callq	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1___redArg
	movl	(%r14), %ecx
	cmpl	$2, %ecx
	jl	.LBB13_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%r14)
.LBB13_4:
	testb	$1, %bl
	jne	.LBB13_9
# %bb.5:
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB13_7
# %bb.6:
	decl	%ecx
	movl	%ecx, (%rbx)
.LBB13_9:
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.LBB13_2:
	.cfi_def_cfa_offset 32
	testl	%ecx, %ecx
	je	.LBB13_4
# %bb.3:
	movq	%r14, %rdi
	movq	%rax, %r14
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rax
	jmp	.LBB13_4
.LBB13_7:
	testl	%ecx, %ecx
	je	.LBB13_9
# %bb.8:
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
.Lfunc_end13:
	.size	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1___redArg___boxed, .Lfunc_end13-l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1___redArg___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l_CompilerStudy_ByteWork_natWhile,"ax",@progbits
	.hidden	l_CompilerStudy_ByteWork_natWhile # -- Begin function l_CompilerStudy_ByteWork_natWhile
	.globl	l_CompilerStudy_ByteWork_natWhile
	.p2align	4
	.type	l_CompilerStudy_ByteWork_natWhile,@function
l_CompilerStudy_ByteWork_natWhile:      # @l_CompilerStudy_ByteWork_natWhile
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
	movq	%rdx, %r12
	movq	%rsi, %rbx
	movq	%rdi, %r14
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB14_17
# %bb.1:
	movq	%rax, %r15
	movabsq	$68719476737, %rax              # imm = 0x1000000001
	movq	%rax, (%r15)
	movq	%r12, 8(%r15)
	callq	lean_inc_heartbeat@PLT
	movl	$24, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB14_17
# %bb.2:
	movabsq	$563053032636417, %rcx          # imm = 0x2001800000001
	movq	%rcx, (%rax)
	movq	$1, 8(%rax)
	movq	%r15, 16(%rax)
	movq	%r14, %rdi
	movq	%rbx, %rsi
	movq	%rax, %rdx
	callq	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1___redArg
	movq	16(%rax), %rbx
	testb	$1, %bl
	jne	.LBB14_7
# %bb.3:
	movl	(%rbx), %ecx
	testl	%ecx, %ecx
	jle	.LBB14_5
# %bb.4:
	incl	%ecx
	movl	%ecx, (%rbx)
.LBB14_7:
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB14_9
# %bb.8:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB14_11:
	movq	8(%rbx), %rax
	testb	$1, %bl
	jne	.LBB14_16
# %bb.12:
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB14_14
# %bb.13:
	decl	%ecx
	movl	%ecx, (%rbx)
.LBB14_16:
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
.LBB14_9:
	.cfi_def_cfa_offset 48
	testl	%ecx, %ecx
	je	.LBB14_11
# %bb.10:
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB14_11
.LBB14_5:
	cmpl	$-1879048191, %ecx              # imm = 0x90000001
	jb	.LBB14_7
# %bb.6:
	lock		decl	(%rbx)
	jmp	.LBB14_7
.LBB14_14:
	testl	%ecx, %ecx
	je	.LBB14_16
# %bb.15:
	movq	%rbx, %rdi
	movq	%rax, %rbx
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rax
	jmp	.LBB14_16
.LBB14_17:
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end14:
	.size	l_CompilerStudy_ByteWork_natWhile, .Lfunc_end14-l_CompilerStudy_ByteWork_natWhile
	.cfi_endproc
                                        # -- End function
	.section	.text.l_CompilerStudy_ByteWork_natWhile___boxed,"ax",@progbits
	.hidden	l_CompilerStudy_ByteWork_natWhile___boxed # -- Begin function l_CompilerStudy_ByteWork_natWhile___boxed
	.globl	l_CompilerStudy_ByteWork_natWhile___boxed
	.p2align	4
	.type	l_CompilerStudy_ByteWork_natWhile___boxed,@function
l_CompilerStudy_ByteWork_natWhile___boxed: # @l_CompilerStudy_ByteWork_natWhile___boxed
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
	movq	%rdx, %rax
	movq	%rsi, %r15
	movq	%rdi, %rbx
	movq	8(%rdx), %rdx
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB15_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB15_4:
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	l_CompilerStudy_ByteWork_natWhile
	movq	%rax, %r14
	movl	(%r15), %eax
	cmpl	$2, %eax
	jl	.LBB15_6
# %bb.5:
	decl	%eax
	movl	%eax, (%r15)
.LBB15_8:
	testb	$1, %bl
	jne	.LBB15_13
# %bb.9:
	movl	(%rbx), %eax
	cmpl	$2, %eax
	jl	.LBB15_11
# %bb.10:
	decl	%eax
	movl	%eax, (%rbx)
.LBB15_13:
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB15_15
# %bb.14:
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
.LBB15_2:
	.cfi_def_cfa_offset 32
	testl	%ecx, %ecx
	je	.LBB15_4
# %bb.3:
	movq	%rax, %rdi
	movq	%rdx, %r14
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rdx
	jmp	.LBB15_4
.LBB15_6:
	testl	%eax, %eax
	je	.LBB15_8
# %bb.7:
	movq	%r15, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB15_8
.LBB15_11:
	testl	%eax, %eax
	je	.LBB15_13
# %bb.12:
	movq	%rbx, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB15_13
.LBB15_15:
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end15:
	.size	l_CompilerStudy_ByteWork_natWhile___boxed, .Lfunc_end15-l_CompilerStudy_ByteWork_natWhile___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0,"ax",@progbits
	.hidden	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0 # -- Begin function l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0
	.globl	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0
	.p2align	4
	.type	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0,@function
l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0: # @l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0
	.cfi_startproc
# %bb.0:
	movq	%rdx, %rsi
	jmp	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0___redArg # TAILCALL
.Lfunc_end16:
	.size	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0, .Lfunc_end16-l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0___boxed,"ax",@progbits
	.hidden	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0___boxed # -- Begin function l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0___boxed
	.globl	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0___boxed
	.p2align	4
	.type	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0___boxed,@function
l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0___boxed: # @l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0___boxed
	.cfi_startproc
# %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movq	%rdx, %rsi
	callq	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0___redArg
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB17_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%rbx)
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.LBB17_2:
	.cfi_def_cfa_offset 16
	testl	%ecx, %ecx
	je	.LBB17_4
# %bb.3:
	movq	%rbx, %rdi
	movq	%rax, %rbx
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rax
.LBB17_4:
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end17:
	.size	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0___boxed, .Lfunc_end17-l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__0___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1,"ax",@progbits
	.hidden	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1 # -- Begin function l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1
	.globl	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1
	.p2align	4
	.type	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1,@function
l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1: # @l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1
	.cfi_startproc
# %bb.0:
	movq	%rcx, %rdx
	jmp	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1___redArg # TAILCALL
.Lfunc_end18:
	.size	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1, .Lfunc_end18-l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1___boxed,"ax",@progbits
	.hidden	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1___boxed # -- Begin function l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1___boxed
	.globl	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1___boxed
	.p2align	4
	.type	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1___boxed,@function
l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1___boxed: # @l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1___boxed
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
	movq	%rcx, %rdx
	callq	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1___redArg
	movl	(%r14), %ecx
	cmpl	$2, %ecx
	jl	.LBB19_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%r14)
.LBB19_4:
	testb	$1, %bl
	jne	.LBB19_9
# %bb.5:
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB19_7
# %bb.6:
	decl	%ecx
	movl	%ecx, (%rbx)
.LBB19_9:
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
	movq	%r14, %rdi
	movq	%rax, %r14
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rax
	jmp	.LBB19_4
.LBB19_7:
	testl	%ecx, %ecx
	je	.LBB19_9
# %bb.8:
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
	.size	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1___boxed, .Lfunc_end19-l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_natWhile_spec__1___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg___splitProd,"ax",@progbits
	.hidden	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg___splitProd # -- Begin function l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg___splitProd
	.globl	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg___splitProd
	.p2align	4
	.type	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg___splitProd,@function
l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg___splitProd: # @l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg___splitProd
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
	movq	%rdx, %rbx
	movq	%rsi, %r14
	movabsq	$9223372036854775807, %r15      # imm = 0x7FFFFFFFFFFFFFFF
	movq	8(%rdi), %rax
	movq	%rax, %rcx
	andq	%r15, %rcx
	cmpq	%rcx, %rdx
	jae	.LBB20_4
# %bb.1:
	leaq	(%rbx,%rbx), %r13
	movabsq	$1099511628211, %rdx            # imm = 0x100000001B3
	movabsq	$3997430708598723931, %r8       # imm = 0x3779BA0CD843D55B
	movq	%rdi, (%rsp)                    # 8-byte Spill
	jmp	.LBB20_2
	.p2align	4
.LBB20_3:                               #   in Loop: Header=BB20_2 Depth=1
	movzbl	24(%rdi,%rbx), %ebp
.LBB20_15:                              #   in Loop: Header=BB20_2 Depth=1
	movzbl	%bpl, %eax
	addq	%rax, %r14
	imulq	%rdx, %r14
	addq	%r8, %r14
	incq	%rbx
	movq	8(%rdi), %rax
	movq	%rax, %rcx
	andq	%r15, %rcx
	addq	$2, %r13
	cmpq	%rcx, %rbx
	jae	.LBB20_4
.LBB20_2:                               # =>This Inner Loop Header: Depth=1
	addq	%rax, %rax
	cmpq	%rax, %r13
	jb	.LBB20_3
# %bb.8:                                #   in Loop: Header=BB20_2 Depth=1
	movq	%rdx, %r12
	movq	l_instInhabitedUInt8@GOTPCREL(%rip), %rax
	movzbl	(%rax), %eax
	leaq	1(,%rax,2), %rdi
	callq	l_outOfBounds___redArg@PLT
	movl	%eax, %ebp
	shrl	%ebp
	testb	$1, %al
	jne	.LBB20_13
# %bb.9:                                #   in Loop: Header=BB20_2 Depth=1
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	movq	%r12, %rdx
	jl	.LBB20_11
# %bb.10:                               #   in Loop: Header=BB20_2 Depth=1
	decl	%ecx
	movl	%ecx, (%rax)
	jmp	.LBB20_14
.LBB20_11:                              #   in Loop: Header=BB20_2 Depth=1
	testl	%ecx, %ecx
	je	.LBB20_14
# %bb.12:                               #   in Loop: Header=BB20_2 Depth=1
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
	.p2align	4
.LBB20_13:                              #   in Loop: Header=BB20_2 Depth=1
	movq	%r12, %rdx
.LBB20_14:                              #   in Loop: Header=BB20_2 Depth=1
	movq	(%rsp), %rdi                    # 8-byte Reload
	movabsq	$3997430708598723931, %r8       # imm = 0x3779BA0CD843D55B
	jmp	.LBB20_15
.LBB20_4:
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB20_16
# %bb.5:
	movq	%rax, %r15
	movabsq	$68719476737, %r12              # imm = 0x1000000001
	movq	%r12, (%rax)
	movq	%r14, 8(%rax)
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB20_16
# %bb.6:
	movq	%rax, %r14
	movq	%r12, (%rax)
	movq	%rbx, 8(%rax)
	callq	lean_inc_heartbeat@PLT
	movl	$24, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB20_16
# %bb.7:
	movabsq	$563053032636417, %rcx          # imm = 0x2001800000001
	movq	%rcx, (%rax)
	movq	%r15, 8(%rax)
	movq	%r14, 16(%rax)
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
.LBB20_16:
	.cfi_def_cfa_offset 64
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end20:
	.size	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg___splitProd, .Lfunc_end20-l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg___splitProd
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg___splitProd___boxed,"ax",@progbits
	.hidden	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg___splitProd___boxed # -- Begin function l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg___splitProd___boxed
	.globl	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg___splitProd___boxed
	.p2align	4
	.type	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg___splitProd___boxed,@function
l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg___splitProd___boxed: # @l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg___splitProd___boxed
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
	movq	8(%rdx), %r14
	movl	(%rdx), %eax
	cmpl	$2, %eax
	jl	.LBB21_6
# %bb.5:
	decl	%eax
	movl	%eax, (%rdx)
.LBB21_8:
	movq	%rbx, %rdi
	movq	%r14, %rdx
	callq	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg___splitProd
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB21_10
# %bb.9:
	decl	%ecx
	movl	%ecx, (%rbx)
.LBB21_12:
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
	movq	%rsi, %r14
	movq	%rdx, %r15
	callq	lean_dec_ref_cold@PLT
	movq	%r15, %rdx
	movq	%r14, %rsi
	jmp	.LBB21_4
.LBB21_6:
	testl	%eax, %eax
	je	.LBB21_8
# %bb.7:
	movq	%rdx, %rdi
	movq	%rsi, %r15
	callq	lean_dec_ref_cold@PLT
	movq	%r15, %rsi
	jmp	.LBB21_8
.LBB21_10:
	testl	%ecx, %ecx
	je	.LBB21_12
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
.Lfunc_end21:
	.size	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg___splitProd___boxed, .Lfunc_end21-l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg___splitProd___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___redArg,"ax",@progbits
	.hidden	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___redArg # -- Begin function l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___redArg
	.globl	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___redArg
	.p2align	4
	.type	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___redArg,@function
l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___redArg: # @l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___redArg
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
	movq	%rdx, %r12
	movq	%rsi, 8(%rsp)                   # 8-byte Spill
	movq	%rdi, (%rsp)                    # 8-byte Spill
                                        # kill: def $edi killed $edi killed $rdi def $rdi
	andl	$1, %edi
	movq	%rdi, 16(%rsp)                  # 8-byte Spill
	jmp	.LBB22_1
	.p2align	4
.LBB22_63:                              #   in Loop: Header=BB22_1 Depth=1
	movq	%r13, 16(%r12)
	movq	%rbp, 8(%r12)
.LBB22_1:                               # =>This Inner Loop Header: Depth=1
	movq	8(%r12), %r13
	movq	16(%r12), %rbp
	movl	(%r12), %r15d
	cmpl	$1, %r15d
	jne	.LBB22_3
# %bb.2:                                #   in Loop: Header=BB22_1 Depth=1
	movl	%r13d, %ebx
	andl	$1, %ebx
	testl	%r13d, 16(%rsp)                 # 4-byte Folded Reload
	je	.LBB22_25
.LBB22_20:                              #   in Loop: Header=BB22_1 Depth=1
	cmpq	(%rsp), %r13                    # 8-byte Folded Reload
	jae	.LBB22_26
.LBB22_21:                              #   in Loop: Header=BB22_1 Depth=1
	testb	$1, %r12b
	jne	.LBB22_23
# %bb.22:                               #   in Loop: Header=BB22_1 Depth=1
	movq	%r12, %rdi
	callq	lean_free_object@PLT
.LBB22_23:                              #   in Loop: Header=BB22_1 Depth=1
	movq	8(%rbp), %rsi
	movl	(%rbp), %eax
	cmpl	$2, %eax
	jl	.LBB22_30
# %bb.24:                               #   in Loop: Header=BB22_1 Depth=1
	decl	%eax
	movl	%eax, (%rbp)
.LBB22_32:                              #   in Loop: Header=BB22_1 Depth=1
	movq	8(%rsp), %rdi                   # 8-byte Reload
	xorl	%edx, %edx
	callq	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg___splitProd
	movq	%rax, %r12
	movq	8(%rax), %rbp
	movl	(%rax), %r15d
	cmpl	$1, %r15d
	jne	.LBB22_38
# %bb.33:                               #   in Loop: Header=BB22_1 Depth=1
	movq	16(%r12), %rdi
	testb	$1, %dil
	jne	.LBB22_49
# %bb.34:                               #   in Loop: Header=BB22_1 Depth=1
	movl	(%rdi), %eax
	cmpl	$2, %eax
	jl	.LBB22_36
# %bb.35:                               #   in Loop: Header=BB22_1 Depth=1
	decl	%eax
	movl	%eax, (%rdi)
	jmp	.LBB22_49
	.p2align	4
.LBB22_3:                               #   in Loop: Header=BB22_1 Depth=1
	testb	$1, %bpl
	jne	.LBB22_8
# %bb.4:                                #   in Loop: Header=BB22_1 Depth=1
	movl	(%rbp), %eax
	testl	%eax, %eax
	jle	.LBB22_6
# %bb.5:                                #   in Loop: Header=BB22_1 Depth=1
	incl	%eax
	movl	%eax, (%rbp)
.LBB22_8:                               #   in Loop: Header=BB22_1 Depth=1
	testb	$1, %r13b
	jne	.LBB22_13
# %bb.9:                                #   in Loop: Header=BB22_1 Depth=1
	movl	(%r13), %eax
	testl	%eax, %eax
	jle	.LBB22_11
# %bb.10:                               #   in Loop: Header=BB22_1 Depth=1
	incl	%eax
	movl	%eax, (%r13)
.LBB22_13:                              #   in Loop: Header=BB22_1 Depth=1
	movl	%r13d, %ebx
	andl	$1, %ebx
	testb	$1, %r12b
	jne	.LBB22_18
# %bb.14:                               #   in Loop: Header=BB22_1 Depth=1
	movl	(%r12), %eax
	cmpl	$2, %eax
	jl	.LBB22_16
# %bb.15:                               #   in Loop: Header=BB22_1 Depth=1
	decl	%eax
	movl	%eax, (%r12)
.LBB22_18:                              #   in Loop: Header=BB22_1 Depth=1
	movl	$1, %r12d
	testl	%r13d, 16(%rsp)                 # 4-byte Folded Reload
	jne	.LBB22_20
.LBB22_25:                              #   in Loop: Header=BB22_1 Depth=1
	movq	%r13, %rdi
	movq	(%rsp), %rsi                    # 8-byte Reload
	callq	lean_nat_big_lt@PLT
	testb	%al, %al
	jne	.LBB22_21
	jmp	.LBB22_26
	.p2align	4
.LBB22_38:                              #   in Loop: Header=BB22_1 Depth=1
	testb	$1, %bpl
	jne	.LBB22_43
# %bb.39:                               #   in Loop: Header=BB22_1 Depth=1
	movl	(%rbp), %eax
	testl	%eax, %eax
	jle	.LBB22_41
# %bb.40:                               #   in Loop: Header=BB22_1 Depth=1
	incl	%eax
	movl	%eax, (%rbp)
.LBB22_43:                              #   in Loop: Header=BB22_1 Depth=1
	testb	$1, %r12b
	jne	.LBB22_48
# %bb.44:                               #   in Loop: Header=BB22_1 Depth=1
	movl	(%r12), %eax
	cmpl	$2, %eax
	jl	.LBB22_46
# %bb.45:                               #   in Loop: Header=BB22_1 Depth=1
	decl	%eax
	movl	%eax, (%r12)
.LBB22_48:                              #   in Loop: Header=BB22_1 Depth=1
	movl	$1, %r12d
.LBB22_49:                              #   in Loop: Header=BB22_1 Depth=1
	movq	8(%rbp), %r14
	movl	(%rbp), %eax
	cmpl	$2, %eax
	jl	.LBB22_51
# %bb.50:                               #   in Loop: Header=BB22_1 Depth=1
	decl	%eax
	movl	%eax, (%rbp)
.LBB22_53:                              #   in Loop: Header=BB22_1 Depth=1
	testq	%rbx, %rbx
	je	.LBB22_57
# %bb.54:                               #   in Loop: Header=BB22_1 Depth=1
	shrq	%r13
	incq	%r13
	js	.LBB22_56
# %bb.55:                               #   in Loop: Header=BB22_1 Depth=1
	leaq	1(,%r13,2), %rbp
.LBB22_61:                              #   in Loop: Header=BB22_1 Depth=1
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB22_66
# %bb.62:                               #   in Loop: Header=BB22_1 Depth=1
	movq	%rax, %r13
	movq	%r14, %rax
	shrq	$33, %rax
	xorq	%r14, %rax
	movabsq	$68719476737, %rcx              # imm = 0x1000000001
	movq	%rcx, (%r13)
	movq	%rax, 8(%r13)
	cmpl	$1, %r15d
	je	.LBB22_63
# %bb.64:                               #   in Loop: Header=BB22_1 Depth=1
	callq	lean_inc_heartbeat@PLT
	movl	$24, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB22_66
# %bb.65:                               #   in Loop: Header=BB22_1 Depth=1
	movq	%rax, %r12
	movabsq	$563053032636417, %rax          # imm = 0x2001800000001
	movq	%rax, (%r12)
	movq	%rbp, 8(%r12)
	movq	%r13, 16(%r12)
	jmp	.LBB22_1
.LBB22_30:                              #   in Loop: Header=BB22_1 Depth=1
	testl	%eax, %eax
	je	.LBB22_32
# %bb.31:                               #   in Loop: Header=BB22_1 Depth=1
	movq	%rbp, %rdi
	movq	%rsi, %r14
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rsi
	jmp	.LBB22_32
.LBB22_51:                              #   in Loop: Header=BB22_1 Depth=1
	testl	%eax, %eax
	je	.LBB22_53
# %bb.52:                               #   in Loop: Header=BB22_1 Depth=1
	movq	%rbp, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB22_53
.LBB22_57:                              #   in Loop: Header=BB22_1 Depth=1
	movl	$3, %esi
	movq	%r13, %rdi
	callq	lean_nat_big_add@PLT
	movq	%rax, %rbp
	movl	(%r13), %eax
	cmpl	$2, %eax
	jl	.LBB22_59
# %bb.58:                               #   in Loop: Header=BB22_1 Depth=1
	decl	%eax
	movl	%eax, (%r13)
	jmp	.LBB22_61
.LBB22_56:                              #   in Loop: Header=BB22_1 Depth=1
	movabsq	$-9223372036854775808, %rdi     # imm = 0x8000000000000000
	callq	lean_big_usize_to_nat@PLT
	movq	%rax, %rbp
	jmp	.LBB22_61
.LBB22_6:                               #   in Loop: Header=BB22_1 Depth=1
	cmpl	$-1879048191, %eax              # imm = 0x90000001
	jb	.LBB22_8
# %bb.7:                                #   in Loop: Header=BB22_1 Depth=1
	lock		decl	(%rbp)
	jmp	.LBB22_8
.LBB22_11:                              #   in Loop: Header=BB22_1 Depth=1
	cmpl	$-1879048191, %eax              # imm = 0x90000001
	jb	.LBB22_13
# %bb.12:                               #   in Loop: Header=BB22_1 Depth=1
	lock		decl	(%r13)
	jmp	.LBB22_13
.LBB22_16:                              #   in Loop: Header=BB22_1 Depth=1
	testl	%eax, %eax
	je	.LBB22_18
# %bb.17:                               #   in Loop: Header=BB22_1 Depth=1
	movq	%r12, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB22_18
.LBB22_36:                              #   in Loop: Header=BB22_1 Depth=1
	testl	%eax, %eax
	je	.LBB22_49
# %bb.37:                               #   in Loop: Header=BB22_1 Depth=1
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB22_49
.LBB22_41:                              #   in Loop: Header=BB22_1 Depth=1
	cmpl	$-1879048191, %eax              # imm = 0x90000001
	jb	.LBB22_43
# %bb.42:                               #   in Loop: Header=BB22_1 Depth=1
	lock		decl	(%rbp)
	jmp	.LBB22_43
.LBB22_46:                              #   in Loop: Header=BB22_1 Depth=1
	testl	%eax, %eax
	je	.LBB22_48
# %bb.47:                               #   in Loop: Header=BB22_1 Depth=1
	movq	%r12, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB22_48
.LBB22_59:                              #   in Loop: Header=BB22_1 Depth=1
	testl	%eax, %eax
	je	.LBB22_61
# %bb.60:                               #   in Loop: Header=BB22_1 Depth=1
	movq	%r13, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB22_61
.LBB22_26:
	cmpl	$1, %r15d
	je	.LBB22_29
# %bb.27:
	callq	lean_inc_heartbeat@PLT
	movl	$24, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB22_66
# %bb.28:
	movq	%rax, %r12
	movabsq	$563053032636417, %rax          # imm = 0x2001800000001
	movq	%rax, (%r12)
	movq	%r13, 8(%r12)
	movq	%rbp, 16(%r12)
.LBB22_29:
	movq	%r12, %rax
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
.LBB22_66:
	.cfi_def_cfa_offset 80
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end22:
	.size	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___redArg, .Lfunc_end22-l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___redArg
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___redArg___boxed,"ax",@progbits
	.hidden	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___redArg___boxed # -- Begin function l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___redArg___boxed
	.globl	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___redArg___boxed
	.p2align	4
	.type	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___redArg___boxed,@function
l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___redArg___boxed: # @l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___redArg___boxed
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
	callq	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___redArg
	movl	(%r14), %ecx
	cmpl	$2, %ecx
	jl	.LBB23_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%r14)
.LBB23_4:
	testb	$1, %bl
	jne	.LBB23_9
# %bb.5:
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB23_7
# %bb.6:
	decl	%ecx
	movl	%ecx, (%rbx)
.LBB23_9:
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.LBB23_2:
	.cfi_def_cfa_offset 32
	testl	%ecx, %ecx
	je	.LBB23_4
# %bb.3:
	movq	%r14, %rdi
	movq	%rax, %r14
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rax
	jmp	.LBB23_4
.LBB23_7:
	testl	%ecx, %ecx
	je	.LBB23_9
# %bb.8:
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
.Lfunc_end23:
	.size	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___redArg___boxed, .Lfunc_end23-l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___redArg___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l_CompilerStudy_ByteWork_usizeWhile,"ax",@progbits
	.hidden	l_CompilerStudy_ByteWork_usizeWhile # -- Begin function l_CompilerStudy_ByteWork_usizeWhile
	.globl	l_CompilerStudy_ByteWork_usizeWhile
	.p2align	4
	.type	l_CompilerStudy_ByteWork_usizeWhile,@function
l_CompilerStudy_ByteWork_usizeWhile:    # @l_CompilerStudy_ByteWork_usizeWhile
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
	movq	%rdx, %r12
	movq	%rsi, %rbx
	movq	%rdi, %r14
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB24_17
# %bb.1:
	movq	%rax, %r15
	movabsq	$68719476737, %rax              # imm = 0x1000000001
	movq	%rax, (%r15)
	movq	%r12, 8(%r15)
	callq	lean_inc_heartbeat@PLT
	movl	$24, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB24_17
# %bb.2:
	movabsq	$563053032636417, %rcx          # imm = 0x2001800000001
	movq	%rcx, (%rax)
	movq	$1, 8(%rax)
	movq	%r15, 16(%rax)
	movq	%r14, %rdi
	movq	%rbx, %rsi
	movq	%rax, %rdx
	callq	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___redArg
	movq	16(%rax), %rbx
	testb	$1, %bl
	jne	.LBB24_7
# %bb.3:
	movl	(%rbx), %ecx
	testl	%ecx, %ecx
	jle	.LBB24_5
# %bb.4:
	incl	%ecx
	movl	%ecx, (%rbx)
.LBB24_7:
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB24_9
# %bb.8:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB24_11:
	movq	8(%rbx), %rax
	testb	$1, %bl
	jne	.LBB24_16
# %bb.12:
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB24_14
# %bb.13:
	decl	%ecx
	movl	%ecx, (%rbx)
.LBB24_16:
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
.LBB24_9:
	.cfi_def_cfa_offset 48
	testl	%ecx, %ecx
	je	.LBB24_11
# %bb.10:
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB24_11
.LBB24_5:
	cmpl	$-1879048191, %ecx              # imm = 0x90000001
	jb	.LBB24_7
# %bb.6:
	lock		decl	(%rbx)
	jmp	.LBB24_7
.LBB24_14:
	testl	%ecx, %ecx
	je	.LBB24_16
# %bb.15:
	movq	%rbx, %rdi
	movq	%rax, %rbx
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rax
	jmp	.LBB24_16
.LBB24_17:
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end24:
	.size	l_CompilerStudy_ByteWork_usizeWhile, .Lfunc_end24-l_CompilerStudy_ByteWork_usizeWhile
	.cfi_endproc
                                        # -- End function
	.section	.text.l_CompilerStudy_ByteWork_usizeWhile___boxed,"ax",@progbits
	.hidden	l_CompilerStudy_ByteWork_usizeWhile___boxed # -- Begin function l_CompilerStudy_ByteWork_usizeWhile___boxed
	.globl	l_CompilerStudy_ByteWork_usizeWhile___boxed
	.p2align	4
	.type	l_CompilerStudy_ByteWork_usizeWhile___boxed,@function
l_CompilerStudy_ByteWork_usizeWhile___boxed: # @l_CompilerStudy_ByteWork_usizeWhile___boxed
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
	movq	%rdx, %rax
	movq	%rsi, %r15
	movq	%rdi, %rbx
	movq	8(%rdx), %rdx
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB25_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB25_4:
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	l_CompilerStudy_ByteWork_usizeWhile
	movq	%rax, %r14
	movl	(%r15), %eax
	cmpl	$2, %eax
	jl	.LBB25_6
# %bb.5:
	decl	%eax
	movl	%eax, (%r15)
.LBB25_8:
	testb	$1, %bl
	jne	.LBB25_13
# %bb.9:
	movl	(%rbx), %eax
	cmpl	$2, %eax
	jl	.LBB25_11
# %bb.10:
	decl	%eax
	movl	%eax, (%rbx)
.LBB25_13:
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB25_15
# %bb.14:
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
.LBB25_2:
	.cfi_def_cfa_offset 32
	testl	%ecx, %ecx
	je	.LBB25_4
# %bb.3:
	movq	%rax, %rdi
	movq	%rdx, %r14
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rdx
	jmp	.LBB25_4
.LBB25_6:
	testl	%eax, %eax
	je	.LBB25_8
# %bb.7:
	movq	%r15, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB25_8
.LBB25_11:
	testl	%eax, %eax
	je	.LBB25_13
# %bb.12:
	movq	%rbx, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB25_13
.LBB25_15:
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end25:
	.size	l_CompilerStudy_ByteWork_usizeWhile___boxed, .Lfunc_end25-l_CompilerStudy_ByteWork_usizeWhile___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg,"ax",@progbits
	.hidden	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg # -- Begin function l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg
	.globl	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg
	.p2align	4
	.type	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg,@function
l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg: # @l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg
	.cfi_startproc
# %bb.0:
	movq	8(%rsi), %rax
	movq	16(%rsi), %rcx
	movq	8(%rax), %rsi
	movq	8(%rcx), %rdx
	jmp	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg___splitProd # TAILCALL
.Lfunc_end26:
	.size	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg, .Lfunc_end26-l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg___boxed,"ax",@progbits
	.hidden	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg___boxed # -- Begin function l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg___boxed
	.globl	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg___boxed
	.p2align	4
	.type	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg___boxed,@function
l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg___boxed: # @l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg___boxed
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
	movq	8(%rsi), %rax
	movq	16(%rsi), %rcx
	movq	8(%rax), %rsi
	movq	8(%rcx), %rdx
	callq	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg___splitProd
	movl	(%r14), %ecx
	cmpl	$2, %ecx
	jl	.LBB27_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%r14)
.LBB27_4:
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB27_6
# %bb.5:
	decl	%ecx
	movl	%ecx, (%rbx)
.LBB27_8:
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.LBB27_2:
	.cfi_def_cfa_offset 32
	testl	%ecx, %ecx
	je	.LBB27_4
# %bb.3:
	movq	%r14, %rdi
	movq	%rax, %r14
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rax
	jmp	.LBB27_4
.LBB27_6:
	testl	%ecx, %ecx
	je	.LBB27_8
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
.Lfunc_end27:
	.size	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg___boxed, .Lfunc_end27-l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0,"ax",@progbits
	.hidden	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0 # -- Begin function l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0
	.globl	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0
	.p2align	4
	.type	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0,@function
l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0: # @l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0
	.cfi_startproc
# %bb.0:
	movq	8(%rdx), %rax
	movq	16(%rdx), %rcx
	movq	8(%rax), %rsi
	movq	8(%rcx), %rdx
	jmp	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg___splitProd # TAILCALL
.Lfunc_end28:
	.size	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0, .Lfunc_end28-l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___boxed,"ax",@progbits
	.hidden	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___boxed # -- Begin function l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___boxed
	.globl	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___boxed
	.p2align	4
	.type	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___boxed,@function
l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___boxed: # @l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___boxed
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
	movq	%rdx, %r14
	movq	%rdi, %rbx
	movq	8(%rdx), %rax
	movq	16(%rdx), %rcx
	movq	8(%rax), %rsi
	movq	8(%rcx), %rdx
	callq	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___redArg___splitProd
	movl	(%r14), %ecx
	cmpl	$2, %ecx
	jl	.LBB29_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%r14)
.LBB29_4:
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB29_6
# %bb.5:
	decl	%ecx
	movl	%ecx, (%rbx)
.LBB29_8:
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.LBB29_2:
	.cfi_def_cfa_offset 32
	testl	%ecx, %ecx
	je	.LBB29_4
# %bb.3:
	movq	%r14, %rdi
	movq	%rax, %r14
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rax
	jmp	.LBB29_4
.LBB29_6:
	testl	%ecx, %ecx
	je	.LBB29_8
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
.Lfunc_end29:
	.size	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___boxed, .Lfunc_end29-l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__0___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1,"ax",@progbits
	.hidden	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1 # -- Begin function l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1
	.globl	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1
	.p2align	4
	.type	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1,@function
l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1: # @l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1
	.cfi_startproc
# %bb.0:
	movq	%rcx, %rdx
	jmp	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___redArg # TAILCALL
.Lfunc_end30:
	.size	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1, .Lfunc_end30-l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___boxed,"ax",@progbits
	.hidden	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___boxed # -- Begin function l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___boxed
	.globl	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___boxed
	.p2align	4
	.type	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___boxed,@function
l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___boxed: # @l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___boxed
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
	movq	%rcx, %rdx
	callq	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___redArg
	movl	(%r14), %ecx
	cmpl	$2, %ecx
	jl	.LBB31_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%r14)
.LBB31_4:
	testb	$1, %bl
	jne	.LBB31_9
# %bb.5:
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB31_7
# %bb.6:
	decl	%ecx
	movl	%ecx, (%rbx)
.LBB31_9:
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
	movq	%r14, %rdi
	movq	%rax, %r14
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rax
	jmp	.LBB31_4
.LBB31_7:
	testl	%ecx, %ecx
	je	.LBB31_9
# %bb.8:
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
.Lfunc_end31:
	.size	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___boxed, .Lfunc_end31-l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeWhile_spec__1___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0___redArg,"ax",@progbits
	.hidden	l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0___redArg # -- Begin function l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0___redArg
	.globl	l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0___redArg
	.p2align	4
	.type	l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0___redArg,@function
l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0___redArg: # @l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0___redArg
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
	movq	%rcx, %rbx
	cmpq	%rdi, %rdx
	jae	.LBB32_27
# %bb.1:
	movq	%rdx, %r14
	movq	%rsi, %r15
	leaq	1(,%rdx,2), %rbp
	movabsq	$1099511628211, %rcx            # imm = 0x100000001B3
	movabsq	$3997430708598723931, %rdx      # imm = 0x3779BA0CD843D55B
	movq	%rsi, 8(%rsp)                   # 8-byte Spill
	jmp	.LBB32_2
	.p2align	4
.LBB32_10:                              #   in Loop: Header=BB32_2 Depth=1
	shrq	%r13
	movzbl	24(%r15,%r13), %r12d
.LBB32_26:                              #   in Loop: Header=BB32_2 Depth=1
	movzbl	%r12b, %eax
	addq	%rax, %rbx
	imulq	%rcx, %rbx
	addq	%rdx, %rbx
	incq	%r14
	addq	$2, %rbp
	cmpq	%rdi, %r14
	jae	.LBB32_27
.LBB32_2:                               # =>This Inner Loop Header: Depth=1
	testq	%r14, %r14
	js	.LBB32_4
# %bb.3:                                #   in Loop: Header=BB32_2 Depth=1
	movq	%rbp, %r13
	movq	8(%r15), %rax
	leaq	1(,%rax,2), %rsi
	testb	$1, %r13b
	je	.LBB32_6
.LBB32_9:                               #   in Loop: Header=BB32_2 Depth=1
	cmpq	%rsi, %r13
	jb	.LBB32_10
.LBB32_13:                              #   in Loop: Header=BB32_2 Depth=1
	movq	%rcx, %r15
	movq	%rdi, %r13
	movq	l_instInhabitedUInt8@GOTPCREL(%rip), %rax
	movzbl	(%rax), %eax
	leaq	1(,%rax,2), %rdi
	callq	l_outOfBounds___redArg@PLT
	movl	%eax, %r12d
	shrl	%r12d
	testb	$1, %al
	jne	.LBB32_14
# %bb.15:                               #   in Loop: Header=BB32_2 Depth=1
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	movabsq	$3997430708598723931, %rdx      # imm = 0x3779BA0CD843D55B
	jl	.LBB32_17
# %bb.16:                               #   in Loop: Header=BB32_2 Depth=1
	decl	%ecx
	movl	%ecx, (%rax)
.LBB32_18:                              #   in Loop: Header=BB32_2 Depth=1
	movq	%r13, %rdi
	movq	%r15, %rcx
	movq	8(%rsp), %r15                   # 8-byte Reload
	jmp	.LBB32_26
	.p2align	4
.LBB32_14:                              #   in Loop: Header=BB32_2 Depth=1
	movq	%r13, %rdi
	movq	%r15, %rcx
.LBB32_25:                              #   in Loop: Header=BB32_2 Depth=1
	movq	8(%rsp), %r15                   # 8-byte Reload
	movabsq	$3997430708598723931, %rdx      # imm = 0x3779BA0CD843D55B
	jmp	.LBB32_26
.LBB32_4:                               #   in Loop: Header=BB32_2 Depth=1
	movq	%rdi, %r12
	movq	%r14, %rdi
	movq	%rcx, %r15
	callq	lean_big_usize_to_nat@PLT
	movabsq	$3997430708598723931, %rdx      # imm = 0x3779BA0CD843D55B
	movq	%r15, %rcx
	movq	8(%rsp), %r15                   # 8-byte Reload
	movq	%r12, %rdi
	movq	%rax, %r13
	movq	8(%r15), %rax
	leaq	1(,%rax,2), %rsi
	testb	$1, %r13b
	jne	.LBB32_9
.LBB32_6:                               #   in Loop: Header=BB32_2 Depth=1
	movq	%rdi, 16(%rsp)                  # 8-byte Spill
	movq	%r13, %rdi
	callq	lean_nat_big_lt@PLT
	testb	%al, %al
	je	.LBB32_7
# %bb.20:                               #   in Loop: Header=BB32_2 Depth=1
	movq	%r13, %rax
	shrq	%rax
	movzbl	24(%r15,%rax), %r12d
	movl	(%r13), %eax
	cmpl	$2, %eax
	movq	16(%rsp), %rdi                  # 8-byte Reload
	movabsq	$1099511628211, %rcx            # imm = 0x100000001B3
	movabsq	$3997430708598723931, %rdx      # imm = 0x3779BA0CD843D55B
	jl	.LBB32_22
# %bb.21:                               #   in Loop: Header=BB32_2 Depth=1
	decl	%eax
	movl	%eax, (%r13)
	jmp	.LBB32_26
.LBB32_7:                               #   in Loop: Header=BB32_2 Depth=1
	movl	(%r13), %eax
	cmpl	$2, %eax
	movq	16(%rsp), %rdi                  # 8-byte Reload
	movabsq	$1099511628211, %rcx            # imm = 0x100000001B3
	jl	.LBB32_11
# %bb.8:                                #   in Loop: Header=BB32_2 Depth=1
	decl	%eax
	movl	%eax, (%r13)
	jmp	.LBB32_13
.LBB32_17:                              #   in Loop: Header=BB32_2 Depth=1
	testl	%ecx, %ecx
	je	.LBB32_18
# %bb.19:                               #   in Loop: Header=BB32_2 Depth=1
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
	movabsq	$3997430708598723931, %rdx      # imm = 0x3779BA0CD843D55B
	jmp	.LBB32_18
.LBB32_22:                              #   in Loop: Header=BB32_2 Depth=1
	testl	%eax, %eax
	je	.LBB32_23
# %bb.24:                               #   in Loop: Header=BB32_2 Depth=1
	movq	%r13, %rdi
	callq	lean_dec_ref_cold@PLT
	movq	16(%rsp), %rdi                  # 8-byte Reload
	movabsq	$1099511628211, %rcx            # imm = 0x100000001B3
	jmp	.LBB32_25
.LBB32_11:                              #   in Loop: Header=BB32_2 Depth=1
	testl	%eax, %eax
	je	.LBB32_13
# %bb.12:                               #   in Loop: Header=BB32_2 Depth=1
	movq	%r13, %rdi
	callq	lean_dec_ref_cold@PLT
	movabsq	$1099511628211, %rcx            # imm = 0x100000001B3
	movq	16(%rsp), %rdi                  # 8-byte Reload
	jmp	.LBB32_13
.LBB32_23:                              #   in Loop: Header=BB32_2 Depth=1
	movq	16(%rsp), %rdi                  # 8-byte Reload
	movq	8(%rsp), %r15                   # 8-byte Reload
	jmp	.LBB32_26
.LBB32_27:
	movq	%rbx, %rax
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
.Lfunc_end32:
	.size	l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0___redArg, .Lfunc_end32-l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0___redArg
	.cfi_endproc
                                        # -- End function
	.section	.text.l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0___redArg___boxed,"ax",@progbits
	.hidden	l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0___redArg___boxed # -- Begin function l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0___redArg___boxed
	.globl	l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0___redArg___boxed
	.p2align	4
	.type	l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0___redArg___boxed,@function
l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0___redArg___boxed: # @l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0___redArg___boxed
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
	movq	%rdi, %rax
	movq	8(%rdi), %rdi
	movl	(%rax), %edx
	cmpl	$2, %edx
	jl	.LBB33_2
# %bb.1:
	decl	%edx
	movl	%edx, (%rax)
.LBB33_4:
	movq	8(%r14), %rdx
	movl	(%r14), %eax
	cmpl	$2, %eax
	jl	.LBB33_6
# %bb.5:
	decl	%eax
	movl	%eax, (%r14)
.LBB33_8:
	movq	8(%rcx), %r14
	movl	(%rcx), %eax
	cmpl	$2, %eax
	jl	.LBB33_10
# %bb.9:
	decl	%eax
	movl	%eax, (%rcx)
.LBB33_12:
	movq	%rbx, %rsi
	movq	%r14, %rcx
	callq	l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0___redArg
	movq	%rax, %r14
	movl	(%rbx), %eax
	cmpl	$2, %eax
	jl	.LBB33_14
# %bb.13:
	decl	%eax
	movl	%eax, (%rbx)
.LBB33_16:
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB33_18
# %bb.17:
	movabsq	$68719476737, %rcx              # imm = 0x1000000001
	movq	%rcx, (%rax)
	movq	%r14, 8(%rax)
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
.LBB33_2:
	.cfi_def_cfa_offset 48
	testl	%edx, %edx
	je	.LBB33_4
# %bb.3:
	movq	%rdi, %r15
	movq	%rax, %rdi
	movq	%rcx, %r12
	callq	lean_dec_ref_cold@PLT
	movq	%r12, %rcx
	movq	%r15, %rdi
	jmp	.LBB33_4
.LBB33_6:
	testl	%eax, %eax
	je	.LBB33_8
# %bb.7:
	movq	%rdi, %r15
	movq	%r14, %rdi
	movq	%rcx, %r14
	movq	%rdx, %r12
	callq	lean_dec_ref_cold@PLT
	movq	%r12, %rdx
	movq	%r14, %rcx
	movq	%r15, %rdi
	jmp	.LBB33_8
.LBB33_10:
	testl	%eax, %eax
	je	.LBB33_12
# %bb.11:
	movq	%rdi, %r15
	movq	%rcx, %rdi
	movq	%rdx, %r12
	callq	lean_dec_ref_cold@PLT
	movq	%r12, %rdx
	movq	%r15, %rdi
	jmp	.LBB33_12
.LBB33_14:
	testl	%eax, %eax
	je	.LBB33_16
# %bb.15:
	movq	%rbx, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB33_16
.LBB33_18:
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end33:
	.size	l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0___redArg___boxed, .Lfunc_end33-l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0___redArg___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1___redArg,"ax",@progbits
	.hidden	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1___redArg # -- Begin function l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1___redArg
	.globl	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1___redArg
	.p2align	4
	.type	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1___redArg,@function
l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1___redArg: # @l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1___redArg
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
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdx, %rbx
	movabsq	$9223372036854775807, %rax      # imm = 0x7FFFFFFFFFFFFFFF
	movq	%rdi, 16(%rsp)                  # 8-byte Spill
                                        # kill: def $edi killed $edi killed $rdi def $rdi
	andl	$1, %edi
	movq	%rdi, 32(%rsp)                  # 8-byte Spill
	incq	%rax
	movq	%rax, 24(%rsp)                  # 8-byte Spill
	jmp	.LBB34_1
	.p2align	4
.LBB34_40:                              #   in Loop: Header=BB34_1 Depth=1
	movq	%r13, 16(%rbx)
	movq	%rbp, 8(%rbx)
	movq	%r15, %rsi
.LBB34_1:                               # =>This Inner Loop Header: Depth=1
	movq	8(%rbx), %r13
	movq	16(%rbx), %rbp
	movl	(%rbx), %r12d
	cmpl	$1, %r12d
	jne	.LBB34_3
# %bb.2:                                #   in Loop: Header=BB34_1 Depth=1
	movl	%r13d, %r14d
	andl	$1, %r14d
	testl	%r13d, 32(%rsp)                 # 4-byte Folded Reload
	je	.LBB34_23
.LBB34_20:                              #   in Loop: Header=BB34_1 Depth=1
	cmpq	16(%rsp), %r13                  # 8-byte Folded Reload
	jae	.LBB34_24
.LBB34_21:                              #   in Loop: Header=BB34_1 Depth=1
	movl	%r12d, 12(%rsp)                 # 4-byte Spill
	movq	8(%rsi), %rdi
	movabsq	$9223372036854775807, %rax      # imm = 0x7FFFFFFFFFFFFFFF
	andq	%rax, %rdi
	movq	8(%rbp), %rcx
	movl	(%rbp), %eax
	cmpl	$2, %eax
	jl	.LBB34_28
# %bb.22:                               #   in Loop: Header=BB34_1 Depth=1
	decl	%eax
	movl	%eax, (%rbp)
.LBB34_30:                              #   in Loop: Header=BB34_1 Depth=1
	movq	%rsi, %r15
	xorl	%edx, %edx
	callq	l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0___redArg
	movq	%rax, %r12
	testq	%r14, %r14
	je	.LBB34_34
# %bb.31:                               #   in Loop: Header=BB34_1 Depth=1
	shrq	%r13
	incq	%r13
	js	.LBB34_33
# %bb.32:                               #   in Loop: Header=BB34_1 Depth=1
	leaq	1(,%r13,2), %rbp
.LBB34_38:                              #   in Loop: Header=BB34_1 Depth=1
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB34_43
# %bb.39:                               #   in Loop: Header=BB34_1 Depth=1
	movq	%rax, %r13
	movq	%r12, %rax
	shrq	$33, %rax
	xorq	%r12, %rax
	movabsq	$68719476737, %rcx              # imm = 0x1000000001
	movq	%rcx, (%r13)
	movq	%rax, 8(%r13)
	cmpl	$1, 12(%rsp)                    # 4-byte Folded Reload
	je	.LBB34_40
# %bb.41:                               #   in Loop: Header=BB34_1 Depth=1
	callq	lean_inc_heartbeat@PLT
	movl	$24, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB34_43
# %bb.42:                               #   in Loop: Header=BB34_1 Depth=1
	movq	%rax, %rbx
	movq	%r15, %rsi
	movabsq	$563053032636417, %rax          # imm = 0x2001800000001
	movq	%rax, (%rbx)
	movq	%rbp, 8(%rbx)
	movq	%r13, 16(%rbx)
	jmp	.LBB34_1
	.p2align	4
.LBB34_3:                               #   in Loop: Header=BB34_1 Depth=1
	testb	$1, %bpl
	jne	.LBB34_8
# %bb.4:                                #   in Loop: Header=BB34_1 Depth=1
	movl	(%rbp), %eax
	testl	%eax, %eax
	jle	.LBB34_6
# %bb.5:                                #   in Loop: Header=BB34_1 Depth=1
	incl	%eax
	movl	%eax, (%rbp)
.LBB34_8:                               #   in Loop: Header=BB34_1 Depth=1
	testb	$1, %r13b
	jne	.LBB34_13
# %bb.9:                                #   in Loop: Header=BB34_1 Depth=1
	movl	(%r13), %eax
	testl	%eax, %eax
	jle	.LBB34_11
# %bb.10:                               #   in Loop: Header=BB34_1 Depth=1
	incl	%eax
	movl	%eax, (%r13)
.LBB34_13:                              #   in Loop: Header=BB34_1 Depth=1
	movl	%r13d, %r14d
	andl	$1, %r14d
	testb	$1, %bl
	jne	.LBB34_18
# %bb.14:                               #   in Loop: Header=BB34_1 Depth=1
	movl	(%rbx), %eax
	cmpl	$2, %eax
	jl	.LBB34_16
# %bb.15:                               #   in Loop: Header=BB34_1 Depth=1
	decl	%eax
	movl	%eax, (%rbx)
.LBB34_18:                              #   in Loop: Header=BB34_1 Depth=1
	movl	$1, %ebx
	testl	%r13d, 32(%rsp)                 # 4-byte Folded Reload
	jne	.LBB34_20
.LBB34_23:                              #   in Loop: Header=BB34_1 Depth=1
	movq	%r13, %rdi
	movq	%rsi, %r15
	movq	16(%rsp), %rsi                  # 8-byte Reload
	callq	lean_nat_big_lt@PLT
	movq	%r15, %rsi
	testb	%al, %al
	jne	.LBB34_21
	jmp	.LBB34_24
.LBB34_28:                              #   in Loop: Header=BB34_1 Depth=1
	testl	%eax, %eax
	je	.LBB34_30
# %bb.29:                               #   in Loop: Header=BB34_1 Depth=1
	movq	%rsi, %r15
	movq	%rdi, %r12
	movq	%rbp, %rdi
	movq	%rcx, %rbp
	callq	lean_dec_ref_cold@PLT
	movq	%rbp, %rcx
	movq	%r12, %rdi
	movq	%r15, %rsi
	jmp	.LBB34_30
.LBB34_34:                              #   in Loop: Header=BB34_1 Depth=1
	movl	$3, %esi
	movq	%r13, %rdi
	callq	lean_nat_big_add@PLT
	movq	%rax, %rbp
	movl	(%r13), %eax
	cmpl	$2, %eax
	jl	.LBB34_36
# %bb.35:                               #   in Loop: Header=BB34_1 Depth=1
	decl	%eax
	movl	%eax, (%r13)
	jmp	.LBB34_38
.LBB34_33:                              #   in Loop: Header=BB34_1 Depth=1
	movq	24(%rsp), %rdi                  # 8-byte Reload
	callq	lean_big_usize_to_nat@PLT
	movq	%rax, %rbp
	jmp	.LBB34_38
.LBB34_6:                               #   in Loop: Header=BB34_1 Depth=1
	cmpl	$-1879048191, %eax              # imm = 0x90000001
	jb	.LBB34_8
# %bb.7:                                #   in Loop: Header=BB34_1 Depth=1
	lock		decl	(%rbp)
	jmp	.LBB34_8
.LBB34_11:                              #   in Loop: Header=BB34_1 Depth=1
	cmpl	$-1879048191, %eax              # imm = 0x90000001
	jb	.LBB34_13
# %bb.12:                               #   in Loop: Header=BB34_1 Depth=1
	lock		decl	(%r13)
	jmp	.LBB34_13
.LBB34_16:                              #   in Loop: Header=BB34_1 Depth=1
	testl	%eax, %eax
	je	.LBB34_18
# %bb.17:                               #   in Loop: Header=BB34_1 Depth=1
	movq	%rbx, %rdi
	movq	%rsi, %rbx
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rsi
	jmp	.LBB34_18
.LBB34_36:                              #   in Loop: Header=BB34_1 Depth=1
	testl	%eax, %eax
	je	.LBB34_38
# %bb.37:                               #   in Loop: Header=BB34_1 Depth=1
	movq	%r13, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB34_38
.LBB34_24:
	cmpl	$1, %r12d
	je	.LBB34_27
# %bb.25:
	callq	lean_inc_heartbeat@PLT
	movl	$24, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB34_43
# %bb.26:
	movq	%rax, %rbx
	movabsq	$563053032636417, %rax          # imm = 0x2001800000001
	movq	%rax, (%rbx)
	movq	%r13, 8(%rbx)
	movq	%rbp, 16(%rbx)
.LBB34_27:
	movq	%rbx, %rax
	addq	$40, %rsp
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
.LBB34_43:
	.cfi_def_cfa_offset 96
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end34:
	.size	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1___redArg, .Lfunc_end34-l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1___redArg
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1___redArg___boxed,"ax",@progbits
	.hidden	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1___redArg___boxed # -- Begin function l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1___redArg___boxed
	.globl	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1___redArg___boxed
	.p2align	4
	.type	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1___redArg___boxed,@function
l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1___redArg___boxed: # @l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1___redArg___boxed
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
	callq	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1___redArg
	movl	(%r14), %ecx
	cmpl	$2, %ecx
	jl	.LBB35_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%r14)
.LBB35_4:
	testb	$1, %bl
	jne	.LBB35_9
# %bb.5:
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB35_7
# %bb.6:
	decl	%ecx
	movl	%ecx, (%rbx)
.LBB35_9:
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.LBB35_2:
	.cfi_def_cfa_offset 32
	testl	%ecx, %ecx
	je	.LBB35_4
# %bb.3:
	movq	%r14, %rdi
	movq	%rax, %r14
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rax
	jmp	.LBB35_4
.LBB35_7:
	testl	%ecx, %ecx
	je	.LBB35_9
# %bb.8:
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
.Lfunc_end35:
	.size	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1___redArg___boxed, .Lfunc_end35-l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1___redArg___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l_CompilerStudy_ByteWork_usizeFor,"ax",@progbits
	.hidden	l_CompilerStudy_ByteWork_usizeFor # -- Begin function l_CompilerStudy_ByteWork_usizeFor
	.globl	l_CompilerStudy_ByteWork_usizeFor
	.p2align	4
	.type	l_CompilerStudy_ByteWork_usizeFor,@function
l_CompilerStudy_ByteWork_usizeFor:      # @l_CompilerStudy_ByteWork_usizeFor
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
	movq	%rdx, %r12
	movq	%rsi, %rbx
	movq	%rdi, %r14
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB36_17
# %bb.1:
	movq	%rax, %r15
	movabsq	$68719476737, %rax              # imm = 0x1000000001
	movq	%rax, (%r15)
	movq	%r12, 8(%r15)
	callq	lean_inc_heartbeat@PLT
	movl	$24, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB36_17
# %bb.2:
	movabsq	$563053032636417, %rcx          # imm = 0x2001800000001
	movq	%rcx, (%rax)
	movq	$1, 8(%rax)
	movq	%r15, 16(%rax)
	movq	%r14, %rdi
	movq	%rbx, %rsi
	movq	%rax, %rdx
	callq	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1___redArg
	movq	16(%rax), %rbx
	testb	$1, %bl
	jne	.LBB36_7
# %bb.3:
	movl	(%rbx), %ecx
	testl	%ecx, %ecx
	jle	.LBB36_5
# %bb.4:
	incl	%ecx
	movl	%ecx, (%rbx)
.LBB36_7:
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB36_9
# %bb.8:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB36_11:
	movq	8(%rbx), %rax
	testb	$1, %bl
	jne	.LBB36_16
# %bb.12:
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB36_14
# %bb.13:
	decl	%ecx
	movl	%ecx, (%rbx)
.LBB36_16:
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
.LBB36_9:
	.cfi_def_cfa_offset 48
	testl	%ecx, %ecx
	je	.LBB36_11
# %bb.10:
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB36_11
.LBB36_5:
	cmpl	$-1879048191, %ecx              # imm = 0x90000001
	jb	.LBB36_7
# %bb.6:
	lock		decl	(%rbx)
	jmp	.LBB36_7
.LBB36_14:
	testl	%ecx, %ecx
	je	.LBB36_16
# %bb.15:
	movq	%rbx, %rdi
	movq	%rax, %rbx
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rax
	jmp	.LBB36_16
.LBB36_17:
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end36:
	.size	l_CompilerStudy_ByteWork_usizeFor, .Lfunc_end36-l_CompilerStudy_ByteWork_usizeFor
	.cfi_endproc
                                        # -- End function
	.section	.text.l_CompilerStudy_ByteWork_usizeFor___boxed,"ax",@progbits
	.hidden	l_CompilerStudy_ByteWork_usizeFor___boxed # -- Begin function l_CompilerStudy_ByteWork_usizeFor___boxed
	.globl	l_CompilerStudy_ByteWork_usizeFor___boxed
	.p2align	4
	.type	l_CompilerStudy_ByteWork_usizeFor___boxed,@function
l_CompilerStudy_ByteWork_usizeFor___boxed: # @l_CompilerStudy_ByteWork_usizeFor___boxed
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
	movq	%rdx, %rax
	movq	%rsi, %r15
	movq	%rdi, %rbx
	movq	8(%rdx), %rdx
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB37_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB37_4:
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	l_CompilerStudy_ByteWork_usizeFor
	movq	%rax, %r14
	movl	(%r15), %eax
	cmpl	$2, %eax
	jl	.LBB37_6
# %bb.5:
	decl	%eax
	movl	%eax, (%r15)
.LBB37_8:
	testb	$1, %bl
	jne	.LBB37_13
# %bb.9:
	movl	(%rbx), %eax
	cmpl	$2, %eax
	jl	.LBB37_11
# %bb.10:
	decl	%eax
	movl	%eax, (%rbx)
.LBB37_13:
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB37_15
# %bb.14:
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
.LBB37_2:
	.cfi_def_cfa_offset 32
	testl	%ecx, %ecx
	je	.LBB37_4
# %bb.3:
	movq	%rax, %rdi
	movq	%rdx, %r14
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rdx
	jmp	.LBB37_4
.LBB37_6:
	testl	%eax, %eax
	je	.LBB37_8
# %bb.7:
	movq	%r15, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB37_8
.LBB37_11:
	testl	%eax, %eax
	je	.LBB37_13
# %bb.12:
	movq	%rbx, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB37_13
.LBB37_15:
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end37:
	.size	l_CompilerStudy_ByteWork_usizeFor___boxed, .Lfunc_end37-l_CompilerStudy_ByteWork_usizeFor___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0,"ax",@progbits
	.hidden	l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0 # -- Begin function l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0
	.globl	l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0
	.p2align	4
	.type	l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0,@function
l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0: # @l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0
	.cfi_startproc
# %bb.0:
	movq	%r9, %rcx
	movq	%r8, %rdx
	jmp	l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0___redArg # TAILCALL
.Lfunc_end38:
	.size	l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0, .Lfunc_end38-l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0
	.cfi_endproc
                                        # -- End function
	.section	.text.l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0___boxed,"ax",@progbits
	.hidden	l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0___boxed # -- Begin function l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0___boxed
	.globl	l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0___boxed
	.p2align	4
	.type	l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0___boxed,@function
l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0___boxed: # @l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0___boxed
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
	movq	%rsi, %rbx
	movq	%rdi, %rax
	movq	8(%rdi), %rdi
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB39_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB39_4:
	movq	8(%r8), %rdx
	movl	(%r8), %eax
	cmpl	$2, %eax
	jl	.LBB39_6
# %bb.5:
	decl	%eax
	movl	%eax, (%r8)
.LBB39_8:
	movq	8(%r9), %rcx
	movl	(%r9), %eax
	cmpl	$2, %eax
	jl	.LBB39_10
# %bb.9:
	decl	%eax
	movl	%eax, (%r9)
.LBB39_12:
	movq	%rbx, %rsi
	callq	l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0___redArg
	movq	%rax, %r14
	movl	(%rbx), %eax
	cmpl	$2, %eax
	jl	.LBB39_14
# %bb.13:
	decl	%eax
	movl	%eax, (%rbx)
.LBB39_16:
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB39_18
# %bb.17:
	movabsq	$68719476737, %rcx              # imm = 0x1000000001
	movq	%rcx, (%rax)
	movq	%r14, 8(%rax)
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
.LBB39_2:
	.cfi_def_cfa_offset 48
	testl	%ecx, %ecx
	je	.LBB39_4
# %bb.3:
	movq	%rdi, %r14
	movq	%rax, %rdi
	movq	%r9, %r15
	movq	%r8, %r12
	callq	lean_dec_ref_cold@PLT
	movq	%r12, %r8
	movq	%r15, %r9
	movq	%r14, %rdi
	jmp	.LBB39_4
.LBB39_6:
	testl	%eax, %eax
	je	.LBB39_8
# %bb.7:
	movq	%rdi, %r14
	movq	%r8, %rdi
	movq	%r9, %r15
	movq	%rdx, %r12
	callq	lean_dec_ref_cold@PLT
	movq	%r12, %rdx
	movq	%r15, %r9
	movq	%r14, %rdi
	jmp	.LBB39_8
.LBB39_10:
	testl	%eax, %eax
	je	.LBB39_12
# %bb.11:
	movq	%rdi, %r14
	movq	%r9, %rdi
	movq	%rdx, %r15
	movq	%rcx, %r12
	callq	lean_dec_ref_cold@PLT
	movq	%r12, %rcx
	movq	%r15, %rdx
	movq	%r14, %rdi
	jmp	.LBB39_12
.LBB39_14:
	testl	%eax, %eax
	je	.LBB39_16
# %bb.15:
	movq	%rbx, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB39_16
.LBB39_18:
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end39:
	.size	l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0___boxed, .Lfunc_end39-l_WellFounded_opaqueFix_u2083___at___00CompilerStudy_ByteWork_usizeFor_spec__0___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1,"ax",@progbits
	.hidden	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1 # -- Begin function l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1
	.globl	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1
	.p2align	4
	.type	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1,@function
l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1: # @l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1
	.cfi_startproc
# %bb.0:
	movq	%rcx, %rdx
	jmp	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1___redArg # TAILCALL
.Lfunc_end40:
	.size	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1, .Lfunc_end40-l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1___boxed,"ax",@progbits
	.hidden	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1___boxed # -- Begin function l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1___boxed
	.globl	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1___boxed
	.p2align	4
	.type	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1___boxed,@function
l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1___boxed: # @l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1___boxed
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
	movq	%rcx, %rdx
	callq	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1___redArg
	movl	(%r14), %ecx
	cmpl	$2, %ecx
	jl	.LBB41_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%r14)
.LBB41_4:
	testb	$1, %bl
	jne	.LBB41_9
# %bb.5:
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB41_7
# %bb.6:
	decl	%ecx
	movl	%ecx, (%rbx)
.LBB41_9:
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
	movq	%r14, %rdi
	movq	%rax, %r14
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rax
	jmp	.LBB41_4
.LBB41_7:
	testl	%ecx, %ecx
	je	.LBB41_9
# %bb.8:
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
.Lfunc_end41:
	.size	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1___boxed, .Lfunc_end41-l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_usizeFor_spec__1___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0___redArg,"ax",@progbits
	.hidden	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0___redArg # -- Begin function l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0___redArg
	.globl	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0___redArg
	.p2align	4
	.type	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0___redArg,@function
l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0___redArg: # @l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0___redArg
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
	movabsq	$9223372036854775807, %rcx      # imm = 0x7FFFFFFFFFFFFFFF
	movq	8(%rsi), %r12
	movq	%rdi, (%rsp)                    # 8-byte Spill
	movq	8(%rdi), %rbx
	movq	%rbx, %rax
	andq	%rcx, %rax
	cmpq	%rax, %r12
	jae	.LBB42_1
# %bb.2:
	movq	16(%rsi), %r13
	leaq	(%r12,%r12), %rbp
	jmp	.LBB42_3
	.p2align	4
.LBB42_20:                              #   in Loop: Header=BB42_3 Depth=1
	incq	%r12
	movzbl	%bl, %eax
	addq	%rax, %r13
	movabsq	$1099511628211, %rax            # imm = 0x100000001B3
	imulq	%rax, %r13
	movabsq	$3997430708598723931, %rax      # imm = 0x3779BA0CD843D55B
	addq	%rax, %r13
	movq	%r12, 8(%r14)
	movq	%r13, 16(%r14)
	movq	(%rsp), %rax                    # 8-byte Reload
	movq	8(%rax), %rbx
	movq	%rbx, %rax
	movabsq	$9223372036854775807, %rcx      # imm = 0x7FFFFFFFFFFFFFFF
	andq	%rcx, %rax
	addq	$2, %rbp
	movq	%r14, %rsi
	cmpq	%rax, %r12
	jae	.LBB42_21
.LBB42_3:                               # =>This Inner Loop Header: Depth=1
	movl	(%rsi), %r15d
	cmpl	$1, %r15d
	jne	.LBB42_5
# %bb.4:                                #   in Loop: Header=BB42_3 Depth=1
	movq	%rsi, %r14
	jmp	.LBB42_10
	.p2align	4
.LBB42_5:                               #   in Loop: Header=BB42_3 Depth=1
	movl	$1, %r14d
	testb	$1, %sil
	jne	.LBB42_10
# %bb.6:                                #   in Loop: Header=BB42_3 Depth=1
	cmpl	$2, %r15d
	jl	.LBB42_8
# %bb.7:                                #   in Loop: Header=BB42_3 Depth=1
	leal	-1(%r15), %eax
	movl	%eax, (%rsi)
.LBB42_10:                              #   in Loop: Header=BB42_3 Depth=1
	addq	%rbx, %rbx
	cmpq	%rbx, %rbp
	jae	.LBB42_12
# %bb.11:                               #   in Loop: Header=BB42_3 Depth=1
	movq	(%rsp), %rax                    # 8-byte Reload
	movzbl	24(%rax,%r12), %ebx
	jmp	.LBB42_17
	.p2align	4
.LBB42_12:                              #   in Loop: Header=BB42_3 Depth=1
	movq	l_instInhabitedUInt8@GOTPCREL(%rip), %rax
	movzbl	(%rax), %eax
	leaq	1(,%rax,2), %rdi
	callq	l_outOfBounds___redArg@PLT
	movl	%eax, %ebx
	shrl	%ebx
	testb	$1, %al
	jne	.LBB42_17
# %bb.13:                               #   in Loop: Header=BB42_3 Depth=1
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB42_15
# %bb.14:                               #   in Loop: Header=BB42_3 Depth=1
	decl	%ecx
	movl	%ecx, (%rax)
.LBB42_17:                              #   in Loop: Header=BB42_3 Depth=1
	cmpl	$1, %r15d
	je	.LBB42_20
# %bb.18:                               #   in Loop: Header=BB42_3 Depth=1
	callq	lean_inc_heartbeat@PLT
	movl	$24, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB42_22
# %bb.19:                               #   in Loop: Header=BB42_3 Depth=1
	movq	%rax, %r14
	movabsq	$103079215105, %rax             # imm = 0x1800000001
	movq	%rax, (%r14)
	jmp	.LBB42_20
.LBB42_8:                               #   in Loop: Header=BB42_3 Depth=1
	testl	%r15d, %r15d
	je	.LBB42_10
# %bb.9:                                #   in Loop: Header=BB42_3 Depth=1
	movq	%rsi, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB42_10
.LBB42_15:                              #   in Loop: Header=BB42_3 Depth=1
	testl	%ecx, %ecx
	je	.LBB42_17
# %bb.16:                               #   in Loop: Header=BB42_3 Depth=1
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB42_17
.LBB42_1:
	movq	%rsi, %r14
.LBB42_21:
	movq	%r14, %rax
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
.LBB42_22:
	.cfi_def_cfa_offset 64
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end42:
	.size	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0___redArg, .Lfunc_end42-l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0___redArg
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0___redArg___boxed,"ax",@progbits
	.hidden	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0___redArg___boxed # -- Begin function l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0___redArg___boxed
	.globl	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0___redArg___boxed
	.p2align	4
	.type	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0___redArg___boxed,@function
l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0___redArg___boxed: # @l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0___redArg___boxed
	.cfi_startproc
# %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	callq	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0___redArg
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB43_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%rbx)
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.LBB43_2:
	.cfi_def_cfa_offset 16
	testl	%ecx, %ecx
	je	.LBB43_4
# %bb.3:
	movq	%rbx, %rdi
	movq	%rax, %rbx
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rax
.LBB43_4:
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end43:
	.size	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0___redArg___boxed, .Lfunc_end43-l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0___redArg___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1___redArg,"ax",@progbits
	.hidden	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1___redArg # -- Begin function l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1___redArg
	.globl	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1___redArg
	.p2align	4
	.type	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1___redArg,@function
l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1___redArg: # @l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1___redArg
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
	movq	%rdx, %rbx
	movq	%rsi, 16(%rsp)                  # 8-byte Spill
	movq	%rdi, %r15
	movq	%rdi, 8(%rsp)                   # 8-byte Spill
                                        # kill: def $r15d killed $r15d killed $r15 def $r15
	andl	$1, %r15d
	jmp	.LBB44_1
	.p2align	4
.LBB44_44:                              #   in Loop: Header=BB44_1 Depth=1
	movq	%rax, 16(%rbx)
	movq	%rbp, 8(%rbx)
.LBB44_1:                               # =>This Inner Loop Header: Depth=1
	movq	8(%rbx), %r13
	movq	16(%rbx), %rsi
	movl	(%rbx), %r14d
	cmpl	$1, %r14d
	jne	.LBB44_3
# %bb.2:                                #   in Loop: Header=BB44_1 Depth=1
	movl	%r13d, %ebp
	andl	$1, %ebp
	testl	%r13d, %r15d
	je	.LBB44_25
.LBB44_20:                              #   in Loop: Header=BB44_1 Depth=1
	cmpq	8(%rsp), %r13                   # 8-byte Folded Reload
	jae	.LBB44_26
.LBB44_21:                              #   in Loop: Header=BB44_1 Depth=1
	movq	16(%rsp), %rdi                  # 8-byte Reload
	callq	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0___redArg
	movq	16(%rax), %r12
	movl	(%rax), %ecx
	cmpl	$1, %ecx
	je	.LBB44_34
# %bb.22:                               #   in Loop: Header=BB44_1 Depth=1
	testb	$1, %al
	jne	.LBB44_32
# %bb.23:                               #   in Loop: Header=BB44_1 Depth=1
	cmpl	$2, %ecx
	jl	.LBB44_30
# %bb.24:                               #   in Loop: Header=BB44_1 Depth=1
	decl	%ecx
	movl	%ecx, (%rax)
.LBB44_32:                              #   in Loop: Header=BB44_1 Depth=1
	callq	lean_inc_heartbeat@PLT
	movl	$24, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB44_47
# %bb.33:                               #   in Loop: Header=BB44_1 Depth=1
	movabsq	$103079215105, %rcx             # imm = 0x1800000001
	movq	%rcx, (%rax)
.LBB44_34:                              #   in Loop: Header=BB44_1 Depth=1
	movq	%r12, %rcx
	shrq	$33, %rcx
	xorq	%r12, %rcx
	movq	$0, 8(%rax)
	movq	%rcx, 16(%rax)
	testq	%rbp, %rbp
	je	.LBB44_38
# %bb.35:                               #   in Loop: Header=BB44_1 Depth=1
	shrq	%r13
	incq	%r13
	js	.LBB44_37
# %bb.36:                               #   in Loop: Header=BB44_1 Depth=1
	leaq	1(,%r13,2), %rbp
	cmpl	$1, %r14d
	je	.LBB44_44
.LBB44_45:                              #   in Loop: Header=BB44_1 Depth=1
	movq	%rax, %r14
	callq	lean_inc_heartbeat@PLT
	movl	$24, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB44_47
# %bb.46:                               #   in Loop: Header=BB44_1 Depth=1
	movq	%rax, %rbx
	movabsq	$563053032636417, %rax          # imm = 0x2001800000001
	movq	%rax, (%rbx)
	movq	%rbp, 8(%rbx)
	movq	%r14, 16(%rbx)
	jmp	.LBB44_1
	.p2align	4
.LBB44_3:                               #   in Loop: Header=BB44_1 Depth=1
	testb	$1, %sil
	jne	.LBB44_8
# %bb.4:                                #   in Loop: Header=BB44_1 Depth=1
	movl	(%rsi), %eax
	testl	%eax, %eax
	jle	.LBB44_6
# %bb.5:                                #   in Loop: Header=BB44_1 Depth=1
	incl	%eax
	movl	%eax, (%rsi)
.LBB44_8:                               #   in Loop: Header=BB44_1 Depth=1
	testb	$1, %r13b
	jne	.LBB44_13
# %bb.9:                                #   in Loop: Header=BB44_1 Depth=1
	movl	(%r13), %eax
	testl	%eax, %eax
	jle	.LBB44_11
# %bb.10:                               #   in Loop: Header=BB44_1 Depth=1
	incl	%eax
	movl	%eax, (%r13)
.LBB44_13:                              #   in Loop: Header=BB44_1 Depth=1
	movl	%r13d, %ebp
	andl	$1, %ebp
	testb	$1, %bl
	jne	.LBB44_18
# %bb.14:                               #   in Loop: Header=BB44_1 Depth=1
	movl	(%rbx), %eax
	cmpl	$2, %eax
	jl	.LBB44_16
# %bb.15:                               #   in Loop: Header=BB44_1 Depth=1
	decl	%eax
	movl	%eax, (%rbx)
.LBB44_18:                              #   in Loop: Header=BB44_1 Depth=1
	movl	$1, %ebx
	testl	%r13d, %r15d
	jne	.LBB44_20
.LBB44_25:                              #   in Loop: Header=BB44_1 Depth=1
	movq	%r13, %rdi
	movq	%rsi, %r12
	movq	8(%rsp), %rsi                   # 8-byte Reload
	callq	lean_nat_big_lt@PLT
	movq	%r12, %rsi
	testb	%al, %al
	jne	.LBB44_21
	jmp	.LBB44_26
.LBB44_38:                              #   in Loop: Header=BB44_1 Depth=1
	movq	%rax, %r12
	movl	$3, %esi
	movq	%r13, %rdi
	callq	lean_nat_big_add@PLT
	movq	%rax, %rbp
	movl	(%r13), %eax
	cmpl	$2, %eax
	jl	.LBB44_40
# %bb.39:                               #   in Loop: Header=BB44_1 Depth=1
	decl	%eax
	movl	%eax, (%r13)
	jmp	.LBB44_42
.LBB44_37:                              #   in Loop: Header=BB44_1 Depth=1
	movabsq	$-9223372036854775808, %rdi     # imm = 0x8000000000000000
	movq	%rax, %r12
	callq	lean_big_usize_to_nat@PLT
	movq	%rax, %rbp
.LBB44_42:                              #   in Loop: Header=BB44_1 Depth=1
	movq	%r12, %rax
	cmpl	$1, %r14d
	je	.LBB44_44
	jmp	.LBB44_45
.LBB44_6:                               #   in Loop: Header=BB44_1 Depth=1
	cmpl	$-1879048191, %eax              # imm = 0x90000001
	jb	.LBB44_8
# %bb.7:                                #   in Loop: Header=BB44_1 Depth=1
	lock		decl	(%rsi)
	jmp	.LBB44_8
.LBB44_11:                              #   in Loop: Header=BB44_1 Depth=1
	cmpl	$-1879048191, %eax              # imm = 0x90000001
	jb	.LBB44_13
# %bb.12:                               #   in Loop: Header=BB44_1 Depth=1
	lock		decl	(%r13)
	jmp	.LBB44_13
.LBB44_16:                              #   in Loop: Header=BB44_1 Depth=1
	testl	%eax, %eax
	je	.LBB44_18
# %bb.17:                               #   in Loop: Header=BB44_1 Depth=1
	movq	%rbx, %rdi
	movq	%rsi, %rbx
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rsi
	jmp	.LBB44_18
.LBB44_30:                              #   in Loop: Header=BB44_1 Depth=1
	testl	%ecx, %ecx
	je	.LBB44_32
# %bb.31:                               #   in Loop: Header=BB44_1 Depth=1
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB44_32
.LBB44_40:                              #   in Loop: Header=BB44_1 Depth=1
	testl	%eax, %eax
	je	.LBB44_42
# %bb.41:                               #   in Loop: Header=BB44_1 Depth=1
	movq	%r13, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB44_42
.LBB44_26:
	cmpl	$1, %r14d
	je	.LBB44_29
# %bb.27:
	movq	%rsi, %r14
	callq	lean_inc_heartbeat@PLT
	movl	$24, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB44_47
# %bb.28:
	movq	%rax, %rbx
	movabsq	$563053032636417, %rax          # imm = 0x2001800000001
	movq	%rax, (%rbx)
	movq	%r13, 8(%rbx)
	movq	%r14, 16(%rbx)
.LBB44_29:
	movq	%rbx, %rax
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
.LBB44_47:
	.cfi_def_cfa_offset 80
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end44:
	.size	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1___redArg, .Lfunc_end44-l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1___redArg
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1___redArg___boxed,"ax",@progbits
	.hidden	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1___redArg___boxed # -- Begin function l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1___redArg___boxed
	.globl	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1___redArg___boxed
	.p2align	4
	.type	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1___redArg___boxed,@function
l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1___redArg___boxed: # @l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1___redArg___boxed
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
	callq	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1___redArg
	movl	(%r14), %ecx
	cmpl	$2, %ecx
	jl	.LBB45_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%r14)
.LBB45_4:
	testb	$1, %bl
	jne	.LBB45_9
# %bb.5:
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB45_7
# %bb.6:
	decl	%ecx
	movl	%ecx, (%rbx)
.LBB45_9:
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.LBB45_2:
	.cfi_def_cfa_offset 32
	testl	%ecx, %ecx
	je	.LBB45_4
# %bb.3:
	movq	%r14, %rdi
	movq	%rax, %r14
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rax
	jmp	.LBB45_4
.LBB45_7:
	testl	%ecx, %ecx
	je	.LBB45_9
# %bb.8:
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
.Lfunc_end45:
	.size	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1___redArg___boxed, .Lfunc_end45-l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1___redArg___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l_CompilerStudy_ByteWork_stateWhile,"ax",@progbits
	.hidden	l_CompilerStudy_ByteWork_stateWhile # -- Begin function l_CompilerStudy_ByteWork_stateWhile
	.globl	l_CompilerStudy_ByteWork_stateWhile
	.p2align	4
	.type	l_CompilerStudy_ByteWork_stateWhile,@function
l_CompilerStudy_ByteWork_stateWhile:    # @l_CompilerStudy_ByteWork_stateWhile
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
	movq	%rdx, %r12
	movq	%rsi, %rbx
	movq	%rdi, %r14
	callq	lean_inc_heartbeat@PLT
	movl	$24, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB46_17
# %bb.1:
	movq	%rax, %r15
	movabsq	$103079215105, %rax             # imm = 0x1800000001
	movq	%rax, (%r15)
	movq	$0, 8(%r15)
	movq	%r12, 16(%r15)
	callq	lean_inc_heartbeat@PLT
	movl	$24, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB46_17
# %bb.2:
	movabsq	$563053032636417, %rcx          # imm = 0x2001800000001
	movq	%rcx, (%rax)
	movq	$1, 8(%rax)
	movq	%r15, 16(%rax)
	movq	%r14, %rdi
	movq	%rbx, %rsi
	movq	%rax, %rdx
	callq	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1___redArg
	movq	16(%rax), %rbx
	testb	$1, %bl
	jne	.LBB46_7
# %bb.3:
	movl	(%rbx), %ecx
	testl	%ecx, %ecx
	jle	.LBB46_5
# %bb.4:
	incl	%ecx
	movl	%ecx, (%rbx)
.LBB46_7:
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB46_9
# %bb.8:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB46_11:
	movq	16(%rbx), %rax
	testb	$1, %bl
	jne	.LBB46_16
# %bb.12:
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB46_14
# %bb.13:
	decl	%ecx
	movl	%ecx, (%rbx)
.LBB46_16:
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
.LBB46_9:
	.cfi_def_cfa_offset 48
	testl	%ecx, %ecx
	je	.LBB46_11
# %bb.10:
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB46_11
.LBB46_5:
	cmpl	$-1879048191, %ecx              # imm = 0x90000001
	jb	.LBB46_7
# %bb.6:
	lock		decl	(%rbx)
	jmp	.LBB46_7
.LBB46_14:
	testl	%ecx, %ecx
	je	.LBB46_16
# %bb.15:
	movq	%rbx, %rdi
	movq	%rax, %rbx
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rax
	jmp	.LBB46_16
.LBB46_17:
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end46:
	.size	l_CompilerStudy_ByteWork_stateWhile, .Lfunc_end46-l_CompilerStudy_ByteWork_stateWhile
	.cfi_endproc
                                        # -- End function
	.section	.text.l_CompilerStudy_ByteWork_stateWhile___boxed,"ax",@progbits
	.hidden	l_CompilerStudy_ByteWork_stateWhile___boxed # -- Begin function l_CompilerStudy_ByteWork_stateWhile___boxed
	.globl	l_CompilerStudy_ByteWork_stateWhile___boxed
	.p2align	4
	.type	l_CompilerStudy_ByteWork_stateWhile___boxed,@function
l_CompilerStudy_ByteWork_stateWhile___boxed: # @l_CompilerStudy_ByteWork_stateWhile___boxed
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
	movq	%rdx, %rax
	movq	%rsi, %r15
	movq	%rdi, %rbx
	movq	8(%rdx), %rdx
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB47_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB47_4:
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	l_CompilerStudy_ByteWork_stateWhile
	movq	%rax, %r14
	movl	(%r15), %eax
	cmpl	$2, %eax
	jl	.LBB47_6
# %bb.5:
	decl	%eax
	movl	%eax, (%r15)
.LBB47_8:
	testb	$1, %bl
	jne	.LBB47_13
# %bb.9:
	movl	(%rbx), %eax
	cmpl	$2, %eax
	jl	.LBB47_11
# %bb.10:
	decl	%eax
	movl	%eax, (%rbx)
.LBB47_13:
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB47_15
# %bb.14:
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
.LBB47_2:
	.cfi_def_cfa_offset 32
	testl	%ecx, %ecx
	je	.LBB47_4
# %bb.3:
	movq	%rax, %rdi
	movq	%rdx, %r14
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rdx
	jmp	.LBB47_4
.LBB47_6:
	testl	%eax, %eax
	je	.LBB47_8
# %bb.7:
	movq	%r15, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB47_8
.LBB47_11:
	testl	%eax, %eax
	je	.LBB47_13
# %bb.12:
	movq	%rbx, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB47_13
.LBB47_15:
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end47:
	.size	l_CompilerStudy_ByteWork_stateWhile___boxed, .Lfunc_end47-l_CompilerStudy_ByteWork_stateWhile___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0,"ax",@progbits
	.hidden	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0 # -- Begin function l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0
	.globl	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0
	.p2align	4
	.type	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0,@function
l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0: # @l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0
	.cfi_startproc
# %bb.0:
	movq	%rdx, %rsi
	jmp	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0___redArg # TAILCALL
.Lfunc_end48:
	.size	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0, .Lfunc_end48-l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0___boxed,"ax",@progbits
	.hidden	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0___boxed # -- Begin function l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0___boxed
	.globl	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0___boxed
	.p2align	4
	.type	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0___boxed,@function
l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0___boxed: # @l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0___boxed
	.cfi_startproc
# %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movq	%rdx, %rsi
	callq	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0___redArg
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB49_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%rbx)
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.LBB49_2:
	.cfi_def_cfa_offset 16
	testl	%ecx, %ecx
	je	.LBB49_4
# %bb.3:
	movq	%rbx, %rdi
	movq	%rax, %rbx
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rax
.LBB49_4:
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end49:
	.size	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0___boxed, .Lfunc_end49-l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__0___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1,"ax",@progbits
	.hidden	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1 # -- Begin function l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1
	.globl	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1
	.p2align	4
	.type	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1,@function
l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1: # @l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1
	.cfi_startproc
# %bb.0:
	movq	%rcx, %rdx
	jmp	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1___redArg # TAILCALL
.Lfunc_end50:
	.size	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1, .Lfunc_end50-l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1
	.cfi_endproc
                                        # -- End function
	.section	.text.l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1___boxed,"ax",@progbits
	.hidden	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1___boxed # -- Begin function l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1___boxed
	.globl	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1___boxed
	.p2align	4
	.type	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1___boxed,@function
l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1___boxed: # @l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1___boxed
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
	movq	%rcx, %rdx
	callq	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1___redArg
	movl	(%r14), %ecx
	cmpl	$2, %ecx
	jl	.LBB51_2
# %bb.1:
	decl	%ecx
	movl	%ecx, (%r14)
.LBB51_4:
	testb	$1, %bl
	jne	.LBB51_9
# %bb.5:
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB51_7
# %bb.6:
	decl	%ecx
	movl	%ecx, (%rbx)
.LBB51_9:
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.LBB51_2:
	.cfi_def_cfa_offset 32
	testl	%ecx, %ecx
	je	.LBB51_4
# %bb.3:
	movq	%r14, %rdi
	movq	%rax, %r14
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rax
	jmp	.LBB51_4
.LBB51_7:
	testl	%ecx, %ecx
	je	.LBB51_9
# %bb.8:
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
.Lfunc_end51:
	.size	l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1___boxed, .Lfunc_end51-l___private_Init_While_0__repeatM_erased___at___00CompilerStudy_ByteWork_stateWhile_spec__1___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l_CompilerStudy_ByteWork_runVariant,"ax",@progbits
	.hidden	l_CompilerStudy_ByteWork_runVariant # -- Begin function l_CompilerStudy_ByteWork_runVariant
	.globl	l_CompilerStudy_ByteWork_runVariant
	.p2align	4
	.type	l_CompilerStudy_ByteWork_runVariant,@function
l_CompilerStudy_ByteWork_runVariant:    # @l_CompilerStudy_ByteWork_runVariant
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
	movq	%rcx, %rbx
	movq	%rdx, %r14
	movq	%rsi, %r15
	leaq	l_CompilerStudy_ByteWork_runVariant___closed__0_value(%rip), %rax
	cmpq	%rax, %rdi
	je	.LBB52_19
# %bb.1:
	movq	%rdi, %r12
	cmpq	$10, 8(%rdi)
	jne	.LBB52_3
# %bb.2:
	leaq	l_CompilerStudy_ByteWork_runVariant___closed__0_value(%rip), %rsi
	movq	%r12, %rdi
	callq	lean_string_eq_cold@PLT
	testb	%al, %al
	je	.LBB52_3
.LBB52_19:
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	l_CompilerStudy_ByteWork_natWhile
	jmp	.LBB52_14
.LBB52_3:
	leaq	l_CompilerStudy_ByteWork_runVariant___closed__1_value(%rip), %rax
	cmpq	%rax, %r12
	je	.LBB52_18
# %bb.4:
	cmpq	$12, 8(%r12)
	jne	.LBB52_6
# %bb.5:
	leaq	l_CompilerStudy_ByteWork_runVariant___closed__1_value(%rip), %rsi
	movq	%r12, %rdi
	callq	lean_string_eq_cold@PLT
	testb	%al, %al
	je	.LBB52_6
.LBB52_18:
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	l_CompilerStudy_ByteWork_usizeWhile
	jmp	.LBB52_14
.LBB52_6:
	leaq	l_CompilerStudy_ByteWork_runVariant___closed__2_value(%rip), %rax
	cmpq	%rax, %r12
	je	.LBB52_17
# %bb.7:
	cmpq	$10, 8(%r12)
	jne	.LBB52_9
# %bb.8:
	leaq	l_CompilerStudy_ByteWork_runVariant___closed__2_value(%rip), %rsi
	movq	%r12, %rdi
	callq	lean_string_eq_cold@PLT
	testb	%al, %al
	je	.LBB52_9
.LBB52_17:
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	l_CompilerStudy_ByteWork_usizeFor
	jmp	.LBB52_14
.LBB52_9:
	leaq	l_CompilerStudy_ByteWork_runVariant___closed__3_value(%rip), %rax
	cmpq	%rax, %r12
	je	.LBB52_13
# %bb.10:
	cmpq	$12, 8(%r12)
	jne	.LBB52_12
# %bb.11:
	leaq	l_CompilerStudy_ByteWork_runVariant___closed__3_value(%rip), %rsi
	movq	%r12, %rdi
	callq	lean_string_eq_cold@PLT
	testb	%al, %al
	je	.LBB52_12
.LBB52_13:
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	l_CompilerStudy_ByteWork_stateWhile
.LBB52_14:
	movq	%rax, %r14
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB52_16
# %bb.15:
	movq	%rax, %rbx
	movabsq	$68719476737, %rax              # imm = 0x1000000001
	movq	%rax, (%rbx)
	movq	%r14, 8(%rbx)
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB52_16
# %bb.20:
	movabsq	$281543696187393, %rcx          # imm = 0x1001000000001
	movq	%rcx, (%rax)
.LBB52_21:
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
.LBB52_12:
	.cfi_def_cfa_offset 48
	leaq	l_CompilerStudy_ByteWork_runVariant___closed__4_value(%rip), %rdi
	movq	%r12, %rsi
	callq	lean_string_append@PLT
	movq	%rax, %r14
	movl	$18, %edi
	movl	$1, %esi
	xorl	%edx, %edx
	callq	lean_alloc_ctor
	movq	%rax, %rbx
	movq	%r14, 8(%rax)
	movl	$1, %edi
	movl	$1, %esi
	xorl	%edx, %edx
	callq	lean_alloc_ctor
	jmp	.LBB52_21
.LBB52_16:
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end52:
	.size	l_CompilerStudy_ByteWork_runVariant, .Lfunc_end52-l_CompilerStudy_ByteWork_runVariant
	.cfi_endproc
                                        # -- End function
	.section	.text.l_CompilerStudy_ByteWork_runVariant___boxed,"ax",@progbits
	.hidden	l_CompilerStudy_ByteWork_runVariant___boxed # -- Begin function l_CompilerStudy_ByteWork_runVariant___boxed
	.globl	l_CompilerStudy_ByteWork_runVariant___boxed
	.p2align	4
	.type	l_CompilerStudy_ByteWork_runVariant___boxed,@function
l_CompilerStudy_ByteWork_runVariant___boxed: # @l_CompilerStudy_ByteWork_runVariant___boxed
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
	movq	%rcx, %rax
	movq	%rdx, %r15
	movq	%rsi, %r14
	movq	%rdi, %rbx
	movq	8(%rcx), %rcx
	movl	(%rax), %edx
	cmpl	$2, %edx
	jl	.LBB53_2
# %bb.1:
	decl	%edx
	movl	%edx, (%rax)
.LBB53_4:
	movq	%rbx, %rdi
	movq	%r14, %rsi
	movq	%r15, %rdx
	callq	l_CompilerStudy_ByteWork_runVariant
	movl	(%r15), %ecx
	cmpl	$2, %ecx
	jl	.LBB53_6
# %bb.5:
	decl	%ecx
	movl	%ecx, (%r15)
.LBB53_8:
	testb	$1, %r14b
	jne	.LBB53_13
# %bb.9:
	movl	(%r14), %ecx
	cmpl	$2, %ecx
	jl	.LBB53_11
# %bb.10:
	decl	%ecx
	movl	%ecx, (%r14)
.LBB53_13:
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB53_15
# %bb.14:
	decl	%ecx
	movl	%ecx, (%rbx)
.LBB53_17:
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
.LBB53_2:
	.cfi_def_cfa_offset 48
	testl	%edx, %edx
	je	.LBB53_4
# %bb.3:
	movq	%rax, %rdi
	movq	%rcx, %r12
	callq	lean_dec_ref_cold@PLT
	movq	%r12, %rcx
	jmp	.LBB53_4
.LBB53_6:
	testl	%ecx, %ecx
	je	.LBB53_8
# %bb.7:
	movq	%r15, %rdi
	movq	%rax, %r15
	callq	lean_dec_ref_cold@PLT
	movq	%r15, %rax
	jmp	.LBB53_8
.LBB53_15:
	testl	%ecx, %ecx
	je	.LBB53_17
# %bb.16:
	movq	%rbx, %rdi
	movq	%rax, %rbx
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rax
	jmp	.LBB53_17
.LBB53_11:
	testl	%ecx, %ecx
	je	.LBB53_13
# %bb.12:
	movq	%r14, %rdi
	movq	%rax, %r14
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rax
	jmp	.LBB53_13
.Lfunc_end53:
	.size	l_CompilerStudy_ByteWork_runVariant___boxed, .Lfunc_end53-l_CompilerStudy_ByteWork_runVariant___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l_CompilerStudy_ByteWork_parseNat,"ax",@progbits
	.hidden	l_CompilerStudy_ByteWork_parseNat # -- Begin function l_CompilerStudy_ByteWork_parseNat
	.globl	l_CompilerStudy_ByteWork_parseNat
	.p2align	4
	.type	l_CompilerStudy_ByteWork_parseNat,@function
l_CompilerStudy_ByteWork_parseNat:      # @l_CompilerStudy_ByteWork_parseNat
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
	movq	%rsi, %rbx
	movq	%rdi, %r14
	movq	8(%rdi), %r12
	callq	lean_inc_heartbeat@PLT
	movl	$32, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB54_48
# %bb.1:
	movq	%rax, %r15
	leaq	-1(,%r12,2), %rax
	movabsq	$844562369085441, %rcx          # imm = 0x3002000000001
	movq	%rcx, (%r15)
	movq	%r14, 8(%r15)
	movq	$1, 16(%r15)
	movq	%rax, 24(%r15)
	movq	%r15, %rdi
	callq	l_String_Slice_toNat_x3f@PLT
	movq	%rax, %r14
	movl	(%r15), %eax
	cmpl	$1, %eax
	jne	.LBB54_18
# %bb.2:
	movq	8(%r15), %rdi
	testb	$1, %dil
	jne	.LBB54_7
# %bb.3:
	movl	(%rdi), %eax
	cmpl	$2, %eax
	jl	.LBB54_5
# %bb.4:
	decl	%eax
	movl	%eax, (%rdi)
.LBB54_7:
	movq	16(%r15), %rdi
	testb	$1, %dil
	jne	.LBB54_12
# %bb.8:
	movl	(%rdi), %eax
	cmpl	$1, %eax
	jle	.LBB54_9
# %bb.11:
	decl	%eax
	movl	%eax, (%rdi)
.LBB54_12:
	movq	24(%r15), %rdi
	testb	$1, %dil
	jne	.LBB54_17
# %bb.13:
	movl	(%rdi), %eax
	cmpl	$1, %eax
	jle	.LBB54_14
# %bb.16:
	decl	%eax
	movl	%eax, (%rdi)
.LBB54_17:
	movq	%r15, %rdi
	callq	lean_free_object@PLT
	jmp	.LBB54_22
.LBB54_18:
	jle	.LBB54_20
# %bb.19:
	decl	%eax
	movl	%eax, (%r15)
.LBB54_22:
	testb	$1, %r14b
	jne	.LBB54_23
# %bb.24:
	movzbl	7(%r14), %eax
	testl	%eax, %eax
	je	.LBB54_26
.LBB54_31:
	movq	8(%r14), %rbx
	testb	$1, %bl
	jne	.LBB54_36
# %bb.32:
	movl	(%rbx), %eax
	testl	%eax, %eax
	jle	.LBB54_34
# %bb.33:
	incl	%eax
	movl	%eax, (%rbx)
.LBB54_36:
	movl	(%r14), %eax
	cmpl	$1, %eax
	jne	.LBB54_43
# %bb.37:
	movq	8(%r14), %rdi
	testb	$1, %dil
	jne	.LBB54_42
# %bb.38:
	movl	(%rdi), %eax
	cmpl	$2, %eax
	jl	.LBB54_40
# %bb.39:
	decl	%eax
	movl	%eax, (%rdi)
.LBB54_42:
	movq	%r14, %rdi
	callq	lean_free_object@PLT
	jmp	.LBB54_47
.LBB54_23:
	movq	%r14, %rax
	shrq	%rax
	testl	%eax, %eax
	jne	.LBB54_31
.LBB54_26:
	testb	$1, %bl
	jne	.LBB54_47
# %bb.27:
	movl	(%rbx), %eax
	testl	%eax, %eax
	jle	.LBB54_29
# %bb.28:
	incl	%eax
	movl	%eax, (%rbx)
	jmp	.LBB54_47
.LBB54_43:
	jle	.LBB54_45
# %bb.44:
	decl	%eax
	movl	%eax, (%r14)
.LBB54_47:
	movq	%rbx, %rax
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
.LBB54_20:
	.cfi_def_cfa_offset 48
	testl	%eax, %eax
	je	.LBB54_22
# %bb.21:
	movq	%r15, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB54_22
.LBB54_34:
	cmpl	$-1879048191, %eax              # imm = 0x90000001
	jb	.LBB54_36
# %bb.35:
	lock		decl	(%rbx)
	jmp	.LBB54_36
.LBB54_45:
	testl	%eax, %eax
	je	.LBB54_47
# %bb.46:
	movq	%r14, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB54_47
.LBB54_5:
	testl	%eax, %eax
	je	.LBB54_7
# %bb.6:
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB54_7
.LBB54_9:
	testl	%eax, %eax
	je	.LBB54_12
# %bb.10:
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB54_12
.LBB54_14:
	testl	%eax, %eax
	je	.LBB54_17
# %bb.15:
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB54_17
.LBB54_29:
	cmpl	$-1879048191, %eax              # imm = 0x90000001
	jb	.LBB54_47
# %bb.30:
	lock		decl	(%rbx)
	jmp	.LBB54_47
.LBB54_40:
	testl	%eax, %eax
	je	.LBB54_42
# %bb.41:
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB54_42
.LBB54_48:
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end54:
	.size	l_CompilerStudy_ByteWork_parseNat, .Lfunc_end54-l_CompilerStudy_ByteWork_parseNat
	.cfi_endproc
                                        # -- End function
	.section	.text.l_CompilerStudy_ByteWork_parseNat___boxed,"ax",@progbits
	.hidden	l_CompilerStudy_ByteWork_parseNat___boxed # -- Begin function l_CompilerStudy_ByteWork_parseNat___boxed
	.globl	l_CompilerStudy_ByteWork_parseNat___boxed
	.p2align	4
	.type	l_CompilerStudy_ByteWork_parseNat___boxed,@function
l_CompilerStudy_ByteWork_parseNat___boxed: # @l_CompilerStudy_ByteWork_parseNat___boxed
	.cfi_startproc
# %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rsi, %rbx
	callq	l_CompilerStudy_ByteWork_parseNat
	testb	$1, %bl
	jne	.LBB55_5
# %bb.1:
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB55_3
# %bb.2:
	decl	%ecx
	movl	%ecx, (%rbx)
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.LBB55_3:
	.cfi_def_cfa_offset 16
	testl	%ecx, %ecx
	je	.LBB55_5
# %bb.4:
	movq	%rbx, %rdi
	movq	%rax, %rbx
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rax
.LBB55_5:
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end55:
	.size	l_CompilerStudy_ByteWork_parseNat___boxed, .Lfunc_end55-l_CompilerStudy_ByteWork_parseNat___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.l_CompilerStudy_ByteWork_runMain,"ax",@progbits
	.hidden	l_CompilerStudy_ByteWork_runMain # -- Begin function l_CompilerStudy_ByteWork_runMain
	.globl	l_CompilerStudy_ByteWork_runMain
	.p2align	4
	.type	l_CompilerStudy_ByteWork_runMain,@function
l_CompilerStudy_ByteWork_runMain:       # @l_CompilerStudy_ByteWork_runMain
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
	movq	%rdi, %r12
	leaq	l_CompilerStudy_ByteWork_runVariant___closed__0_value(%rip), %rdx
	movl	$1, %esi
	callq	l_List_getD___redArg@PLT
	movq	%rax, %r14
	leaq	l_CompilerStudy_ByteWork_runMain___closed__0_value(%rip), %rdx
	movl	$3, %esi
	movq	%r12, %rdi
	callq	l_List_getD___redArg@PLT
	movl	$2097153, %esi                  # imm = 0x200001
	movq	%rax, %rdi
	callq	l_CompilerStudy_ByteWork_parseNat
	movq	%rax, %rbx
	leaq	l_CompilerStudy_ByteWork_runMain___closed__1_value(%rip), %rdx
	movl	$5, %esi
	movq	%r12, %rdi
	callq	l_List_getD___redArg@PLT
	movl	$3, %esi
	movq	%rax, %rdi
	callq	l_CompilerStudy_ByteWork_parseNat
	movq	%rax, %r15
	leaq	l_CompilerStudy_ByteWork_runMain___closed__2_value(%rip), %rdx
	movl	$7, %esi
	movq	%r12, %rdi
	callq	l_List_getD___redArg@PLT
	movq	%rax, %r12
	leaq	.L.str(%rip), %rdi
	callq	lean_cstr_to_nat@PLT
	movq	%r12, %rdi
	movq	%rax, %rsi
	callq	l_CompilerStudy_ByteWork_parseNat
	movq	%rax, %r12
	testb	$1, %r12b
	jne	.LBB56_1
# %bb.2:
	movq	%r12, %rdi
	callq	lean_uint64_of_big_nat@PLT
	movq	%rax, %r13
	movl	(%r12), %eax
	cmpl	$2, %eax
	jl	.LBB56_4
# %bb.3:
	decl	%eax
	movl	%eax, (%r12)
	jmp	.LBB56_6
.LBB56_1:
	shrq	%r12
	movq	%r12, %r13
.LBB56_6:
	movq	%rbx, %rdi
	callq	l_CompilerStudy_ByteWork_makeBuf
	movq	%rax, %rbp
	testb	$1, %r15b
	je	.LBB56_8
# %bb.7:
	movq	%r15, %rbx
	shrq	%rbx
	orq	$1, %rbx
.LBB56_9:
	movq	%r14, %rdi
	movq	%rbx, %rsi
	movq	%rbp, %rdx
	movq	%r13, %rcx
	callq	l_CompilerStudy_ByteWork_runVariant
	testb	$1, %bl
	jne	.LBB56_14
# %bb.10:
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB56_12
# %bb.11:
	decl	%ecx
	movl	%ecx, (%rbx)
.LBB56_14:
	testb	$1, %al
	jne	.LBB56_15
# %bb.16:
	movzbl	7(%rax), %ecx
	testl	%ecx, %ecx
	je	.LBB56_18
.LBB56_133:
	movl	(%rbp), %ecx
	cmpl	$2, %ecx
	jl	.LBB56_135
# %bb.134:
	decl	%ecx
	movl	%ecx, (%rbp)
.LBB56_137:
	testb	$1, %r15b
	jne	.LBB56_142
# %bb.138:
	movl	(%r15), %ecx
	cmpl	$2, %ecx
	jl	.LBB56_140
# %bb.139:
	decl	%ecx
	movl	%ecx, (%r15)
.LBB56_142:
	testb	$1, %r14b
	jne	.LBB56_120
# %bb.143:
	movl	(%r14), %ecx
	cmpl	$2, %ecx
	jl	.LBB56_145
# %bb.144:
	decl	%ecx
	movl	%ecx, (%r14)
	jmp	.LBB56_120
.LBB56_15:
	movq	%rax, %rcx
	shrq	%rcx
	testl	%ecx, %ecx
	jne	.LBB56_133
.LBB56_18:
	movq	8(%rax), %rbx
	testb	$1, %bl
	jne	.LBB56_23
# %bb.19:
	movl	(%rbx), %ecx
	testl	%ecx, %ecx
	jle	.LBB56_21
# %bb.20:
	incl	%ecx
	movl	%ecx, (%rbx)
.LBB56_23:
	movl	(%rax), %ecx
	cmpl	$1, %ecx
	jne	.LBB56_30
# %bb.24:
	movq	8(%rax), %rdi
	testb	$1, %dil
	jne	.LBB56_29
# %bb.25:
	movl	(%rdi), %ecx
	cmpl	$2, %ecx
	jl	.LBB56_27
# %bb.26:
	decl	%ecx
	movl	%ecx, (%rdi)
.LBB56_29:
	movq	%rax, %rdi
	callq	lean_free_object@PLT
	jmp	.LBB56_34
.LBB56_30:
	jle	.LBB56_32
# %bb.31:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB56_34:
	xorl	%eax, %eax
	callq	lean_io_mono_nanos_now@PLT
	movq	%rax, %r12
	movq	%r14, %rdi
	movq	%r15, %rsi
	movq	%rbp, %rdx
	movq	%r13, %rcx
	callq	l_CompilerStudy_ByteWork_runVariant
	movl	(%rbp), %ecx
	cmpl	$2, %ecx
	jl	.LBB56_36
# %bb.35:
	decl	%ecx
	movl	%ecx, (%rbp)
.LBB56_38:
	testb	$1, %r15b
	jne	.LBB56_43
# %bb.39:
	movl	(%r15), %ecx
	cmpl	$2, %ecx
	jl	.LBB56_41
# %bb.40:
	decl	%ecx
	movl	%ecx, (%r15)
.LBB56_43:
	testb	$1, %r14b
	jne	.LBB56_48
# %bb.44:
	movl	(%r14), %ecx
	cmpl	$2, %ecx
	jl	.LBB56_46
# %bb.45:
	decl	%ecx
	movl	%ecx, (%r14)
.LBB56_48:
	testb	$1, %al
	jne	.LBB56_49
# %bb.50:
	movzbl	7(%rax), %ecx
	testl	%ecx, %ecx
	je	.LBB56_52
.LBB56_109:
	testb	$1, %r12b
	jne	.LBB56_114
# %bb.110:
	movl	(%r12), %ecx
	cmpl	$2, %ecx
	jl	.LBB56_112
# %bb.111:
	decl	%ecx
	movl	%ecx, (%r12)
.LBB56_114:
	testb	$1, %bl
	jne	.LBB56_120
# %bb.115:
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB56_117
# %bb.116:
	decl	%ecx
	movl	%ecx, (%rbx)
.LBB56_120:
	cmpl	$1, (%rax)
	je	.LBB56_148
# %bb.121:
	movq	8(%rax), %rbx
	testb	$1, %bl
	jne	.LBB56_126
# %bb.122:
	movl	(%rbx), %ecx
	testl	%ecx, %ecx
	jle	.LBB56_124
# %bb.123:
	incl	%ecx
	movl	%ecx, (%rbx)
.LBB56_126:
	testb	$1, %al
	jne	.LBB56_131
# %bb.127:
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB56_129
# %bb.128:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB56_131:
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB56_132
# %bb.147:
	movabsq	$72339137734115329, %rcx        # imm = 0x101001000000001
	movq	%rcx, (%rax)
	movq	%rbx, 8(%rax)
.LBB56_148:
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
.LBB56_49:
	.cfi_def_cfa_offset 64
	movq	%rax, %rcx
	shrq	%rcx
	testl	%ecx, %ecx
	jne	.LBB56_109
.LBB56_52:
	movq	8(%rax), %r14
	testb	$1, %r14b
	jne	.LBB56_57
# %bb.53:
	movl	(%r14), %ecx
	testl	%ecx, %ecx
	jle	.LBB56_55
# %bb.54:
	incl	%ecx
	movl	%ecx, (%r14)
.LBB56_57:
	movl	(%rax), %ecx
	cmpl	$1, %ecx
	jne	.LBB56_64
# %bb.58:
	movq	8(%rax), %rdi
	testb	$1, %dil
	jne	.LBB56_63
# %bb.59:
	movl	(%rdi), %ecx
	cmpl	$2, %ecx
	jl	.LBB56_61
# %bb.60:
	decl	%ecx
	movl	%ecx, (%rdi)
.LBB56_63:
	movq	%rax, %rdi
	callq	lean_free_object@PLT
	jmp	.LBB56_68
.LBB56_64:
	jle	.LBB56_66
# %bb.65:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB56_68:
	xorl	%eax, %eax
	callq	lean_io_mono_nanos_now@PLT
	testb	$1, %al
	je	.LBB56_73
# %bb.69:
	testb	$1, %r12b
	je	.LBB56_70
# %bb.71:
	shrq	%rax
	shrq	%r12
	movl	$1, %edi
	subq	%r12, %rax
	jb	.LBB56_84
# %bb.72:
	leaq	1(,%rax,2), %rdi
.LBB56_84:
	callq	l_Nat_reprFast@PLT
	leaq	l_CompilerStudy_ByteWork_runMain___closed__3_value(%rip), %rsi
	movq	%rax, %rdi
	callq	lean_string_append@PLT
	movq	%rax, %r15
	movq	8(%r14), %rdi
	testb	$1, %r14b
	jne	.LBB56_89
# %bb.85:
	movl	(%r14), %eax
	cmpl	$2, %eax
	jl	.LBB56_87
# %bb.86:
	decl	%eax
	movl	%eax, (%r14)
.LBB56_89:
	testq	%rdi, %rdi
	js	.LBB56_91
# %bb.90:
	leaq	1(,%rdi,2), %rdi
.LBB56_92:
	callq	l_Nat_reprFast@PLT
	movq	%rax, %r14
	movq	%r15, %rdi
	movq	%rax, %rsi
	callq	lean_string_append@PLT
	movl	(%r14), %ecx
	cmpl	$2, %ecx
	jl	.LBB56_94
# %bb.93:
	decl	%ecx
	movl	%ecx, (%r14)
.LBB56_96:
	leaq	l_CompilerStudy_ByteWork_runMain___closed__3_value(%rip), %rsi
	movq	%rax, %rdi
	callq	lean_string_append@PLT
	movq	%rax, %r14
	movq	8(%rbx), %rdi
	testb	$1, %bl
	jne	.LBB56_101
# %bb.97:
	movl	(%rbx), %eax
	cmpl	$2, %eax
	jl	.LBB56_99
# %bb.98:
	decl	%eax
	movl	%eax, (%rbx)
.LBB56_101:
	testq	%rdi, %rdi
	js	.LBB56_103
# %bb.102:
	leaq	1(,%rdi,2), %rdi
.LBB56_104:
	callq	l_Nat_reprFast@PLT
	movq	%rax, %rbx
	movq	%r14, %rdi
	movq	%rax, %rsi
	callq	lean_string_append@PLT
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB56_106
# %bb.105:
	decl	%ecx
	movl	%ecx, (%rbx)
.LBB56_108:
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
.LBB56_8:
	.cfi_def_cfa_offset 64
	movl	$3, %esi
	movq	%r15, %rdi
	callq	lean_nat_big_shiftr@PLT
	movq	%rax, %rbx
	jmp	.LBB56_9
.LBB56_135:
	testl	%ecx, %ecx
	je	.LBB56_137
# %bb.136:
	movq	%rbp, %rdi
	movq	%rax, %rbx
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rax
	jmp	.LBB56_137
.LBB56_4:
	testl	%eax, %eax
	je	.LBB56_6
# %bb.5:
	movq	%r12, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB56_6
.LBB56_12:
	testl	%ecx, %ecx
	je	.LBB56_14
# %bb.13:
	movq	%rbx, %rdi
	movq	%rax, %rbx
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rax
	jmp	.LBB56_14
.LBB56_36:
	testl	%ecx, %ecx
	je	.LBB56_38
# %bb.37:
	movq	%rbp, %rdi
	movq	%rax, %r13
	callq	lean_dec_ref_cold@PLT
	movq	%r13, %rax
	jmp	.LBB56_38
.LBB56_140:
	testl	%ecx, %ecx
	je	.LBB56_142
# %bb.141:
	movq	%r15, %rdi
	movq	%rax, %rbx
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rax
	jmp	.LBB56_142
.LBB56_145:
	testl	%ecx, %ecx
	je	.LBB56_120
# %bb.146:
	movq	%r14, %rdi
	jmp	.LBB56_119
.LBB56_124:
	cmpl	$-1879048191, %ecx              # imm = 0x90000001
	jb	.LBB56_126
# %bb.125:
	lock		decl	(%rbx)
	jmp	.LBB56_126
.LBB56_129:
	testl	%ecx, %ecx
	je	.LBB56_131
# %bb.130:
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB56_131
.LBB56_21:
	cmpl	$-1879048191, %ecx              # imm = 0x90000001
	jb	.LBB56_23
# %bb.22:
	lock		decl	(%rbx)
	jmp	.LBB56_23
.LBB56_32:
	testl	%ecx, %ecx
	je	.LBB56_34
# %bb.33:
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB56_34
.LBB56_41:
	testl	%ecx, %ecx
	je	.LBB56_43
# %bb.42:
	movq	%r15, %rdi
	movq	%rax, %r15
	callq	lean_dec_ref_cold@PLT
	movq	%r15, %rax
	jmp	.LBB56_43
.LBB56_46:
	testl	%ecx, %ecx
	je	.LBB56_48
# %bb.47:
	movq	%r14, %rdi
	movq	%rax, %r14
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rax
	jmp	.LBB56_48
.LBB56_73:
	movq	%rax, %rdi
	movq	%r12, %rsi
	movq	%rax, %r15
	callq	lean_nat_big_sub@PLT
	movq	%rax, %rdi
	movq	%r15, %rax
	testb	$1, %r12b
	je	.LBB56_74
	jmp	.LBB56_79
.LBB56_91:
	callq	lean_big_uint64_to_nat@PLT
	movq	%rax, %rdi
	jmp	.LBB56_92
.LBB56_94:
	testl	%ecx, %ecx
	je	.LBB56_96
# %bb.95:
	movq	%r14, %rdi
	movq	%rax, %r14
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rax
	jmp	.LBB56_96
.LBB56_103:
	callq	lean_big_uint64_to_nat@PLT
	movq	%rax, %rdi
	jmp	.LBB56_104
.LBB56_106:
	testl	%ecx, %ecx
	je	.LBB56_108
# %bb.107:
	movq	%rbx, %rdi
	movq	%rax, %rbx
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rax
	jmp	.LBB56_108
.LBB56_70:
	movq	%rax, %rdi
	movq	%r12, %rsi
	movq	%rax, %r15
	callq	lean_nat_big_sub@PLT
	movq	%rax, %rdi
	movq	%r15, %rax
.LBB56_74:
	movq	%rdi, %r15
	movq	%rax, %r13
	movl	(%r12), %eax
	cmpl	$2, %eax
	jl	.LBB56_76
# %bb.75:
	decl	%eax
	movl	%eax, (%r12)
.LBB56_78:
	movq	%r13, %rax
	testb	$1, %al
	movq	%r15, %rdi
	jne	.LBB56_84
.LBB56_79:
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB56_81
# %bb.80:
	decl	%ecx
	movl	%ecx, (%rax)
	jmp	.LBB56_84
.LBB56_112:
	testl	%ecx, %ecx
	je	.LBB56_114
# %bb.113:
	movq	%r12, %rdi
	movq	%rax, %r14
	callq	lean_dec_ref_cold@PLT
	movq	%r14, %rax
	jmp	.LBB56_114
.LBB56_117:
	testl	%ecx, %ecx
	je	.LBB56_120
# %bb.118:
	movq	%rbx, %rdi
.LBB56_119:
	movq	%rax, %rbx
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rax
	jmp	.LBB56_120
.LBB56_27:
	testl	%ecx, %ecx
	je	.LBB56_29
# %bb.28:
	movq	%rax, %r12
	callq	lean_dec_ref_cold@PLT
	movq	%r12, %rax
	jmp	.LBB56_29
.LBB56_55:
	cmpl	$-1879048191, %ecx              # imm = 0x90000001
	jb	.LBB56_57
# %bb.56:
	lock		decl	(%r14)
	jmp	.LBB56_57
.LBB56_66:
	testl	%ecx, %ecx
	je	.LBB56_68
# %bb.67:
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB56_68
.LBB56_87:
	testl	%eax, %eax
	je	.LBB56_89
# %bb.88:
	movq	%rdi, %r12
	movq	%r14, %rdi
	callq	lean_dec_ref_cold@PLT
	movq	%r12, %rdi
	jmp	.LBB56_89
.LBB56_99:
	testl	%eax, %eax
	je	.LBB56_101
# %bb.100:
	movq	%rdi, %r15
	movq	%rbx, %rdi
	callq	lean_dec_ref_cold@PLT
	movq	%r15, %rdi
	jmp	.LBB56_101
.LBB56_61:
	testl	%ecx, %ecx
	je	.LBB56_63
# %bb.62:
	movq	%rax, %r15
	callq	lean_dec_ref_cold@PLT
	movq	%r15, %rax
	jmp	.LBB56_63
.LBB56_132:
	callq	lean_internal_panic_out_of_memory@PLT
.LBB56_76:
	testl	%eax, %eax
	je	.LBB56_78
# %bb.77:
	movq	%r12, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB56_78
.LBB56_81:
	movq	%rdi, %r15
	testl	%ecx, %ecx
	je	.LBB56_83
# %bb.82:
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
.LBB56_83:
	movq	%r15, %rdi
	jmp	.LBB56_84
.Lfunc_end56:
	.size	l_CompilerStudy_ByteWork_runMain, .Lfunc_end56-l_CompilerStudy_ByteWork_runMain
	.cfi_endproc
                                        # -- End function
	.section	.text.l_CompilerStudy_ByteWork_runMain___boxed,"ax",@progbits
	.hidden	l_CompilerStudy_ByteWork_runMain___boxed # -- Begin function l_CompilerStudy_ByteWork_runMain___boxed
	.globl	l_CompilerStudy_ByteWork_runMain___boxed
	.p2align	4
	.type	l_CompilerStudy_ByteWork_runMain___boxed,@function
l_CompilerStudy_ByteWork_runMain___boxed: # @l_CompilerStudy_ByteWork_runMain___boxed
	.cfi_startproc
# %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	callq	l_CompilerStudy_ByteWork_runMain
	testb	$1, %bl
	jne	.LBB57_5
# %bb.1:
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB57_3
# %bb.2:
	decl	%ecx
	movl	%ecx, (%rbx)
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.LBB57_3:
	.cfi_def_cfa_offset 16
	testl	%ecx, %ecx
	je	.LBB57_5
# %bb.4:
	movq	%rbx, %rdi
	movq	%rax, %rbx
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rax
.LBB57_5:
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end57:
	.size	l_CompilerStudy_ByteWork_runMain___boxed, .Lfunc_end57-l_CompilerStudy_ByteWork_runMain___boxed
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
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	callq	l_CompilerStudy_ByteWork_runMain
	testb	$1, %bl
	jne	.LBB58_5
# %bb.1:
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB58_3
# %bb.2:
	decl	%ecx
	movl	%ecx, (%rbx)
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.LBB58_3:
	.cfi_def_cfa_offset 16
	testl	%ecx, %ecx
	je	.LBB58_5
# %bb.4:
	movq	%rbx, %rdi
	movq	%rax, %rbx
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rax
.LBB58_5:
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end58:
	.size	_lean_main, .Lfunc_end58-_lean_main
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
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	callq	l_CompilerStudy_ByteWork_runMain
	testb	$1, %bl
	jne	.LBB59_5
# %bb.1:
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB59_3
# %bb.2:
	decl	%ecx
	movl	%ecx, (%rbx)
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.LBB59_3:
	.cfi_def_cfa_offset 16
	testl	%ecx, %ecx
	je	.LBB59_5
# %bb.4:
	movq	%rbx, %rdi
	movq	%rax, %rbx
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rax
.LBB59_5:
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end59:
	.size	l_main___boxed, .Lfunc_end59-l_main___boxed
	.cfi_endproc
                                        # -- End function
	.section	.text.initialize_ByteWork,"ax",@progbits
	.hidden	initialize_ByteWork             # -- Begin function initialize_ByteWork
	.globl	initialize_ByteWork
	.p2align	4
	.type	initialize_ByteWork,@function
initialize_ByteWork:                    # @initialize_ByteWork
	.cfi_startproc
# %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	cmpb	$1, _G_initialized(%rip)
	jne	.LBB60_3
.LBB60_1:
	callq	lean_inc_heartbeat@PLT
	movl	$16, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB60_2
# %bb.23:
	movabsq	$281543696187393, %rcx          # imm = 0x1001000000001
	movq	%rcx, (%rax)
	movq	$1, 8(%rax)
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.LBB60_3:
	.cfi_def_cfa_offset 16
	movb	$1, _G_initialized(%rip)
	movzbl	%dil, %ebx
	movl	%ebx, %edi
	callq	initialize_Init@PLT
	movzbl	7(%rax), %ecx
	shll	$24, %ecx
	cmpl	$16777216, %ecx                 # imm = 0x1000000
	je	.LBB60_24
# %bb.4:
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB60_6
# %bb.5:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB60_8:
	movl	%ebx, %edi
	callq	initialize_Init@PLT
	movzbl	7(%rax), %ecx
	shll	$24, %ecx
	cmpl	$16777216, %ecx                 # imm = 0x1000000
	je	.LBB60_24
# %bb.9:
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB60_11
# %bb.10:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB60_13:
	movl	%ebx, %edi
	callq	initialize_SplitProd@PLT
	movzbl	7(%rax), %ecx
	shll	$24, %ecx
	cmpl	$16777216, %ecx                 # imm = 0x1000000
	je	.LBB60_24
# %bb.14:
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB60_16
# %bb.15:
	decl	%ecx
	movl	%ecx, (%rax)
.LBB60_18:
	movl	%ebx, %edi
	callq	initialize_Std@PLT
	movzbl	7(%rax), %ecx
	shll	$24, %ecx
	cmpl	$16777216, %ecx                 # imm = 0x1000000
	jne	.LBB60_19
.LBB60_24:
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.LBB60_19:
	.cfi_def_cfa_offset 16
	movl	(%rax), %ecx
	cmpl	$2, %ecx
	jl	.LBB60_21
# %bb.20:
	decl	%ecx
	movl	%ecx, (%rax)
	jmp	.LBB60_1
.LBB60_6:
	testl	%ecx, %ecx
	je	.LBB60_8
# %bb.7:
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB60_8
.LBB60_11:
	testl	%ecx, %ecx
	je	.LBB60_13
# %bb.12:
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB60_13
.LBB60_16:
	testl	%ecx, %ecx
	je	.LBB60_18
# %bb.17:
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB60_18
.LBB60_21:
	testl	%ecx, %ecx
	je	.LBB60_1
# %bb.22:
	movq	%rax, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB60_1
.LBB60_2:
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end60:
	.size	initialize_ByteWork, .Lfunc_end60-initialize_ByteWork
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
	movl	$1, %ebx
	cmpl	$2, %edi
	jl	.LBB61_4
# %bb.1:
	movq	%rsi, %r14
	movl	%edi, %r15d
	incq	%r15
	movl	$1, %r13d
	movabsq	$72620647070564353, %r12        # imm = 0x102001800000001
	.p2align	4
.LBB61_2:                               # =>This Inner Loop Header: Depth=1
	callq	lean_inc_heartbeat@PLT
	movl	$24, %edi
	callq	mi_malloc_small@PLT
	testq	%rax, %rax
	je	.LBB61_10
# %bb.3:                                #   in Loop: Header=BB61_2 Depth=1
	movq	%rax, %rbx
	movq	%r12, (%rax)
	movq	-16(%r14,%r15,8), %rdi
	callq	lean_mk_string@PLT
	movq	%rax, 8(%rbx)
	movq	%r13, 16(%rbx)
	decq	%r15
	movq	%rbx, %r13
	cmpq	$2, %r15
	jg	.LBB61_2
.LBB61_4:
	movq	%rbx, %rdi
	callq	l_CompilerStudy_ByteWork_runMain
	testb	$1, %bl
	jne	.LBB61_9
# %bb.5:
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB61_7
# %bb.6:
	decl	%ecx
	movl	%ecx, (%rbx)
.LBB61_9:
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
	retq
.LBB61_7:
	.cfi_def_cfa_offset 48
	testl	%ecx, %ecx
	je	.LBB61_9
# %bb.8:
	movq	%rbx, %rdi
	movq	%rax, %rbx
	callq	lean_dec_ref_cold@PLT
	movq	%rbx, %rax
	jmp	.LBB61_9
.LBB61_10:
	callq	lean_internal_panic_out_of_memory@PLT
.Lfunc_end61:
	.size	run_main, .Lfunc_end61-run_main
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
	callq	initialize_ByteWork
	movq	%rax, %rbx
	callq	lean_io_mark_end_initialization@PLT
	cmpl	$16777215, 4(%rbx)              # imm = 0xFFFFFF
	ja	.LBB62_6
# %bb.1:
	movl	(%rbx), %eax
	cmpl	$2, %eax
	jl	.LBB62_3
# %bb.2:
	decl	%eax
	movl	%eax, (%rbx)
.LBB62_5:
	callq	lean_init_task_manager@PLT
	leaq	run_main(%rip), %rdi
	movl	%ebp, %esi
	movq	%r14, %rdx
	callq	lean_run_main@PLT
	movq	%rax, %rbx
.LBB62_6:
	callq	lean_finalize_task_manager@PLT
	cmpl	$16777215, 4(%rbx)              # imm = 0xFFFFFF
	ja	.LBB62_11
# %bb.7:
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB62_9
# %bb.8:
	decl	%ecx
	movl	%ecx, (%rbx)
	xorl	%eax, %eax
.LBB62_16:
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB62_11:
	.cfi_def_cfa_offset 32
	movq	%rbx, %rdi
	callq	lean_io_result_show_error@PLT
	movl	(%rbx), %ecx
	cmpl	$2, %ecx
	jl	.LBB62_13
# %bb.12:
	decl	%ecx
	movl	%ecx, (%rbx)
.LBB62_15:
	movl	$1, %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB62_3:
	.cfi_def_cfa_offset 32
	testl	%eax, %eax
	je	.LBB62_5
# %bb.4:
	movq	%rbx, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB62_5
.LBB62_9:
	xorl	%eax, %eax
	testl	%ecx, %ecx
	je	.LBB62_16
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
.LBB62_13:
	.cfi_def_cfa_offset 32
	movl	$1, %eax
	testl	%ecx, %ecx
	je	.LBB62_16
# %bb.14:
	movq	%rbx, %rdi
	callq	lean_dec_ref_cold@PLT
	jmp	.LBB62_15
.Lfunc_end62:
	.size	main, .Lfunc_end62-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"2611923443488327891"
	.size	.L.str, 20

	.type	_G_initialized,@object          # @_G_initialized
	.section	.bss._G_initialized,"aw",@nobits
_G_initialized:
	.byte	0                               # 0x0
	.size	_G_initialized, 1

	.type	l_CompilerStudy_ByteWork_runVariant___closed__0_value,@object # @l_CompilerStudy_ByteWork_runVariant___closed__0_value
	.section	.rodata.l_CompilerStudy_ByteWork_runVariant___closed__0_value,"a",@progbits
	.p2align	3, 0x0
l_CompilerStudy_ByteWork_runVariant___closed__0_value:
	.long	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	249                             # 0xf9
	.quad	10                              # 0xa
	.quad	10                              # 0xa
	.quad	9                               # 0x9
	.asciz	"nat-while"
	.size	l_CompilerStudy_ByteWork_runVariant___closed__0_value, 42

	.type	l_CompilerStudy_ByteWork_runVariant___closed__1_value,@object # @l_CompilerStudy_ByteWork_runVariant___closed__1_value
	.section	.rodata.l_CompilerStudy_ByteWork_runVariant___closed__1_value,"a",@progbits
	.p2align	3, 0x0
l_CompilerStudy_ByteWork_runVariant___closed__1_value:
	.long	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	249                             # 0xf9
	.quad	12                              # 0xc
	.quad	12                              # 0xc
	.quad	11                              # 0xb
	.asciz	"usize-while"
	.size	l_CompilerStudy_ByteWork_runVariant___closed__1_value, 44

	.type	l_CompilerStudy_ByteWork_runVariant___closed__2_value,@object # @l_CompilerStudy_ByteWork_runVariant___closed__2_value
	.section	.rodata.l_CompilerStudy_ByteWork_runVariant___closed__2_value,"a",@progbits
	.p2align	3, 0x0
l_CompilerStudy_ByteWork_runVariant___closed__2_value:
	.long	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	249                             # 0xf9
	.quad	10                              # 0xa
	.quad	10                              # 0xa
	.quad	9                               # 0x9
	.asciz	"usize-for"
	.size	l_CompilerStudy_ByteWork_runVariant___closed__2_value, 42

	.type	l_CompilerStudy_ByteWork_runVariant___closed__3_value,@object # @l_CompilerStudy_ByteWork_runVariant___closed__3_value
	.section	.rodata.l_CompilerStudy_ByteWork_runVariant___closed__3_value,"a",@progbits
	.p2align	3, 0x0
l_CompilerStudy_ByteWork_runVariant___closed__3_value:
	.long	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	249                             # 0xf9
	.quad	12                              # 0xc
	.quad	12                              # 0xc
	.quad	11                              # 0xb
	.asciz	"state-while"
	.size	l_CompilerStudy_ByteWork_runVariant___closed__3_value, 44

	.type	l_CompilerStudy_ByteWork_runVariant___closed__4_value,@object # @l_CompilerStudy_ByteWork_runVariant___closed__4_value
	.section	.rodata.l_CompilerStudy_ByteWork_runVariant___closed__4_value,"a",@progbits
	.p2align	3, 0x0
l_CompilerStudy_ByteWork_runVariant___closed__4_value:
	.long	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	249                             # 0xf9
	.quad	18                              # 0x12
	.quad	18                              # 0x12
	.quad	17                              # 0x11
	.asciz	"unknown variant: "
	.size	l_CompilerStudy_ByteWork_runVariant___closed__4_value, 50

	.type	l_CompilerStudy_ByteWork_runMain___closed__0_value,@object # @l_CompilerStudy_ByteWork_runMain___closed__0_value
	.section	.rodata.l_CompilerStudy_ByteWork_runMain___closed__0_value,"a",@progbits
	.p2align	3, 0x0
l_CompilerStudy_ByteWork_runMain___closed__0_value:
	.long	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	249                             # 0xf9
	.quad	8                               # 0x8
	.quad	8                               # 0x8
	.quad	7                               # 0x7
	.asciz	"1048576"
	.size	l_CompilerStudy_ByteWork_runMain___closed__0_value, 40

	.type	l_CompilerStudy_ByteWork_runMain___closed__1_value,@object # @l_CompilerStudy_ByteWork_runMain___closed__1_value
	.section	.rodata.l_CompilerStudy_ByteWork_runMain___closed__1_value,"a",@progbits
	.p2align	3, 0x0
l_CompilerStudy_ByteWork_runMain___closed__1_value:
	.long	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	249                             # 0xf9
	.quad	2                               # 0x2
	.quad	2                               # 0x2
	.quad	1                               # 0x1
	.asciz	"1"
	.size	l_CompilerStudy_ByteWork_runMain___closed__1_value, 34

	.type	l_CompilerStudy_ByteWork_runMain___closed__2_value,@object # @l_CompilerStudy_ByteWork_runMain___closed__2_value
	.section	.rodata.l_CompilerStudy_ByteWork_runMain___closed__2_value,"a",@progbits
	.p2align	3, 0x0
l_CompilerStudy_ByteWork_runMain___closed__2_value:
	.long	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	249                             # 0xf9
	.quad	20                              # 0x14
	.quad	20                              # 0x14
	.quad	19                              # 0x13
	.asciz	"2611923443488327891"
	.size	l_CompilerStudy_ByteWork_runMain___closed__2_value, 52

	.type	l_CompilerStudy_ByteWork_runMain___closed__3_value,@object # @l_CompilerStudy_ByteWork_runMain___closed__3_value
	.section	.rodata.l_CompilerStudy_ByteWork_runMain___closed__3_value,"a",@progbits
	.p2align	3, 0x0
l_CompilerStudy_ByteWork_runMain___closed__3_value:
	.long	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	0                               # 0x0
	.byte	249                             # 0xf9
	.quad	2                               # 0x2
	.quad	2                               # 0x2
	.quad	1                               # 0x1
	.asciz	" "
	.size	l_CompilerStudy_ByteWork_runMain___closed__3_value, 34

	.ident	"clang version 22.1.4 (https://github.com/llvm/llvm-project 35990504507d79e0b9deb809c8ee5e1b34ceef20)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym run_main
	.addrsig_sym l_CompilerStudy_ByteWork_runVariant___closed__0_value
	.addrsig_sym l_CompilerStudy_ByteWork_runVariant___closed__1_value
	.addrsig_sym l_CompilerStudy_ByteWork_runVariant___closed__2_value
	.addrsig_sym l_CompilerStudy_ByteWork_runVariant___closed__3_value
	.addrsig_sym l_CompilerStudy_ByteWork_runVariant___closed__4_value
	.addrsig_sym l_CompilerStudy_ByteWork_runMain___closed__0_value
	.addrsig_sym l_CompilerStudy_ByteWork_runMain___closed__1_value
	.addrsig_sym l_CompilerStudy_ByteWork_runMain___closed__2_value
	.addrsig_sym l_CompilerStudy_ByteWork_runMain___closed__3_value
