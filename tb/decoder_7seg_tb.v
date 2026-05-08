`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2026 01:37:55 PM
// Design Name: 
// Module Name: decoder_7seg_tb
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

module decoder_7seg_tb();

    // Inputs
    reg A, B, C, D;

    // Outputs
    wire led_a, led_b, led_c, led_d, led_e, led_f, led_g;

    // Instantiate the Unit Under Test (UUT)
    decoder_7seg uut (
        .A(A), .B(B), .C(C), .D(D), 
        .led_a(led_a), .led_b(led_b), .led_c(led_c), 
        .led_d(led_d), .led_e(led_e), .led_f(led_f), 
        .led_g(led_g)
    );

    // Integer for the loop
    integer i;

    initial begin
        // Print Header
        $display("A B C D | a b c d e f g");
        $display("-----------------------");

        // Cycle through all 16 combinations (0 to 15)
        for (i = 0; i < 16; i = i + 1) begin
            {A, B, C, D} = i; // Concatenation to assign bits of i to inputs
            #10; // Wait 10ns for logic to settle
            
            $display("%b %b %b %b | %b %b %b %b %b %b %b", 
                     A, B, C, D, led_a, led_b, led_c, led_d, led_e, led_f, led_g);
        end

        #10;
        $finish;
    end

endmodule