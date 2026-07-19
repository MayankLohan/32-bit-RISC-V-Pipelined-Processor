`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/11/2026 11:53:35 AM
// Design Name: 
// Module Name: pc_counter
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


module pc_counter(
input clk, rst,
input [31:0] PC_Next,
output reg [31:0] PC
    );
    
    always@(posedge clk) begin
    if (rst == 1'b0)
        PC <= 32'b0;
    else
        PC <= PC_Next;
    end
    
endmodule
