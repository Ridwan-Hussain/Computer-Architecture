//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union                                                             //
// ECE 251 Spring 2023                                                          //
// Engineers: Ridwan Hussain and Ilona Lameka                                   //
//                                                                              //
//     Create Date: 2023-05-06                                                  //
//     Module Name: adder32Bit                                                  //
//     Description: 32 bit adder                                                //
//                                                                              //
// Revision: 1.0                                                                //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////
`ifndef TB_ADDER32BIT
`define TB_ADDER32BIT

`timescale 1ns/100ps
`include "adder32Bit.sv"


module tb_adder32Bit();
        reg [31:0]x, y;
	reg cin;
        wire [31:0] s;
	wire cout;

        adder32Bit uut (.A(x), .B(y), .Cin(cin), .Cout(cout), .Sum(s));

        initial
        begin
                $display("A\t\t\t\t\tB\t\t\t\t\tCin\tSum\t\t\t\t\tCout");
                $monitor("%b\t%b\t%b\t%b\t%b", a, b, cin, s, cout);
        end

        initial
        begin

                x = 32'b11111111111111111111111111111111;
                y = 32'b00000000000000000000000000000000;
		cin = 1'b0;
		
		#10
		x = 32'b00000000000000000000000000000000;
		y = 32'b00000000000000000000000000000000;
		cin = 1'b1;

		#10
		x = 32'b00000000000000000000000000000001;
		y = 32'b00000000000000000000000000000011;
		cin = 1'b1;
        end
endmodule // tb_adder32Bit
`endif
