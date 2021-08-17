`timescale 1ns / 1ps
module cod_to_dec;
 
reg  [3:0] binario_tb;
wire [3:0] result_tb;
integer i;
 
CODDEC dut( binario_tb, result_tb );
 
initial
begin
    $display("binario  |  Result", binario_tb, result_tb);
    for (i = 0; i < 16; i = i + 1)
    begin
        binario_tb = i; #1
      $display(" %b    |    %b ", binario_tb, result_tb);
    end
    $finish;
end
endmodule
