//////////////////////////////////////////////////////////////////////////
//                                                                      //
// EXAMPLE TestBench module                                             //
//                                                                      //
// An example testbench module for your Computer Architecture Elements  // 
// Catalog                                                              //
//                                                                      //
// module: example_tb                                                   //
// hdl: Verilog                                                         //
//                                                                      //
// author: Ridwan Hussain <ridwan.hussain@cooper.edu>                   //
//                                                                      //
//////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

`include "./example.sv"

module example_tb;
	// ---- Defining variables to be used ---- //
	reg [3:0] a, b;   //inputs are reg for test bench
	wire [3:0] c;     //outputs are wire for test bench
   
	// ---- INSTANTIATE UNIT UNDER TEST (UUT) ---- //
	example uut(.A(a), .B(b), .C(c));
	
	// ---- INITIALIZE TEST BENCH ---- //
	initial begin
		$dumpfile("example.vcd"); // for Makefile, make dump file same as module name
		$dumpvars(0, uut);
		//$monitor("A is %b, B is %b, C is %b", a, b, c);
		//#50 A = 4'b1100;
		//#50 $finish;
	end

	//apply input vectors
	initial begin: apply_stimulus
		reg[3:0] tVect; //tVect[3] terminates the for loop
		for (tVect = 0; tVect < 8; tVect = tVect + 1) begin
			//{a, b, cin} = invect [3:0];
			//#10 $display ("abcin = %b, cout = %b, sum = %b", {a, b, cin}, cout, sum);
			{a} = tVect [3:0];
			{b} = ~tVect [3:0];
			#10 $display("a=%b, b=%b, c=%b", a, b, c);
		end
		$finish;
	end

endmodule

// `endif // example_tb
