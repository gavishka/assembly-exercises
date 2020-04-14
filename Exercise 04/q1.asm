;This program displays a menu of options where user can manipulate an array of values
;Assignment 6
;problem number 1
;name- Sachini Fernando
;date - 2017/08/14

;pseudo code---
	;display the menu and get the value entered by user
	;according to the value navigate the correct procedure
	;generating random numbers procedure prompts upper bound and lower bound
	;generate random number within the range
	;populate the array with random numbers

	;calling multiply array prompts the user to enter multiplier
	;get each value from the array and multiply
	;call the display array proceudre to display the array
	;shows a message that the procedure ended successfully

	;calling divide array prompts the user to enter divisor
	;get each value from the array and divide
	;put the quotient value in array elements 
	;call the display array proceudre to display the array
	;shows a message that the procedure ended successfully

	;calling mod array prompts the user to enter divisor
	;get each value from the array and divide
	;put the remainder to the array elements
	;call the display array proceudre to display the array
	;shows a message that the procedure ended successfully

	;calling display array 
	;get each value from the array and diplay with brackets and commas
	
	;if user enters 0 exit from program


INCLUDE Irvine32.inc

genRandomNum PROTO, parray:PTR DWORD, psizee: DWORD
mutiplyArray PROTO, parray:PTR DWORD, psizee: DWORD, Pmultiplier:DWORD
divideArray PROTO, parray:PTR DWORD, psizee: DWORD, Pdivisor:DWORD
modArray PROTO, parray:PTR DWORD, psizee: DWORD, Pdivisor:DWORD
displayArray PROTO, parray:PTR DWORD, psizee: DWORD

.data
	array SDWORD 10 DUP(0)
	invalidmsg BYTE "ENTER A VALID OPTION",0
	successmsg BYTE "Procedure completed successfully",0
	upperboundmsg BYTE "Enter a number for upper bound: ",0
	lowerboundmsg BYTE "Enter a number for lower bound: ",0
	muliplierprompt BYTE "Enter a multiplier: ",0
	divisorprompt BYTE "Enter a divisor: ",0

	sizee DWORD ?
	arrayloc DWORD ?
	multiplier DWORD ?
	divisor DWORD ?
	menu1 BYTE "1 - Populate the array with random numbers(user supplied range)",0
	menu2 BYTE "2 - Multiply the array with a user provided multiplier",0
	menu3 BYTE "3 - Divide the array with a user provided divisor ",0
	menu4 BYTE "4 - Mod the array with a user provided divisor ",0
	menu5 BYTE "5 - Print the array",0
	menu6 BYTE "0 - Exit",0
	menu7 BYTE "Enter an option: ",0
.code

main PROC
	mov sizee,LENGTHOF array

	top:
		call DisplayMenu									;calling displaymenu procedure
		call ReadDec										;get value entered by user
		cmp eax,0											;compare the value with zer0
		je done												;if not equals jump to done
		
		cmp eax,1											;if it not equal to 1 jmp to next
		jne next
		INVOKE genRandomNum, ADDR array, sizee				;invoking genRandomNum
		call Crlf
		jmp top												;after procedure completes show the menu again by jumping top

		next:												
		cmp eax,2											;if it not equal to 2 jmp to next2
		jne next2 

		mov edx,OFFSET muliplierprompt						;ask the user for multiplier
		call WriteString
		call ReadInt										;get multiplier
		mov multiplier,eax						
		

		INVOKE mutiplyArray, ADDR array, sizee, multiplier	;invoking mutiplyArray
		call Crlf	
		jmp top

		next2:
		cmp eax,3											;if it not equal to 3 jmp to next3
		jne next3
		
		mov edx,OFFSET divisorprompt						;ask the user for divisor
		call WriteString
		call ReadInt										;get divisor
		mov divisor,eax
		

		INVOKE divideArray, ADDR array, sizee, divisor		;invoking divideArray
		call Crlf
		jmp top

		next3:
		cmp eax,4											;if it not equal to 4 jmp to next4
		jne next4

		
		mov edx,OFFSET divisorprompt						;ask the user for divisor
		call WriteString
		call ReadInt										;get divisor
		mov divisor,eax
		INVOKE modArray, ADDR array, sizee, divisor			;invoking modArray
		call Crlf
		jmp top

		next4:
		cmp eax,5											;if it not equal to 5 jmp to next5
		jne next5
		INVOKE displayArray, ADDR array, sizee				;invoking displayArray
		call Crlf
		jmp top

		next5:
		mov edx,OFFSET invalidmsg							;if user input number is not valid print a msg
		call WriteString
		call Crlf
		jmp top

		done:
exit
main ENDP

