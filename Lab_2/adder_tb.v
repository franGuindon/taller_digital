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

   reg [DATA_WIDTH-1:0]  i, j;
   
   task test1();
      begin
	 for (i = 0; i < 256; i=i+1) begin
	    for (j = 0; j < 256; j=j+1) begin
	       in0 = j;
	       in1 = i;
	       #10;
	    end
	 end
      end
   endtask // test1

   initial begin
      cin = 0;
      test1();
      cin = 1;
      test1();
      $finish;
   end

   initial begin
      $display ("| cin | in0 | in1 || cout | sum | checksum | notes");
      $monitor ("|   %b | %d | %d ||    %b | %d | %d | %s%s",
		cin, in0, in1, cout, sum, in0 + in1,
		sum != in0 + in1 ? "Error" : "", cout == 1 ? "overflow" : "");
   end
endmodule // adder_tb
