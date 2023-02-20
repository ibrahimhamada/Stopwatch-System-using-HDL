/* This module is used to choose the output that will be displayed whether F3:F3 or the current value of the clock */
module Error1_out(clk, reset, up, start, seven_seg, SI0, SI1, MI0, MI1, SS0_out, SS1_out, MM0_out, MM1_out);

input logic clk, reset, up, start, seven_seg;  //inputs
input reg [3:0] SI0, SI1, MI0, MI1;            //inputs (The current clock value)
output reg [3:0] SS0_out, SS1_out, MM0_out, MM1_out;  //outputs (F3:F3) or the current value 
 
wire M1_out, e7, error1;
wire [3:0] M3_out, M4_out, M6_out, M7_out, M9_out, M10_out, M12_out, M13_out;

// Detect if an error occured (from up to down while counting, or from down to up while counting)
Error1 M20( clk, reset, up, start, error1);

JK_FF M1(clk, reset, 1'b1, error1, 1'b1, M1_out);
MUX2 #(1) M2(1'b1, M1_out, error1, e7);
// S0 will disply either the current value or 3 4'b0011 or 10 4'b1010 to turn off (flashing) 
MUX2 #(4) M3(SI0, 4'b0011, error1, M3_out);
MUX2 #(4) M4(4'b0000, 4'b1010, seven_seg, M4_out);
MUX2 #(4) M5(M4_out, M3_out, e7, SS0_out);
// S1 will disply either the current value or F 4'b1111 or 10 4'b1010 to turn off (flashing) 
MUX2 #(4) M6(SI1, 4'b1111, error1, M6_out);
MUX2 #(4) M7(4'b0000, 4'b1010, seven_seg, M7_out);
MUX2 #(4) M8(M7_out, M6_out, e7, SS1_out);
// M0 will disply either the current value or 3 4'b0011 or 10 4'b1010 to turn off (flashing) 
MUX2 #(4) M9(MI0, 4'b0011, error1, M9_out);
MUX2 #(4) M10(4'b0000, 4'b1010, seven_seg, M10_out);
MUX2 #(4) M11(M10_out, M9_out, e7, MM0_out);
// M1 will disply either the current value or F 4'b1111 or 10 4'b1010 to turn off (flashing) 
MUX2 #(4) M12(MI1, 4'b1111, error1, M12_out);
MUX2 #(4) M13(4'b0000, 4'b1010, seven_seg, M13_out);
MUX2 #(4) M14(M13_out, M12_out, e7, MM1_out);

endmodule


