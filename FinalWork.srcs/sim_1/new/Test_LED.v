`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/23 22:17:35
// Design Name: 
// Module Name: Test_LED
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


module Test_LED();
    reg SW,ZF,OF;
    reg [31:0]ALU_OUT;
    wire [31:0]LED;
    LED uut(
        .ZF(ZF),
        .OF(OF),
        .ALU_OUT(ALU_OUT),
        .SW(SW),
        .LED(LED)
    );
    initial begin
        ALU_OUT=0;ZF=0;OF=0;SW=0;
        #100;
        ZF=1;OF=0;
        #100;
        ZF=0;OF=1;
        #100;
        SW=1;
        #100;
        ALU_OUT=75;
        #100;
        ALU_OUT=200;    
    end
endmodule
