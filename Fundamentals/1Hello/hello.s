# Compilation: gcc -fno-pie -no-pie c.cpp 1hello.s -z noexecstack
.section .data
  
  Str:  .ascii  "*****************************************\n"
        .ascii  "********** Hello ASM World!!! ***********\n"
        .asciz  "*****************************************\n"  

.section .bss
.section .text

ProgramOutput:
    pushq   %rbx
    
    xorq    %rax, %rax    # Output procedure.
    call    printf
    xorq    %rax, %rax
    
    popq    %rbx

    ret

ProgramExit:
    movq  $60, %rax     # Exit procedure.
    xorq  %rdi, %rdi

    syscall
    
    .global asmMain
asmMain:

# Program start:         
                  pushq   %rbp            # Prepare space on stack for C library calls. 
                  movq    %rsp, %rbp
                  subq  $16, %rsp

# Program body:
                  lea Str(%rip), %rdi
                  call  ProgramOutput


# Program end:
                  addq  $16, %rsp       # Bring back stack to the state 
                  popq  %rbp            # before running program.
                  
                  call  ProgramExit     # Close porgram. Return 0.


    
  
