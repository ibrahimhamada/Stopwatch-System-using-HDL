/* This module implments a JK Flip Flop with a Enable and Synchrouns Reset */
module JK_FF(clk,reset,EN,J,K,Q);
input logic clk, J,K,reset,EN;  //inputs
output logic Q;                 //outputs
wire D,and1,not_K,not_Q;

D_FF_SyncR DFF(clk,reset,EN,D,Q);
// JK ff logic
not gate0(not_K,K);
not gate1(not_Q,Q);
and gate2(and1,not_K,Q);
and gate3(and2,not_Q,J);
or gate4(D,and1,and2);
endmodule

