//////////////////////////////////////////////////////////////////////////
//                                                                      //
// Control Unit module                                                       //
//                                                                      //
// Control Unit module made for ECE 251 Final Project Spring '23.    //
//                                                                      //
// module: example                                                      //
// hdl: Verilog                                                         //
//                                                                      //
// author: Ridwan Hussain <ridwan.hussain@cooper.edu>                   //
//                                                                      //
//////////////////////////////////////////////////////////////////////////

`ifndef CONTROLLER
`define CONTROLLER

module example(A, B, C);
	// ---- PORT DEFINITIONS ---- //
	input  [3:0] A, B;
	output [3:0] C;

	// ---- MODULE DESIGN IMPLEMENTATION ---- //

	// mix up the input bits
	assign C = { A[0], B[2], A[1], B[3] };

endmodule

`endif // EXAMPLE
