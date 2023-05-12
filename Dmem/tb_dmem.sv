//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union                                                             //
// ECE 251 Spring 2023                                                          //
// Engineers: Ridwan Hussain and Ilona Lameka                                   //
//                                                                              //
//     Create Date: 2023-05-09                                                  //
//     Module Name: tb_dmem                                                     //
//     Description: XXXXXXXXXX                                                  //
//                                                                              //
// Revision: 1.0                                                                //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps
`include "./dmem.sv"
`include "../Clock/clock.sv"

module tb_dmem
	#(parameter n = 32, parameter r = 6);
	// ---- Defining variables to be used ---- //
	reg clk, writeEnable, clkEnable;    //inputs are reg for test bench
	reg [(n-1):0] addr;
	reg [(n-1):0] writeData;
	wire [(n-1):0] readData, readData1; //outputs are wire for test bench
   
	// ---- INSTANTIATE UNIT UNDER TEST (UUT) ---- //
	dmem uut(.clk(clk), .writeEnable(writeEnable), .addr(addr), .writeData(writeData), .readData(readData));
	clock uut1(.clk(clk), .enable(clkEnable));

	// ---- INITIALIZE TEST BENCH ---- //
	initial begin
		$dumpfile("dmem.vcd"); // for Makefile, make dump file same as module name
		$dumpvars(0, uut, uut1);
		$monitor("wE=%b, addr=%x, wD=%x, rD=%x", writeEnable, addr, writeData, readData);
	end

	//apply input vectors
	initial begin: apply_stimulus
		clkEnable <= 1;
		#20 writeData = 32'hDEADBEEF;
		#20 addr <= 6'b010101;
		#20 writeEnable <= 1;
		#20 writeEnable <= 0;
		#20 addr <= 6'b101010;
		#20 writeData = 32'hACACACAC;
		#20 writeEnable <= 1;
		#20 writeEnable <= 0;
		#20 addr <= 6'b111111;
		#20 writeData = 32'hBCBCBCBC;
		#20 writeEnable <= 1;
		#20 writeEnable <= 0;
		#20 $finish;	
	end

	endmodule 
	// `endif //tb_dmem
