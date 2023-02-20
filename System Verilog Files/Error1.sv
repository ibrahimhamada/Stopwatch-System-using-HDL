/* This module implments Error Code 1 that flashes twice when the mode (up/down) is changed without stopping */
module Error1( clk, reset, up, start, err1);
input logic clk, reset, up, start;  //inputs
output logic err1;                  //outputs

wire M1_out, M2_out, M3_out, M4_out, M5_out, M6_out, M7_out, M8_out;
//This logic is used to detect if there is a change from up to down or from down to up while stopping
D_FF_SyncR M1(clk, 1'b0, 1'b1, up, M1_out);
xnor M2(M2_out, M1_out, ~up);
and M3(M3_out, M2_out, start);
D_FF_SyncR M4(clk, reset, 1'b1, M3_out, M4_out);
or M5(M5_out, M4_out, M3_out);
D_FF_SyncR M6(clk, reset, 1'b1, M5_out, M6_out);
or M7(M7_out, M5_out, M6_out);
D_FF_SyncR M8(clk, reset, 1'b1, M7_out, M8_out);
or M9(err1, M7_out, M8_out);

endmodule
