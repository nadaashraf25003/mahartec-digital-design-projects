`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2026 01:29:09 PM
// Design Name: 
// Module Name: JohnsonCounter_tb
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

module JohnsonCounter_tb();

    // Inputs
    reg clk;
    reg rstn;
    reg [3:0] d; // Note: 'd' is defined in your module but unused in the logic

    // Outputs
    wire [3:0] q;

    // Instantiate the Unit Under Test (UUT)
    JohnsonCounter uut (
        .d(d), 
        .rstn(rstn), 
        .clk(clk), 
        .q(q)
    );

    // Clock generation (100MHz -> 10ns period)
    always begin
        #5 clk = ~clk;
    end

    initial begin
        // Initialize Inputs
        clk = 0;
        rstn = 0;
        d = 4'b0000;

        // Hold reset state for 20ns
        #20;
        rstn = 1;
        
        // Wait for 10 clock cycles to observe the full 8-state sequence
        // Plus a few extra to see the wrap-around
        #120;

        // Test asynchronous reset during operation
        $display("Applying mid-run reset...");
        rstn = 0;
        #10;
        rstn = 1;

        #40;
        
        // End simulation
        $display("Simulation Complete.");
        $finish;
    end
      
    // Monitor the output in the console
    initial begin
        $monitor("Time: %0t | Reset: %b | Output Q: %b", $time, rstn, q);
    end

endmodule
