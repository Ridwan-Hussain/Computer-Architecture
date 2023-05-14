//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union                                                             //
// ECE 251 Spring 2023                                                          //
// Engineers: Ridwan Hussain and Ilona Lameka                                   //
//                                                                              //
//     Create Date: 2023-05-12                                                  //
//     Module Name: tb_imem                                                     //
//     Description: Testbench for imem, read input from program_exe and prints  //
//     selected 1st, 3rd, 9th, 15th, 31st, 63rd, and last line from the file.   //
//                                                                              //
// Revision: 1.0                                                                //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps
`include "./imem.sv"

module tb_imem
	// ---- Defining variables to be used ---- //
	#(parameter n = 32, parameter r = 6);
	reg [(r-1):0] addr;   //inputs are reg for test bench
	wire [(n-1):0] readData;     //outputs are wire for test bench
   
	// ---- INSTANTIATE UNIT UNDER TEST (UUT) ---- //
	imem uut(.addr(addr), .readData(readData));
	
	// ---- INITIALIZE TEST BENCH ---- //
	initial begin
		$dumpfile("imem.vcd"); // for Makefile, make dump file same as module name
		$dumpvars(0, uut);
		$monitor("addr=%x, readData=%x", addr, readData);
	end

	initial begin: apply_stimulus
		#20 addr <= #(r)'b0000001; //First line of the file
		#20 addr <= #(r)'b0000011; //3rd line
		#20 addr <= #(r)'b0000111; //9th line
		#20 addr <= #(r)'b0001111; //15th line
		#20 addr <= #(r)'b0011111; //31st line
		#20 addr <= #(r)'b0111111; //63rd line
		#20 addr <= #(r)'b1000000; //Last line of the file
		$finish;
	end

endmodule

// `endif // tb_imem
