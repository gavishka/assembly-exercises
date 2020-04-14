;Title linking array items 
;This program print values of the data file considering the indexes given
;Name- Sachini Fernando
;Assignment 4
;problem number 1
;date - 2017/08/01

;pseudo code---
	;get the name of file from user
	;open file
	;read file
	;put values of file into array
	;get last value of array-index
	;find the value relevant to the index
	;start a loop
	;get the next index value from the previous index
	;find that value relevant to the index
	;close loop

INCLUDE Irvine32.inc
.data
	prompt BYTE "Enter file name: ",0
	msg BYTE "Secret message: ",0
	filename BYTE ?
	array BYTE 53 DUP(?)
	filehandle DWORD ?
	num BYTE ?

.code
main PROC
	mov edx,OFFSET prompt			;ask user for filename
	call WriteString

	mov edx,OFFSET filename			;read string given by user and assign to filename
	mov ecx, 100

	call ReadString
			
	mov edx,OFFSET filename			;open file stored in filename
	call OpenInputFile
	mov filehandle,eax				;get the file handler

	mov edx,OFFSET array			;read all the data in file and store them in lettersarray
	mov ecx,53
	call ReadFromFile
	
	call Crlf
	mov edx,OFFSET msg				;print the string"secret msg:"
	call WriteString

	mov edi,52						;get the last byte
	mov al,array[edi]				
	mov num,al
	mov esi,DWORD PTR num
	mov al,array[esi]				;find the value relevant to the index in last byte
	call WriteChar					;print that value character

	mov ecx,25						;loop for the rest of the 25 letters
	L1:
		mov al,array[esi+26]		;add 26 to get to the part of indexes
		mov num,al
		mov esi,DWORD PTR num
		mov al,array[esi]			;find the value relevant to the index in last byte
		call WriteChar				;print that value character

	loop L1

	call Crlf
	call Crlf
exit
main ENDP
END main