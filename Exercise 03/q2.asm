;This program encrypts the string entered by user and decrypts
;Assignment 5
;problem number 2/(b)
;date - 2017/08/07

;pseudo code---
	;getting the string from user and storing it
	;translate the string
	;start a loop 
	;get the values of the user provided string array
	;get the values of the key array
	;perform xor between the matching values in both arrays
	;check whether key array has reached the end, if so start key array from beginning
	;increase indexes in both arrays 
	;end loop
	;use same loop to decrypt the encrypted message

INCLUDE Irvine32.inc
BUFMAX=128

.data
	key BYTE 'A','B','X','m','v','#','7'
	prompt1 BYTE "Enter plain text: ",0
	msg1 BYTE "Ciper text: ",0
	msg2 BYTE "Decrypted: ",0
	buffer BYTE BUFMAX+1 DUP(0)
	bufsize DWORD ?

.code
main PROC
	call collectString			; Get string from user
	call TranslateBuffer		; encrypt the buffer
	mov edx,OFFSET msg1			; display encrypted message
	call DisplayString
	call TranslateBuffer		; decrypt the buffer
	mov edx,OFFSET msg2			; display decrypted message
	call DisplayString
exit
main ENDP

;-----------------------------------------------------
collectString PROC
;
; Prompts user for a string. Saves the string
; and its length.
; Receives: nothing
; Returns: nothing
;-----------------------------------------------------
	pushad						; save 32-bit registers
	mov edx,OFFSET prompt1		; display a prompt
	call WriteString
	mov ecx,BUFMAX				; maximum character count
	mov edx,OFFSET buffer		; point to the buffer
	call ReadString				; get the string entered by user
	mov bufSize,eax				; save the length
	call Crlf
	popad
	ret

collectString ENDP

;-----------------------------------------------------
DisplayString PROC
;
; Displays the encrypted or decrypted message.
; Receives: EDX points to the string
; Returns: nothing
;-----------------------------------------------------

	pushad
	call WriteString
	mov edx,OFFSET buffer		; display the buffer
	call WriteString
	call Crlf
	call Crlf
	popad
	ret
DisplayString ENDP

;-----------------------------------------------------
TranslateBuffer PROC
;
; Translates the string by exclusive-ORing each
; byte with the encryption key byte.
; Receives: nothing
; Returns: nothing
;-----------------------------------------------------
	pushad
	mov ecx,bufSize				; set the loop counter
	mov esi,0					; index 0 in buffer
	mov edi,0
	L1:
		mov bl,key[edi]			;get value in key array
		xor buffer[esi],bl		; translate a byte
		add esi,TYPE buffer		;increase index in buffer
		cmp edi,6				;check whther key array has reached the end
		je next					;if true jump to next
		add edi,TYPE key		;if not increase index of key array
		jmp skipNext			;jump to skipnext
		next:
			mov edi,0			;make index zero
		skipNext:
	loop L1
	popad
	ret
TranslateBuffer ENDP

END main