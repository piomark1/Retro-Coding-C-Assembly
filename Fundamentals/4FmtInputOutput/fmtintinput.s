#Compilation:
#           gcc -fno-pie -no-pie fmtintinput.s c.cpp -lstdc++ -z noexecstack
.section .text
intProgramOutput:
    pushq   %rbx
    xorq    %rax, %rax
    call    printf
    xorq    %rax, %rax
    popq    %rbx
    ret
intProgramInput:
    pushq   %rbx
    xorq    %rax, %rax
    call    scanf
    xorq    %rax, %rax
    popq    %rbx
    ret
    
    .global asmMain
asmMain:
    pushq   %rbp
    movq    %rsp, %rbp
    pushq   %rbx
    pushq   %rcx

    lea     fmtInput(%rip), %rdi
    lea     Age(%rip), %rsi
    call    intProgramInput

    lea     fmtStr(%rip), %rdi
    movl    Age(%rip), %esi
    call    intProgramOutput
        
    popq    %rcx
    popq    %rbx
    popq    %rbp

    xorq    %rdi, %rdi
    movq    $60, %rax

    syscall
.section const, "a"
    fmtInput:   .asciz "%d"
    fmtStr:     .asciz  "You are %d years old.\n"
.section .data
    Age:    .int    0
.section .bss
