;This program displays unsigned 8bit binary value in decimal format

;pseudo code---
	;get the number from user
	;put the value in variable
	;call procedure
	;divide num by 10
	;print the quotient as a character
	;print the remainder as a character

INCLUDE Irvine32.inc


.data
	num WORD ?
	prompt1 BYTE "Enter number between 0-99 : ",0
.code
main PROC
	mov edx,OFFSET prompt1		; display a prompt
	call WriteString
	call ReadDec
	mov num,ax					;putting value to num
	call Crlf
	call showDecimal8			;call procedure
	
	call Crlf
	call Crlf
exit
main ENDP

showDecimal8 PROC
	mov ax,num					;divide by 10
	mov bl,10
	div bl

	call WriteChar				;print al(quotient)

	mov al,ah
	call WriteChar				;print ah(remainder)
	ret


showDecimal8 ENDP
END main
