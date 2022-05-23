`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/23 19:29:24
// Design Name: 
// Module Name: Test_Register
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


module Test_Register();
    reg [4:0] R_Addr_A;
	reg [4:0] R_Addr_B;
	reg [4:0] W_Addr;
	reg Write_Reg;
	reg [31:0] Write_Data;
	reg clk;
	reg reset;

	// Outputs
	wire [31:0] R_Data_A;
	wire [31:0] R_Data_B;

	// Instantiate the Unit Under Test (UUT)
	Register uut (
		.R_Addr_A(R_Addr_A), 
		.R_Addr_B(R_Addr_B), 
		.W_Addr(W_Addr), 
		.Write_Reg(Write_Reg), 
		.W_Data(Write_Data), 
		.clk(clk), 
		.reset(reset), 
		.R_Data_A(R_Data_A), 
		.R_Data_B(R_Data_B)
	);
	always #25 clk=~clk;
	initial begin
		//��ʼ������REG[0]��λ�ô��0
		R_Addr_A = 0;
		R_Addr_B = 0;
		W_Addr = 0;
		Write_Reg = 1;
		Write_Data = 0;
		clk = 0;
		reset = 0;
		
		//����Ϊregistorд������
		#100 Write_Reg = 1;W_Addr = 0;Write_Data = 799;
		#100 Write_Reg = 1;W_Addr = 1;Write_Data = 54567445;
		#100 Write_Reg = 1;W_Addr = 2;Write_Data = 785656;
		#100 Write_Reg = 1;W_Addr = 3;Write_Data = 123444;
		#100 Write_Reg = 1;W_Addr = 4;Write_Data = 75644;
		#100 Write_Reg = 1;W_Addr = 5;Write_Data = 6998;
		
		//���ʹ��˫��ַ���ж�����������ʱӦ�ù�ȥ��6��ʱ��
		#100 R_Addr_A = 0;R_Addr_B = 1;Write_Reg = 0;
		#100 R_Addr_A = 2;R_Addr_B = 3;
		#100 R_Addr_A = 4;R_Addr_B = 5;
		
		//���и�λ����
		#100 reset = 1;
		
		//��⸴λ���Ч��
		#100 R_Addr_A = 0;R_Addr_B = 1;
		#100 R_Addr_A = 2;R_Addr_B = 3;
		#100 R_Addr_A = 4;R_Addr_B = 5;
	end
endmodule
