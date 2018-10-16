; Author : MARTI Emilie
; Created on : 10/10/2018
; Objective : Read some integers between 0 and 50 from input and display the other ones.

%include "asm_io.inc"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .data
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
msg1 : db "Please enter some integers between 0 and 50 and finish with -1 : ", 0
space : db " ", 0
newline : db 10, 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .bss
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; allocating 51 bits to save integers from 0 to 50
_int : resb 51

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .text
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
global main
main:
	mov eax, msg1
	call print_string

	; ecx will be my pointer
	mov ecx, _int
	; edx will be my index
	mov edx, 0
	; eax will be the element
	mov eax, 0

	; while loop to take user input
while:
	; take user input
	call read_int

	; exit while loop if eax == -1 && eax > 50 && eax < 0
	cmp eax, -1
	je end_while
	cmp eax, 50
	jg end_while
	cmp eax, 0
	jl end_while

	; change array value to 1 to index == user input
	mov byte [ecx + eax], 1

	jmp while
end_while:

	; edx will be my index
	mov edx, -1

; for loop to print
forprint:
	; i++
	add edx, 1

	; end for loop if array is all read
	cmp edx, 51
	je end_forprint

	; ecx will be my pointer
	mov ecx, _int
	add ecx, edx

	; restart for loop if value == 1
	cmp byte [ecx], 1
	je forprint

	; print index and a space character if value == 0
	mov eax, edx
	call print_int

	mov eax, space
	call print_string

	jmp forprint
end_forprint:

	; print an \n-like character
	mov eax, newline
	call print_string

    ; end of programm
    mov ebx, 0
    mov eax, 1
    int 0x80