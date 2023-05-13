//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union                                                             //
// ECE 251 Spring 2023                                                          //
// Engineers: Ridwan Hussain and Ilona Lameka                                   //
//                                                                              //
//     Create Date: 2023-05-DD                                                  //
//     Module Name: XXXXXXX                                                     //
//     Description: XXXXXXXXXX                                                  //
//                                                                              //
// Revision: 1.0                                                                //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps
`include "./signExtender.sv"

module tb_signExtender;
  // ---- Defining variables to be used ---- //
	reg signed [15:0] num16bit;   //inputs are reg for test bench
	wire signed [31:0] num32bit;     //outputs are wire for test bench
   
	// ---- INSTANTIATE UNIT UNDER TEST (UUT) ---- //
	signExtender uut(.numIn(num16bit), .numOut(num32bit));
	
	// ---- INITIALIZE TEST BENCH ---- //
	initial begin
		$dumpfile("signExtender.vcd"); // for Makefile, make dump file same as module name
		$dumpvars(0, uut);
		$monitor("16bitNum=%b=%d, 32bitNum=%b=%d", num16bit, num16bit, num32bit, num32bit);
	end

	//apply input vectors
	initial begin: apply_stimulus
		#1 num16bit = 10;
		#1 num16bit = 2237;
		#1 num16bit = -24;
		#1 num16bit = -1234;
		#1 num16bit = 32767;
		#1 num16bit = -32768;
		$finish;
	end

endmodule
// `endif // tb_signExtender
