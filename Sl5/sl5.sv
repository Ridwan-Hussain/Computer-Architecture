//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union                                                             //
// ECE 251 Spring 2023                                                          //
// Engineers: Ridwan Hussain and Ilona Lameka                                   //
//                                                                              //
//     Create Date: 2023-05-13                                                  //
//     Module Name: sl5                                                         //
//     Description: Shift 5 bits to the left (the same as multiply by 32). We    //
//     implemented so that the 5 MSB will get dropped instead of rolling over.  //
//                                                                              //
// Revision: 1.0                                                                //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////

`ifndef sl5
`define sl5

module sl5
	#(parameter n = 32)
	// ---- PORT DEFINITIONS ---- //
	(input  [(n-1):0] num,
	output [(n-1):0] num32);

	// ---- MODULE DESIGN IMPLEMENTATION ---- //
	genvar i;
	generate for (i = 0; i < (n-5); i = i + 1) begin
		or(num32[i+5], num[i], 0);
	end
	endgenerate
	and(num32[0], 0, 0);
	and(num32[1], 0, 0);
	and(num32[2], 0, 0);
	and(num32[3], 0, 0);
	and(num32[4], 0, 0);

endmodule

`endif // sl5
