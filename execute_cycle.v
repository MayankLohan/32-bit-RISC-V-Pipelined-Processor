`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/12/2026 11:43:20 PM
// Design Name: 
// Module Name: execute_cycle
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


module execute_cycle (
    input clk, rst,
    input Reg_Write_E, ALU_Source_E, Mem_Write_E, Result_Source_E, Branch_E,
    input [2:0] ALU_Control_E,
    input [31:0] RD1_E, RD2_E, Imm_Extend_E,
    input [4:0] RD_E,
    input [31:0] PC_E, PC_Plus4_E,
    input [31:0] Result_W,
    input [1:0] Forward_A_E, Forward_B_E,

    output PC_Source_E, Reg_Write_M, Mem_Write_M, Result_Source_M,
    output [4:0] RD_M,
    output [31:0] PC_Plus4_M, Write_Data_M, ALU_Result_M,
    output [31:0] PC_Target_E
    );

    //declaring internal wires
    wire [31:0] Source_A, Source_B_interim, Source_B;
    wire [31:0] Result_E;
    wire Zero_E;

    //declaring internal registers
    reg Reg_Write_E_r, Mem_Write_E_r, Result_Source_E_r;
    reg [4:0] RD_E_r;
    reg [31:0] PC_Plus4_E_r, RD2_E_r, Result_E_r;
    
    //intiation of modules
    //3 X 1 mux for A
    mux_3x1 Mux_A (
                        .w(RD1_E),
                        .x(Result_W),
                        .y(ALU_Result_M),
                        .s(Forward_A_E),
                        .z(Source_A)
                        );

    //3 X 1 mux for B
    mux_3x1 Mux_B (
                        .w(RD2_E),
                        .x(Result_W),
                        .y(ALU_Result_M),
                        .s(Forward_B_E),
                        .z(Source_B_interim)
                        );
                        
    //declaring alu mux
    mux Alu_Mux (Source_B_interim, Imm_Extend_E, ALU_Source_E, Source_B);
    
    //declaring adder
    pc_adder Branch_Adder (PC_E, Imm_Extend_E, PC_Target_E);
    
    //declaring alu
    alu ALU (
            .A(Source_A),
            .B(Source_B),
            .Result(Result_E),
            .ALU_Control(ALU_Control_E),
            .Zero(Zero_E)
            );
    
    //register logic
    always @(posedge clk or negedge rst) begin
        if(rst == 1'b0) begin
            Reg_Write_E_r <= 1'b0; 
            Mem_Write_E_r <= 1'b0; 
            Result_Source_E_r <= 1'b0;
            RD_E_r <= 5'h00;
            PC_Plus4_E_r <= 32'h00000000; 
            RD2_E_r <= 32'h00000000; 
            Result_E_r <= 32'h00000000;
        end
        else begin
            Reg_Write_E_r <= Reg_Write_E; 
            Mem_Write_E_r <= Mem_Write_E; 
            Result_Source_E_r <= Result_Source_E;
            RD_E_r <= RD_E;
            PC_Plus4_E_r <= PC_Plus4_E; 
            RD2_E_r <= Source_B_interim; 
            Result_E_r <= Result_E;
        end
    end

    //output assignments   
    assign PC_Source_E = Zero_E & Branch_E;
    assign Reg_Write_M = Reg_Write_E_r;
    assign Mem_Write_M = Mem_Write_E_r;
    assign Result_Source_M = Result_Source_E_r;
    assign RD_M = RD_E_r;
    assign PC_Plus4_M = PC_Plus4_E_r;
    assign Write_Data_M = RD2_E_r;
    assign ALU_Result_M = Result_E_r;
    
endmodule
