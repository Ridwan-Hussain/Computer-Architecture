# Computer-Architecture
Created a CPU in Verilog for ECE251 Final Project.

# Rob Website 
https://github.com/robmarano/cpu_hdl_catalog/tree/STEP-01

# OttoBit Spreadsheet 
https://cooperunion.sharepoint.com/:x:/r/sites/Section_ECE-251-A-2023SP/_layouts/15/Doc.aspx?action=edit&sourcedoc=%7B2cd312b1-8aa7-483c-a74d-31bccdc8a4b7%7D&wdOrigin=TEAMS-WEB.teamsSdk.openFilePreview&wdExp=TEAMS-CONTROL&web=1

# ISA for Besties CPU
![image](https://github.com/Ridwan-Hussain/Computer-Architecture/assets/114603278/d3ffbb4a-12b0-439f-a2ce-7703e0aa9b65)
<sup>Register, Immediate, and Address Instruction Types Formating</sup>

![image](https://github.com/Ridwan-Hussain/Computer-Architecture/assets/114603278/df0eed54-47c4-412b-90be-76972f3918a8)
<sup>The instructions we defined for R-type and how their bit values are defined.</sup>

![image](https://github.com/Ridwan-Hussain/Computer-Architecture/assets/114603278/ebdd376d-3438-4d3c-a71f-5a3a8e21f683)
<sup>The instructions we defined for I-type and how their bit values are defined.</sup>

![image](https://github.com/Ridwan-Hussain/Computer-Architecture/assets/114603278/c13264f9-f2df-4e49-99b9-e8aac4e7815c)
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
