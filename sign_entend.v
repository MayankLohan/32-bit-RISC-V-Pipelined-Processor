`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/12/2026 02:16:36 PM
// Design Name: 
// Module Name: sign_entend
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


module sign_extend(
input [31:0] In,
input [1:0] Imm_Source,
output [31:0] Imm_Extend
    );
    
    assign Imm_Extend =  (Imm_Source == 2'b00) ? {{20{In[31]}},In[31:20]} : 
                         (Imm_Source == 2'b01) ? {{20{In[31]}},In[31:25],In[11:7]} : 32'h00000000;
    
endmodule
