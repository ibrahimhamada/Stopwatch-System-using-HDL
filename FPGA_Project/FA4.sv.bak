/* This module implments a 4-bit Full Ripple Carry Adder that stores the sum and Cout of the inputs */
module FA4(Cin, A, B, Cout, S);
input logic [3:0] A, B;  //Input 4-bits
input logic Cin;         //Carry in
output logic [3:0] S;    //Sum 
output logic Cout;       //Carry out

wire c1, c2, c3;

//The module uses 4 FA blocks to add each corresponding 2 bits from the two inputs while rippling the carry
FA A1(Cin, A[0], B[0], c1, S[0]);   //FA(Cin, A, B, Cout, S);
FA A2(c1, A[1], B[1], c2, S[1]);
FA A3(c2, A[2], B[2], c3, S[2]);
FA A4(c3, A[3], B[3], Cout, S[3]);

endmodule

