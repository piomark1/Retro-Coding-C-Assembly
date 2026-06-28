.include "InputOutput.inc"

.section .text
    .global RetNothing
RetNothing:
    pushq   %rbp
    subq    $16, %rsp

    cmpl    $20, %edi
    jae     AboveOrEqual

    lea     Below20Str(%rip), %rdi
    xorq    %rax, %rax
    call    ProgramOutput
    
    jmp     FunctionEnd
    
    AboveOrEqual:
        cmpl    $20, %edi
        ja      Above

        lea     Equal20Str(%rip), %rdi
        xorq    %rax, %rax
        call    ProgramOutput

        jmp     FunctionEnd

        Above:
            lea     Great20Str(%rip), %rdi
            xorq    %rax, %rax
            call    ProgramOutput


FunctionEnd:
    addq    $16, %rsp
    popq    %rbp

    ret

.section const, "a"
    Below20Str: .asciz  "Number is lower than 20\n"
    Equal20Str: .asciz  "Number is equal to 20\n"
    Great20Str: .asciz  "Number is greater than 20\n"

    
    
