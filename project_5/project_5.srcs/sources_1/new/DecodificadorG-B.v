`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.08.2021 08:32:32
// Design Name: 
// Module Name: DecodificadorG-B
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module DecodificadorGB #( parameter N = 4 )(
    input [N-1:0] grey ,
    output wire [N-1:0] binary
     );
assign binary[N-1] = grey [N-1];

generate
genvar i;
    for(i=0;i<N-1;i=i+1) begin:b2g
        assign binary[i] = grey[i]^binary[i+1];
    end
endgenerate

endmodule
