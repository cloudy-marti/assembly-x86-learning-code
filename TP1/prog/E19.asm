SECTION .data           ; constant var declared here
msg :
    db "L'ordinateur va s'éteindre !", 10, 0

SECTION .text
global main
main :
    mov edx, 0x1f       ; display 31 characters
    mov ecx, msg        ; constant declared into SECTION .data
    mov ebx, 1          ; print to stdout
    mov eax, 4          ; command write number
    int 0x80            ; interruption to call write function from linux kernel
    mov ebx, 0
    mov eax, 1          ; command exit number
    int 0x80