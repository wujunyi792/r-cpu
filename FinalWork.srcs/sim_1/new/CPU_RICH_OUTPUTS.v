`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/24 01:43:24
// Design Name: 
// Module Name: CPU_RICH_OUTPUTS
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


module CPU_RICH_OUTPUTS( rst, clk, SW, LED, ALU_OUT, Inst_code,R_Data_A,R_Data_B, Write_Reg, Func, OP, RS, RT, RD, Shamt);
    input SW,rst,clk;
    output [31:0]LED;
    output wire [31:0]Inst_code;
    wire ZF,OF;
    output reg Write_Reg;//写控制信号
	output wire [31:0]R_Data_A;//A端口读出数据
	output wire [31:0]R_Data_B;//B端口读出数据
	output wire [31:0]ALU_OUT;
	output [5:0]Func;
	output [4:0]RS, RT, RD, Shamt;
	wire [5:0]OPCode;
	output reg [3:0]OP;
	assign OPCode = Inst_code[31:26];
    assign RS = Inst_code[25:21];
    assign RT = Inst_code[20:16];
    assign RD = Inst_code[15:11];
    assign Shamt = Inst_code[10:6];
    assign Func = Inst_code[5:0];
    
    
    PC pc(clk, rst, Inst_code); //checked
    ALU_NEW alu(OF,ZF,OP,R_Data_A, R_Data_B, ALU_OUT); // ALU_NEW(OF,ZF,ALU_OP,A,B,OUT);
    LED led(ZF,OF,ALU_OUT,SW,LED);
    Register register(R_Data_A, R_Data_B, ALU_OUT, RS, RT, RD, Write_Reg, rst, clk); 
    
    
    always@(*)
    begin
        Write_Reg = 0;
        OP = 0;
        if(OPCode==0)
        begin
            case(Func)
                6'b100000:OP=3'b100;
                6'b100010:OP=3'b101;
                6'b100100:OP=3'b000;
                6'b100101:OP=3'b001;
                6'b100110:OP=3'b010;
                6'b100111:OP=3'b011;
                6'b101011:OP=3'b110;
                6'b000100:OP=3'b111;
           endcase
           Write_Reg=1;
        end
    end
endmodule
