/*This module implments a 4-bits Comarator compares between 2 4-bits inputs*/
module Comparator4(A, B, y);
input logic [3:0] A, B;  //Inputs
output logic y;

wire [3:0] res;          //Subtraction result

Subtractor4 M1(A, B, res);   //A-B

assign y = res[3];           //y is a signal to determine whether B>A or not. if y = 1 then B>A

endmodule
