;Title- CrazyArt Program
;This program geberates an image by printing a character at random locations within a defined area of the console window

;pseudo code- 
	;Get the data from user
	;start a loop 
	;call randomxypostion
	;call betterRandomRange
	;call combinecolor
	;print symbol
	;end loop

INCLUDE Irvine32.inc
.data
	prompt1 BYTE "enter the symbol for the drawing: ",0
	prompt2 BYTE "enter the color for the border(0-15): ",0
	prompt3 BYTE "enter the color for background of the text(0-15): ",0
	prompt4 BYTE "enter the color for foreground of the text(0-15): ",0
	SYMBOL BYTE ?
	colors1 BYTE "(0=BLACK, 1=BLUE, 2=GREEN, 3=CYAN, 4=RED, 5=MAGENTA, 6=BROWN, 7=LIGHTGRAY, 8=GRAY, 9=LIGHTBLUE, ",0
	COLOR DWORD ?
	colors2 BYTE "10=LIGHT GREEN, 11=LIGHT CYAN, 12=LIGHT RED, 13=LIGHT MAGENTA, 14=YELLOW, 15=BLACK)",0
	BORDERCOLOR DWORD ?
	background DWORD ?
	foreground DWORD ?

	numRows DWORD 20
	numCols DWORD 60

	x BYTE ?
	y BYTE ?

.code
main PROC
	mov edx, OFFSET prompt1			;asks for the symbol
	call WriteString
	call ReadChar					;get the symbol

	mov SYMBOL,al

	call Crlf
	call Crlf

	mov edx,OFFSET colors1			;print color codes
	call WriteString
	mov edx,OFFSET colors2
	call WriteString
	call Crlf
	call Crlf

	mov edx, OFFSET prompt2			;ask for the border color
	call WriteString
	call ReadInt

	mov BORDERCOLOR,eax

	mov edx, OFFSET prompt3			;ask for the background color
	call WriteString
	call ReadInt

	mov background,eax

	mov edx, OFFSET prompt4			;ask for the foreground color
	call WriteString
	call ReadInt

	mov foreground,eax

	call combineColour				

	mov ecx,8000					;print the stars within a loop
	L1:
		call randomXYPosition		;get random x,y postions
		mov dh,x
		mov dl,y
		call Gotoxy					;locate the cursor at the above x,y position

		call combineColour
		
		mov al,SYMBOL				;print character
		call WriteChar


	loop L1
exit
main ENDP

;************************************************************
;combineColour PROC
; Receives: AH = background Colour, AL = foreground Colour
; Returns: AL = 16* background + foreColour
;************************************************************
combineColour PROC

	mov al,BYTE PTR foreground		;take value stored in foreground
	mov ah,BYTE PTR background		;take value stored in background

	mov eax, background				;calculate 16* background + foreColour
	imul eax, 16
	add eax, foreground

	call SetTextColor 
	mov COLOR,eax
	inc background					;change background color by incrementing
	inc foreground					;change foreground color by incrementing
ret
combineColour ENDP

;************************************************************
;randomXYPosition PROC
; Generates a random (x,y) coordinate position for the
; cursor within a box defined with a width in esi and
; a height in edi with an offset border of two on the top
; and 3 on the sides
; Receives: ESI = width of border box
; EDI = height of border box
; Return: DH = row position (y)
; DL = column position (x)
;************************************************************
randomXYPosition PROC
	mov esi,numRows					;get the maximum row number
	mov edi,numCols					;get the maximum column number

	call betterRandomRange

ret
randomXYPosition ENDP

;************************************************************
;betterRandomRange PROC
; Receives: EAX = high number; EBX = low number
; Returns: EAX = random number from low to high
;************************************************************

betterRandomRange PROC uses esi edi
	mov eax,esi						;get the max row number
	call RandomRange				;generate random number from 0-maxrow
	mov x,al

	mov eax,edi						;get the max col number
	call RandomRange				;generate random number from 0-maxcol
	mov y,al
ret
betterRandomRange ENDP


END main
