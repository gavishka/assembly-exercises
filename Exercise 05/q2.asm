;This program receives a decimal fraction number and converts to binary and print it in a format

;pseudo code---
	;ask user to enter decimal floating point value
	;get value and print in binary
	;to print it in format,get the sign value
	;print character for the relevant sign value
	;shift the binary value 8 times and get the shifted value
	;substract 127 from the shifted value to get the exponent value
	;print the rest of the values with "1." as the prefix
	;print E and the exponent
	

INCLUDE Irvine32.inc

printRealValue PROTO, valuee: REAL4
.data
	NegZero LABEL REAL4
	X SDWORD 80000000h

	PosZero LABEL REAL4
	Y SDWORD 00000000h

	NegInf LABEL REAL4
	W SDWORD 0FF800000h

	PosInf LABEL REAL4
	F SDWORD 7F800000h

	QNaN LABEL REAL4
	K SDWORD 7FC00000h

	SNaN LABEL REAL4
	V SDWORD 7FA00000h

	temp REAL4 ?
	
	temp2 SDWORD 0
	temp3 SDWORD 0
	temp1 SDWORD 0
	
	onetwoseven SDWORD 27
	prompt1 BYTE "Enter floating point decimal number: ",0
	
	msg1 BYTE "Negative zero: ",0
	msg2 BYTE "Positive zero: ",0
	msg3 BYTE "Negative infinity: ",0
	msg4 BYTE "Positive infinity: ",0
	msg5 BYTE "QNaN: ",0
	msg6 BYTE "SNaN: ",0

	str1 BYTE "1.",0
.code
main PROC
	finit
	top:
	mov edx,OFFSET prompt1					;ask user to enter decimal floating point value
	call WriteString
	call ReadFloat							;read the number and store it in stack
	call crlf
	FST temp								;put it to variable temp

	FLDZ									;compare with zero
	FCOMP
	fnstsw ax
	sahf
	je done									;if equals to zero jump to done

	INVOKE printRealValue, temp				;call procedure
	
	call showFPUStack
	call Crlf
	call Crlf
	jmp top

	done:
	
	FLD NegZero								;print in binary format for negative zero
	FSTP temp
	mov edx,OFFSET msg1
	call WriteString
	INVOKE printRealValue, temp
	call Crlf

	FLD PosZero								;print in binary format for positive zero
	FSTP temp
	mov edx,OFFSET msg2
	call WriteString
	INVOKE printRealValue, temp
	call Crlf

	FLD NegInf								;print in binary format for negative infinity
	FSTP temp
	mov edx,OFFSET msg3
	call WriteString
	INVOKE printRealValue, temp
	call Crlf

	FLD PosInf								;print in binary format for positive infinity
	FSTP temp
	mov edx,OFFSET msg4
	call WriteString
	INVOKE printRealValue, temp
	call Crlf

	FLD QNaN								;print in binary format for quiet not a number
	FSTP temp
	mov edx,OFFSET msg5
	call WriteString
	INVOKE printRealValue, temp
	call Crlf

	FLD SNaN								;print in binary format for signaling not a number
	FSTP temp
	mov edx,OFFSET msg6
	call WriteString
	INVOKE printRealValue, temp
	call Crlf
exit
main ENDP

printRealValue PROC, valuee: REAL4
	;FLD st(1)
	mov eax,0
	mov ebx,0
	
	FLD valuee								;get the parameter
	FST temp1								;store it in temp1
	mov eax,temp1
	call WriteBinB							;first print in binary
	call crlf
	call crlf

	shl temp1,1								;shift temp1 once
	jc setsign								;if carry flag is set jump to setsign

	mov al,'+'								;print +
	call WriteChar

	mov edx,OFFSET str1						;print "1."
	call WriteString

	shl temp1,8								;shift temp1 8 times
	mov eax,temp1
	;shld ebx,eax,8							;getting exponent 
	;mov temp2,ebx
	;mov ebx,onetwoseven
	;sub temp2,ebx							
	;mov eax,temp2

	call WriteBinB							;print in binary

	mov al,'E'								;print E
	call WriteChar

	mov eax,temp2							;print exponent
	call WriteInt
	jmp done

	setsign:
		mov al,'-'							;if carry flag not set print -
		call WriteChar

		mov edx,OFFSET str1					;print "1."
		call WriteString

		shl temp1,8							;shift temp1 8 times
		mov eax,temp1
		call WriteBinB						;print in binary

		mov al,'E'							;print E
		call WriteChar

		mov eax,temp2						;print exponent
		call WriteInt

	done:
	call crlf
	call crlf
	FFREE ST(0)								;clear the stack
	FFREE ST(1)
	ret
printRealValue ENDP

END main
