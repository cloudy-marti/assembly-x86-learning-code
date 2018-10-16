; Author : MARTI Emilie
; Created on : 10/10/2018
; Objective : Read some integers and display them inversed.

%include "asm_io.inc"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .data
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
msg1 : db "Enter some integers and finish with -1 : ", 0
space : db " ", 0
newline : db 10, 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .bss
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .text
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
global main
main:
	; save original esp address
	mov ebp, esp

	; take user input
	mov eax, msg1
	call print_string

	; ecx will be my counter
	mov ecx, 0

read_while:
	add ecx, 1
	call read_int
	push eax
	cmp eax, -1
	jne read_while

	; edx will be my index
	mov edx, 0

print_for:
	add edx, 1
	; exit for loop if edx = ecx
	cmp edx, ecx
	jg end_for

	; print number
	pop eax
	call print_int
	
	; print a space
	mov eax, space
	call print_string

	jmp print_for
end_for:

	; print an \n-like character
	mov eax, newline
	call print_string

    ; end of programm
    mov ebx, 0
    mov eax, 1
    int 0x80