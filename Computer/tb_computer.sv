//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union                                                             //
// ECE 251 Spring 2023                                                          //
// Engineers: Ridwan Hussain and Ilona Lameka                                   //
//                                                                              //
//     Create Date: 2023-05-14                                                  //
//     Module Name: tb_computer                                                 //
//     Description: Testbench for the computer. Reads instructions from         // 
//     prorgam_exe.                                                             //
//                                                                              //
// Revision: 1.0                                                                //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps
`include "./computer.sv"
`include "../Clock/clock.sv"

module tb_computer
  // ---- Defining variables to be used ---- //
	#(parameter n = 32, parameter r = 7);
	input reg clk, reset;
	input reg [31:0] writedata, dataadr;
	output wire memwrite;

	reg clkEnable;
   
	// ---- INSTANTIATE UNIT UNDER TEST (UUT) ---- //
	computer uut(.clk(clk), .reset(reset), .writedata(writedata), .dataadr(dataadr), .memwrite(memwrite));
	clock uut1(.clk(clk), .enable(clkEnable));

	// ---- INITIALIZE TEST BENCH ---- //
	initial begin
		$dumpfile("computer.vcd"); // for Makefile, make dump file same as module name
		$dumpvars(0, uut, uut1);
		$monitor("clk=%b, r=%b, writeData=%x, dataadr=%x, memwrite=%b", clk, reset, writeData, dataadr, memwrite);
	end

	always @(posedge clk)
  begin
      $display("+");
      $display("\t+instr = 0x%8h",dut.instr);
      $display("\t+op = 0b%6b",dut.mips.c.op);
      $display("\t+controls = 0b%9b",dut.mips.c.md.controls);
      $display("\t+funct = 0b%6b",dut.mips.c.ad.funct);
      $display("\t+aluop = 0b%2b",dut.mips.c.ad.aluop);
      $display("\t+alucontrol = 0b%3b",dut.mips.c.ad.alucontrol);
      $display("\t+alu result = 0x%8h",dut.mips.dp.alu.result);
      $display("\t+HiLo = 0x%8h",dut.mips.dp.alu.HiLo);
      $display("\t+$v0 = 0x%4h",dut.mips.dp.rf.rf[2]);
      $display("\t+$v1 = 0x%4h",dut.mips.dp.rf.rf[3]);
      $display("\t+$a0 = 0x%4h",dut.mips.dp.rf.rf[4]);
      $display("\t+$a1 = 0x%4h",dut.mips.dp.rf.rf[5]);
      $display("\t+$t0 = 0x%4h",dut.mips.dp.rf.rf[8]);
      $display("\t+$t1 = 0x%4h",dut.mips.dp.rf.rf[9]);
      $display("\t+regfile -- ra1 = %d",dut.mips.dp.rf.ra1);
      $display("\t+regfile -- ra2 = %d",dut.mips.dp.rf.ra2);
      $display("\t+regfile -- we3 = %d",dut.mips.dp.rf.we3);
      $display("\t+regfile -- wa3 = %d",dut.mips.dp.rf.wa3);
      $display("\t+regfile -- wd3 = %d",dut.mips.dp.rf.wd3);
      $display("\t+regfile -- rd1 = %d",dut.mips.dp.rf.rd1);
      $display("\t+regfile -- rd2 = %d",dut.mips.dp.rf.rd2);
      $display("\t+RAM[%4d] = %4d",dut.dmem.a,dut.dmem.rd);
      $display("writedata\tdataadr\tmemwrite");
  end

  // check results
  always @(negedge clk)
    begin
      $display("-");
      $display("\t-instr = 0x%8h",dut.instr);
      $display("\t-op = 0b%6b",dut.mips.c.op);
      $display("\t-controls = 0b%9b",dut.mips.c.md.controls);
      $display("\t-funct = 0b%6b",dut.mips.c.ad.funct);
      $display("\t-aluop = 0b%2b",dut.mips.c.ad.aluop);
      $display("\t-alucontrol = 0b%3b",dut.mips.c.ad.alucontrol);
      $display("\t-alu result = 0x%8h",dut.mips.dp.alu.result);
      $display("\t-HiLo = 0x%8h",dut.mips.dp.alu.HiLo);
      $display("\t-$v0 = 0x%4h",dut.mips.dp.rf.rf[2]);
      $display("\t-$v1 = 0x%4h",dut.mips.dp.rf.rf[3]);
      $display("\t-$a0 = 0x%4h",dut.mips.dp.rf.rf[4]);
      $display("\t-$a1 = 0x%4h",dut.mips.dp.rf.rf[5]);
      $display("\t-$t0 = 0x%4h",dut.mips.dp.rf.rf[8]);
      $display("\t-$t1 = 0x%4h",dut.mips.dp.rf.rf[9]);
      $display("\t-regfile -- ra1 = %d",dut.mips.dp.rf.ra1);
      $display("\t-regfile -- ra2 = %d",dut.mips.dp.rf.ra2);
      $display("\t-regfile -- we3 = %d",dut.mips.dp.rf.we3);
      $display("\t-regfile -- wa3 = %d",dut.mips.dp.rf.wa3);
      $display("\t-regfile -- wd3 = %d",dut.mips.dp.rf.wd3);
      $display("\t-regfile -- rd1 = %d",dut.mips.dp.rf.rd1);
      $display("\t-regfile -- rd2 = %d",dut.mips.dp.rf.rd2);
      $display("\t+RAM[%4d] = %4d",dut.dmem.a,dut.dmem.rd);
      $display("writedata\tdataadr\tmemwrite");
      if (dut.dmem.RAM[84] === 32'h9504)
        begin
          $display("Successfully wrote 0x%4h at RAM[%3d]",84,32'h9504);
          firstTest = 1'b1;
        end
      if (dut.dmem.RAM[88] === 0)
        begin
          $display("Successfully wrote 0x%4h at RAM[%3d]",88,0);
          secondTest = 1'b1;
        end
      if(memwrite) begin
        if(dataadr === 84 & writedata === 32'h9504)
        begin
          $display("Successfully wrote 0x%4h at RAM[%3d]",writedata,dataadr);
          firstTest = 1'b1;
        end
        if(dataadr === 88 & writedata === 0)
        begin
          $display("Successfully wrote 0x%4h at RAM[%3d]",writedata,dataadr);
          secondTest = 1'b1;
        //if(dataadr === 60 & writedata === 28) begin
            // $display("Simulation succeeded");
            // $finish;
          // end
        end
        // else if (dataadr !== 80) begin
        //   $display("Simulation failed");
        //   $finish;
        // end
      end
      if (firstTest === 1'b1 & secondTest === 1'b1)
      begin
          $display("Program successfully completed");
          $finish;
      end
      // else
      // begin
      //     $display("Program UNsuccessfully completed");
      //     $finish;
      // end
    end

	//apply input vectors
	initial begin: apply_stimulus
		clkEnable = 1;
		reset = 0; 
		writedata = 
		reg[3:0] tVect; //tVect[3] terminates the for loop
		for (tVect = 0; tVect < 8; tVect = tVect + 1) begin
			#1;
			#1;
			#1;
			#1;
		end
		$finish;
	end

endmodule

// `endif // tb_computer
