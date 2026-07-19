`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/13/2026 09:04:02 PM
// Design Name: 
// Module Name: top_pipeline
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


module top_pipeline(
input clk, rst
    );
    
    //declaring of internal wires
        
    wire PC_Source_E, Reg_Write_W, Reg_Write_E, ALU_Source_E, Mem_Write_E, Result_Source_E, Branch_E,
         Reg_Write_M, Mem_Write_M, Result_Source_M, Result_Source_W;
    wire [2:0] ALU_Control_E;
    wire [4:0] RD_E, RD_M, RD_W;
    wire [31:0] PC_Target_E, Instruction_D, PC_D, PC_Plus4_D, Result_W, RD1_E, RD2_E, Imm_Extend_E,
         PC_E, PC_Plus4_E, PC_Plus4_M, Write_Data_M, ALU_Result_M;
    wire [31:0] PC_Plus4_W, ALU_Result_W, Read_Data_W;
    wire [4:0] RS1_E, RS2_E;
    wire [1:0] Forward_A_E, Forward_B_E;  
    
    //initiation of modules
    //fetch cycle
    fetch_cycle Fetch_Cycle (
                            .clk(clk), 
                            .rst(rst), 
                            .PC_Source_E(PC_Source_E), 
                            .PC_Target_E(PC_Target_E), 
                            .Instruction_D(Instruction_D), 
                            .PC_D(PC_D), 
                            .PC_Plus4_D(PC_Plus4_D)
                            );
    
    //decode cycle
    decode_cycle Decode_Cycle (
                               .clk(clk), 
                               .rst(rst), 
                               .Instruction_D(Instruction_D), 
                               .PC_D(PC_D), 
                               .PC_Plus4_D(PC_Plus4_D), 
                               .Reg_Write_W(Reg_Write_W), 
                               .RD_W(RD_W), 
                               .Result_W(Result_W), 
                               .Reg_Write_E(Reg_Write_E), 
                               .ALU_Source_E(ALU_Source_E), 
                               .Mem_Write_E(Mem_Write_E), 
                               .Result_Source_E(Result_Source_E),
                               .Branch_E(Branch_E),  
                               .ALU_Control_E(ALU_Control_E), 
                               .RD1_E(RD1_E), 
                               .RD2_E(RD2_E), 
                               .Imm_Extend_E(Imm_Extend_E), 
                               .RD_E(RD_E), 
                               .PC_E(PC_E), 
                               .PC_Plus4_E(PC_Plus4_E),
                               .RS1_E(RS1_E),
                               .RS2_E(RS2_E)
                               );
    
    //execute cycle
    execute_cycle Execute_Cycle (
                               .clk(clk), 
                               .rst(rst), 
                               .Reg_Write_E(Reg_Write_E), 
                               .ALU_Source_E(ALU_Source_E), 
                               .Mem_Write_E(Mem_Write_E), 
                               .Result_Source_E(Result_Source_E), 
                               .Branch_E(Branch_E), 
                               .ALU_Control_E(ALU_Control_E), 
                               .RD1_E(RD1_E), 
                               .RD2_E(RD2_E), 
                               .Imm_Extend_E(Imm_Extend_E), 
                               .RD_E(RD_E), 
                               .PC_E(PC_E), 
                               .PC_Plus4_E(PC_Plus4_E), 
                               .PC_Source_E(PC_Source_E), 
                               .PC_Target_E(PC_Target_E), 
                               .Reg_Write_M(Reg_Write_M), 
                               .Mem_Write_M(Mem_Write_M), 
                               .Result_Source_M(Result_Source_M), 
                               .RD_M(RD_M), 
                               .PC_Plus4_M(PC_Plus4_M), 
                               .Write_Data_M(Write_Data_M), 
                               .ALU_Result_M(ALU_Result_M),
                               .Result_W(Result_W),
                               .Forward_A_E(Forward_A_E),
                               .Forward_B_E(Forward_B_E)
                               );
    
    //memory cycle
    memory_cycle Memory_Cycle (
                            .clk(clk), 
                            .rst(rst), 
                            .Reg_Write_M(Reg_Write_M), 
                            .Mem_Write_M(Mem_Write_M), 
                            .Result_Source_M(Result_Source_M), 
                            .RD_M(RD_M), 
                            .PC_Plus4_M(PC_Plus4_M), 
                            .Write_Data_M(Write_Data_M), 
                            .ALU_Result_M(ALU_Result_M), 
                            .Reg_Write_W(Reg_Write_W), 
                            .Result_Source_W(Result_Source_W), 
                            .RD_W(RD_W), 
                            .PC_Plus4_W(PC_Plus4_W), 
                            .ALU_Result_W(ALU_Result_W), 
                            .Read_Data_W(Read_Data_W)
                            );
    
    //writeback cycle
    writeback_cycle WriteBack_Cycle (
                                .clk(clk), 
                                .rst(rst), 
                                .Result_Source_W(Result_Source_W), 
                                .PC_Plus4_W(PC_Plus4_W), 
                                .ALU_Result_W(ALU_Result_W), 
                                .Read_Data_W(Read_Data_W), 
                                .Result_W(Result_W)
                                );
                                
    //hazard block
    hazard_block Hazard_Block (
                            .rst(rst), 
                            .Reg_Write_M(Reg_Write_M), 
                            .Reg_Write_W(Reg_Write_W), 
                            .RD_M(RD_M), 
                            .RD_W(RD_W), 
                            .Rs1_E(RS1_E), 
                            .Rs2_E(RS2_E), 
                            .Forward_A_E(Forward_A_E), 
                            .Forward_B_E(Forward_B_E)
                            );        
        
endmodule
