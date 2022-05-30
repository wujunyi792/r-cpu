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
    wire [31:0]LED;
    wire [31:0]ALU_OUT;
    wire [31:0]Inst_code;
    wire [31:0]R_Data_A;
    wire [31:0]R_Data_B;
    wire Write_Reg;
    wire [5:0]Func;
    wire [3:0]OP;
    wire [4:0]RS,RT,RD,Shamt;
    CPU_RICH_OUTPUTS uut(
        .rst(rst), 
        .clk(clk), 
        .SW(SW), 
        .LED(LED), 
        .ALU_OUT(ALU_OUT),
        .Inst_code(Inst_code),
        .R_Data_A(R_Data_A),
        .R_Data_B(R_Data_B), 
        .Write_Reg(Write_Reg),
        .Func(Func),
        .OP(OP),
        .RS(RS),
        .RT(RT),
        .RD(RD),
        .Shamt(Shamt)
        );
    always #25 clk=~clk;
    initial begin
        clk=0;rst=1;SW=0;
        #100;
        rst=0;
    end
endmodule
