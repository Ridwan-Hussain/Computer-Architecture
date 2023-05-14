//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union                                                             //
// ECE 251 Spring 2023                                                          //
// Engineers: Ridwan Hussain and Ilona Lameka                                   //
//                                                                              //
//     Create Date: 2023-05-13                                                  //
//     Module Name: alu                                                         //
//     Description: ALU                                                         //
//                                                                              //
// Revision: 1.0                                                                //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////

`ifndef ALU
`define ALU

`timescale 1ns/100ps

module alu(clk, a, b, alucontrol, result, pc, zero);
    
    input  logic clk;
    input  logic [31:0] a, b;
    input  logic [2:0]  alucontrol;
    output logic [31:0] result, pc;
    output logic zero;


    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    logic [31:0] condinvb, sum;
    logic [63:0] HiLo;

    assign zero = (result == {32{1'b0}}); // zero result control signal

    // initialize the internal HiLo register used in multiplying two 32-bit numbers = a 64-bit number.
    initial
        begin
            HiLo = 64'b0;
        end

    always @(a,b,alucontrol) begin
        case (alucontrol)
            	4'b0000: result = a + b; // add
            	4'b0001: result = a + (~b + 1'b1); // sub
		4'b0100: result = a << b; //sl
		4'b0101: result = a >> b; //sr
		4'b0110: result = a & b; // and
            	4'b0111: result = a | b; // or
		4'b1000: result = a^b; // xor
		4'b1001: result = ~(a | b); //nor
		4'b1010: result = a; //jr
		4'b1011: result = ~(a & b); // nand
		4'b1100: result = ~(a); //not

            4'b1101: begin                       // slt
				if (a[31] != b[31])
					if (a[31] > b[31])
						result = 1;
					else
						result = 0;
				else
					if (a < b)
						result = 1;
					else
						result = 0;
            end
	    4'1110: begin 
	    			if (a[31] != b[31])
					if (a[31] < b[31])
						result = 1;
					else
						result = 0;
				else
					if (a > b)
						result = 1;
					else
						result = 0;
		end
	endcase
    end

    //Multiply and divide results are only stored at clock falling edge.
    always @(negedge clk) begin
        case (alucontrol)
            4'b0010: HiLo = a * b; // mult
            4'b0011: // div
            begin
                HiLo[31:0] = a / b;
                HiLo[63:32] = a % b;
            end
        endcase				
    end

endmodule  //alu

`endif 
