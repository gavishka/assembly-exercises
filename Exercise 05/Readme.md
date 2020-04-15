Q1: Volume and Area of a Regular Icosahedron

An icosahedron is a regular polyhedron with 20 congruent equilateral triangular faces. Ask the user to supply the length of one of the edges (one side of a triangular face) and then calculate the total surface area and volume of the icosahedron. Report the answers and then repeat. Your program should loop until the value 0 is entered for the radius – and then it should promptly exit. Only positive numbers are allowed for the length of the edge.

𝑨𝒓𝒆𝒂 =𝟓 √𝟑∗𝒆𝟐
𝑽𝒐𝒍𝒖𝒎𝒆=𝟓𝟏𝟐 (𝟑+ √𝟓)∗ 𝒆𝟑

Q2 Display Floating-Point Binary

Create a procedure to print the value as described in the textbook. The procedure could be named printRealValue and it will print the top value on the FPU stack and make sure it is removed once printed.
Prompt the user for the number until the user enters 0. Once the zero is entered, then also display the following values using your printRealValue procedure:

a) Negative zero (-0)
b) Positive zero (+0)
c) Positive infinity
d) Negative infinity
e) QNaN – the quiet non-signalling NAN
f) SNaN – the signalling NAN.

You can load these values into predefined variables using the binary patterns for each variable.

.data
  NegZero LABEL REAL4
  X DWORD 100000000000000000000000000000
.code
  FLD NegZero
