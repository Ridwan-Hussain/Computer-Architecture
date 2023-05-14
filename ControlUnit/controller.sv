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

module controller(op, zero, regdst, jump, memtoreg, aluop, memwrite, alusrc, regwrite, pcsrc, alucontrol);
	input logic [4:0]op;
	input logic zero;
	output logic regdst, jump, memtoreg, memwrite, alusrc, regwrite, pcsrc;
	output logic [3:0] alucontrol;

	logic [1:0] aluop;
	logic branch;
    
	// CPU main decoder
	mainDec md(op, memtoreg, memwrite, branch, alusrc, regdst, regwrite, jump, aluop);
	// CPU's ALU decoder
	aluDec  ad(op, aluop, alucontrol);
	// AND Gate that is part of Control
	assign pcsrc = branch & zero;

endmodule //controller

`endif 
