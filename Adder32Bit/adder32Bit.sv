//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union                                                             //
// ECE 251 Spring 2023                                                          //
// Engineers: Ridwan Hussain and Ilona Lameka                                   //
//                                                                              //
//     Create Date: 2023-05-06                                                  //
//     Module Name: adder32Bit                                                  //
//     Description: 32 bit adder                                                //
//                                                                              //
// Revision: 1.0                                                                //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////

`ifndef ADDER32BIT
`define ADDER32BIT

`include "../FullAdder/fullAdder.sv"
`timescale 1ns/100ps

module adder32Bit(A, B, Cin, Cout, Sum);
	input [31:0]A, B;
	input Cin;
	output Cout;
	output [31:0] Sum;
	wire [31:0]carries;
	assign carries[0] = Cin;
	
	genvar i;
	generate for(i = 0; i < 31; i = i + 1)
		begin
			fullAdder bits(.In1(A[i]), .In2(B[i]), .Cin(carries[i]), .Sum(Sum[i]), .Cout(carries[i+1]));
		end
	endgenerate
	fullAdder bit31(.In1(A[31]), .In2(B[31]), .Cin(carries[31]), .Sum(Sum[31]), .Cout(Cout));

endmodule // bit32Adder
`endif
