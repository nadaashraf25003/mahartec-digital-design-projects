`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2026 03:17:41 PM
// Design Name: 
// Module Name: Top_Keypad_ALU_Display
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

module Top_Keypad_ALU_Display(
    input [1:0] keypad_A,      // Input A from keypad
    input [1:0] keypad_B,      // Input B from keypad
    input [2:0] operation,     // Operation selector from keypad
    output [6:0] display_A,    // Segments for Top Display (Operand A)
    output [6:0] display_B,    // Segments for Middle Display (Operand B)
    output [6:0] display_Res   // Segments for Bottom Display (ALU Result)
    );

    // Internal wire to hold the 4-bit result from the ALU
    wire [3:0] alu_out;

    // 1. Instantiate the ALU
    // This processes the keypad inputs
    ALU main_alu (
        .A(keypad_A), 
        .B(keypad_B), 
        .ALU_sel(operation), 
        .ALU_result(alu_out)
    );

    // 2. Instantiate 7-Segment Decoder for Input A
    // We pad keypad_A with leading zeros to make it 4-bit for the decoder
    sevenSegments dec_A (
        .bcd({2'b00, keypad_A}), 
        .dec(display_A)
    );

    // 3. Instantiate 7-Segment Decoder for Input B
    sevenSegments dec_B (
        .bcd({2'b00, keypad_B}), 
        .dec(display_B)
    );

    // 4. Instantiate 7-Segment Decoder for the Result
    sevenSegments dec_Result (
        .bcd(alu_out), 
        .dec(display_Res)
    );

endmodule