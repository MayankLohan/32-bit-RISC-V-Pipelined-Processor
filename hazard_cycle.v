`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2026 10:19:27 PM
// Design Name: 
// Module Name: hazard_cycle
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


module hazard_block(
    input rst, Reg_Write_M, Reg_Write_W,
    input [4:0] RD_M, RD_W, Rs1_E, Rs2_E,
    output [1:0] Forward_A_E, Forward_B_E
    );
    
    assign Forward_A_E = (rst == 1'b0) ? 2'b00 : 
                       ((Reg_Write_M == 1'b1) & (RD_M != 5'h00) & (RD_M == Rs1_E)) ? 2'b10 :
                       ((Reg_Write_W == 1'b1) & (RD_W != 5'h00) & (RD_W == Rs1_E)) ? 2'b01 : 2'b00;
                       
    assign Forward_B_E = (rst == 1'b0) ? 2'b00 : 
                       ((Reg_Write_M == 1'b1) & (RD_M != 5'h00) & (RD_M == Rs2_E)) ? 2'b10 :
                       ((Reg_Write_W == 1'b1) & (RD_W != 5'h00) & (RD_W == Rs2_E)) ? 2'b01 : 2'b00;
                                            
endmodule
