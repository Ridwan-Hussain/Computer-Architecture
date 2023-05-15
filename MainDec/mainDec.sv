//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union                                                             //
// ECE 251 Spring 2023                                                          //
// Engineers: Ridwan Hussain and Ilona Lameka                                   //
//                                                                              //
//     Create Date: 2023-05-07                                                  //
//     Module Name: mainDec                                                     //
//     Description: Main decoder for controller                                 //
//                                                                              //
// Revision: 1.0                                                                //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////
`ifndef MAINDEC
`define MAINDEC

`timescale 1ns/100ps

module mainDec(opCode, zero, regDst, regWrite, branch, memWrite, memToReg, jump, aluSrc, aluControl);
	input logic [4:0] opCode;
	input logic zero;
	output logic regDst, regWrite, branch, memWrite, memToReg, jump, aluSrc;
	output logic [3:0] aluControl;

	logic [10:0] controls;
	     //[0       1         2       3         4_         5     6       7 8_9 10]
	assign {regDst, regWrite, branch, memWrite, memToReg, jump, aluSrc, aluControl} = controls;

	always @* begin
		// R type, set aluop to 
		case(opCode) //for alu decoder, 00 is add 11 is subtract
			5'b01000: controls <= 11'b1100_0000_000; //add
			5'b01001: controls <= 11'b1100_0000_001; //sub
			5'b01010: controls <= 11'b1100_0000_010; //sl
			5'b01011: controls <= 11'b1100_0000_011; //sr
			5'b01100: controls <= 11'b1100_0000_100; //and
			5'b01101: controls <= 11'b1100_0000_101; //or
			5'b01110: controls <= 11'b1100_0000_110; //xor
			5'b01111: controls <= 11'b1100_0000_111; //nor
			5'b10000: controls <= 11'b1100_0001_000; //nand
			5'b10001: controls <= 11'b1100_0001_001; //not
			5'b10010: controls <= 11'bXXXX_X101_010; //jr
			5'b10011: controls <= 11'b1100_0001_011; //slt
			5'b10100: controls <= 11'b1100_0001_100; //sgt

			5'b11000: controls <= 11'b0100_0010_000; //addi 
			5'b11001: controls <= 11'b0100_0010_001; //subi
			5'b11010: controls <= 11'b0100_1010_000; //lw
			5'b11011: controls <= 11'b0001_0010_000; //sw
			5'b11100: controls <= 11'b0010_0000_001; //beq
			5'b11101: controls <= 11'b0010_0000_001; //bne

			5'b00000: controls <= 11'b0000_0100_000; //j
			5'b00111: controls <= 11'bXXXX_XX1X_XXX; //jal
			default:  controls <= 11'bxxxxxxxxx; //illegal
		endcase
	end

endmodule //mainDec

`endif 
