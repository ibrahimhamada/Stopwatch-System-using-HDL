/* This module implments a 4-bit register with a Enable, Set, and Synchrouns Reset */
module Register4_SyncR( clk, reset, EN, set, out);

input logic clk, reset, EN;
input logic [3:0] set;
output reg [3:0] out;
//4 D_FF are used to deal with each bit of the 4 bits, where they are all synchronised
D_FF_SyncR M1(clk, reset, EN, set[0], out[0]);
D_FF_SyncR M2(clk, reset, EN, set[1], out[1]);
D_FF_SyncR M3(clk, reset, EN, set[2], out[2]);
D_FF_SyncR M4(clk, reset, EN, set[3], out[3]);

endmodule