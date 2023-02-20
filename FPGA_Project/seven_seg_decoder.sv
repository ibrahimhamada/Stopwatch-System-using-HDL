/*This module implments a 4:7 decoder to convert the 4-bits output from registers into the 7 inputs of the 7 segment*/
module seven_seg_decoder(A, c, d, e, b, a, f, g);
//A-B
input logic [3:0] A;   //Inputs A 

output logic a, b, c, d, e, f, g;     //Outputs

wire M1_out, M2_out, M3_out, M4_out, M6_out, M7_out, M8_out, M9_out, M10_out, M11_out, M13_out, M14_out, M16_out, M17_out, M18_out, M19_out, M20_out, M21_out;
wire M23_out, M24_out, M25_out, M27_out, M28_out, M29_out, M30_out, M31_out, M33_out, M34_out, M35_out, M36_out, M37_out, M38_out;
// Segment a
xor M1(M1_out, A[3], A[1]);
and M2(M2_out, A[2], A[0]);
and M3(M3_out, ~A[3], ~A[2]);
and M4(M4_out, M3_out, ~A[0]);
OR3_mod M5(M1_out, M2_out, M4_out, a); //a
// Segment b
and M6(M6_out, ~A[3], ~A[2]);
and M7(M7_out, ~A[2], ~A[1]);
and M8(M8_out, ~A[3], A[1]);
and M9(M9_out, M8_out, A[0]);
and M10(M10_out, ~A[1], ~A[0]);
OR3_mod M11(M10_out, M9_out, M7_out, M11_out);
or M12(b, M11_out, M6_out);  //b
// Segment c
and M13(M13_out, ~A[3], A[0]);
and M14(M14_out, ~A[3], A[2]);
OR3_mod M15(M13_out, M14_out, ~A[1], c); //c
// Segment d
and M16(M16_out, A[3], ~A[1]);
AND4_mod M17(~A[3], ~A[2], ~A[0], 1'b1, M17_out);
AND4_mod M18(~A[3], ~A[2], A[1], 1'b1, M18_out);
AND4_mod M19(~A[3], A[1], ~A[0], 1'b1, M19_out);
AND4_mod M20(A[2], ~A[1], A[0], 1'b1, M20_out);
OR3_mod M21(M16_out, M17_out, M18_out, M21_out);
OR3_mod M22(M21_out, M19_out, M20_out, d); //d
// Segment e
and M23(M23_out, A[3], A[2]);
AND4_mod M24(~A[2], ~A[1], ~A[0], 1'b1, M24_out);
AND4_mod M25(~A[3], A[1], ~A[0], 1'b1, M25_out);
OR3_mod M26(M23_out, M24_out, M25_out, e); //e
// Segment f 
and M27(M27_out, ~A[1], ~A[0]);
and M28(M28_out, A[2], ~A[1]);
and M29(M29_out, A[2], ~A[0]);
and M30(M30_out, A[3], A[0]);
OR3_mod M31(M27_out, M28_out, M29_out, M31_out); 
or M32(f, M31_out, M30_out); //f
// Segment g
and M33(M33_out, A[2], ~A[1]);
and M34(M34_out, A[2], ~A[0]);
and M35(M35_out, A[3], ~A[1]);
and M36(M36_out, A[3], A[0]);
AND4_mod M37(~A[3], ~A[2], A[1], 1'b1, M37_out);
OR3_mod M38(M33_out, M34_out, M35_out, M38_out); 
OR3_mod M39(M38_out, M36_out, M37_out, g);  //g

endmodule
