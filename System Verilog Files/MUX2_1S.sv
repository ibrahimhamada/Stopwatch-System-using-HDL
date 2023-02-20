/* This module implments a 2:1 MUX that selects between 2 1-bit inputs  */
module MUX2_1S(a, b, sel, y);
input logic a, b, sel;
output logic y;

wire w1, s_bar, w2;

and M1(w1, b, sel);
not M2(s_bar, sel);
and M3(w2, a, s_bar);
or M4(y, w1, w2);


endmodule
