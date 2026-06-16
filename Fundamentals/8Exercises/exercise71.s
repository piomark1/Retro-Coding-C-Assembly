#Compilation:
#          gcc -fno-pie -no-pie exercise7.s c.cpp -lstdc++ -z noexecstak

.section .text
ProgramInput:
    pushq  %rbx
    xorq   %rax, %rax
    call   scanf
    xorq   %rax, %rax
    popq   %rbx

    ret

ProgramOutput:
    pushq  %rbx
    call   printf
    xorq   %rax, %rax
    popq   %rbx

    ret

    .global  asmMain
asmMain:
    pushq  %rbp
    movq   %rsp, %rbp 
    subq   $16, %rsp

ProgramExit:
    addq    $16, %rsp
    popq    %rbp
    xorq    %rdi, %rdi
    movq    $60, %rax

    syscall
    
.section const, "a"
    NumInStr:   .asciz  "Enter five numbers:\n"
    FmtInStr:   .asciz  "%d"  
    
    OutStrA:    .asciz  "The largest number is a: %d\n"
    OutStrB:    .asciz  "The largest number is b: %d\n"
    OutStrC:    .asciz  "The largest number is c: %d\n"
    OutStrD:    .asciz  "The largest number is d: %d\n"
    OutStrE:    .asciz  "The largest number is e: %d\n"

.section .data
    a:    .int    0
    b:    .int    0
    c:    .int    0
    d:    .int    0
    e:    .int    0
.section .bss
