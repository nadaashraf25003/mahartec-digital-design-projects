`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2026 03:54:09 PM
// Design Name: 
// Module Name: bcd_counter_top
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

module bcd_counter_top (
    input clk,      // Master Clock (e.g., 50MHz or 100MHz)
    input reset, 
    output [3:0] bcd_out
);

    wire clk_1Hz;

    // Reuse your existing clock_divider
    clock_divider slow_clk (
        .clk(clk), 
        .reset(reset), 
        .CLK1Hz(clk_1Hz)
    );

    // Instantiate the BCD FSM
    bcd_counter_fsm fsm_inst (
        .clk(clk_1Hz), 
        .reset(reset), 
        .bcd_out(bcd_out)
    );

endmodule