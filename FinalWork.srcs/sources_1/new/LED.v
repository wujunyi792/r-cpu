`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/23 09:31:44
// Design Name: 
// Module Name: LED
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


module LED(input ZF, input OF, input [31:0]ALU_OUT,input SW,output reg[31:0]LED);
always @(*)
begin
    if(SW==1) LED=ALU_OUT;
    else LED={30'b0,ZF,OF};
end
endmodule
