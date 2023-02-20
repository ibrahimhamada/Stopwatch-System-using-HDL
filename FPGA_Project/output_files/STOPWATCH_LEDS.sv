module STOPWATCH_LEDS(in_clk, reset, start, up, plus_min2, speedup, slowdown , SS0, SS1, MM0, MM1);

input logic in_clk, reset, start, up, plus_min2, speedup, slowdown;
output reg [3:0] SS0, SS1, MM0, MM1;

//wires
wire ups, sig_S1_S0, sig_S0_S1, comp_sig_S1_S0, sig_S1_M0, sig_M0_M1, sig_M1_M0, sig_M0_S1,setting,M_set, force_reset;
//wire clk;
wire [3:0] out_S0, out_S1, out_M0, out_M1;
assign force_reset = 0;
clock_dividor H1(in_clk,speedup,slowdown,clk);
wire seven_segment_flag;
assign seven_segment_flag = 1'b1;
// UP*
//D_FF_SyncR H2(clk, reset, ~start, up, ups);

//JK_FF(clk,reset,EN,J,K,Q);
//DFF( clk, reset, set, EN, D, Q);

and (setting,up,~reset);
DFF_mod H2(clk, ~reset, setting, ~start, up, ups);


S0_block H3(clk, ~reset, start, ups, sig_S1_S0, comp_sig_S1_S0, sig_S0_S1, out_S0);
S1_block H4(clk, ~reset, start, ups, force_reset, sig_S0_S1, sig_M0_S1, sig_S1_S0, comp_sig_S1_S0, sig_S1_M0, out_S1,M_set, ~plus_min2);
M0_block H5(clk, ~reset, start, ups, ~plus_min2, force_reset, sig_S1_M0, sig_M1_M0, sig_M0_S1, sig_M0_M1, out_M0,M_set);
M1_block H6(clk, ~reset, start, ups, ~plus_min2, force_reset, sig_M0_M1, sig_M1_M0, out_M1);


// M1_block(clk, reset, start, ups, plus_min2, force_reset, in_sig_M0, out_sig_M0, out_M1);


//M0_block(clk, reset, start, ups, plus_min2, force_reset, in_sig_S1, in_sig_M1, out_sig_S1, out_sig_M1, out_M0);


//M1_block H6(clk, reset, start, ups, plus_min2, sig_M0_M1, sig_M1_M0, MM1);

//S0_block H3(clk, reset, start, ups, sig_S1_S0, comp_sig_S1_S0, sig_S0_S1, SS0);
//S1_block H4(clk, reset, start, ups, sig_S0_S1, sig_M0_S1, sig_S1_S0, comp_sig_S1_S0, sig_S1_M0, SS1);
//M0_block H5(clk, reset, start, ups, plus_min2, sig_S1_M0, sig_M1_M0, sig_M0_S1, sig_M0_M1, MM0);
//M1_block H6(clk, reset, start, ups, plus_min2, sig_M0_M1, sig_M1_M0, out_M1);




Error1_out H7(clk, ~reset, up, start, seven_segment_flag, out_S0, out_S1, out_M0, out_M1, SS0, SS1, MM0, MM1);

endmodule



/*
module STOPWATCH(in_clk, reset, start, up, plus_min2, speedup, slowdown,  out_S0, out_S1, out_M0, out_M1);

input logic in_clk, reset, start, up, plus_min2, speedup, slowdown;
output reg [6:0] out_S0, out_S1, out_M0, out_M1;

wire [3:0] SS0, SS1, MM0, MM1;
wire seven_segment_flag;

assign seven_segment_flag = 1'b1;

STOPWATCH K1(in_clk, reset, start, up, plus_min2, speedup, slowdown, seven_segment_flag, SS0, SS1, MM0, MM1);

seven_seg_decoder KS0(SS0, out_S0[0], out_S0[1], out_S0[2], out_S0[3], out_S0[4], out_S0[5] ,out_S0[6]);
seven_seg_decoder KS1(SS1, out_S1[0], out_S1[1], out_S1[2], out_S1[3], out_S1[4], out_S1[5] ,out_S1[6]);
seven_seg_decoder KM0(MM0, out_M0[0], out_M0[1], out_M0[2], out_M0[3], out_M0[4], out_M0[5] ,out_M0[6]);
seven_seg_decoder KM1(MM1, out_M1[0], out_M1[1], out_M1[2], out_M1[3], out_M1[4], out_M1[5] ,out_M1[6]);

endmodule


*/
