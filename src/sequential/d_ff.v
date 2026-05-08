`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2026 01:23:44 PM
// Design Name: 
// Module Name: d_ff
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

// ----------------- D-Flip Flop --------------------// 
// asynchronous reset D-flipflop  
module d_ff ( d, rstn, clk, q) ; 
input d, rstn, clk; 
output reg q; 
// D-flipflop is sensitive to positive edge clock and negative edge reset 
always @ (posedge clk or negedge rstn) 
// the output q is zero at negative reset 
if (!rstn) 
q <= 0; 
// else the output q follows the d input 
else 
q <= d; 
endmodule  
// --------------------------------------------------// 
