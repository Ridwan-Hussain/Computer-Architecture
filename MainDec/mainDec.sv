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

module mainDec(op, memtoreg, memwrite, branch, alusrc, regdst, regwrite, jump, aluop);
	input logic [4:0] op;
	output logic memtoreg, memwrite, branch, alusrc, regdst, regwrite, jump;
	output logic [1:0] aluop;

	logic [8:0] controls;
	assign {memtoreg, memwrite, branch, alusrc, regdst, regwrite, jump, aluop} = controls;

	always @* begin
		// R type, set aluop to 
		if ((op[1:0] == 2'b01) | (op[1:0] == 2'b01))
		begin
			controls = 9'b000011010;
	    	end
		case(op) //for alu decoder, 00 is add 11 is subtract
			5'b11000: controls <= 9'b000101000; // ADDI 
			5'b11001: controls <= 9'b000101011; // SUBI
			5'b11010: controls <= 9'b100101000; // LW
			5'b11011: controls <= 9'b010100000; // SW
			5'b11100: controls <= 9'b001000011; // BEQ
			5'b11101: controls <= 9'b000000011; // BNE
			5'b00000: controls <= 9'b000000100; // J
			5'b00111: controls <= 9'b000000100; // JAL
			//5'b11110:
			//5'b11111:
			default: controls <= 9'bxxxxxxxxx; //illegal
		endcase
	end

endmodule //mainDec

`endif 
