#Compilation:
#           gcc -fno-pie -no-pie exercise5.s c.cpp -lstdc++ -z noexecstack

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
    
    lea     InStr(%rip), %rdi
    xorq    %rax, %rax
    call    ProgramOutput

    lea     InFmt(%rip), %rdi
    lea     age(%rip), %rsi
    call    ProgramInput

    movl    age(%rip), %eax
    cmpl    ARE_OF_AGE(%rip), %eax
    jb      AgeNotOk
    lea     IsOfAge(%rip), %rdi
    xorq    %rax, %rax
    call    ProgramOutput
    jmp     ProgramExit

AgeNotOk:
    lea     NoOfAge(%rip), %rdi
    movl    age(%rip), %eax
    movl    ARE_OF_AGE(%rip), %esi
    subl    %eax, %esi
    xorq    %rax, %rax
    call    ProgramOutput

ProgramExit:
    addq    $16, %rsp
    popq     %rbp
    xorq    %rdi, %rdi
    movq    $60, %rax

    syscall

.section const, "a"
    ARE_OF_AGE: .int 18
    InStr:  .asciz  "Enter your age: "
    InFmt:  .asciz  "%d"

    IsOfAge:    .asciz  "Yes, you are already of age. Come in!\n"
    NoOfAge:    .asciz  "Sorry, you have to wait %d years yet.\n"

.section .data
    age:    .int    0
.section .bss
