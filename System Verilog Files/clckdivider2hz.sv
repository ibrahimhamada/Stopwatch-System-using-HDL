//This module is used to generate a 2 Hz clock (for speed up mode) out of the 50MHz input clock from the FPGA
module clckdivider2hz(clock_in,clock_out);
input clock_in;  //input clock
output reg clock_out;  //output clock

reg[27:0] counter=28'd0;             //counter to increment with each half cycle of the 50MHz clock
parameter division = 28'd25000000;   //replace d4 to be d25000000 if the clock is 50Mhz
always @(posedge clock_in)
//check if the counter reaches 25000000, the output clock will generate one clock
begin
 counter <= counter + 28'd1;
 if(counter>=(division-1))
  counter <= 28'd0;
 clock_out <= (counter<division/2)?1'b1:1'b0;
end
endmodule
