`timescale 1ns / 1ps

module alu_tb;

   reg [3:0] A;
   reg [3:0] B;
   reg 	     FlagIn;
   reg [3:0] Control, Esperado;
   wire [3:0] Result;
   wire       C, Z;
   integer    i;
   ALU #(.n(4)) alu (.ALUA(A),
		     .ALUB(B),
		     .ALUControl(Control),
		     .ALUFlagIn(FlagIn),
		     .ALUResult(Result),
		     .C(C),
		     .Z(Z));

   task test_and(); begin
      Control = 4'h0;
      A = 4'b0000;
      B = 4'b1111;
      Esperado = 4'b0000;
      #10;
      A = 4'b0110;
      B = 4'b1101;
      Esperado = 4'b0100;
      #10;
   end
   endtask // test_and
   
   task test_or(); begin
      Control = 4'h1;
      A = 4'b0000;
      B = 4'b1111;
      Esperado = 4'b1111;
      #10;
      A = 4'b0100;
      B = 4'b1101;
      Esperado = 4'b1101;
      #10;
   end
   endtask // test_or

   task test_suma(); begin
      Control = 4'h2;
      for (i = 0; i < 3; i = i + 1) begin
	 A = $random;
	 B = $random;
	 Esperado = A + B + FlagIn;
	 #10;
      end
   end
   endtask // test_suma

   task test_incrementar(); begin
      Control = 4'h3;
      FlagIn = 0;
      A = 4'b0000;
      B = 4'b1111;
      Esperado = 4'b0001;
      #10;
      FlagIn = 1;
      A = 4'b0100;
      B = 4'b1101;
      Esperado = 4'b1110;
      #10;
   end
   endtask // test_incrementar

   task test_decrementar(); begin
      Control = 4'h4;
      FlagIn = 0;
      A = 4'b0000;
      B = 4'b1111;
      Esperado = 4'b1111;
      #10;
      FlagIn = 1;
      A = 4'b0100;
      B = 4'b1101;
      Esperado = 4'b1100;
      #10;
   end
   endtask // test_decrementar

   task test_not(); begin
      Control = 4'h5;
      FlagIn = 0;
      A = 4'b0000;
      B = 4'b1111;
      Esperado = 4'b1111;
      #10;
      FlagIn = 1;
      A = 4'b0100;
      B = 4'b1101;
      Esperado = 4'b0010;
      #10;
   end
   endtask // test_not

   task test_resta(); begin
      Control = 4'h6;
      for (i = 0; i < 3; i = i + 1) begin
	 A = $random;
	 B = $random;
	 Esperado = A - B + FlagIn;
	 #10;
      end
   end

   endtask // test_resta

   task test_xor(); begin
      Control = 4'h7;
      A = 4'b0000;
      B = 4'b1111;
      Esperado = 4'b1111;
      #10;
      A = 4'b0101;
      B = 4'b1100;
      Esperado = 4'b1001;
      #10;
   end
   endtask // test_xor
   
   task test_corrimiento_izquierda(); begin
      Control = 4'h8;
      A = 4'b1010;
      FlagIn = 0;
      
      B = 0;
      Esperado = 4'b1010;
      #10;
      
      B = 1;
      Esperado = 4'b0100;
      #10;

      B = 2;
      Esperado = 4'b1000;
      #10;
      
      B = 3;
      Esperado = 4'b0000;
      #10;

      FlagIn = 1;
      
      B = 0;
      Esperado = 4'b1010;
      #10;
      
      B = 1;
      Esperado = 4'b0101;
      #10;

      B = 2;
      Esperado = 4'b1011;
      #10;
      
      B = 3;
      Esperado = 4'b0111;
      #10;
   end
   endtask // test_corrimiento_izquierda

   task test_corrimiento_derecha(); begin
      Control = 4'h9;
      A = 4'b1010;
      FlagIn = 0;
      
      B = 0;
      Esperado = 4'b1010;
      #10;
      
      B = 1;
      Esperado = 4'b0101;
      #10;

      B = 2;
      Esperado = 4'b0010;
      #10;
      
      B = 3;
      Esperado = 4'b0001;
      #10;

      FlagIn = 1;
      
      B = 0;
      Esperado = 4'b1010;
      #10;
      
      B = 1;
      Esperado = 4'b1101;
      #10;

      B = 2;
      Esperado = 4'b1110;
      #10;
      
      B = 3;
      Esperado = 4'b1111;
      #10;
   end
   endtask // test_corrimiento_derecha
   
   initial begin
      FlagIn = 0;
      $display (" %4s | %4s | %10s | %10s || %10s | %10s | %1s | %1s |", "A", "B", "FlagIn", "Control", "Resultado", "Esperado", "C", "Z");
      $display ("AND---------------------------------------");
      test_and();
      $display ("OR----------------------------------------");
      test_or();
      $display ("SUMA--------------------------------------");
      FlagIn = 0;
      test_suma();
      FlagIn = 1;
      test_suma();
      $display ("INCREMENTAR-------------------------------");
      test_incrementar();
      $display ("DECREMENTAR-------------------------------");
      test_decrementar();
      $display ("NOT---------------------------------------");
      test_not();
      $display ("RESTA-------------------------------------");
      FlagIn = 0;
      test_resta();
      FlagIn = 1;
      test_resta();
      $display ("XOR---------------------------------------");
      test_xor();
      $display ("CORRIMIENTO IZQUIERDA---------------------");
      test_corrimiento_izquierda();
      $display ("CORRIMIENTO DERECHA-----------------------");
      test_corrimiento_derecha();
      $finish;
   end

   initial begin
      $monitor (" %4b | %4b | %10b | %10h || %10h | %10h | %1b | %1b | %s", A, B, FlagIn, Control, Result, Esperado, C, Z, Result != Esperado ? "Error" : "");
   end
endmodule // alu_tb
