`timescale 1ns / 100ps

module adder_tb;

   parameter DATA_WIDTH=8;

   reg [DATA_WIDTH-1:0] in0, in1;
   reg 			cin;
   wire [DATA_WIDTH-1:0] sum;
   wire 		 cout;

   Adder #(.DATA_WIDTH(DATA_WIDTH)) uut (.in0(in0), .in1(in1),
					 .cin(cin),
					 .sum(sum),
					 .cout(cout));

   reg [DATA_WIDTH*2:0]  i;
   
   task test1();
      begin
	 for (i = 0; i < 131072; i=i+1) begin
	    cin = i[0];
	    in0 = i[8:1];
	    in1 = i[16:9];
	    #10;
	 end
      end
   endtask // test1

   initial
     begin
	test1();
	$finish;
     end

   initial
     begin
	$dumpvars;
	$display ("| cin | in0 | in1 || cout | sum | notes");
	$monitor ("|   %b | %d | %d ||    %b | %d | %s", cin, in0, in1, cout, sum, cout == 1 ? "overflow" : "");
     end
endmodule // adder_tb
