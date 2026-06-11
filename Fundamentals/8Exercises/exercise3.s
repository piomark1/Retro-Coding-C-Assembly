#Compilation:
#           gcc -fno-pie -no-pie exercise3.s c.cpp -lstdc++ -z noexecstack

.section .text
ProgramInput:
    pushq   %rbx
    xorq    %rax, %rax
    call    scanf
    xorq    %rax, %rax
    popq    %rbx

    ret
ProgramOutput:
    pushq   %rbx
    call    printf
    xorq    %rax, %rax
    popq    %rbx

    ret

    .global asmMain
asmMain:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $16, %rsp

    lea     RInStr(%rip), %rdi
    xorq    %rax, %rax
    call    ProgramOutput

    lea     fmtInStr(%rip), %rdi
    lea     R(%rip), %rsi
    call    ProgramInput

#   A = PI*R*R
    cvtss2sd    R(%rip), %xmm0
    movsd       %xmm0, %xmm1
    mulsd       %xmm1, %xmm0
    cvtss2sd    PI(%rip), %xmm1
    mulsd       %xmm1, %xmm0

#   A = PI*R*R 
#   movss       R(%rip), %xmm0
#   movss       %xmm0, %xmm1
#   mulss       %xmm1, %xmm0
#   movss       PI(%rip), %xmm1
#   mulss       %xmm1, %xmm0

    lea         OutStr(%rip), %rdi
    xorq        %rax, %rax
    incq        %rax
    call        ProgramOutput

    addq    $16, %rsp
    popq    %rbp

    xorq    %rdi, %rdi
    movq    $60, %rax

    syscall
.section const, "a"
    RInStr:     .asciz  "Enter radius: "
    fmtInStr:   .asciz  "%f"
    OutStr:     .asciz  "Area of a circle is %.2f\n"
    
    PI:     .single 3.14
.section .data
    R:  .single 0.0
.section .bss
