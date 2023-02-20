/* This module implments a parameterized 4:1 MUX that selects between 4 n-bits inputs  */
module MUX4(a0, a1, a2, a3, sel, y);

parameter WIDTH=4; //Number of bits of the inputs

input logic [WIDTH-1:0] a0, a1, a2, a3;  //Inputs
input logic [1:0] sel;                   //Select
output logic [WIDTH-1:0] y;              //Output

wire [3:0] y1, y2;

//3 MUX2 blocks are used to select 1 out of the 4 inputs.
MUX2 #(WIDTH) M1(a0, a1, sel[0], y1);
MUX2 #(WIDTH) M2(a2, a3, sel[0], y2);
MUX2 #(WIDTH) M3(y1, y2, sel[1], y);

endmodule


