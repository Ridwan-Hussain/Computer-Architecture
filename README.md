# Computer-Architecture
Created a CPU in Verilog for ECE251. Made it with Bestie :monkey:

# Rob Website 
https://github.com/robmarano/cpu_hdl_catalog/tree/STEP-01

# Single Cycle CPU MIT OCW slides
https://ocw.mit.edu/courses/6-823-computer-system-architecture-fall-2005/964e8d2c1085754ba5ed2eba48269a0b_l05_singlecycle.pdf

# OttoBit Spreadsheet 
https://cooperunion.sharepoint.com/:x:/r/sites/Section_ECE-251-A-2023SP/_layouts/15/Doc.aspx?action=edit&sourcedoc=%7B2cd312b1-8aa7-483c-a74d-31bccdc8a4b7%7D&wdOrigin=TEAMS-WEB.teamsSdk.openFilePreview&wdExp=TEAMS-CONTROL&web=1

# Components Made in Verilog:
- [x] Clock 
- [x] Data mem
- [x] Instruction Mem
- [x] Register File
- [ ] ALU
- [ ] Adder
- [ ] Shift left two
- [ ] Sign Extender
- [x] D Flip-Flop
- [ ] Multiplexer 2:1 (could be diff for us)
- [ ] CPU (MIPS) (diff for us I think)
- [ ] Controller
- [ ] Main Decoder
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

Choices made:
- 128 registers
- word addressable
- write on rising edge, read on falling edge

