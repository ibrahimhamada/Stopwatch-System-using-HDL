/*This module implments a 4-bits subtractor that subtracts B from A and the answer is stored in y*/
module Subtractor4(A, B, y);
//A-B
input logic [3:0] A, B;   //Inputs A and B

output logic [3:0] y;     //Output y = A-B

wire Cout;
wire [3:0] B_bar;

//Finding B' (First Complment)
not(B_bar[0], B[0]);
not(B_bar[1], B[1]);
not(B_bar[2], B[2]);
not(B_bar[3], B[3]);

//Using the 4-bits Adder to add A and the two's complment of B.
FA4 A1(1'b1, A, B_bar, Cout, y);   // FA4(Cin, A, B, Cout, S);

endmodule
