#Compilation:
#           gcc -fno-pie -no-pie exercise4.s c.cpp -lstdc++ -z noexecstack

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

    lea     Rinput(%rip), %rdi
    xorq    %rax, %rax
    call    ProgramOutput

    lea     fmtInput(%rip), %rdi
    lea     R(%rip), %rsi
    call    ProgramInput
    
    lea     Hinput(%rip), %rdi
    xorq    %rax, %rax
    call    ProgramOutput

    lea     fmtInput(%rip), %rdi
    lea     H(%rip), %rsi
    call    ProgramInput

    movss       R(%rip), %xmm2
    movss       %xmm2, %xmm1
    mulss       %xmm2, %xmm1
    movss       PI(%rip), %xmm2
    mulss       %xmm2, %xmm1
    movq        $2, %rax
    cvtsi2ss    %rax, %xmm2
    mulss       %xmm2, %xmm1
    movss       %xmm1, %xmm0

    movss       H(%rip), %xmm2
    movss       R(%rip), %xmm1
    mulss       %xmm2, %xmm1
    movss       PI(%rip), %xmm2
    mulss       %xmm2, %xmm1
    movq        $2, %rax
    cvtsi2ss    %rax, %xmm2
    mulss       %xmm2, %xmm1
    addss       %xmm0, %xmm1
    cvtss2sd    %xmm1, %xmm0

    lea     OutStr(%rip), %rdi
    xorq    %rax, %rax
    incq    %rax
    call    ProgramOutput

    addq    $16, %rsp
    popq    %rbp

    xorq    %rdi, %rdi
    movq    $60, %rax

    syscall
    
.section const, "a"
    Rinput: .asciz  "Enter radius of the cylinder: "
    Hinput: .asciz  "Enter height of the cylinder: "
    OutStr: .asciz  "The area of the cylinder is %.2f\n"
    
    fmtInput:   .asciz  "%f"

    PI: .single 3.14
.section .data
    R:  .single 0.0
    H:  .single 0.0
.section .bss
