#Compilation:
#   gcc -fno-pie -no-pie exercise1.s c.cpp -lstdc++ -z noexecstack

    .include    "InputOutput.inc"
    .include    "FloatDifference.inc"
    .include    "IntDifference.inc"

.section .text
    .global asmMain
asmMain:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $16, %rsp

    DoWhile3Loop:
        lea     SysCmd(%rip), %rdi
        call    system
        
        lea     MenuStr(%rip), %rdi
        xorq    %rax, %rax
        call    ProgramOutput

        lea     IntFmtStr(%rip), %rdi
        lea     value(%rip), %esi
        call    ProgramInput

        movl    value(%rip), %ebx
        cmpl    $1, %ebx
        je      Case1
        cmpl    $2, %ebx
        je      Case2
        cmpl    $3, %ebx
        je      ProgramExit
        jne     DoWhile3Loop

    Case1:
        lea     FstNumStr(%rip), %rdi
        xorq    %rax, %rax
        call    ProgramOutput

        lea     IntFmtStr(%rip), %rdi
        push    %rdi
        lea     first(%rip), %rsi
        call    ProgramInput

        lea     ScndNumStr(%rip), %rdi
        xorq    %rax, %rax
        call    ProgramOutput

        popq    %rdi
        lea     second(%rip), %rsi
        call    ProgramInput

        #movl    first(%rip), %esi
        #subl    second(%rip), %esi
        call    IntDifference

        lea     IntDiffStr(%rip), %rdi
        xorq    %rax, %rax
        call    ProgramOutput
        
        call    getchar
        call    getchar

        jmp     DoWhile3Loop
        
    Case2:
        lea     FstFltStr(%rip), %rdi
        xorq    %rax, %rax
        call    ProgramOutput

        lea     FltFmtStr(%rip), %rdi
        pushq   %rdi
        lea     first_float(%rip), %rsi
        call    ProgramInput

        lea     ScdFltStr(%rip), %rdi
        xorq    %rax, %rax
        call    ProgramOutput

        popq    %rdi
        lea     second_float(%rip), %rsi
        call    ProgramInput

        #movss   first_float(%rip), %xmm0
        #subss   second_flot(%rip), %xmm0
        call    FloatDifference
        
        lea     FltDiffStr(%rip), %rdi
        xorq    %rax, %rax
        incq    %rax
        call    ProgramOutput
        
        call    getchar
        call    getchar
        
        jmp     DoWhile3Loop
        
ProgramExit:
    lea     SysCmd(%rip), %rdi
    call    system

    addq    $16, %rsp
    popq    %rbp

    xorq    %rdi, %rdi
    movq    $60, %rax

    syscall

.section .rodata
    FltFmtStr:  .asciz  "%f"
    IntFmtStr:  .asciz  "%d"
    
    SysCmd:    .asciz  "clear"
    
    MenuStr:    .ascii  "\n1-Integer Difference Calculator\n"
                .ascii  "2-Float Difference Calculator\n"
                .asciz  "3-Exit\n"

    #ChoiceStr:  .asciz  "Enter value 1 or 2: "
    
    FstNumStr:  .asciz  "Enter first number: "
    ScndNumStr: .asciz  "Enter second number: "

    FstFltStr:  .asciz  "Enter first float number: "
    ScdFltStr:  .asciz  "Enter second float number: "
    
    IntDiffStr: .asciz  "\nThe difference of entered integers is %d\n"
    FltDiffStr: .asciz  "\nThe difference of entered floats is %.2f\n"

.section .data
    value:  .int    0
    first:  .int    0
    second: .int    0

    first_float:    .single 0.0
    second_float:   .single 0.0
.section .bss
