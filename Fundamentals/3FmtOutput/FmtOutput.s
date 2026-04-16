#Compilation: gcc -fno-pie -no-pie c.cpp 3FmtOutput.s -z noexecstack

#Constants section:
	fmtStrI:
              .asciz  "i=%d, converted to hex=%#x\n"

    fmtStrJ:   
              .asciz  "j=%d, converted to hex=%#x\n"

    fmtStrK:
              .asciz  "k=%d, converted to hex=%#x\n"
#Writable/readable section:
.section .data
	
	i:
		.byte	1
	
	j:
		.byte	123
	
	k:	
		.int	456789
	
.section .bss
.section .text
#Frequently used procedures:
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

#Start asmMain function:
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

#Program end:
	call	ProgramExit


	
	
