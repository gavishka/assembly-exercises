;Title BetterRandomRange  
;This program generate a random number from the lower number to the upper number

;pseudo code--
	;get the values for upper bound and lower bound from user
	;start a loop to repeat five times
	;get the sum of upper and lower number
	;get a random number from 0-sum
	;substract lower number from the random number
	;print value
	;end loop

INCLUDE Irvine32.inc
TAB=9
.data
	prompt1 BYTE "Give a number for upper bound: ",0
	prompt2 BYTE "Give a number for lower bound: ",0

	upper Dword ?
	lower DWORD ?
.code
main PROC
	call Randomize
	mov ecx,5

	mov edx,OFFSET prompt1		;ask for upper number
	call WriteString

	call ReadInt
	mov upper,eax

	call Crlf

	mov edx,OFFSET prompt2		;ask for lower number
	call WriteString

	call ReadInt
	mov lower,eax				
	
	call Crlf

	mov ecx,5					;repeat for 5 times

	L1:

	mov eax,upper				;add upper and lower
	add eax,lower
	call RandomRange			;generate random 0 to sum
	sub eax,lower				;substract lower num from random number
	call WriteInt

	mov al,TAB					;print tab
	call WriteChar

	loop L1
	call Crlf

	exit
main ENDP
END main
