; Author : MARTI Emilie
; Created on : 09/10/2018
; Objective : Read one integer from input and display it in binary.

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
	; exit for loop if ecx > 32
	cmp ecx, 32
	jg end_for

	; update eax with _int value
	mov eax, [_int]
	; push bits to the left 1 time
	shl eax, 1
	; update _int value
	mov [_int], eax
	; jump to print_0 if CF value equals 0
	jnc print_0

	; print 1
	mov eax, 1
	call print_int
	jmp for

	print_0:
	; print 0
	mov eax, 0
	call print_int
	jmp for

	jmp for
end_for:

	; print an \n-like character
	mov eax, newline
	call print_string

    ; end of programm
    mov ebx, 0
    mov eax, 1
    int 0x80 

; jc = Jump if carry is set (C=1)
; jnc = Jump if carry is not set (C=0)