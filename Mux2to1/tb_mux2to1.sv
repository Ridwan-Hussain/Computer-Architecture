//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union                                                             //
// ECE 251 Spring 2023                                                          //
// Engineers: Ridwan Hussain and Ilona Lameka                                   //
//                                                                              //
//     Create Date: 2023-05-13                                                  //
//     Module Name: tb_mux2to1                                                  //
//     Description: Testbench for a 2 to 1 Multiplexer.                          //
//                                                                              //
// Revision: 1.0                                                                //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps
`include "./mux2to1.sv"

module tb_mux2to1
  // ---- Defining variables to be used ---- //
	#(parameter n = 32);
	reg s;
	reg [(n-1):0] d1, d2;   //inputs are reg for test bench
	wire [(n-1):0] dO;     //outputs are wire for test bench
   
	// ---- INSTANTIATE UNIT UNDER TEST (UUT) ---- //
	mux2to1 uut(.select(s), .data1(d1), .data2(d2), .dataOut(dO));
	
	// ---- INITIALIZE TEST BENCH ---- //
	initial begin
		$dumpfile("mux.vcd"); // for Makefile, make dump file same as module name
		$dumpvars(0, uut);
		$monitor("S=%b, D1=%x, D2=%x, DO=%x", s, d1, d2, dO);
	end

	//apply input vectors
	initial begin: apply_stimulus
		reg[3:0] tVect; //tVect[3] terminates the for loop
		for (tVect = 0; tVect < 8; tVect = tVect + 1) begin
			d1 = tVect;
			d2 = 8 - tVect;
			if (tVect[0] == 0) begin
				s = 0;
			end else begin
				s = 1;
			end
			#1;
		end
		$finish;
	end

endmodule

// `endif // tb_mux2to1
