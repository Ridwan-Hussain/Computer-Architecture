//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union                                                             //
// ECE 251 Spring 2023                                                          //
// Engineers: Ridwan Hussain and Ilona Lameka                                   //
//                                                                              //
//     Create Date: 2023-05-13                                                  //
//     Module Name: sl2                                                         //
//     Description: Shift 2 bits to the left (the same as multiply by 4). We    //
//     implemented so that the 2 MSB will get dropped instead of rolling over.  //
//                                                                              //
// Revision: 1.0                                                                //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////

`ifndef sl2
`define sl2

module sl2
	#(parameter n = 32)
	// ---- PORT DEFINITIONS ---- //
	(input  [(n-1):0] num,
	output [(n-1):0] num4);

	// ---- MODULE DESIGN IMPLEMENTATION ---- //
	assign num4 = num * 4;

endmodule

`endif // sl2
