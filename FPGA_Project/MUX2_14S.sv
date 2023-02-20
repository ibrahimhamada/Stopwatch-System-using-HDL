/* This module implments a 2:1 MUX that selects between 2 4-bits inputs  */
module MUX2_14S(a, b, sel, y);
input logic [3:0] a, b;
input logic sel;
output logic [3:0] y;

MUX2_1S M1(a[3], b[3], sel, y[3]);
MUX2_1S M2(a[2], b[2], sel, y[2]);
MUX2_1S M3(a[1], b[1], sel, y[1]);
MUX2_1S M4(a[0], b[0], sel, y[0]);

endmodule
