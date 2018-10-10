; courtesy of Vincent Agullo

; Author : MARTI Emilie
; Created on : 10/10/2018
; Objective : Read one integer from input and display the number of occurrencies of 1 in its binary form.

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
_adr : resd 1

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

	mov edx, eax
	and edx, 0xFFFFFFFF
	;call print_int

	; for loop
for:
	add ecx, 1
	; exit for loop if ecx > 32
	cmp ecx, 32
	jg end_for

	; update eax with _int value
	mov eax, edx
	; push bits to the right 1 time
	shl eax, 1
	; update _int value
	; restart loop if CF equals 0
	jnc for

	; save counter value
	add eax, 1

	jmp for
end_for:

	; print counter value
	mov eax, edx
	call print_int

	; print an \n-like character
	mov eax, newline
	call print_string

    ; end of programm
    mov ebx, 0
    mov eax, 1
    int 0x80 

; jc = Jump if carry is set (C=1)
; jnc = Jump if carry is not set (C=0)
