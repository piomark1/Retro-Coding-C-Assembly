#Compilation:
#           gcc -fno-pie -no-pie FloatArray.s c.cpp -lstdc++ -z noexecstack    
    
    .include "InputOutput.inc"

.section .text
    .global asmMain

asmMain:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $16, %rsp
    
    xorq    %rbx, %rbx
    incq    %rbx
    pushq   %rbx
    
    lea     InFmt(%rip), %rdi
    lea     FloatArray(, %rbx, 4), %rsi
    call    ProgramInput
    
    popq    %rbx
    
    cvtss2sd    FloatArray(, %rbx, 4), %xmm0
    lea         OutFmt(%rip), %rdi
    xorq        %rax, %rax
    incq        %rax
    call        ProgramOutput

ProgramExit:
    addq    $16, %rsp
    popq    %rbp

    xorq    %rdi, %rdi
    movq    $60, %rax

    syscall
    
.section .rodata
    InFmt:  .asciz  "%f"
    OutFmt: .asciz  "%.1f\n"

.section .data
   FloatArray:   .fill 21, 4, 0
 
 # FloatArray:   .single     0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0
 #               .single     0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0
 #               .single     0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0
.section .bss
