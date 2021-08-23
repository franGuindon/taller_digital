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

	 for (i = 0; i < 131072; i=i+1)
	   begin
	      in0 = i [DATA_WIDTH-1:0];
	      in1 = i [DATA_WIDTH*2-1:DATA_WIDTH];
	      cin= i[DATA_WIDTH*2];
	      #10; 
	   end

   endtask // test1

   initial
     begin
	test1();
	$finish;
     end

   initial
     begin
	$display ("| cin | in0 | in1 || cout | sum | checksum | notes");
	$monitor ("|   %b | %d | %d ||    %b | %d | %d | %s %s",
		  cin, in0, in1, cout, sum, in0 + in1 + cin,
		  sum != in0 + in1 + cin ? "Error" : "", cout == 1 ? "overflow" : "");	
     end
endmodule // adder_tb

