`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/11/2026 12:02:39 PM
// Design Name: 
// Module Name: instruction_memory
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


module instruction_memory(
input rst,
input [31:0] A,
output [31:0] RD
    );
    
    reg [31:0] memory [1023:0];
    
    assign RD = (rst == 1'b0) ? {32{1'b0}} : memory[A[31:2]];
    
    initial begin
        $readmemh("memfile.hex", memory);
    end
    
endmodule
