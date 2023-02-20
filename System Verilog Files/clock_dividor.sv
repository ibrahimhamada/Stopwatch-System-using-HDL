// This module is used to determine the input clock to S0, S1, M0, M1 based on the selected mode
module clock_dividor(clk,speedup,slowdown,outputclk);
input clk, speedup, slowdown;  //inputs
output reg outputclk;          //output
wire  w0,w1,w2;                //wires

clckdivider1hz clk1(clk,w0);     //Normal clock
clckdividerhalfhz clk2(clk,w1);  //Speed up clock
clckdivider2hz clk3(clk,w2);     //Slow down clock
//Mux 4 is used to select from different clocks based on speedup,slowdown
MUX4 #(1) mux(w0,w1,w2,w0,{speedup,slowdown},outputclk);

endmodule


