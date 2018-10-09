SECTION .data
debut :
    db "Le premier TP ", 0
fin :
	db "est presque terminé !", 10, 0

SECTION .text

global main
main :
	; print debut message to stdout
    mov edx, 0xf
    mov ecx, debut
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; print fin message to stdout
    mov edx, 0x17
    mov ecx, fin
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; exit program
    mov ebx, 0
    mov eax, 1
    int 0x80