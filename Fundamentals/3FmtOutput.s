    fmtStrI:
              .asciz  "i=%d, converted to hex=%#x\n"

    fmtStrJ:   
              .asciz  "j=%d, converted to hex=%#x\n"

    fmtStrK:
              .asciz  "k=%d, converted to hex=%#x\n"

.section .data
	
	i:
		.byte	1
	
	j:
		.byte	123
	
	k:	
		.int	456789
	
.section .bss
.section .text
	

ProgramOutput:
	pushq %rbx
  xorq	%rax, %rax
	call	printf
	xorq	%rax, %rax
	popq	%rbx
	
	ret

ProgramExit:
	addq  $16, %rsp
  popq  %rbp

  xorq  %rdi, %rdi
  movq  $60, %rax

  syscall

	.global	asmMain
asmMain:

#Program start:
		
	pushq	%rbp
	movq	%rsp, %rbp
	subq  $16, %rsp
	
  
  xorq  %rsi, %rsi
  xorq  %rdx, %rdx
  
  lea	fmtStrI(%rip), %rdi
	movb	i, %sil
	movb	%sil, %dl
	call	ProgramOutput
	
  xorq  %rsi, %rsi
  xorq  %rdx, %rdx

  lea	fmtStrJ(%rip), %rdi
	movb	j, %sil
	movb	%sil, %dl
	call	ProgramOutput
	

	xorq  %rsi, %rsi
  xorq  %rdx, %rdx

  lea	fmtStrK(%rip), %rdi
	movl	k, %esi
	movl	%esi, %edx
	call	ProgramOutput
	
ProgramEnd:

	call	ProgramExit


	
	
