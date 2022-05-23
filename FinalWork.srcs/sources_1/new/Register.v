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
    input [4:0]R_Addr_A;//A�˿ڶ��Ĵ�����ַ
    input [4:0]R_Addr_B;//B�˿ڶ��Ĵ�����ַ
    input [4:0]W_Addr;//д�Ĵ�����ַ
    input [31:0]W_Data;//д������
    input clk;//д��ʱ���ź�
    input reset;//�����ź�
    input Write_Reg;//д�����ź�
	output [31:0]R_Data_A;//A�˿ڶ�������
    output [31:0]R_Data_B;//B�˿ڶ�������
	integer i;
	reg [31:0] REG_Files[0:31];//����Ĵ���
	initial REG_Files[0]<=32'hF0F0F0F0;
	initial REG_Files[1]<=32'h00000004;
    initial//��ȫ���Ĵ�����ʼ��Ϊ0
        for(i=2;i<32;i=i+1) 
            REG_Files[i]<=0;
    always@(negedge clk or posedge reset)
   	 begin
        if(reset)
                for(i=0;i<32;i=i+1) 
                    REG_Files[i]<=0;
        else
                if(Write_Reg) 
                    REG_Files[W_Addr]<=W_Data;//������ǣ����ӦW_Addrд������W_Data
  	  end
    //�����ǲ��еĶ�������
    //��������߼�
    assign R_Data_A=REG_Files[R_Addr_A];//�ɵ�ַR_Addr_Aѡ����Ӧ�ļĴ�������������
    assign R_Data_B=REG_Files[R_Addr_B];//�ɵ�ַR_Addr_Bѡ����Ӧ�ļĴ�������������
endmodule
