; Author : MARTI Emilie
; Created on : 09/10/2018
; Objective : Read two integers from input and display the greatest one.

%include "asm_io.inc"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .data
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
msg1 : db "Enter a number please : ", 0
msg2 : db "Another number please : ", 0
msg3 : db "Biggest integer is : ", 0
newline : db 10, 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .bss
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
input1 : resd 1
input2 : resd 1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .text
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
global main
main:
	mov eax, msg1
	call print_string		; print msg1
	call read_int			; read an input int and save it into eax
	mov [input1], eax		; move eax content into input1 var

	mov eax, msg2
	call print_string
	call read_int
	mov [input2], eax

	cmp [input1], eax

	jg else
		mov eax, [input2]
		call print_int
		jmp end_if

	else:
		mov eax, [input1]
		call print_int

end_if:
	mov eax, newline
	call print_string		; print a \n character for better display

    ; Fin de l'execution.
    mov ebx, 0
    mov eax, 1
    int 0x80