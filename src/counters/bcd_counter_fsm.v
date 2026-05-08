`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2026 03:53:26 PM
// Design Name: 
// Module Name: bcd_counter_fsm
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

`timescale 1ns / 1ps

module bcd_counter_fsm (
    input clk, 
    input reset, 
    output reg [3:0] bcd_out
);
    // State definitions
    parameter S0=0, S1=1, S2=2, S3=3, S4=4, S5=5, S6=6, S7=7, S8=8, S9=9;
    reg [3:0] state;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= S0;
            bcd_out <= 4'b0000;
        end else begin
            case (state)
                S0: state <= S1;
                S1: state <= S2;
                S2: state <= S3;
                S3: state <= S4;
                S4: state <= S5;
                S5: state <= S6;
                S6: state <= S7;
                S7: state <= S8;
                S8: state <= S9;
                S9: state <= S0;
                default: state <= S0;
            endcase
            bcd_out <= state; // Output follows the current state
        end
    end
endmodule
