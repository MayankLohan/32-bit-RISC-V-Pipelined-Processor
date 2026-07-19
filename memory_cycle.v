`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/13/2026 03:19:31 PM
// Design Name: 
// Module Name: memory_cycle
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


module memory_cycle(
    input clk, rst, Reg_Write_M, Mem_Write_M, Result_Source_M,
    input [4:0] RD_M,
    input [31:0] PC_Plus4_M, Write_Data_M, ALU_Result_M,
    output Reg_Write_W, Result_Source_W,
    output [4:0] RD_W,
    output [31:0] PC_Plus4_W, ALU_Result_W, Read_Data_W
    );
    

    
    //declaring internal wires
    wire [31:0] Read_Data_M;
    
    //declaring internal registers
    reg Reg_Write_M_r, Result_Source_M_r;
    reg [4:0] RD_M_r;
    reg [31:0] PC_Plus4_M_r, ALU_Result_M_r, Read_Data_M_r;
    
    //initiating the module
    //declaring data memory
    data_memory Data_Memory(
                            .clk(clk),
                            .rst(rst),
                            .WE(Mem_Write_M),
                            .WD(Write_Data_M),
                            .A(ALU_Result_M),
                            .RD(Read_Data_M)
                            );
                            
    // Memory Stage Register Logic
    always @(posedge clk or negedge rst) begin
        if (rst == 1'b0) begin
            Reg_Write_M_r <= 1'b0; 
            Result_Source_M_r <= 1'b0;
            RD_M_r <= 5'h00;
            PC_Plus4_M_r <= 32'h00000000; 
            ALU_Result_M_r <= 32'h00000000; 
            Read_Data_M_r <= 32'h00000000;
        end
        else begin
            Reg_Write_M_r <= Reg_Write_M; 
            Result_Source_M_r <= Result_Source_M;
            RD_M_r <= RD_M;
            PC_Plus4_M_r <= PC_Plus4_M; 
            ALU_Result_M_r <= ALU_Result_M; 
            Read_Data_M_r <= Read_Data_M;
        end
    end 
    
    // Declaration of output assignments
    assign Reg_Write_W = Reg_Write_M_r;
    assign Result_Source_W = Result_Source_M_r;
    assign RD_W = RD_M_r;
    assign PC_Plus4_W = PC_Plus4_M_r;
    assign ALU_Result_W = ALU_Result_M_r;
    assign Read_Data_W = Read_Data_M_r;
endmodule

