//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union                                                             //
// ECE 251 Spring 2023                                                          //
// Engineers: Ridwan Hussain and Ilona Lameka                                   //
//                                                                              //
//     Create Date: 2023-05-13                                                  //
//     Module Name: tb_sl5                                                      //
//     Description: Testbench for sl5. Makes sure the bits are shifted to the   //
//     left by 5 and overflow is handled so the 5 MSB get dropped.              //
//                                                                              //
// Revision: 1.0                                                                //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps
`include "./sl5.sv"

module tb_sl5
  // ---- Defining variables to be used ---- //
	#(parameter n = 32);
	reg [(n-1):0] num;   //inputs are reg for test bench
	wire [(n-1):0] num32;     //outputs are wire for test bench
   
	// ---- INSTANTIATE UNIT UNDER TEST (UUT) ---- //
	sl5 uut(.num(num), .num32(num32));
	
	// ---- INITIALIZE TEST BENCH ---- //
	initial begin
		$dumpfile("sl5.vcd"); // for Makefile, make dump file same as module name
		$dumpvars(0, uut);
		$monitor("num=%b=%d, num32=%b=%d", num, num, num32, num32);
	end

	//apply input vectors
	initial begin: apply_stimulus
		#1 num = 32'h00000000;
		#1 num = 32'h00000001;
		#1 num = 32'h00000111;
		#1 num = 32'h0000BEEF;
		#1 num = 32'h11111111;
		#1 num = 32'h13579BDF;
		#1 num = 32'hF0000000;
		#1 num = 32'hFFFFFFFF;
		$finish;
	end

endmodule

// `endif // tb_sl2
