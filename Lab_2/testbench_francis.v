`timescale 1ns / 1ps

module testbench_francis;

reg a, b, sel;

wire z;

mux_francis uut( .a(a), .b(b), .sel(sel), .z(z) );

task test1();
   begin
          a = 0; b = 0; sel = 0;
      #10 a = 0; b = 0; sel = 1;
      #10 a = 0; b = 1; sel = 0;
      #10 a = 0; b = 1; sel = 1;
      #10 a = 1; b = 0; sel = 0;
      #10 a = 1; b = 0; sel = 1;
      #10 a = 1; b = 1; sel = 0;
      #10 a = 1; b = 1; sel = 1;
   end
endtask // test1

initial
begin
   test1();
   #10;
   $finish;
end
initial
  begin
     $dumpvars;
     $display ("in1 |  in2 | sel |  out1 |");
     $monitor ("  %b |    %b |   %b |     %b |", a, b, sel, z); 
  end
endmodule
