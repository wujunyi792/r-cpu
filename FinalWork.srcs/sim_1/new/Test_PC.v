`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/23 21:35:13
// Design Name: 
// Module Name: Test_PC
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


module Test_PC();
    reg clk, rst;
    wire [31:0]Inst_code;
    PC uut (
		.clk(clk),
		.rst(rst),
		.Inst_code(Inst_code)
	);
	always #25 clk=~clk;
	initial begin
        clk=0;
        rst=0;
	end
endmodule
