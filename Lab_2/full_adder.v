module Fulladder(input 	    BitA,
		 input 	BitB,
		 input 	Cin,
		 output Res,
   		 output Carry);

   wire 		Rx, Ad, AB;
      
   assign	Rx = BitA ^ BitB;
   assign	Res = Rx ^ Cin;
   assign	Ad = Rx & Cin;
   assign	AB = BitA & BitB;
   assign	Carry = Ad | AB;
   
endmodule
