TITLE summation of integers of array(q4.asm)
;description- This program displays items as signed integers, hex values and displays the total of the numbers in array

;JAVA PROGRAM
; import java.lang.*;
; public class arrayNum {
;    static int sum=0;
;    static int myarray[]={566,276,100,400,500,600};
;    static int num1=myarray[0];
;    public static void main(String[] args) {
;        System.out.print(num1);
;        for(int i=1;i<myarray.length;i++){
;            System.out.print(","+myarray[i]);
;            sum=sum+myarray[i];
;        }
        
;        System.out.print("\n");
;        String num1s=Integer.toHexString(num1);
;        System.out.print(num1s);
;        for(int i=1;i<myarray.length;i++){
;            String tempvar=Integer.toHexString(myarray[i]);
;            System.out.print(","+tempvar);
;        }
        
;        sum=sum+myarray[0];
;        System.out.print("\n");
;        System.out.print("Summation of the values in the array is: "+sum);
;    }    
;}

INCLUDE Irvine32.inc
.data
	msg1 BYTE "Summation of the values in the array= ",0
	commaString BYTE ", ",0
	
	myarray BYTE 1,2,3,4,5,6
	result BYTE ?				;when checking with WORD values,need to change result also to WORD
	number BYTE ?				;when checking with WORD values,need to change number also to WORD

	
.code
ques4main PROC
	
	mov esi,OFFSET myarray		;address of intarray
	mov al,[esi]				;move an integer from array
	mov number,al				;move int from al to number variable
	mov eax,DWORD PTR number	;moving the value in result to a larger operand using PTR
	call WriteInt				;print answer
	

	mov ecx,LENGTHOF myarray	;getting the length of array and setting the loop counter
	dec ecx						;decrementing ecx
	
L1:
	add esi,TYPE myarray		;incrementing the register by the value that matches the array type

	mov edx,OFFSET commaString	;display comma
	call WriteString

	mov al,[esi]				;move an integer from array
	mov number,al				;move int from al to number variable
	mov eax,DWORD PTR number	;moving the value in result to a larger operand using PTR
	call WriteInt				;print answer

	;add esi,TYPE myarray		;incrementing the register by the value that matches the array type
	loop L1						;repeat until ecx=0

	call Crlf					;print new line
	call Crlf					;print new line

	mov esi,OFFSET myarray		;address of intarray
	mov al,[esi]				;move an integer from array
	mov ecx,LENGTHOF myarray	;getting the length of array and setting the loop counter
	;dec ecx
	

L2:
	add esi,TYPE myarray		;incrementing the register by the value that matches the array type
	add al,[esi]				;add an integer from array
	
	loop L2					    ;repeat until ecx=0

	mov result,al				;moving the value of al to result variable
	
	mov edx,OFFSET msg1			;displaying message
	call WriteString
	mov eax,DWORD PTR result	;moving the value in result to a larger operand using PTR
	call WriteInt				;print answer
	call Crlf					;print new line
	call Crlf					;print new line

exit
ques4main ENDP
END ques4main
