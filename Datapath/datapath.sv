//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union                                                             //
// ECE 251 Spring 2023                                                          //
// Engineers: Ridwan Hussain and Ilona Lameka                                   //
//                                                                              //
//     Create Date: 2023-05-13                                                  //
//     Module Name: datapath                                                     //
//     Description: The datapath the integrates RegFile, Alu, dff, adder, sl2, mux2, signext                                                  //
//                                                                              //
// Revision: 1.0                                                                //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////

`ifndef EXAMPLE
`define EXAMPLE

module example
	#(parameter n = 32, parameter r = 6)
	// ---- PORT DEFINITIONS ---- //
	(input  [3:0] A, B,
	output [3:0] C);

	// ---- MODULE DESIGN IMPLEMENTATION ---- //

	// mix up the input bits
	assign C = { A[0], B[2], A[1], B[3] };

endmodule

`endif // EXAMPLE
