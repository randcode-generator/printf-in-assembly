global main
 
extern printf
 
section .data
	fmtStr: db 'printf: a1 - %i, a2 - %s',0xA,0
	param1: db 'Parameter String'
 
section .text
	main:

	; Load the second argument into the stack
	sub     esp, 4			; Allocate space on the stack for one 4 byte parameter
	lea     eax, [param1]   ; Load string into eax
	mov     [esp], eax		; Copy eax into the address of esp
	
	; Load the first argument into the stack
	sub     esp, 4			; Allocate space on the stack for one 4 byte parameter
	mov     eax, 8			; Copy 8 into eax
	add     eax, 1098		; eax = eax + 1098
	mov     [esp], eax		; Copy eax into the address of esp

	; Load the format string into the stack
	sub     esp, 4          ; Allocate space on the stack for one 4 byte parameter
	lea     eax, [fmtStr]	; Load string into eax
	mov     [esp], eax      ; Copy eax into the address of esp

	; Call printf
	call    printf          ; Call printf(3):
							; int printf(const char *format, ...);

	; Return the stack (pointer) to it's original position (0 elements)
	add     esp, 12         ; Pop the stack (There were 3 "sub esp,4")

	ret
