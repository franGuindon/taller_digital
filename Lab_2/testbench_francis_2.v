`timescale 1ns / 1ps

module testbench_francis_2;

   parameter DATA_WIDTH=4;
   
   reg [DATA_WIDTH-1:0] in0, in1, in2, in3;
   reg [1:0] 		sel;
   wire [DATA_WIDTH-1:0] out;
   
   integer 		 i;
   

   mux_francis_2 #(.DATA_WIDTH(DATA_WIDTH)) uut (.in0(in0), .in1(in1), .in2(in2), .in3(in3), .sel(sel), .out(out));

   task test1();
      begin
	 sel = 0;
	 in0 = $random;
	 in1 = $random;
	 in2 = $random;
	 in3 = $random;

	 for (i = 1; i < 4; i=i+1) begin
	    #5 sel = i;
	 end
      end
   endtask // test1

   initial
     begin
	test1();
	#5;
	$finish;
     end
   initial
     begin
	$dumpvars;
	$display ("in0 | in1 | in2 | in3 | sel | out |");
	$monitor (" %h |  %h |  %h |  %h | %b  | %h  |", in0, in1, in2, in3, sel, out);
     end
endmodule
