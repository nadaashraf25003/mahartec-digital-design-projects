`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2026 03:34:29 PM
// Design Name: 
// Module Name: bcd_counter_flexible
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


module bcd_counter_flexible #(parameter MAX_COUNT = 9) (
    input clk, 
    input reset,
    input enable, // Only count if the previous stage finished
    output reg [3:0] count,
    output tc // Terminal Count: high when we reach the limit
);
    assign tc = (count == MAX_COUNT && enable);

    always @ (posedge clk or posedge reset) begin
        if(reset)
            count <= 4'b0;
        else if (enable) begin
            if (count >= MAX_COUNT)
                count <= 4'b0;
            else
                count <= count + 1'b1;
        end
    end
endmodule