`timescale 1ns / 1ps

module mux_4_1_tb;
      
   reg [15:0] in0, in1, in2, in3;
   
   reg [1:0]  sel;
   
   wire [3:0] out0;
   wire [7:0] out1;
   wire [15:0] out2;
   
   integer     i, j;

   mux_4_1 #(.DATA_WIDTH(4)) mux_4 (.in0(in0), .in1(in1), .in2(in2), .in3(in3),
				    .sel(sel),
				    .out(out0));
   mux_4_1 #(.DATA_WIDTH(8)) mux_8 (.in0(in0), .in1(in1), .in2(in2), .in3(in3),
				    .sel(sel),
				    .out(out1));
   mux_4_1 #(.DATA_WIDTH(16)) mux_16 (.in0(in0), .in1(in1), .in2(in2), .in3(in3),
				      .sel(sel),
				      .out(out2));

   task test_selection_with_random_inputs();
      begin
	 in0 = $random;
	 in1 = $random;
	 in2 = $random;
	 in3 = $random;

	 for (i = 0; i < 4; i=i+1) begin
	    sel = i;
	    #10;
	 end
      end
   endtask // test_selection_with_random_inputs

   initial
     begin
	$display (" %4s | %4s | %4s | %4s || %4s || %4s | %4s | %4s |", "in0", "in1", "in2", "in3", "sel", "out0", "out1", "out2");
	for (j = 0; j < 50; j = j + 1) begin
	   $display ("---------------------------------------------------------------------");
	   
	   test_selection_with_random_inputs();
	end
	$finish;
     end
   initial
     begin

	$monitor (" %4h | %4h | %4h | %4h || %4b || %4h | %4h | %4h |", in0, in1, in2, in3, sel, out0, out1, out2);
     end
endmodule // mux_4_1_tb
