`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2026 03:24:50 PM
// Design Name: 
// Module Name: counter_to_decoder
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

module counter_to_decoder ( clk, reset, segment_leds); 
 
input clk , reset ; 
output [6:0] segment_leds; 
wire [3:0] count_wire; 
 
// Instantiation of the BCD counter  
bcd_counter bcd_counter_dut ( clk, reset, count_wire); 
 
// Instantiation of the seven segments decoder   
decoder_7seg decoder_7seg_dut ( count_wire[3], 
count_wire[2], count_wire[1], count_wire[0], 
segment_leds[6], segment_leds[5], segment_leds[4], 
segment_leds[3], segment_leds[2], segment_leds[1], 
segment_leds[0] ); 
 
endmodule 
