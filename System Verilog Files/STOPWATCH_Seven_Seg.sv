module STOPWATCH_Seven_Seg(in_clk, reset, start, up, plus_min2, speedup, slowdown , SS0, SS1, MM0, MM1);

input logic in_clk, reset, start, up, plus_min2, speedup, slowdown;  //inputs
output reg [3:0] SS0, SS1, MM0, MM1;                                 //outputs 4-bits
//wires
wire ups, sig_S1_S0, sig_S0_S1, comp_sig_S1_S0, sig_S1_M0, sig_M0_M1, sig_M1_M0, sig_M0_S1,setting,M_set, force_reset;
//wire clk;
wire [3:0] out_S0, out_S1, out_M0, out_M1;
assign force_reset = 0;
clock_dividor H1(in_clk,speedup,slowdown,clk);
wire seven_segment_flag;
assign seven_segment_flag = 0;
//Finds the value of up* (ups) that will be passed to all modules
and (setting,up,~reset);
DFF_mod H2(clk, ~reset, setting, ~start, up, ups);
// 4 blocks for S0, S1, M0, M1
S0_block H3(clk, ~reset, start, ups, sig_S1_S0, comp_sig_S1_S0, sig_S0_S1, out_S0);
S1_block H4(clk, ~reset, start, ups, force_reset, sig_S0_S1, sig_M0_S1, sig_S1_S0, comp_sig_S1_S0, sig_S1_M0, out_S1,M_set, ~plus_min2);
M0_block H5(clk, ~reset, start, ups, ~plus_min2, force_reset, sig_S1_M0, sig_M1_M0, sig_M0_S1, sig_M0_M1, out_M0,M_set);
M1_block H6(clk, ~reset, start, ups, ~plus_min2, force_reset, sig_M0_M1, sig_M1_M0, out_M1);

//Error module to check the error code 1
Error1_out H7(clk, ~reset, up, start, seven_segment_flag, out_S0, out_S1, out_M0, out_M1, SS0, SS1, MM0, MM1);
endmodule

