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


module main_decoder(
input [6:0]Op,
output Reg_Write,ALU_Source,Mem_Write,Result_Source,Branch,
output [1:0]Imm_Source,ALUOp
    );

    assign Reg_Write = (Op == 7'b0000011 | Op == 7'b0110011 | Op == 7'b0010011 ) ? 1'b1 : 1'b0;
    assign Imm_Source = (Op == 7'b0100011) ? 2'b01 : (Op == 7'b1100011) ? 2'b10 : 2'b00;
    assign ALU_Source = (Op == 7'b0000011 | Op == 7'b0100011 | Op == 7'b0010011) ? 1'b1 : 1'b0;
    assign Mem_Write = (Op == 7'b0100011) ? 1'b1 : 1'b0;
    assign Result_Source = (Op == 7'b0000011) ? 1'b1 : 1'b0;
    assign Branch = (Op == 7'b1100011) ? 1'b1 : 1'b0;
    assign ALUOp = (Op == 7'b0110011) ? 2'b10 : (Op == 7'b1100011) ? 2'b01 : 2'b00;

endmodule
