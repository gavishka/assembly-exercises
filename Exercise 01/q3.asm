TITLE fibonnaci number series(q3.asm)
;description- This program displays the first thirty values in fibonacci number series

;JAVA PROGRAM
; public class fibonacci {
;    static int num1=1;
;    static int num2=1;
;    static int num3;
;    public static void main(String[] args) {
;        System.out.print(num1+","+num2);
        
;        for(int i=2;i<30;i++){
;            num3=num1+num2;
;           System.out.print(","+num3);
;            num1=num2;
;            num2=num3;
;        }
;    }
;}

INCLUDE Irvine32.inc
.data
	commaString BYTE ", ",0
	
	num1 DWORD 2
	num2 DWORD 3
	num3 DWORD ?
	
	displayString BYTE "1, 1, 2, 3",0

.code
main PROC
	
	mov edx,OFFSET displayString	;display the first 4 numbers in the series
	call WriteString
	
	mov ecx,26					;setting the loop counter to 26 as the first 4 has already been printed.
L1:
	mov eax,num1					;move the value in num1 to eax register
	add eax,num2					;adding the value of num2 to num1

	mov edx,OFFSET commaString		;display comma
	call WriteString

	call WriteDec					;display the sum of num1 and num2 which is stored in eax

	mov ebx,num2					;move num2 to ebx register
	mov num1,ebx					;move value which was in num2 to num1
	mov num2,eax					;move the sum we got before to num2 variable
	loop L1
	call Crlf						;print new line

exit
main ENDP
END main
