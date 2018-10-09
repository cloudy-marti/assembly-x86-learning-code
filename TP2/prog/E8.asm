; Author : MARTI Emilie
; Created on : 09/10/2018
; Objective : Read one integer from input and count its occurrencies of 1 in binary.

%include "asm_io.inc"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .data
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
msg1 : db "Enter a number please : ", 0
space : db " ", 0
newline : db 10, 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .bss
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
_int : resd 1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .text
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
global main
main:
	; take user input
	mov eax, msg1
	call print_string
	call read_int
	mov [_int], eax

	; ecx will be my index
	mov ecx, 0

	; for loop
for:
	add ecx, 1
	; exit for loop if ecx > a
	cmp ecx, [a]
	jg end_for

	; divide a / ecx
	mov edx, 0
	mov eax, [a]
	div ecx

	; check if division is euclidean and print divisor
	cmp edx, 0
	jne for
	call print_int

	; print a space
	mov eax, space
	call print_string

	jmp for
end_for:

	; print an \n-like character
	mov eax, newline
	call print_string

    ; end of programm
    mov ebx, 0
    mov eax, 1
    int 0x80 