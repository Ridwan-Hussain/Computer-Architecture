//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union                                                             //
// ECE 251 Spring 2023                                                          //
// Engineers: Ridwan Hussain and Ilona Lameka                                   //
//                                                                              //
//     Create Date: 2023-05-14                                                  //
//     Module Name: cpu                                                         //
//     Description: CPU                                                         //
//                                                                              //
// Revision: 1.0                                                                //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////
`ifndef CPU
`define CPU

`timescale 1ns/100ps

`include "../ControlUnit/controller.sv"
`include "../Datapath/datapath.sv"

module cpu(clk, reset, pc, instr, memwrite, aluout, writedata, readdata);
    
	
    	input  logic clk, reset;
    	output logic [31:0] pc;
    	input logic [31:0] instr;
    	output logic memwrite;
    	output logic [31:0] aluout, writedata;
    	input  logic [31:0] readdata;
    
    	logic memtoreg, alusrc, regdst, regwrite, jump, pcsrc, zero;
    	logic [3:0] alucontrol;
    
    	controller c(instr[(31):27], zero, regdst, jump, memtoreg, memwrite, alusrc, regwrite, pcsrc, alucontrol); 
        

    	datapath #(32) dp(clk, reset, memtoreg, pcsrc, alusrc, regdst, regwrite, jump, alucontrol, instr, readdata, zero, pc, aluout, writedata);

endmodule

`endif // CPU