genRandomNum PROC, parray:PTR DWORD, psizee: DWORD

	call Randomize
	
	sub esp,8
	pushfd
	
	mov edx,OFFSET upperboundmsg							;get the upperbound number
	call WriteString
	call ReadInt
	mov [EBP-4],eax											;store it in a local variable

	mov edx,OFFSET lowerboundmsg							;get the lowerbound number
	call WriteString
	call ReadInt
	mov [EBP-8],eax											;store it in a local variable

	mov ecx, psizee
	mov edi, parray

	L1: 
		mov		eax,[EBP-4]										;get the upperbound
		sub		eax,[EBP-8]										;substract lowerbound
		inc		eax												;add 1 to the result
		call	RandomRange										;generate random
		add		eax,[EBP-8]										;add the lower bound to the random number
	
		mov		[edi],eax										;populate array
	
		add		edi,4											;increment index
	
	loop L1
	call Crlf
	call Crlf
	mov edx,OFFSET successmsg								;print succesful message
	call WriteString

	call Crlf
	call Crlf
	INVOKE displayArray, ADDR array, sizee					;print the array values
	
	
	popfd
	
	ret
genRandomNum ENDP

mutiplyArray PROC, parray:PTR DWORD, psizee: DWORD, Pmultiplier:DWORD
	
	pushfd
	pushad


	mov ecx, psizee											
	mov edi, parray
	mov ebx, Pmultiplier

	L1: 
		mov	eax,[edi]											;get value of array
		imul ebx												;multiply by the multiplier
		 mov [edi],eax											;move the result to the array
	
		add edi,4												;increment index
	
	loop L1
	call Crlf
	call Crlf
	mov edx,OFFSET successmsg								;print succesful message
	call WriteString

	call Crlf
	call Crlf
	INVOKE displayArray, ADDR array, sizee					;print the array values
	
	popad
	popfd
	
	ret
mutiplyArray ENDP

divideArray PROC, parray:PTR DWORD, psizee: DWORD, Pdivisor:DWORD
	
	pushfd
	pushad


	mov ecx, psizee
	mov edi, parray
	mov ebx, Pdivisor

	L1: 
		mov dx,0											
		mov	ax,WORD PTR [edi]								;get the values of array
	
		div bx												;divide it by divisor
		mov [edi], ax										;move the quotient result to the array
	
		add edi,4											;increment index
	
	loop L1
	call Crlf
	call Crlf
	mov edx,OFFSET successmsg							;print succesful message
	call WriteString

	call Crlf
	call Crlf
	INVOKE displayArray, ADDR array, sizee				;print the array values

	popad
	popfd
	
	ret
divideArray ENDP

modArray PROC, parray:PTR DWORD, psizee: DWORD, Pdivisor:DWORD
	
	pushfd
	pushad


	mov ecx, psizee
	mov edi, parray
	mov ebx, Pdivisor

	L1: 
		mov dx,0
		mov	ax,WORD PTR [edi]								;get the values of array
	
		div bx												;divide it by divisor
		mov [edi], dx										;move the remainder result to the array
	
		add edi,4
	
	loop L1
	call Crlf
	call Crlf
	mov edx,OFFSET successmsg							;print succesful message
	call WriteString

	call Crlf
	call Crlf
	INVOKE displayArray, ADDR array, sizee				;print the array values
	
	popad
	popfd
	
	ret
modArray ENDP

displayArray PROC, parray:PTR DWORD, psizee: DWORD
	
	LOCAL firstbracket: BYTE							;local variables for characters
	LOCAL lastbracket: BYTE 
	LOCAL comma :BYTE 
	pushfd
	pushad


	mov ecx, psizee
	dec ecx
	mov edi, parray

	mov firstbracket,"{"								;print first bracket
	mov al,firstbracket
	call WriteChar

	L1: 
		mov	eax, [edi]										;print array element
		call	writeInt
		mov comma,","										;print comma
		mov al,comma
		call WriteChar

		add edi,4
	
	loop L1
	mov	eax, [edi]										;print last value
	call	writeInt

	mov lastbracket,"}"									;print last bracket
	mov al,lastbracket
	call WriteChar
	call Crlf
	call Crlf

	popad
	popfd
	
	ret
displayArray ENDP


displayMenu PROC
	mov edx,OFFSET menu1							;displaying each lines of menu
	call WriteString
	call Crlf
	mov edx,OFFSET menu2
	call WriteString
	call Crlf
	mov edx,OFFSET menu3
	call WriteString
	call Crlf
	mov edx,OFFSET menu4
	call WriteString
	call Crlf
	mov edx,OFFSET menu5
	call WriteString
	call Crlf
	mov edx,OFFSET menu6
	call WriteString
	call Crlf
	call Crlf
	mov edx,OFFSET menu7
	call WriteString
	call Crlf
	call Crlf

	ret
displayMenu ENDP
	
END main