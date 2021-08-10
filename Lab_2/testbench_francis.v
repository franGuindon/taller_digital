`timescale 1ns / 1ps

module testbench_francis;

reg a = 0;
reg b = 0;
reg sel = 0;

wire z;

mux_francis uut( .a(a), .b(b), .sel(sel), .z(z) );

initial
begin
    a = 1;
    b = 0;
    sel = 0;
    forever #5 sel = ~sel;
end

endmodule