TITLE calculations(q1.asm)
;description- This program displays the answers for each equation after getting values for P,Q,R,S,T from user

;JAVA PROGRAM
; public class ass3ques1 {
;    static String msg1="Enter a number for P:";
;    static String msg2="Enter a number for Q:";
;    static String msg3="Enter a number for R:";
;    static String msg4="Enter a number for S:";
;    static String msg5="Enter a number for T:";
    
;    static int P,Q,R,S,T;
    
;    public static void main(String[] args) {
;        Scanner in=new Scanner(System.in);
;        System.out.print(msg1);
;        P=in.nextInt();
;        System.out.print(msg2);
;        Q=in.nextInt();
;        System.out.print(msg3);
;        R=in.nextInt();
;        System.out.print(msg4);
;       S=in.nextInt();
;        System.out.print(msg5);
;        T=in.nextInt();
        
 ;       System.out.print("(2P+R)-(Q-S)-3T = ");
 ;      System.out.println((2*P+R)-(Q-S)-(3*T));
        
 ;       System.out.print("(2P+4R)-(S+Q)+2T = ");
 ;       System.out.println((2*P+4*R)-(S+Q)+(2*T));
        
 ;       System.out.print("8*R-(S+Q)-(3T+P) = ");
 ;       System.out.print((8*R)-(S+Q)-(3*T+P));
        
 ;   }
    
;}

INCLUDE Irvine32.inc
.data
	msg1 BYTE "Enter anumber for P: ",0
	msg2 BYTE "Enter anumber for Q: ",0
	msg3 BYTE "Enter anumber for R: ",0
	msg4 BYTE "Enter anumber for S: ",0
	msg5 BYTE "Enter anumber for T: ",0

	msg6 BYTE "(2P+R)-(Q-S)-3T= ",0
	msg7 BYTE "(2P+4R)-(S+Q)+2T= ",0
	msg8 BYTE "8R-(S+Q)-(3T+P)= ",0

	P DWORD ?
	Q DWORD ?
	R DWORD ?
	S DWORD ?
	T DWORD ?

.code
main PROC
	mov edx,OFFSET msg1			;print msg to enter P
	call WriteString
	call ReadDec				;get unsigned integer value for P
	mov P,eax					;store the value in P variable

	mov edx,OFFSET msg2			;print msg to enter Q
	call WriteString
	call ReadInt				;get signed integer value for Q
	mov Q,eax					;store the value in Q variable

	mov edx,OFFSET msg3			;print msg to enter R
	call WriteString
	call ReadDec				;get unsigned integer value for R
	mov R,eax					;store the value in R variable

	mov edx,OFFSET msg4			;print msg to enter S
	call WriteString
	call ReadInt				;get signed integer value for S
	mov S,eax					;store the value in S variable

	mov edx,OFFSET msg5			;print msg to enter T
	call WriteString
	call ReadDec				;get unsigned integer value for T
	mov T,eax					;store the value in T variable


	;first equation calculation

	mov eax,P					;get the result for 2P
	add eax,P
	add eax,R					;add R to 2P

	mov ebx,Q					;Get the result for Q-S
	sub ebx,S
	sub eax,ebx					;Substract (Q-S) from (2P+R)

	mov ebx,T					;get the result for 3T
	add ebx,T
	add ebx,T
	sub eax,ebx					;substract 3T from (2P+R)-(Q-S)

	call Crlf

	mov edx,OFFSET msg6			;print msg6 which contains the equation
	call WriteString
	call WriteInt				;print answer
	call Crlf					;print new line

	;second equation calculation

	mov eax,P					;get result for 2P
	add eax,P
	mov ebx,R					;get result for 4R
	add ebx,R
	add ebx,R
	add ebx,R
	add eax,ebx					;add 4R to 2P
	
	mov ebx,S					;get result for (Q+S)
	add ebx,Q
	sub eax,ebx					;substract (Q+S) from (2P+4R)

	mov ebx,T					;get result for 2T
	add ebx,T
	add eax,ebx					;add 2T to (2P + 4R) -(S + Q)

	call Crlf					;print newline

	mov edx,OFFSET msg7			;print second equation
	call WriteString
	call WriteInt				;print answer
	call Crlf					;print new line

	;third equation calculation

	mov eax,R					;get result for 8R
	add eax,R
	add eax,R
	add eax,R
	add eax,R
	add eax,R
	add eax,R
	add eax,R

	mov ebx,S					;get result for S+Q
	add ebx,Q
	sub eax,ebx					;substract (Q+S) from 8R

	mov ebx,T					;get result for 3T
	add ebx,T
	add ebx,T
	add ebx,P					;add P to 3T
	sub eax,ebx					;substract (3T+P) from 8R-(S+Q)

	call Crlf

	mov edx,OFFSET msg8			;print equation 3
	call WriteString
	call WriteInt				;print answer
	call Crlf					;print new line
	call Crlf					;print new line

exit
main ENDP
END main
