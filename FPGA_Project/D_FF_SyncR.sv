/* This module implments a DQ Flip Flop with a Enable and Synchrouns Reset */
module D_FF_SyncR( clk, reset, EN, D, Q);
input logic clk, reset, EN, D;
output logic Q;

// At Positive edge of the clock, check the reset and if it euqals '0', pass D to Q if it is enabled.
always_ff @(posedge clk)
if (reset) Q <= 0;
else if (EN) Q <= D;
endmodule
