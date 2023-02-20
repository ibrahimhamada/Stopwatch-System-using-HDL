/* This module implments a 3-inputs OR Gate that stores the result is stored in y */
module OR3_mod(A, B, C, y);

input logic A, B, C;  //Inputs
output logic y;       //Output y = A | B | C
wire w1;

// 2 2-input or gates are used to find the result of ORing 3 bits
or M1(w1, A, B);
or M2(y, w1, C);

endmodule
