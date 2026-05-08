`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2026 03:48:53 PM
// Design Name: 
// Module Name: one_hot_counter
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


module one_hot_counter (clk, reset, oneHot); 
input clk, reset; 
output [9:0] oneHot; 
// Instantiation of the  clcok divider  
clock_divider clock_divider_1Hz (clk, reset, CLK1Hz); 
// Instantiation of the one hot couter fsm  
one_hot_counter_fsm one_hot_cnt (CLK1Hz,reset, oneHot); 
endmodule 