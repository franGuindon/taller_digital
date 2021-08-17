module Fulladder(input 	    BitA,
		 input 	    BitB,
		 input 	    Cin,
		 output reg Res,
		 output reg Carry);

   reg 			    Rx, Ad, AB;

   always@(*)
     begin
	Rx = BitA ^ BitB;
	Res = Rx ^ Cin;
	Ad = Rx & Cin;
	AB = BitA & BitB;
	Carry = Ad | AB;
     end
   
endmodule
