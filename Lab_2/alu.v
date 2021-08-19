`timescale 1ns / 100ps

module ALU
  #(parameter n=4)(input [n-1:0] ALUA, ALUB,
		   input [3:0] 	      ALUControl,
		   input 	      ALUFlagIn,
		   output [n-1:0] ALUResult,
		   output 	      C,Z
		   );
   wire [3:0] 			      B;
   wire [4:0] 			      temp;
   wire [3:0] 			      S;
   wire 			      Cout;
   CLA_4bit adder (.S(S), .Cout(Cout), .A(ALUA), .B(B), .Cin(ALUFlagIn));
   
   assign B = ALUControl == 4'h2 ? ALUB :
	      ALUControl == 4'h6 ? ~ALUB + 1 : 0;
   assign temp = ALUControl == 4'h8 ? (ALUFlagIn == 0 ? ALUA << ALUB : ~((~ALUA) << ALUB)) :
		 ALUControl == 4'h9 ? (ALUFlagIn == 0 ? {1'b0,ALUA} >> (ALUB-1) : ~((~{1'b1,ALUA}) >> (ALUB-1))) :
		 0 ;
   assign C = ALUControl == 4'h8 ? temp[n] :
	      ALUControl == 4'h9 ? temp[0] :
	      0 ;
   assign ALUResult = ALUControl == 4'h0 ? ALUA & ALUB :
		      ALUControl == 4'h1 ? ALUA | ALUB :
		      ALUControl == 4'h2 ? S :
		      ALUControl == 4'h3 ? (ALUFlagIn == 0 ? ALUA+1: ALUB+1) :
		      ALUControl == 4'h4 ? (ALUFlagIn == 0 ? ALUA-1: ALUB-1) :
		      ALUControl == 4'h5 ? (ALUFlagIn == 0 ? ~ALUA : ~ALUB) :
		      ALUControl == 4'h6 ? S :
		      ALUControl == 4'h7 ? ALUA ^ ALUB :
		      ALUControl == 4'h8 ? temp[n-1:0] :
		      ALUControl == 4'h9 ? temp[n:1] :
		      0 ;
   assign Z = (ALUResult == 0 ? 1 : 0);
endmodule // ALU
