#Compilation:
#           gcc -fno-pie -no-pie AgeAfter480.s c.cpp -lstdc++ -z noexecstack
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
    xorq    %rax, %rax
    call    printf
    xorq    %rax, %rax
    popq    %rbx
    ret

    .global asmMain
asmMain:
    pushq   %rbp
    movq    %rsp, %rbp
    pushq    %rbx
    pushq   %rcx

    xorq    %rbx, %rbx
    movb    months_a_year(%rip), %bl

    xorq    %rax, %rax
    movw    TimeRange(%rip), %ax
    xorq    %rdx, %rdx  #Without this operation there is "arithmetic exceptio" return.
    divq    %rbx
    movl    %eax, HowMannyYears(%rip)

    lea     fmtInput(%rip), %rdi
    lea     Age(%rip), %rsi
    call    ProgramInput

    movl    HowMannyYears(%rip), %eax
    movl    Age(%rip), %ebx
    addl    %ebx, %eax
    movl    %eax, CalculatedAge(%rip)
    
    lea     fmtStr(%rip), %rdi
    movl    HowMannyYears(%rip), %esi
    movl    CalculatedAge(%rip), %edx
    call    ProgramOutput

    popq    %rcx
    popq    %rbx
    popq    %rbp

    xorq    %rdi, %rdi
    movq    $60, %rax

    syscall

.section const, "a"
    fmtInput:   .asciz  "%d"
    fmtStr:     .ascii  "After 480 months, it means %d years, "
                .asciz  "You'll be %d years old\n"

    TimeRange:      .word   480
    months_a_year:  .byte    12

.section .data
    Age:            .int    0
    CalculatedAge:  .int    0
    HowMannyYears:  .int    0
.section .bss
