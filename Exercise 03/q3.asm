;This program shows how to calculate val1 = (val2/val3) * (val1+val2)
;Assignment 5
;problem number 3/(c)
;date - 2017/08/07

;pseudo code---
	;get the val 1 from user
	;get the val 2 from user
	;get the val 3 from user
	;put the values in variables
	;add val1 and val2
	;gather summation as second value
	;divide val2 from val3
	;gather divition as first value
	;multiply first and second value

INCLUDE Irvine32.inc
BUFMAX=128

.data
	val1 DWORD ?
	val2 DWORD ?
	val3 DWORD ?
	secondVal DWORD ?
	firstVal DWORD ?
	resultinEdx DWORD ?
	prompt1 BYTE "Enter number for val 1: ",0
	prompt2 BYTE "Enter number for val 2: ",0
	prompt3 BYTE "Enter number for val 3: ",0
	msg BYTE "Result for val1 = (val2/val3) * (val1+val2)= ",0
.code
main PROC
	mov edx,OFFSET prompt1		; display a prompt
	call WriteString
	call ReadInt
	mov val1,eax
	call Crlf

	mov edx,OFFSET prompt2		; display a prompt
	call WriteString
	call ReadInt
	mov val2,eax
	call Crlf

	mov edx,OFFSET prompt3		; display a prompt
	call WriteString
	call ReadInt
	mov val3,eax
	call Crlf

	mov eax,val1				;add val 1 and val2
	add eax,val2
	mov secondVal,eax

	mov eax,val2				;divide val2 from val3
	cdq
	mov ebx,val3
	idiv ebx
	mov firstVal,eax
		
	mov eax,firstVal			;multiply first and second value
	imul secondVal

	mov edx,OFFSET msg			; display msg
	call WriteString
	

	mov resultinEdx,edx			;move value in edx to variable
	mov ebx,eax					;move value in eax to ebx

	mov eax,resultinEdx			;print value of edx
	call WriteHex

	mov al,":"					;print colon
	call WriteChar

	mov eax,ebx					;print value which was in eax
	call WriteHex
	call Crlf
	call Crlf
exit
main ENDP

END main