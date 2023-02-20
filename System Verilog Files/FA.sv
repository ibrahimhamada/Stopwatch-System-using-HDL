/* This module implments a Full Adder that stores the sum and Cout of the inputs */
module FA(Cin, A, B, Cout, S);
input logic Cin, A, B;   //Inputs
output logic Cout, S;    //Outputs: Sum and Carry
wire w1, w2, w3, w4, o5;

//Find the Sum = A ^ B ^ Cin
xor M1(w1, A, B);
xor M2(S, w1, Cin);

//Find the Carry out = A*B + A*Cin + B*Cin
and M3(w2, A, B);
and M4(w3, A, Cin);
and M5(w4, B, Cin);

or M6(o5, w2, w3);
or M7(Cout, o5, w4);

endmodule

