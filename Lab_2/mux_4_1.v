`timescale 1ns / 1ps

module mux_4_1
  #(DATA_WIDTH=4)(input [DATA_WIDTH-1:0]  in0, in1, in2, in3,
		  input [1:0] 		  sel,
		  output [DATA_WIDTH-1:0] out);
   case (sel)
     2'b00: assign out = in0;
     2'b01: assign out = in1;
     2'b10: assign out = in2;
     2'b11: assign out = in3;
   endcase // case (sel)
endmodule // mux_4_1

