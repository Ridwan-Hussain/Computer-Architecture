//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union                                                             //
// ECE 251 Spring 2023                                                          //
// Engineers: Ridwan Hussain and Ilona Lameka                                   //
//                                                                              //
//     Create Date: 2023-05-13                                                  //
//     Module Name: Mux2to1                                                     //
//     Description: A 2 to 1 Multiplexer to decide which data signal to send in  //
//     for different parts of the datapath.                                     //
//                                                                              //
// Revision: 1.0                                                                //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////

`ifndef mux2to1
`define mux2to1

module mux2to1
	#(parameter n = 32)
	// ---- PORT DEFINITIONS ---- //
	(input select,
	input  [(n-1):0] data1, data2,
	output [(n-1):0] dataOut);

	// ---- MODULE DESIGN IMPLEMENTATION ---- //
	/*wire nSelect;
	wire [(n-1):0] selectD1, selectD2;

	not(nSelect, select);
	genvar i;
	generate for (i = 0; i < n; i = i + 1) begin
		and(selectD2[i], nSelect, data1[i]);
		and(selectD1[i], select, data2[i]);
		or(dataOut[i], selectD1[i], selectD2[i]);
	end*/

	reg [(n-1):0] data;
	always @* begin
		if (select == 0) begin
			data = data1;
		end else begin
			data = data2;
		end
	end

	assign dataOut = data;

endmodule

`endif // mux2to1
