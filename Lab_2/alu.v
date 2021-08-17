`timescale 1ns / 100ps

module ALU
  #(parameter n=4)(input [n-1:0] ALUA, ALUB,
		   input [3:0] 	      ALUControl,
		   input 	      ALUFlagIn,
		   output reg [n-1:0] ALUResult,
		   output reg 	      C,Z
		   );
   reg [3:0] 			      B;
   reg [4:0] 			      temp, temp2;
   wire [3:0] 			      S;
   wire 			      Cout;
   CLA_4bit adder (.S(S), .Cout(Cout), .A(ALUA), .B(B), .Cin(ALUFlagIn));

   always @ * begin
      assign C = 0;
      case (ALUControl)
	4'h0:
	  begin
	     assign ALUResult = ALUA & ALUB;
	  end
	4'h1:
	  begin
	     assign ALUResult = ALUA | ALUB;
	  end
	4'h2:
	  begin
	     assign B = ALUB;
	     assign ALUResult = S;
	  end
	4'h3:
	  begin
	     assign ALUResult = ALUFlagIn == 0 ? ALUA+1: ALUB+1;
	  end
	4'h4:
	  begin
	     assign ALUResult = ALUFlagIn == 0 ? ALUA-1: ALUB-1;
	  end
	4'h5:
	  begin
	     assign ALUResult = ALUFlagIn == 0 ? ~ALUA : ~ALUB;
	  end
	4'h6:
	  begin
	     assign B = ~ALUB + 1;
	     assign ALUResult = S;
	  end
	4'h7:
	  begin
	     assign ALUResult = ALUA ^ ALUB;
	  end
	4'h8:
	  begin
	     assign temp = (ALUFlagIn == 0 ? ALUA << ALUB : ~((~ALUA) << ALUB));
	     assign ALUResult = temp[n-1:0];
	     assign C = temp[n];
	  end
	4'h9:
	  begin
	     assign temp = (ALUFlagIn == 0 ? ALUA >> ALUB : ~((~ALUA) >> ALUB)); //
	     assign ALUResult = temp[n:1];
	     assign C = ALUB > n ? ALUFlagIn : ALUA[ALUB-1];
	  end
      endcase // case (ALUControl)
      assign Z = (ALUResult == 0 ? 1 : 0);
   end
endmodule // ALU
