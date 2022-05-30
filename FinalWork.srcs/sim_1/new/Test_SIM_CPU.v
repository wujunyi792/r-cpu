`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/24 01:50:10
// Design Name: 
// Module Name: Test_SIM_CPU
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


module Test_SIM_CPU;
    reg clk,rst,sw;
    wire [31:0]LED;
    CPU uut(
        .rst(rst),
        .clk(clk),
        .SW(sw),
        .LED(LED)
    );
    always #25 clk=~clk;
    initial begin 
    clk=0;rst=1;sw=1;
    #100;
    rst=0;
    #100;
    #100;
    #100;
    #100;
    #100;
    #100;
    #100;
    #100;
    sw=0;
    
    end
endmodule
