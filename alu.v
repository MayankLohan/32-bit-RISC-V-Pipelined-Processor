`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/13/2026 12:42:19 PM
// Design Name: 
// Module Name: alu
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


module alu(
    input [31:0] A, B,
    input [2:0] ALU_Control,
    output Zero,
    output [31:0] Result
    );
    
    wire Cout;
    wire [31:0]Sum;
    
    assign Sum = (ALU_Control[0] == 1'b0) ? A + B : (A + ((~B) + 1));
    
    assign {Cout,Result} = (ALU_Control == 3'b000) ? Sum :
                           (ALU_Control == 3'b001) ? Sum :
                           (ALU_Control == 3'b010) ? A & B :
                           (ALU_Control == 3'b011) ? A | B :
                           (ALU_Control == 3'b101) ? {{32{1'b0}},(Sum[31])} : {33{1'b0}};
    
    assign Zero = &(~Result);
    
endmodule
