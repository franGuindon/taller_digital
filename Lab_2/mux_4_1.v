`timescale 1ns / 1ps

module mux_4_1
  #(DATA_WIDTH=4)(input [DATA_WIDTH-1:0]  in0, in1, in2, in3,
		  input [1:0] 		  sel,
		  output [DATA_WIDTH-1:0] out);
   assign out = sel == 2'b00 ? in0 :
		sel == 2'b01 ? in1 :
		sel == 2'b10 ? in2 :
		sel == 2'b11 ? in3 :
		{1'bx};
endmodule // mux_4_1

