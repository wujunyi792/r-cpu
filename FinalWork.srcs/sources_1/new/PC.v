`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/23 08:58:48
// Design Name: 
// Module Name: PC
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


module PC(input clk,input rst,output [31:0]Inst_code);
	reg [31:0]PC;
	wire[31:0]PC_new;
	initial PC<=32'h00000000;
	RAM ram (
		.clka(clk),
		.addra(PC[7:2]), 
		.douta(Inst_code)
		);
	assign PC_new=PC+4;
	always@(negedge clk or posedge rst)
	begin
		if(rst) PC=32'h00000000;
		else PC={24'h000000,PC_new[7:0]};
	end
endmodule
