#Compilation:
#       gcc -fno-pie -no-pie ZeroArray.s c.cpp -lstdc++ -z noexecstack
    .include "InputOutput.inc"

.section .text
    
    .global asmMain
asmMain:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $16, %rsp

Zero_Array: 
    xorq    %rbx, %rbx
    xorq    %rcx, %rcx
    movb    $40, %cl
    
    Loop_zero:
        cmpq    %rcx, %rbx
        je      End
        movl    $0, Array(, %rbx, 4)
        incq    %rbx
        jmp     Loop_zero
    End:
        lea     OutStr(%rip), %rdi
        xorq    %rax, %rax
        call    ProgramOutput

Print_Array:
    
    xorq    %rbx, %rbx
    Loop_print:
        
        movq    %rbx, %rax
        incq    %rax
        movq    $10, %rcx
        divq    %rcx
        cmpq    $0, %rdx
        je      New_line
        
        lea     ArrOut(%rip), %rdi
        movl    Array(, %rbx, 4), %esi
        pushq   %rbx
        xorq    %rax, %rax
        call    ProgramOutput
        popq    %rbx
        
        incq    %rbx
        cmpq    $40, %rbx
        je      ProgramExit
        jmp     Loop_print
        
        New_line:
            lea     ArrOutNl(%rip), %rdi
            movl    Array(, %rbx, 4), %esi
            pushq   %rbx
            xorq    %rax, %rax
            call    ProgramOutput
            popq    %rbx
            
            incq    %rbx
            cmpq    $40, %rbx
            jb      Loop_print

ProgramExit:        
    addq    $16, %rsp
    popq    %rbp

    xorq    %rdi, %rdi
    movq    $60, %rax

    syscall

.section .rodata
    ArrOut:     .asciz  "%d"
    ArrOutNl:   .asciz  "%d\n"
    
    OutStr: .asciz  "The array was set to 0.\n"

.section .data
    Array:  .fill   40, 4, 1

.section .bss
