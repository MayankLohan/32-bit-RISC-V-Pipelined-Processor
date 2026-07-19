`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/12/2026 01:29:52 PM
// Design Name: 
// Module Name: alu_decoder
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


module alu_decoder(
input [1:0]ALUOp,
input [2:0]funct3,
input [6:0]funct7,Op,
output [2:0]ALU_Control
    );
    
    assign ALU_Control = (ALUOp == 2'b00) ? 3'b000 : (ALUOp == 2'b01) ? 3'b001 :
                         ((ALUOp == 2'b10) & (funct3 == 3'b000) & ({Op[5],funct7[5]} == 2'b11)) ? 3'b001 : 
                         ((ALUOp == 2'b10) & (funct3 == 3'b000) & ({Op[5],funct7[5]} != 2'b11)) ? 3'b000 : 
                         ((ALUOp == 2'b10) & (funct3 == 3'b010)) ? 3'b101 : 
                         ((ALUOp == 2'b10) & (funct3 == 3'b110)) ? 3'b011 : 
                         ((ALUOp == 2'b10) & (funct3 == 3'b111)) ? 3'b010 : 3'b000;
                                                                  
endmodule
