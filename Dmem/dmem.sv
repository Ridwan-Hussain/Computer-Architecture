//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union                                                             //
// ECE 251 Spring 2023                                                          //
// Engineers: Ridwan Hussain and Ilona Lameka                                   //
//                                                                              //
//     Create Date: 2023-05-09                                                  //
//     Module Name: dmem                                                        //
//     Description: Data Memory for the computer; stores the output. It is 128- //
//     bits and we have 7 bits for our registers (for a total of 128 registers. //
//                                                                              //
// Revision: 1.0                                                                //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////

`ifndef dmem
`define dmem

module dmem
	// ---- PORT DEFINITIONS ---- //
	//n is the size of each register; r is the lenght of addr (limited by verilog emulator)
	#(parameter n = 32, parameter r = 6)
	(input clk, writeEnable, 
	input [(n-1):0] addr,
	input [(n-1):0] writeData, 
	output [(n-1):0] readData);

	// ---- MODULE DESIGN IMPLEMENTATION ---- //
	reg [(n-1):0] RAM[0:(2**r-1)]; //memory fills up from the bottom up
	assign readData = RAM[addr[(n-1):5]]; //Since our system is word addrressable we ignore the bottom 5 bits

	always @(posedge clk) begin //We write on positive clk edge
		if (writeEnable) begin //Checks to see if the register is writable
			RAM[addr[(n-1):5]] = writeData; 
		end
	end

endmodule

`endif // dmem

//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2023
// Engineer: Prof Rob Marano
// 
//     Create Date: 2023-02-07
//     Module Name: dmem
//     Description: 32-bit RISC memory ("data" segment)
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
/*`ifndef DMEM
`define DMEM

`timescale 1ns/100ps

module dmem
// n=bit length of register; r=bit length of addr to limit memory and not crash your verilog emulator
    #(parameter n = 32, parameter r = 6)(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input  logic           clk, write_enable,
    input  logic [(n-1):0] addr, writedata,
    output logic [(n-1):0] readdata
);
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    logic [(n-1):0] RAM[0:(2**r-1)];

    assign readdata = RAM[addr[(n-1):2]]; // word aligned (ignores lower 2 bits of address)

    always @(posedge clk) // write on posedge
        if (write_enable) RAM[addr[(n-1):2]] <= writedata;

endmodule

`endif // DMEM*/
