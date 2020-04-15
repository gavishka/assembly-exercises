;This program shows how to calculate x=n mod y

;pseudo code---
	;get the number n from user
	;get the number y from user
	;put the values in variables
	;substract 1 from y
	;perform AND operation between n and y
	;get the modulus value as final output


INCLUDE Irvine32.inc


.data
	n DWORD ?
	y DWORD ?
	x DWORD ?
	prompt1 BYTE "Enter number for n: ",0
	prompt2 BYTE "Enter number for y: ",0
	msg BYTE "x= n mod y= ",0
.code
main PROC
	mov edx,OFFSET prompt1		; display a prompt
	call WriteString
	call ReadDec
	mov n,eax					;put value for n
	call Crlf
	
	mov eax,0

	mov edx,OFFSET prompt2		; display a prompt
	call WriteString
	call ReadDec
	mov y,eax					;put value for y
	call Crlf

	sub y,1						;substract 1 from y
	mov eax,n
	AND eax,y					;perform and operation between n and y
	mov x,eax

	mov edx,OFFSET msg			; display a msg
	call WriteString
	mov eax,x					;print x which is mod
	call WriteDec
	call Crlf
	call Crlf
exit
main ENDP


END main
