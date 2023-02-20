/* This module implments a 4-inputs AND Gate that stores the result is stored in y */
module AND4_mod (a0, a1, a2, a3, y);
input logic a0, a1, a2, a3; //Input 4 bits a0-a3
output logic y;             //Output y = a0 & a1 & a2 & a3

wire w1, w2;

// 3 2-inputs AND gates are used to implment the 4-inputs AND gate following the structural design.
and M1(w1, a0, a1);
and M2(w2, a2, a3);
and M3(y, w1, w2);

endmodule

