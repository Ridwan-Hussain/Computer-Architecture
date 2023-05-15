//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union                                                             //
// ECE 251 Spring 2023                                                          //
// Engineers: Ridwan Hussain and Ilona Lameka                                   //
//                                                                              //
//     Create Date: 2023-05-12                                                  //
//     Module Name: signExtender                                                //
//     Description: Extends the number of bits a number is from 16 bits to 32   //
//     bits, taking into account that the numbers are 2's complement.           //
//                                                                              //
// Revision: 1.0                                                                //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////

`ifndef signExtender
`define signExtender

module signExtender
	// ---- PORT DEFINITIONS ---- //
	(input  [12:0] numIn,
	output [31:0] numOut);

	// ---- MODULE DESIGN IMPLEMENTATION ---- //
	assign msb = numIn[12];
	assign numOut = {{19{msb}}, numIn};

endmodule

`endif // signExtender
