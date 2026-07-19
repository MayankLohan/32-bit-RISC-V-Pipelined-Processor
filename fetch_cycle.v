`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/11/2026 11:26:05 AM
// Design Name: 
// Module Name: fetch_cycle
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


module fetch_cycle(
input clk, rst, 
input PC_Source_E,
input [31:0] PC_Target_E,
output [31:0] Instruction_D,
output [31:0] PC_D, PC_Plus4_D 
    );
    
    //declaring internal signals
    wire [31:0] PC_F, PC_F1, PC_Plus4_F;
    wire [31:0] Instruction_F;
    
    //declaring registers
    reg [31:0] Instruction_F_reg;
    reg [31:0] PC_F_reg, PC_Plus4_F_reg;
    
    // intiation of modules
    // declaring pc mux
    mux PC_Mux (PC_Plus4_F, PC_Target_E, PC_Source_E, PC_F1);
    
    // declaring pc counter
    pc_counter Program_Counter (clk, rst, PC_F1, PC_F);
    
    //declaring instruction memory
    instruction_memory Instruction_Memory (rst, PC_F, Instruction_F);
    
    //declaring pc adder
    pc_adder PC_Adder (PC_F, 32'h00000004, PC_Plus4_F);
    
    //fetch cycle register logic
    always @(posedge clk or negedge rst) begin
        if (rst == 1'b0) begin
            Instruction_F_reg <= 32'h00000000;
            PC_F_reg <= 32'h00000000;
            PC_Plus4_F_reg <= 32'h00000000;
        end
        else begin
            Instruction_F_reg <= Instruction_F;
            PC_F_reg <= PC_F;
            PC_Plus4_F_reg <= PC_Plus4_F;
        end
    end
    
    //assigning registers values to output ports
    assign Instruction_D = (rst == 1'b0) ? 32'h00000000 : Instruction_F_reg;
    assign PC_D = (rst == 1'b0) ? 32'h00000000 : PC_F_reg;
    assign PC_Plus4_D = (rst == 1'b0) ? 32'h00000000 : PC_Plus4_F_reg;        
endmodule
