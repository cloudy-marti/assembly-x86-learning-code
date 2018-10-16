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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  FILL ARRAY  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	; ecx will be my pointer
	mov ecx, _int
	; edx will be my index
	mov edx, 0
	; eax will be the element
	mov eax, 0

	; pas besoin de remplir le tableau
	; on a juste a mettre des 0 partout et ensuite remplacer par 1 chaque case
	; qui correspond a ce que l'user a rentré
	; puis on imprime les INDEX où il y a des 0
	
	; for loop to fill the array
for:
	; move element to [pointer + i]
	add ecx, edx
	mov [ecx], eax

	; i++ && n++
	add edx, 1
	add eax, 1
	
	; exit for loop if eax is greater than 50
	cmp eax, 50
	jg end_for

	jmp for
end_for:

	; clean ecx, eax and edx
	mov ecx, _int
	mov eax, 0
	mov edx, 0

	; ebx will be my counter
	mov ebx, 0

;;;;;;;;;;;;;;;;;;;;;;  TAKE INPUT AND COMPARE  ;;;;;;;;;;;;;;;;;;;;;
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

	forint:
		cmp edx, 50
		jg end_forint

		; if condition
		; cmp eax, [ecx + edx]
		; jne end_if
		; 	sub ecx, 1
		; end_if:

		; i++
		add edx, 1

		jmp forint
	end_forint:

	jmp while
end_while:

; for loop to print
; forprint:
; 	cmp eax, 51
; 	je end_forprint

; 	; print an \n-like character
; 	mov eax, space
; 	call print_string

; 	mov eax, [ecx + edx]
; 	call print_int

; 	; i++
; 	add edx, 1

; 	jmp forprint
; end_forprint:

	; print an \n-like character
	mov eax, newline
	call print_string

    ; end of programm
    mov ebx, 0
    mov eax, 1
    int 0x80