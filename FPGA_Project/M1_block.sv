//This module implments the M1 digit in the stopwatch.
module M1_block(clk, reset, start, ups, plus_min2, force_reset, in_sig_M0, out_sig_M0, out_M1);
input logic clk, reset, start, ups, plus_min2, force_reset, in_sig_M0;
output reg [3:0] out_M1;
output logic out_sig_M0;

//wires
wire [3:0] M1_out, M2_out, M3_out;
wire cout_M3, M4_out, M5_out, M7_out, M8_out, M9_out, M10_out, M12_out,M13_out;

wire down, reset_signal, enable_signal;
wire [3:0] set_reg;
assign down = ~ups;

assign reset_signal = force_reset;
//Set Signals based on the selected mode (up/down)
MUX2 #(4) M1(4'b1111, 4'b0001, ups, M1_out);
MUX2 #(4) M2(4'b0000, M1_out, in_sig_M0, M2_out);
FA4 M3(1'b0, out_M1, M2_out, cout_M3, M3_out);

and M4(M4_out, ups, reset);  //M0
and M5(M5_out, down, reset);   //M1

MUX4 #(4) M6(M3_out, 4'b0001, 4'b0100, 4'b0000, {M5_out, M4_out}, set_reg);  //Set Signal

AND4_mod M7(~out_M1[0], ~out_M1[1], out_M1[2], ~out_M1[3], M7_out);
AND4_mod M8(out_M1[0], ~out_M1[1], ~out_M1[2], ~out_M1[3], M8_out);
and M9(M9_out, down, M8_out);

and M10(M10_out, ups, M7_out);

or M11(out_sig_M0, M10_out, M9_out);
and M41(M41_out, out_sig_M0, in_sig_M0);

or M12(M12_out, plus_min2, start);
and M13(M13_out, ~M41_out, M12_out);  //Enable Signal
or (enable_signal,M13_out,reset);

//Register Output Signal
Register4_SyncR RR(clk, reset_signal, enable_signal, set_reg, out_M1);
endmodule

