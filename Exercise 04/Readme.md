Q1: Create a program with an array of 10 SDWORDS initialized with all zeros. Then present the user with the following menu of options:

1 – Populate the array with random numbers (user supplied range)
2 – Multiply the array with a user provided multiplier
3 – Divide the array with a user provided divisor
4 – Mod the array with a user provided divisor
5 – Print the array
0 - Exit

For option #1, ask the user for the low value and the high value of the random number range. Use this to call a function genRandomNum(sdword low,sdword high) which accepts named parameters and uses the INVOKE method of being called; the result should be returned in EAX. Use this function to populate the array. At least one local variable, created on the stack without the use of the LOCAL directive, must be used by the procedure.

For options #2, #3 and #4, ask the user to provide the multiplier or divisor for the required operation. For each operation, use a procedure which accepts the offset of the DWORD to be multiplied or divided and the multiplier or divisor as unnamed stack parameters. The result of the operation will be stored in the same DWORD. The stack parameters must be removed by the procedure when it returns.

For option #5, the printed values should be signed integers, comma separated, with { } brackets around the list. A procedure must be used to complete this task and parameters must be passed using either named parameters (with INVOKE) or by pushing any parameters onto the stack.

Additional Requirements:

A. Each menu option (except exit) should call a procedure which is passed the array of numbers. Some procedures will call other procedures as described above. Use a separate procedure for each task. Even printing the menu and collecting a valid response can be a procedure called by the main method in a loop. The loop will use the return value to determine what procedure to call next or managed the exit of the program if zero is entered.

B. Only option#5 will print the array values – but every other procedure should provide some appropriate message when complete.

C. All procedures must preserve register values whenever possible.

D. Any procedure returning an answer must do so in either the EAX register or using an in-out stack parameter.

E. No procedure can directly reference an array. Only use indirect operands with the offset and size of the array being passed as a parameter on the stack.

F. Your procedures must demonstrate both the use of parameter passing using unnamed
parameter values (refer to these using only the EBP register) and named parameters created
using a parameter list.

G. Your procedures must demonstrate creating local unnamed stack variables (referred to using
EBP) and local variables created using LOCAL.

H. Your program must demonstrate both INVOKE and CALL operations for executing procedures.

I. All INVOKE operations must have matching PROTO declarations.


Q2 Expression Evaluation
Prompt the user for each of the required values (A thru E) and present the formula along with the
answer. Have the program loop to repeat the 5 times- collecting new numbers and performing the
calculation again using the new numbers.
