`timescale 1ns / 1ps

module mux_francis_2
  #(DATA_WIDTH=4)(input [DATA_WIDTH-1:0]  in0, in1, in2, in3,
		  input [1:0] 		      sel,
		  output reg [DATA_WIDTH-1:0] out);

   always @ (sel or in0 or in1 or in2 or in3)
     case (sel)
       2'b00: out = in0;
       2'b01: out = in1;
       2'b10: out = in2;
       2'b11: out = in3;
     endcase // case (sel)
endmodule // mux_francis_2
