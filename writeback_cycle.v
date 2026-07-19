`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/13/2026 05:55:27 PM
// Design Name: 
// Module Name: writeback_cycle
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


module writeback_cycle(
    input clk, rst, Result_Source_W,
    input [31:0] PC_Plus4_W, ALU_Result_W, Read_Data_W,
    
    output [31:0] Result_W
    );
    
    //initiation of module
    //declaring the mux
    mux Result_Mux (ALU_Result_W, Read_Data_W, Result_Source_W, Result_W);
    
endmodule
