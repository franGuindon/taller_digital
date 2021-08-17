`timescale 1ns / 1ps

module alu_tb;

   reg [3:0] A;
   reg [3:0] B;
   reg 	     FlagIn;
   reg [3:0] Control;
   wire [3:0] Result;
   wire       C, Z;
   
   ALU #(.n(4)) alu (.ALUA(A),
		     .ALUB(B),
		     .ALUControl(Control),
		     .ALUFlagIn(FlagIn),
		     .ALUResult(Result),
		     .C(C),
		     .Z(Z));

   task test1();
      begin
	 A = 4'b1101;
	 B = 4'b1011;
	 FlagIn = 0;
	 Control = 4'h0;
	 #10;
	 A = $random;
	 B = $random;
	 FlagIn = 0;
	 Control = 4'h2;
	 #10;
	 A = $random;
	 B = $random;
	 FlagIn = 0;
	 Control = 4'h6;
	 #10;
	 A = 4'b0110; // respuesta debería ser 1000
	 B = 4'b0010;
	 FlagIn = 0;
	 Control = 4'h8;
	 #10;
	 A = 4'b0110; // respuesta debería ser 1011
	 B = 4'b0010;
	 FlagIn = 1;
	 Control = 4'h8;
	 #10;
	 A = 4'b0110; // respuesta debería ser 0001 y C=1
	 B = 4'b0010;
	 FlagIn = 0;
	 Control = 4'h9;
	 #10;
	 A = 4'b0110; // respuesta debería ser 1101 y C=1
	 B = 4'b0010;
	 FlagIn = 1;
	 Control = 4'h9;
	 #10;
      end
   endtask // test1
   
   initial begin
      test1();
      $finish;
   end

   initial begin
      $dumpvars;
      $monitor("%b | %b | %b", A, B, Result);
   end
endmodule // alu_tb
