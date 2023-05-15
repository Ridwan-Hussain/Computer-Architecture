//////////////////////////////////////////////////i///////////////////////////////
// The Cooper Union                                                             //
// ECE 251 Spring 2023                                                          //
// Engineers: Ridwan Hussain and Ilona Lameka                                   //
//                                                                              //
//     Create Date: 2023-05-14                                                  //
//     Module Name: computer                                                    //
//     Description: Computer                                                    //
//                                                                              //
// Revision: 1.0                                                                //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////

`ifndef COMPUTER
`define COMPUTER

`timescale 1ns/100ps

`include "../Cpu/cpu.sv"
`include "../Imem/imem.sv"
`include "../Dmem/dmem.sv"

module computer(clk, reset, writedata, dataadr, memwrite);
	input logic clk, reset;
	input logic [31:0] writedata, dataadr;
	output logic memwrite;

	logic [31:0] pc, instr, readdata;

  // computer internal components
  // the RISC CPU
  cpu mips(clk, reset, pc, instr, memwrite, dataadr, writedata, readdata);
  // the instruction memory ("text segment") in main memory
  imem imem(pc[8:2], instr);
  // the data memory ("data segment") in main memory
  dmem dmem(clk, memwrite, dataadr, writedata, readdata);

endmodule

`endif // COMPUTER
