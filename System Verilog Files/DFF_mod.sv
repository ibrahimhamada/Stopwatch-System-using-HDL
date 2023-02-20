/* This module implments a DQ Flip Flop with Set, Enable and Synchrouns Reset Signals */
module DFF_mod( clk, reset, set, EN, D, Q);

input logic clk, reset, EN, D, set;
output logic Q;

// asynchronous reset
// At Positive edge of the clock, check the set signal to set the FF.
// Then check reset and if it euqals '0', pass D to Q if it is enabled.
always_ff @(posedge clk, posedge reset, posedge set)
if (set) Q <= 1;
else if (reset) Q <= 0;
else if (EN) Q <= D;
endmodule
