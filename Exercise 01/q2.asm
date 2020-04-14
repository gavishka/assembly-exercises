TITLE Asterisk pyramid(secondques.asm)
;description- This program displays a pyramid of asterisks with rows specified by user
;Name- Sachini Fernando
;Assignmnet 3
;problem number 2
;date coded- 2017/07/21

;JAVA PROGRAM
; public class AssemblyTest {
;        static int x=-1;
;        static int n=5;
;        static int j;
;        static int y;
;    public static void main(String[] args) {
        
;        for(int i=n;i>0;i--){
;            y=i;
;            for(int t=y;t>0;t--){
;            System.out.print(" ");
;            }
;            x++;
;            j=2*x+1;
            
;            for(int k=0;k<j;k++){
;                System.out.print("*");
;           }
;            System.out.print("\n");
;        }
;    }  
;}


INCLUDE Irvine32.inc
.data
	msg1 BYTE "Enter the number of rows for the pyramid: ",0
	
	count DWORD ?
	rows DWORD -1

.code
main PROC
	
	mov edx,OFFSET msg1			;print message to enter number of rows
	call WriteString
	call ReadInt				;get the value for number of rows
	call Crlf					;print new line
	mov ecx,eax					;setting the loop counter (number of rows)

L1:
	mov count,ecx				;move the number of rows to count variable
	mov ecx,count				;restore the value of count to ecx to print spaces as every row contains spaces starting from the value given by user,each time decrementing

L2:
	mov al,' '					;move the space character to al register
	call WriteChar				;print space
	loop L2

	inc rows					;rows variable shows which row we are in, here increments rows by one
	mov ebx,rows				;calculating 2*rows+1
	add ebx,rows
	add ebx,1
	xchg ecx,ebx				;answer for 2*rows+1 is exchanged to ecx and setting the loop counter for loop 3

L3:
	mov al,'*'					;printing * character
	call WriteChar
	loop L3
	call Crlf					;print new line, go to the next line

	mov ecx,count				;restoring the value of count to ecx
	loop L1

	call Crlf					;print new line

exit
main ENDP
END main