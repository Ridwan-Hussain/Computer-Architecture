# Computer-Architecture
Created a CPU in Verilog for ECE251 Final Project.

# Rob Website 
https://github.com/robmarano/cpu_hdl_catalog/tree/STEP-01

# OttoBit Spreadsheet 
https://cooperunion.sharepoint.com/:x:/r/sites/Section_ECE-251-A-2023SP/_layouts/15/Doc.aspx?action=edit&sourcedoc=%7B2cd312b1-8aa7-483c-a74d-31bccdc8a4b7%7D&wdOrigin=TEAMS-WEB.teamsSdk.openFilePreview&wdExp=TEAMS-CONTROL&web=1

<<<<<<< HEAD
=======
# ISA for Besties CPU
![image](https://github.com/Ridwan-Hussain/Computer-Architecture/assets/114603278/48548477-219a-45a8-9fb7-18185bfe5cf4)
<sup>Register, Immediate, and Address Instruction Types Formating</sup>

![image](https://github.com/Ridwan-Hussain/Computer-Architecture/assets/114603278/aabbf38f-dabf-4588-97ed-76556f38f680)
<sup>The instructions we defined for R-type and how their bit values are defined.</sup>

![image](https://github.com/Ridwan-Hussain/Computer-Architecture/assets/114603278/5c2e417e-c619-4bc5-887f-0a19813c8336)
<sup>The instructions we defined for I-type and how their bit values are defined.</sup>

![image](https://github.com/Ridwan-Hussain/Computer-Architecture/assets/114603278/1bfbdb4b-e731-42b2-a181-3aac20e3a2e6)
<sup>The instructions we defined for J-type and how their bit values are defined.</sup>

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
- for our code, n=32 bits and r=7 bits

>>>>>>> refs/remotes/origin/main
# Components Made in Verilog:
- [x] Clock 
- [ ] Data mem
- [ ] Instruction Mem
- [ ] Register File
- [ ] ALU
- [x] Adder
- [ ] Shift left two
- [ ] Sign Extender
- [ ] D Flip-Flop
- [ ] Multiplexer 2:1 (could be diff for us)
- [ ] CPU (MIPS) (diff for us I think)
- [x] Controller
- [ ] Main Decoder
- [ ] ALU Decoder
- [ ] Datapath
- [ ] Computer (CPU + MEM + 1/0)

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
