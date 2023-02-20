/*This module implments the functionality of stopwatch using 7 segments*/
module STOPWATCH(in_clk, reset, start, up, plus_min2, speedup, slowdown,  out_S0, out_S1, out_M0, out_M1);
input logic in_clk, reset, start, up, plus_min2, speedup, slowdown;  //inputs
output reg [6:0] out_S0, out_S1, out_M0, out_M1;                     //outputs
wire [3:0] SS0, SS1, MM0, MM1;
wire seven_segment_flag;
assign seven_segment_flag = 1'b1;
wire ups, sig_S1_S0, sig_S0_S1, comp_sig_S1_S0, sig_S1_M0, sig_M0_M1, sig_M1_M0, sig_M0_S1,setting,M_set, force_reset;
//Stopwatch that outputs 4 bits
STOPWATCH_LEDS K1(in_clk, reset, start, up, plus_min2, speedup, slowdown , SS0, SS1, MM0, MM1);  
//Decoding each 4-bits output into 7 bits
seven_seg_decoder KS0(SS0, out_S0[0], out_S0[1], out_S0[2], out_S0[3], out_S0[4], out_S0[5] ,out_S0[6]);
seven_seg_decoder KS1(SS1, out_S1[0], out_S1[1], out_S1[2], out_S1[3], out_S1[4], out_S1[5] ,out_S1[6]);
seven_seg_decoder KM0(MM0, out_M0[0], out_M0[1], out_M0[2], out_M0[3], out_M0[4], out_M0[5] ,out_M0[6]);
seven_seg_decoder KM1(MM1, out_M1[0], out_M1[1], out_M1[2], out_M1[3], out_M1[4], out_M1[5] ,out_M1[6]);

endmodule


