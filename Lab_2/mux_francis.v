`timescale 1ns / 1ps

module mux_francis(
    input wire a,
    input wire b,
    input wire sel,
    output wire z);
    assign z = sel ? b : a;
endmodule
