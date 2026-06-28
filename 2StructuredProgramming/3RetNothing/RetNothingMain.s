#Compilation:
#        gcc -fno-pie -no-pie RetNothingMain.s c.cpp -lstdc++ -z noexecstack
    
    .include    "InputOutput.inc"
    .include    "RetNothing.inc"
.section .text
    .global asmMain
asmMain:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $16, %rsp
    
    lea     OutStr(%rip), %rdi
    call    ProgramOutput

    lea     FmtIn(%rip), %rdi
    lea     Number(%rip), %rsi
    call    ProgramInput
    
    movl    Number(%rip), %edi
    call    RetNothing
    
    addq    $16, %rsp
    popq    %rbp
    
    xorq    %rdi, %rdi
    movq    $60, %rax

    syscall
.section const, "a"
    FmtIn:      .asciz  "%d"
    OutStr:     .asciz  "Enter some number: \n"
    
    Below20Str: .asciz  "The number is less than 20.\n"
    Equal20Str: .asciz  "The number is equal to 20.\n"
    Great20Str: .asciz  "The number is greater than 20.\n"

.section .data
    Number:     .int    0

.section .bss
