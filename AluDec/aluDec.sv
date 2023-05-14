//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union                                                             //
// ECE 251 Spring 2023                                                          //
// Engineers: Ridwan Hussain and Ilona Lameka                                   //
//                                                                              //
//     Create Date: 2023-05-07                                                  //
//     Module Name: aluDec                                                      //
//     Description: ALU Decoder                                                 //
//                                                                              //
// Revision: 1.0                                                                //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////

`ifndef ALUDEC
`define ALUDEC

`timescale 1ns/100ps

module aluDec(op, aluop, alucontrol);
	input logic [4:0] op;
	input logic [1:0] aluop;
	output logic [3:0] alucontrol;




	always @*
	begin
        	case(aluop)
        	2'b00: alucontrol <= 4'b0000;  // add 
        	2'b11: alucontrol <= 4'b0001;  // sub 
        	default:
            	case(op)
			5'b00001: alucontrol <= 4'b0000; // add
                	5'b01001: alucontrol <= 4'b0001; // sub 
                	5'b01010: alucontrol <= 4'b0010; // mult
                	5'b01011: alucontrol <= 4'b0011; // div
                	5'b01100: alucontrol <= 4'b0100; // sl
                	5'b01101: alucontrol <= 4'b0101; // sr
                	5'b01110: alucontrol <= 4'b0110; // and
                	5'b01111: alucontrol <= 4'b0111; // or
                	5'b10000: alucontrol <= 4'b1000; // xor
                	5'b10001: alucontrol <= 4'b1001; // nor
                	5'b10010: alucontrol <= 4'b1010; // jr
                	5'b10011: alucontrol <= 4'b1011; // nand
                	5'b10100: alucontrol <= 4'b1100; // not 
                	5'b10101: alucontrol <= 4'b1101; // slt 
                	5'b10110: alucontrol <= 4'b1110; // sgt
                default:   alucontrol <= 4'bxxxx; // ???
            endcase
        endcase

    end

endmodule //aluDec

`endif 
