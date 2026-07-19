`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/12/2026 02:24:46 AM
// Design Name: 
// Module Name: control_unit
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


module control_unit(
input [6:0]Op,funct7,
input [2:0]funct3,
output Reg_Write, ALU_Source, Mem_Write, Result_Source, Branch,
output [1:0]Imm_Source,
output [2:0]ALU_Control
    );
    
    //declaring wires
    wire [1:0]ALUOp;
    
    //initiate main decoder
    main_decoder Main_Decoder (Op, Reg_Write, ALU_Source, Mem_Write, Result_Source, Branch, Imm_Source, ALUOp);
    
    //initiate alu decoder
    alu_decoder Alu_Decoder (ALUOp, funct3, funct7, Op, ALU_Control);
    
endmodule
