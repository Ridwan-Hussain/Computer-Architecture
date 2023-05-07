///////////////////////////////////////////////////i//////////////////////////////
// The Cooper Union                                                             //
// ECE 251 Spring 2023                                                          //
// Engineers: Ridwan Hussain and Ilona Lameka                                   //
//                                                                              //
//     Create Date: 2023-05-07                                                  //
//     Module Name: controller                                                  //
//     Description: Controller Unit                                             //
//                                                                              //
// Revision: 1.0                                                                //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////

`ifndef CONTROLLER
`define CONTROLLER

`timescale 1ns/100ps

`include "../MainDec/mainDec.sv"
`include "../AluDec/aluDec.sv"

module controller(op, zero, regdst, jump, memread, memtoreg, aluop, memwrite, alusrc, regwrite);
	input logic [4:0]op;
	input logic zero;
	output logic regdst, branch, jump, memread, memtoreg, aluop, memwrite, alusrc, regwrite;
	output logic [2:0] alucontrol;

	logic [3:0] aluop;
	logic branch;
    
	// CPU main decoder
	mainDec md(op, memtoreg, memwrite, branch, alusrc, regdst, regwrite, jump, aluop);
	// CPU's ALU decoder
	aluDec  ad(aluop, alucontrol);
	// AND Gate that is part of Control
	assign pcsrc = branch & zero;

endmodule //controller

`endif 
