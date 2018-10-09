; Author : MARTI Emilie
; Created on : 09/10/2018
; Objective : Read two integers from input and divide them.

%include "asm_io.inc"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .data
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
msg1 : db "Enter a number please : ", 0
msg2 : db "Another number please : ", 0
divok : db "yes !", 0
divnope : db "NO !", 0
eq : db "division = ", 0
rem : db "remainder is : ", 0
newline : db 10, 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .bss
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
a : resd 1
b : resd 1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .text
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
global main
main:
	; take user input
	mov eax, msg1
	call print_string
	call read_int
	mov [a], eax

	mov eax, msg2
	call print_string
	call read_int
	mov [b], eax

	; print equal
	mov eax, eq
	call print_string

	; make the division
	mov edx, 0
	mov eax, [a]
	cdq
	mov ecx, [b]
	idiv ecx

	; print entire division portion
	call print_int

	; print an \n-like character
	mov eax, newline
	call print_string

	; check whether remainder is 0 or not
	cmp edx, 0

	je else
		; say nope
		mov eax, divnope
		call print_string

		; print an \n-like character
		mov eax, newline
		call print_string

		; tell remainder
		mov eax, rem
		call print_string

		; print remainder
		mov eax, edx
		call print_int
		jmp end_if

	else:
		; say yes
		mov eax, divok
		call print_string

end_if:
	; print an \n-like character
	mov eax, newline
	call print_string

    ; end of programm
    mov ebx, 0
    mov eax, 1
    int 0x80