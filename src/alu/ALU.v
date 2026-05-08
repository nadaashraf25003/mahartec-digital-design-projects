`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2026 02:53:34 PM
// Design Name: 
// Module Name: ALU
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


module ALU ( A, B, ALU_sel, ALU_result); 
input [1:0] A,B; // ALU 2-bit Inputs 
input [2:0] ALU_sel; // ALU 3-bit Selector  
output [3:0] ALU_result; // ALU 4-bit Output 
reg [3:0] ALU_result; 
always @(*) 
    begin 
        case(ALU_sel) 
        3'b000: // Logical and 
           ALU_result = A & B;  
        3'b001: // Logical or 
           ALU_result = A | B; 
        3'b010: // Addition 
           ALU_result = A + B; 
        3'b011: // Subtraction 
           ALU_result = A - B; 
        3'b100: // Multiplication 
           ALU_result = A * B; 
        3'b101: // Greater comparison 
           ALU_result = A > B? 4'b1010:4'b1011; 
        3'b110: // lower comparison 
           ALU_result = A < B? 4'b1011:4'b1010; 
        3'b111: // Equal comparison 
           ALU_result = A == B? 4'b1100:4'b0000; 
        default: ALU_result = 4'b0 ;  
        endcase 
    end 
endmodule 
