`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2026 01:01:00 PM
// Design Name: 
// Module Name: mux_2_1_tb
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


 
module mux_2_1_tb; 
  reg s, d0, d1; 
  wire y; 
  mux_2_1 mux_dut(s,d0,d1,y); 
initial 
  begin 
    s= 0; d0 = 0; d1 =0;  
    #10 s=0; d0=0; d1=1; // select d0=0 
    #10 s=0; d0=1; d1=0; // select d0=1 
    #10 s=1; d0=0; d1=1; // select d1=1 
    #10 s=1; d0=1; d1=0; // select d1=0  
  end 
endmodule 