`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/12/2026 02:07:00 PM
// Design Name: 
// Module Name: register_file
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


module register_file(
input clk, rst, WE,
input [4:0] A1, A2, A3,
input [31:0] WD,
output [31:0] RD1, RD2
    );
    
    reg [31:0] Register [31:0];
    
    always @(posedge clk) begin
        if (WE & (A3 != 5'h00))
            Register[A3] <= WD;
    end
    
    assign RD1 = (rst == 1'b0) ? 32'd0 : Register[A1];
    assign RD2 = (rst == 1'b0) ? 32'd0 : Register[A2];
    
    initial begin
        Register[0] = 32'h00000000;
    end
     
endmodule
