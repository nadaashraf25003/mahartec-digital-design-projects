`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2026 03:34:57 PM
// Design Name: 
// Module Name: seconds_counter_top
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


module seconds_counter_top (
    input clk,    // 1Hz clock for actual seconds
    input reset,
    output [6:0] seg_units, // 7-segments for right digit (0-9)
    output [6:0] seg_tens    // 7-segments for left digit (0-5)
);

    wire [3:0] units_val;
    wire [3:0] tens_val;
    wire units_done;

    // --- UNITS COUNTER (0-9) ---
    // Always enabled (enable = 1)
    bcd_counter_flexible #(.MAX_COUNT(9)) units_cnt (
        .clk(clk),
        .reset(reset),
        .enable(1'b1),
        .count(units_val),
        .tc(units_done) // High when units reaches 9
    );

    // --- TENS COUNTER (0-5) ---
    // Only increments when units_done is high
    bcd_counter_flexible #(.MAX_COUNT(5)) tens_cnt (
        .clk(clk),
        .reset(reset),
        .enable(units_done),
        .count(tens_val),
        .tc() // Not needed unless connecting to Minutes
    );

    // --- DECODER FOR UNITS ---
    decoder_7seg units_dec (
        .A(units_val[3]), .B(units_val[2]), .C(units_val[1]), .D(units_val[0]),
        .led_a(seg_units[6]), .led_b(seg_units[5]), .led_c(seg_units[4]),
        .led_d(seg_units[3]), .led_e(seg_units[2]), .led_f(seg_units[1]), .led_g(seg_units[0])
    );

    // --- DECODER FOR TENS ---
    decoder_7seg tens_dec (
        .A(tens_val[3]), .B(tens_val[2]), .C(tens_val[1]), .D(tens_val[0]),
        .led_a(seg_tens[6]), .led_b(seg_tens[5]), .led_c(seg_tens[4]),
        .led_d(seg_tens[3]), .led_e(seg_tens[2]), .led_f(seg_tens[1]), .led_g(seg_tens[0])
    );

endmodule