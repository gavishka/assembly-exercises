;This program receives a value for edge and calculates the area and volume of Icosahedron

;pseudo code---
	;ask user to enter edge value
	;get value and perform operation from left
	;perform e^2
	;multiply by 5
	;load 3 and get sqrt
	;mutiply sqrt(3)by the previous value

	;get value and perform operation from left
	;perform e^3
	;load 5 and get sqrt
	;add 3
	;mutiply the result by 5 adn divide by 12
	;multiply the previous value of e^3

INCLUDE Irvine32.inc
.data
	edge REAL4 ?
	five DWORD 5
	three DWORD 3
	twelve DWORD 12
	area REAL4 ?
	volume REAL4 ?
	prompt1 BYTE "Enter value for edge: ",0
	msg BYTE "The area is: ",0
	msg2 BYTE "The volume is: ",0
.code
main PROC
	finit
	top:
	mov edx,OFFSET prompt1					;ask user to enter edge value
	call WriteString
	call ReadFloat

	FLDZ									;load zero
	FCOMP									;compare with zero
	fnstsw ax
	sahf
	je done									;if value equals to zero jump to done

	FST edge								;store it in edge variable
	call Crlf
	FLD edge								;load edge value again
	FMUL									;multiply st(0),st(1) and store result in st(0)
	FIMUL five								;multiply by 5
	FILD three								;st(0)=3, st(1)=5*edge*edge
	FSQRT									;st(0)=sqrt(3), st(1)=5*edge*edge
	FMUL									;st(0)*st(1)

	mov edx,OFFSET msg						;print the area
	call WriteString
	call WriteFloat
	FSTP area								;store it in area variable
	call Crlf
	call Crlf

	FLD edge								;st(0)=edge
	FMUL edge								;st(0)=edge*edge
	FMUL edge								;st(0)=edge*edge*edge

	FILD five								;st(0)=5, st(1)=edge*edge*edge
	FSQRT									;st(0)=sqrt(5), st(1)=edge*edge*edge
	FIADD three								;st(0)=sqrt(5)+3, st(1)=edge*edge*edge
	FIMUL five								;st(0)=(sqrt(5)+3)*5, st(1)=edge*edge*edge
	FIDIV twelve							;st(0)=(sqrt(5)+3)*5/12, st(1)=edge*edge*edge
	FMUL									;st(0)*st(1)

	mov edx,OFFSET msg2						;print volume
	call WriteString
	call WriteFloat
	FSTP volume								;store it in volume variable
	call Crlf
	call Crlf
	call showFPUStack
	jmp top

	done:
	FFREE ST(0)
	FFREE ST(1)
	call Crlf
	call Crlf
	call showFPUStack
	call Crlf
	call Crlf

exit
main ENDP
END main
