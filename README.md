# Computer-Architecture
Created a CPU in Verilog for ECE251. Made it with Bestie :monkey:

# Rob Website 
https://github.com/robmarano/cpu_hdl_catalog/tree/STEP-01

# Single Cycle CPU MIT OCW slides
https://ocw.mit.edu/courses/6-823-computer-system-architecture-fall-2005/964e8d2c1085754ba5ed2eba48269a0b_l05_singlecycle.pdf

# OttoBit Spreadsheet 
https://cooperunion.sharepoint.com/:x:/r/sites/Section_ECE-251-A-2023SP/_layouts/15/Doc.aspx?action=edit&sourcedoc=%7B2cd312b1-8aa7-483c-a74d-31bccdc8a4b7%7D&wdOrigin=TEAMS-WEB.teamsSdk.openFilePreview&wdExp=TEAMS-CONTROL&web=1

# ISA for Besties CPU
1. The ALU Operand Size is 32 bits.
2. ==[We'd support X ALU operations: **List operations here**]==
3. The Operational Code (OpCode) will be 5 bits.
4. We'll provide 128 registers for the programs (7 bits for register addressing).
5. We will have a return address to receive the results of the ALU ($ra, reg #127)
6. We'll have 3 types of instruction format: Register (R), Immediate (I), & Jump (J)
7. Our instruction width will be a fixed value of 32 bits.
8. We'll design our datapath and Control Unit similar to MIPs but make any changes we want/need to make.
9. The datapath and control unit will be implemented using a single-cycle instruction execution since will plan on using RISC.
10. The single-cycle implementation won't be converted to a pipelined design.
11. Our Verilog Components include: ==[LIST VERILOG COMPONENTS HERE]==

# Other Decisions Made
- First two bits for OpCode determine instruction type (XOR for Register, AND for Immediate, NAND for Jump)
- We'll be storing our numbers using Little Endianness
- Registers are written on rising edge, and are read on falling edge (not async)
- 

# Components Made in Verilog:
- [x] Clock 
  - The universal timescale is 1ns/100ps (each tick/#1 is 1ns with a precision of 100ps)
  - The clock has a period of 2ns, so a frequency of 500 MHz
  - 50% duty cycle (turns on for 1ns, then off for 1ns, and repeats)
- [x] Data mem
  - 
- [x] Instruction Mem
  - 
- [x] Register File
  - 
- [ ] ALU
  - 
- [ ] Adder
  - 
- [x] Shift left two
  - 
- [x] Sign Extender
  - 
- [x] D Flip-Flop
  - 
- [x] Multiplexer 2:1 (could be diff for us)
  - 
- [ ] CPU (MIPS) (diff for us I think)
  - 
- [ ] Controller
  - 
- [ ] Main Decoder
  - 
- [ ] Datapath
  - 
- [ ] Computer (CPU + MEM + 1/0)
  - 
Start of File Code Stuff:
```
//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union                                                             //
// ECE 251 Spring 2023                                                          //
// Engineers: Ridwan Hussain and Ilona Lameka                                   //
//                                                                              //
//     Create Date: 2023-05-DD                                                  //
//     Module Name: XXXXXXX                                                     //
//     Description: XXXXXXXXXX                                                  //
//                                                                              //
// Revision: 1.0                                                                //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////
```

Choices made:
- 128 registers
- word addressable
- write on rising edge, read on falling edge
