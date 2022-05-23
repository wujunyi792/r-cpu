`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/23 22:03:24
// Design Name: 
// Module Name: Test_ALU
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


module Test_ALU();
    reg [2:0]ALU_OP;
    reg [31:0]A,B;
    wire OF,ZF;
    wire [31:0]OUT;
    ALU_NEW uut(
        .OF(OF),
        .ZF(ZF),
        .ALU_OP(ALU_OP),
        .A(A),
        .B(B),
        .OUT(OUT)
    );
    initial begin
        ALU_OP=0;A=0;B=0;
        #100;
        ALU_OP=3'b010;A=3'b001;B=3'b010;
        #100;
        ALU_OP=3'b011;A=10;B=5;
         
    end
    
    
    

endmodule
