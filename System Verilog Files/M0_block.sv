//This module implments the M0 digit in the stopwatch.
module M0_block(clk, reset, start, ups, plus_min2, force_reset, in_sig_S1, in_sig_M1, out_sig_S1, out_sig_M1, out_M0,M_set);
input logic clk, reset, start, ups, plus_min2, force_reset, in_sig_S1, in_sig_M1;
output reg [3:0] out_M0;
output logic out_sig_S1, out_sig_M1,M_set;

//wires
wire [3:0] M1_out, M2_out, M3_out, M4_out, M5_out, M6_out, M17_out, M18_out;

wire cout_M3, cout_M6, M7_out, M8_out, M9_out, M10_out, M11_out, M12_out, M13_out, M14_out, M15_out, M16_out, M20_out,M44_out, M50_out,M67_out;
wire M21_out, M22_out, M23_out, M24_out, M25_out, M26_out,M35_out ,M28_out, M29_out,M36_out,M38_out,M39_out,M40_out,M41_out,M42_out,M43_out; 
wire down, reset_signal, enable_signal,M66_out,M70_out;
wire [3:0] set_reg;

assign down = ~ups;
//Set Signals based on the selected mode (up/down)
MUX2 #(4) M1(4'b1111, 4'b0001, ups, M1_out);
MUX2 #(4) M2(4'b0000, M1_out, in_sig_S1, M2_out);
FA4 M3(1'b0, out_M0, M2_out, cout_M3, M3_out);

MUX2 #(4) M4(4'b1110, 4'b0010, ups, M4_out);
MUX2 #(4) M5(4'b0000, M4_out, plus_min2, M5_out);
FA4 M6(1'b0, M3_out, M5_out, cout_M6, M6_out);

AND4_mod M7(~M6_out[0], M6_out[1], ~M6_out[2], M6_out[3], M7_out);
AND4_mod M8(M6_out[0], M6_out[1], ~M6_out[2], M6_out[3], M8_out);
AND4_mod M9(~M6_out[0], ~M6_out[1], M6_out[2], M6_out[3], M9_out);
OR3_mod M10(M7_out, M8_out, M9_out, M10_out);

AND4_mod M11(M6_out[0], M6_out[1], M6_out[2], M6_out[3], M11_out);
AND4_mod M12(M6_out[3], M6_out[2], M6_out[1], ~M6_out[0], M12_out);
AND4_mod M13(M6_out[3], M6_out[2], ~M6_out[1], M6_out[0], M13_out);
OR3_mod M14(M11_out, M12_out, M13_out, M14_out);
MUX2 #(1) M15(M14_out, M10_out, ups, M15_out);
and (M39_out,M20_out,ups);
or M16(out_sig_M1, M39_out, M15_out);

MUX2 #(4) M17({~M13_out, M13_out, M13_out, ~M12_out} , {1'b0,1'b0, M9_out, M8_out}, ups, M17_out);
MUX2 #(4) M18(M6_out, M17_out, M15_out, M18_out);
or M67(M67_out,in_sig_S1,reset);
and M66(M66_out,M40_out,M67_out);
or M43(M43_out,M66_out,M41_out);
MUX2 #(4) M19(M18_out, 4'b1001, M43_out, set_reg); //Set Register

AND4_mod M20(out_M0[0], ~out_M0[1], ~out_M0[2], out_M0[3], M20_out);
and M38(M38_out,M50_out,~plus_min2);
and M21(M21_out, M38_out, ~in_sig_M1);
and M36(M36_out,M21_out,ups);
and M22(M22_out, ups, reset);
and M44(M44_out,M41_out,down);
OR3_mod M23(M44_out, M36_out, M22_out,M23_out);   //Reset Signal
or O1(reset_signal, force_reset, M23_out);
and M24(M24_out, down, reset); 

AND4_mod M25(~out_M0[0], ~out_M0[1], ~out_M0[2], ~out_M0[3], M25_out);
or M26(M26_out, M25_out, M24_out);
//and M51(M26_out, M51_out, in_sig_S1);
and M35(M35_out,M26_out,down);
or M70(M70_out,~plus_min2,down);
and M40(M40_out,M35_out,M70_out);
and M41(M41_out,out_sig_M1,in_sig_M1);
or M42(M42_out,M20_out,M41_out);
MUX2 #(1) M28(M40_out, M20_out, ups, M28_out);

and M27(out_sig_S1, M28_out, in_sig_M1);
and M50(M50_out, out_sig_S1, in_sig_S1);

or M29(M29_out, start, plus_min2);
and M30(enable_signal, ~M50_out, M29_out);  //Enable Signal

and Mset(M_set,M15_out,in_sig_M1);   //out set signal

//Register Output Signal
Register4_SyncR RR(clk, reset_signal, enable_signal, set_reg, out_M0);
endmodule
