`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/23 11:54:34
// Design Name: 
// Module Name: Test_CPU
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


module Test_CPU();
    reg rst, SW, clk;
    wire LED;
    wire [31:0]ALU_OUT;
    wire [31:0]Inst_code;
    CPU uut(.rst(rst), .clk(clk), .SW(SW), .LED(LED), .ALU_OUT(ALU_OUT), .Inst_code(Inst_code));
    always #25 clk=~clk;
    initial begin
        clk=0;rst=0;SW=0;
        #100;
    end
endmodule
