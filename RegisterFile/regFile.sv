//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union                                                             //
// ECE 251 Spring 2023                                                          //
// Engineers: Ridwan Hussain and Ilona Lameka                                   //
//                                                                              //
//     Create Date: 2023-05-12                                                  //
//     Module Name: regFile                                                     //
//     Description: 128-bit register file; this is where the registers are      //
//     defined for the CPU. The registers are written on rising edge and are    //
//     read on falling edge.                                                    //
//		                                                                          //
// Revision: 1.0                                                                //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////

`ifndef regFile
`define regFile
`timescale 1ns/100ps

module regFile
	// ---- PORT DEFINITIONS ---- //
	#(parameter n = 32, parameter r = 7)
	(input clk, writeEnable,
	input [(r-1):0] readReg1, readReg2, writeReg, 
	input [(n-1):0] writeData,
	output [(n-1):0] readData1, readData2);

	reg [(n-1):0] registers[(2**r-1):0];
	reg [(2**r-1):0] rReg1Hb, rReg1Lb, rReg2Hb, rReg2Lb, wRegHb, wRegLb;
	reg [(n-1):0] rD1, rD2;

	assign rReg1Hb = (readReg1 + 1) * 32 - 1; 
	assign rReg1Lb = readReg1 * 32; 
	assign rReg2Hb = (readReg2 + 1) * 32 - 1; 
	assign rReg2Lb = readReg2 * 32; 
	assign wRegHb = (writeReg + 1) * 32 - 1;
	assign wRegLb = writeReg * 32; 

	// ---- MODULE DESIGN IMPLEMENTATION ---- //
	always @(posedge clk) begin		
		if (writeEnable) begin
			registers[writeReg] = writeData;
		end
	end

	always @(negedge clk) begin
		rD1 = registers[readReg1];
	  rD2 = registers[readReg2];
	end

	assign readData1 = rD1;
	assign readData2 = rD2;

endmodule

`endif // regFile
