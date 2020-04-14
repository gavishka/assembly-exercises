;This program displays the sum of array elements within a given range
;Assignment 5
;problem number 1/(a)
;date - 2017/08/07

;pseudo code---
	;getting the starting index from user
	;store it in jpointer
	;getting the ending index from user
	;store it in kpointer
	;move the index to the jpointer
	;call sumarray procedure
	;get the sum of the rest of the elements after that index
	;move the index to the kpointer
	;call sumarray procedure
	;get the sum of the rest of the elements after that index 
	;substract the second summation value from first summation value
	;get the sum of the array elements within the range

INCLUDE Irvine32.inc
.data
	array SDWORD 10,20,-40,30,60,50
	prompt1 BYTE "ENTER A NUMBER FOR J: ",0
	prompt2 BYTE "ENTER A NUMBER FOR K: ",0
	msg BYTE "Sum of the elements of the defined range: ",0
	jpointer DWORD ?
	kpointer DWORD ?
	firstsum DWORD ?
	secondsum DWORD ?
.code
main PROC
	mov ecx,LENGTHOF array				;get the array length

	mov edx,OFFSET prompt1				;prompt for starting index
	call WriteString
	call ReadDec
	mov jpointer,eax

	mov edx,OFFSET prompt2				;prompt for ending index
	call WriteString
	call ReadDec
	mov kpointer,eax
	call Crlf

	mov esi,jpointer					;get the sum after the starting index
	call sumArray
	mov firstsum,eax

	mov esi,kpointer					;get the sum after the ending index
	call sumArray
	mov secondsum,eax

	mov eax,firstsum					;substract those summations above
	sub eax,secondsum
	mov esi,kpointer					;add the value of the ending index because when substracting, we loose that value only
	add eax,array[esi*4]

	mov edx,OFFSET msg					;display last message
	call WriteString
	call WriteDec
	call Crlf
	call Crlf
	exit
main ENDP

sumArray PROC
	
	push esi							;pointers for indexes
	push ecx
	sub ecx,esi							;substract the indexing value from ecx, so we can get the correct number of values we have to addd
	mov eax,4							;multiplying the esi value with 4 to get indexes relevnat to Dword array
	mul esi								
	mov esi,eax							;store the value back to esi
	mov eax,0							;make sum=0
	
	L1:
		add eax,array[esi]				;add the values to sum
		add esi,4						;increment index
		loop L1

	pop ecx
	pop esi
	ret
sumArray ENDP

END main