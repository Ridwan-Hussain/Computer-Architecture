//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union                                                             //
// ECE 251 Spring 2023                                                          //
// Engineers: Ridwan Hussain and Ilona Lameka                                   //
//                                                                              //
//     Create Date: 2023-05-13                                                  //
//     Module Name: datapath                                                    //
//     Description: The datapath the integrates clock, regFile, alu, dff,       // 
//     adder32bit, sl2, mux2to1, and signExtender.                              //
//                                                                              //
// Revision: 1.0                                                                //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////

`ifndef DATAPATH
`define DATAPATH
`timescale 1ns/100ps
`include "../Clock/clock.sv"
`include "../RegFile/regFile.sv"
`include "../Alu/alu.sv"
`include "../DFF/dff.sv"
`include "../Adder32Bit/adder32Bit.sv"
`include "../Sl2/sl2.sv"
`include "../Mux2to1/mux2to1.sv"
`include "../SignExtender/signExtender.sv"

module datapath
	#(parameter n = 32, parameter r = 7)
	// ---- PORT DEFINITIONS ---- //
	(input clk, reset,         //clock inputs
	dffEnable,                            //enable pin for DFFs
	memToReg, pcSrc, aluSrc, regDst,      //mux select pints
	writeEnable,                          //writeEnable pin for writing to Regs
	jump,                                 //(?)
	input [3:0] aluControl,               //(?)
	input [(n-1):0] instruction,          //Instruction we gave
	readData1, readData2,                 //Data red from registers
	output zero,                          //Constant zero (also reg 0)
	output [(n-1):0] pc,                  //Program count (reads 32 lines right now)
	aluOut,                               //Output from the ALU
	writeData);                           //Data to be written onto a register

	// ---- MODULE DESIGN IMPLEMENTATION ---- //
	reg [?:0] writeReg;                                //
	reg [(n-1):0] pcNext, pcNextBR, pcPlus4, pcBranch; //
	reg [(n-1):0] signImm, signImmSh;                  //
	reg [(n-1):0] srca, scrb;                          //
	reg [(n-1):0] result;                              //
		
	
	dff #(64) pcreg(.clk(clk), .reset(reset), .enable(dffEnable), .D(pc), .Q(pcnext));
	sl2 signShift(.num(
	adder32bit pcAdd2();
	mux #(n) pcbRMux(.select(pcSrc), .data1(), .data2(), .dataOut(pc));
	mux #(n) pcMux(.select(), .data1(), .data2(), .dataOut());

	regFile registerFile(.clk(), .writeEnable(), .readRead1(), .readReg2(), .writeData(), .readData1(), .readData2())

endmodule

`endif // datapath
