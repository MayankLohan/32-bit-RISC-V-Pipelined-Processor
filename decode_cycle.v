`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/12/2026 02:17:54 AM
// Design Name: 
// Module Name: decode_cycle
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


module decode_cycle(
    input clk, rst,
    input Reg_Write_W,
    input [4:0] RD_W, 
    input [31:0] Instruction_D, PC_D, PC_Plus4_D, Result_W,
    
    output Reg_Write_E, ALU_Source_E, Mem_Write_E, Result_Source_E, Branch_E,
    output [2:0] ALU_Control_E,
    output [31:0] RD1_E, RD2_E, Imm_Extend_E,
    output [4:0] RS1_E, RS2_E, RD_E,
    output [31:0] PC_E, PC_Plus4_E
    );
    
    //declaring internal wires
    wire Reg_Write_D, ALU_Source_D, Mem_Write_D, Result_Source_D, Branch_D;
    wire [1:0] Imm_Source_D;
    wire [2:0] ALU_Control_D;
    wire [31:0] RD1_D, RD2_D, Imm_Extend_D;
    
    // declaring internal registers
    reg Reg_Write_D_r, ALU_Source_D_r, Mem_Write_D_r, Result_Source_D_r, Branch_D_r;
    reg [2:0] ALU_Control_D_r;
    reg [31:0] RD1_D_r, RD2_D_r, Imm_Extend_D_r;
    reg [4:0] RD_D_r, RS1_D_r, RS2_D_r;
    reg [31:0] PC_D_r, PC_Plus4_D_r;
    
    //initiation of modules
    //declaring the control unit
    control_unit Control_Unit (
                               .Op (Instruction_D[6:0]),
                               .Reg_Write (Reg_Write_D),
                               .Imm_Source (Imm_Source_D),
                               .ALU_Source (ALU_Source_D),
                               .Mem_Write (Mem_Write_D),
                               .Result_Source (Result_Source_D),
                               .Branch (Branch_D),
                               .funct3 (Instruction_D[14:12]),
                               .funct7 (Instruction_D[31:25]),
                               .ALU_Control (ALU_Control_D)
                               );
                            
    //declaring register file
    register_file Register_File (
                            .clk (clk),
                            .rst (rst),
                            .WE (Reg_Write_W),
                            .WD (Result_W),
                            .A1 (Instruction_D[19:15]),
                            .A2 (Instruction_D[24:20]),
                            .A3 (RD_W),
                            .RD1 (RD1_D),
                            .RD2 (RD2_D)
                            );
                                                      
    //declaring sign extend
    sign_extend Sign_Extend(
                            .In (Instruction_D[31:0]),
                            .Imm_Extend (Imm_Extend_D),
                            .Imm_Source (Imm_Source_D)
                            );                                                      
               
    //declaring register logic
    always @(posedge clk or negedge rst) begin
        if(rst == 1'b0) begin
            Reg_Write_D_r <= 1'b0;
            ALU_Source_D_r <= 1'b0;
            Mem_Write_D_r <= 1'b0;
            Result_Source_D_r <= 1'b0;
            Branch_D_r <= 1'b0;
            ALU_Control_D_r <= 3'b000;
            RD1_D_r <= 32'h00000000; 
            RD2_D_r <= 32'h00000000; 
            Imm_Extend_D_r <= 32'h00000000;
            RD_D_r <= 5'h00;
            PC_D_r <= 32'h00000000; 
            PC_Plus4_D_r <= 32'h00000000;
            RS1_D_r <= 5'h00;
            RS2_D_r <= 5'h00;
        end
        else begin
            Reg_Write_D_r <= Reg_Write_D;
            ALU_Source_D_r <= ALU_Source_D;
            Mem_Write_D_r <= Mem_Write_D;
            Result_Source_D_r <= Result_Source_D;
            Branch_D_r <= Branch_D;
            ALU_Control_D_r <= ALU_Control_D;
            RD1_D_r <= RD1_D; 
            RD2_D_r <= RD2_D; 
            Imm_Extend_D_r <= Imm_Extend_D;
            RD_D_r <= Instruction_D[11:7];
            PC_D_r <= PC_D; 
            PC_Plus4_D_r <= PC_Plus4_D;
            RS1_D_r <= Instruction_D[19:15];
            RS2_D_r <= Instruction_D[24:20];
        end
    end

    //output asssign statements
    assign Reg_Write_E = Reg_Write_D_r;
    assign ALU_Source_E = ALU_Source_D_r;
    assign Mem_Write_E = Mem_Write_D_r;
    assign Result_Source_E = Result_Source_D_r;
    assign Branch_E = Branch_D_r;
    assign ALU_Control_E = ALU_Control_D_r;
    assign RD1_E = RD1_D_r;
    assign RD2_E = RD2_D_r;
    assign Imm_Extend_E = Imm_Extend_D_r;
    assign RD_E = RD_D_r;
    assign PC_E = PC_D_r;
    assign PC_Plus4_E = PC_Plus4_D_r;
    assign RS1_E = RS1_D_r;
    assign RS2_E = RS2_D_r;   
                                                         
endmodule
