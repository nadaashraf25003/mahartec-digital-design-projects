`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2026 12:58:59 PM
// Design Name: 
// Module Name: mux_2_1
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

// ------------------- Mux 2-1 ---------------------// 
module mux_2_1(S,D0,D1,Y); 
input S, D0, D1; 
output Y; 
wire not_S, out_G2, out_G3; 
notGate G1(S, not_S); 
andGate G2(D0, not_S, out_G2); 
andGate G3(D1, S, out_G3); 
orGate G4(out_G2, out_G3, Y); 
endmodule 
 
 
// ------------------- AND Gate ---------------------// 
module andGate (a,b,c); 
input a, b; 
output c; 
assign c = a & b; 
endmodule 

// ------------------- Or Gate ---------------------// 
module orGate (a,b,c); 
input a, b; 
output c; 
assign c = a | b; 
endmodule 
// ------------------- Not Gate ---------------------// 
module notGate (a,c); 
input a; 
output c; 
assign c = ~a; 
endmodule 