%include "asm_io.inc"

SECTION .data

SECTION .bss

SECTION .text
global main
main :
    enter 0, 0
    pusha

debut :
    call affiche
    popa
    mov eax, 0
    leave
    ret

affiche :
    push dword affiche
    mov eax, 0
    push eax
    call print_int
    call print_nl
    ret
    
    mov ebx, 0
    mov eax, 1
    int 0x80

