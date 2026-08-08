#Compilation:
#   gcc -fno-pie -no-pie Switch.s c.cpp -lstdc++ -z noexecstack

    .include    "InputOutput.inc"
.section .text
    .global asmMain
asmMain:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $16, %rsp

    lea     InStr(%rip), %rdi
    xorq    %rax, %rax
    call    ProgramOutput

    lea     FmtStr(%rip), %rdi
    lea     value(%rip), %esi
    call    ProgramInput

    xorq    %rbx, %rbx
    movl    value(%rip), %ebx
    
    cmpl    $1, %ebx
    je      Case1
    cmpl    $2, %ebx
    je      Case2
    cmpl    $3, %ebx
    je      Case3
    jne     Default

Case1:
    lea     Case1Out(%rip), %rdi
    xorq    %rax, %rax
    call    ProgramOutput
    jmp     Break

Case2:
    lea     Case2Out(%rip), %rdi
    xorq    %rax, %rax
    call    ProgramOutput
    jmp     Break

Case3:
    lea     Case3Out(%rip), %rdi
    xorq    %rax, %rax
    call    ProgramOutput
    jmp     Break

Default:
    lea     DefOut(%rip), %rdi
    xorq    %rax, %rax
    call    ProgramOutput

Break:
    nop

ProgramExit:
    addq    $16, %rsp
    popq    %rbp

    xorq    %rdi, %rdi
    movq    $60, %rax

    syscall

.section .rodata
    FmtStr: .asciz "%d"
    InStr:  .asciz  "Enter value from 1-3: "
    
    Case1Out:   .asciz  "You've entered 1\n"
    Case2Out:   .asciz  "You've entered 2\n"
    Case3Out:   .asciz  "You've entered 3\n"
    DefOut:     .asciz  "?!...\n"

.section .data
    value:      .int 0

.section .bss
