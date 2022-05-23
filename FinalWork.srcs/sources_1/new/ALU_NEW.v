`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/23 08:58:12
// Design Name: 
// Module Name: ALU_NEW
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


module ALU_NEW(OF,ZF,ALU_OP,A,B,OUT);
    input [2:0]ALU_OP;
    input [31:0]A,B;
    output reg[31:0]OUT;
    reg C32;
    output reg OF;
    output reg ZF;
    always @(*)
    begin
	   OF = 0;
	   C32 = 0;
	   case(ALU_OP)
	        3'b000:OUT<=A&B;
	        3'b001:OUT<=A|B;
	        3'b010:OUT<=A^B;
	        3'b011:OUT<=A~^B;
	        3'b100:begin {C32,OUT}=A+B;OF = A[31]^B[31]^OUT[31]^C32; end
			3'b101:begin {C32,OUT}=A-B;OF = A[31]^B[31]^OUT[31]^C32; end 
			3'b110:begin OUT=A<B; end
			3'b111:begin OUT=B<<A; end
	   endcase
	   ZF= OUT==0;
    end
endmodule
