/* This module implments a parameterized 2:1 MUX that selects between 2 n-bits inputs  */
module MUX2(a0, a1, sel, y);

parameter WIDTH=4; //Number of bits of the inputs

input logic [WIDTH-1:0] a0, a1;  //Inputs 
input logic sel;                 //Select
output logic [WIDTH-1:0] y;      //Output

assign y = sel ? a1 : a0;        //The output is a1 if the select bit = 1, otherwise it is a0.
endmodule

//MUX2 #(4) M1(a0, a1, sel[0], y1);  How to create an object of the module
