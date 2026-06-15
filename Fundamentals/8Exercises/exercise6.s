#Compilation:
#           gcc -fno-pie -no-pie exercise6.s c.cpp -lstdc++ -z noexecstack

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

    lea     CelsInStr(%rip), %rdi
    xorq    %rax, %rax
    call    ProgramOutput

    lea     FmtIn(%rip), %rdi
    lea     celsius(%rip), %rsi
    call    ProgramInput

    movss       celsius(%rip), %xmm1
    mulss       CELS_TO_FAHR(%rip), %xmm1
    cvtss2sd    %xmm1, %xmm0

    lea     FahrOutStr(%rip), %rdi
    xorq    %rax, %rax
    incq    %rax
    call    ProgramOutput

    addq    $16, %rsp
    popq    %rbp
    xorq    %rdi, %rdi
    movq    $60, %rax

    syscall

.section const, "a"
    CELS_TO_FAHR:   .single 2.12

    CelsInStr:  .asciz  "Enter temperature in Celsius degrees: "
    FmtIn:      .asciz  "%f"
    FahrOutStr: .asciz  "Temperature in Fahrenheit degrees is: %.2f\n"

.section .data
    celsius:    .single 0.0

.section .bss
