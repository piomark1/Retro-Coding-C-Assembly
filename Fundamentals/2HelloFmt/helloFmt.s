# Program displaying formatted string and using C functions; system("clear");
# and getchar() from level of assembly.

# This time all text is above data writable section
# but if You wish to put it into data section
# program should work as well.
#
# Compilation: gcc -fno-pie -no-pie c.cpp 2helloFmt.s -z noexecstack
	
  	fmtStr:     .asciz  "%s\n"
  
  	Str:	      .ascii  "********************************************\n" 
    	          .ascii  "************Hello ASM World!!!**************\n"
        	      .asciz  "********************************************"
  
  	SysCallStr: .asciz  "clear"

.section  .data	
.section  .bss
.section  .text

ProgramOutput:
    pushq %rbx
    xorq  %rax, %rax
    call  printf
    xorq  %rax, %rax
	popq  %rbx

    ret

ProgramExit:
    addq  $16, %rsp
    popq  %rbp
	xorq  %rdi, %rdi
    movq  $60, %rax
	
	syscall

System:
    pushq  %rbx
    call  system
	xorq  %rdi, %rdi
    popq  %rbx
    
    ret
	
	.global asmMain
asmMain:

#Program start:
	pushq	%rbp
	movq	%rsp, %rbp
	subq  $16,	%rsp	
#Clear screen:
  	lea   SysCallStr(%rip), %rdi  # system("clear"); in C
  	call  System
	
#Display formatted text:
	lea	  fmtStr(%rip), %rdi
	lea   Str(%rip), %rsi
	call	ProgramOutput

#Wait for press any key:
  	call  getchar

#Clear screen and end program:
  	lea   SysCallStr(%rip), %rdi
  	call  System
	
  	call  ProgramExit	
	

