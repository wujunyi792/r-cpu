`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/23 10:01:32
// Design Name: 
// Module Name: Register
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

module Register(R_Data_A,R_Data_B,W_Data,R_Addr_A,R_Addr_B,W_Addr,Write_Reg,reset,clk);
    input [4:0]R_Addr_A;//A端口读寄存器地址
    input [4:0]R_Addr_B;//B端口读寄存器地址
    input [4:0]W_Addr;//写寄存器地址
    input [31:0]W_Data;//写入数据
    input clk;//写入时钟信号
    input reset;//清零信号
    input Write_Reg;//写控制信号
	output [31:0]R_Data_A;//A端口读出数据
    output [31:0]R_Data_B;//B端口读出数据
	integer i;
	reg [31:0] REG_Files[0:31];//定义寄存器
	initial REG_Files[0]<=32'hF0F0F0F0;
	initial REG_Files[1]<=32'h00000004;
    initial//将全部寄存器初始化为0
        for(i=2;i<32;i=i+1) 
            REG_Files[i]<=0;
    always@(negedge clk or posedge reset)
   	 begin
        if(reset)
                for(i=0;i<32;i=i+1) 
                    REG_Files[i]<=0;
        else
                if(Write_Reg) 
                    REG_Files[W_Addr]<=W_Data;//如果不是，则对应W_Addr写入数据W_Data
  	  end
    //下面是并行的读出数据
    //属于组合逻辑
    assign R_Data_A=REG_Files[R_Addr_A];//由地址R_Addr_A选中相应的寄存器并读出数据
    assign R_Data_B=REG_Files[R_Addr_B];//由地址R_Addr_B选中相应的寄存器并读出数据
endmodule
