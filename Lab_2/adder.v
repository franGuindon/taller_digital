`timescale 1ns / 100ps

module Adder
  #(DATA_WIDTH=8)(input [DATA_WIDTH-1:0] in0, in1,
		  input 		      cin,
		  output [DATA_WIDTH-1:0] sum,
		  output 		      cout);
   wire [DATA_WIDTH-2:0] 		      carries;
   Fulladder Adder [DATA_WIDTH-1:0] (.BitA(in0),.BitB(in1),.Cin({carries,cin}),
				     .Res(sum),.Carry({cout,carries}) );
endmodule
