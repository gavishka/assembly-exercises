;This program calculates a formula

;pseudo code---
	;get the values from A-E
	;added b to a
	;divided the result by c
	;store the result in variable

	;get value of d
	;substract a from d
	;add e to the end value
	;store it in a variable 2

	;multiply the variable 1 and 2
	;print the result
	

INCLUDE Irvine32.inc
.data
	A DWORD ?
	B DWORD ?
	C1 DWORD ?
	D DWORD ?
	E DWORD ?

	firstVal DWORD ?
	secondVal DWORD ?
	resultInEdx DWORD ?
	resultInEax DWORD ?

	prompt1 BYTE "Enter number for A: ",0
	prompt2 BYTE "Enter number for B: ",0
	prompt3 BYTE "Enter number for C: ",0
	prompt4 BYTE "Enter number for D: ",0
	prompt5 BYTE "Enter number for E: ",0
	msg BYTE "Result for ((A+B)/C) * ((D-A)+E)= ",0
.code
main PROC
	mov ecx,5								;set counter to 5
	top:
	mov edx,OFFSET prompt1					;ask for A
	call WriteString
	call ReadInt
	mov A,eax
	call Crlf

	mov edx,OFFSET prompt2					;ask for B
	call WriteString
	call ReadInt
	mov B,eax
	call Crlf

	mov edx,OFFSET prompt3					;ask for C
	call WriteString
	call ReadInt
	mov C1,eax
	call Crlf

	mov edx,OFFSET prompt4					;ask for D
	call WriteString
	call ReadInt
	mov D,eax
	call Crlf

	mov edx,OFFSET prompt5					;ask for E
	call WriteString
	call ReadInt
	mov E,eax
	call Crlf

	mov edx,0

	mov eax,A								;add b to a
	add eax,B
	mov ebx,C1
	idiv ebx								;divide by c

	mov firstVal,eax						;put the result in firstval

	mov eax,D								;substarct a from d
	sub eax,A
	add eax,E								;add e to the end value
	mov secondVal,eax						;put the result in secondval

	mov eax,firstVal					
	mov ebx,secondVal
	mul ebx									;multiply first val and second val

	mov resultInEdx,edx						;store the edx value

	mov edx,OFFSET msg
	call WriteString
	
	mov ebx,eax								;move eax value from multipliaction to ebx
	mov eax,resultInEdx						;print edx
	call WriteInt

	mov al,":"								;print colon
	call WriteChar
	mov eax, ebx							;print eax
	call WriteInt

	
	call Crlf
	call Crlf
	dec ecx
	cmp ecx,0								;check ecx has reached 0
	jne top									;if not jump to top

exit
main ENDP
END main
