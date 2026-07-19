`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2026 11:24:35 PM
// Design Name: 
// Module Name: mux_3x1
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


module mux_3x1(
    input [31:0] w, x, y,
    input [1:0] s,
    output [31:0] z
    );
    
    assign z = (s == 2'b00) ? w : (s == 2'b01) ? x : (s == 2'b10) ? y : 32'h00000000;
    
endmodule
