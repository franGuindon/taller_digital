`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.08.2021 09:23:54
// Design Name: 
// Module Name: CODDEC
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


module CODDEC #( parameter N = 4 )(
input      [N-1:0] binario,
output wire [N-1:0] Result);

wire [N-1:0] conect;

begin 

Cod u1( .binario(binario), .gray(conect));

DecodificadorGB u2(.grey(conect),.binary(Result));

end

endmodule
