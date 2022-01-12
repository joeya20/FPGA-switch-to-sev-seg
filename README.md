# FPGA-switch-to-sev-seg

This projects uses the Terasic DE-10 Lite FPGA development board.

The input being used are 9 switches and 3 7-segment displays.

Input:
1. SW[8]: switch between hex and decimal display output
2. SW[7:0]: Value to be displayed on 7-segment displays

Output:
Decimal or Hex representation of input value

Process:
1. Take binary from SW[7:0] and convert to 12-bit BCD signal for decimal output
2. Pass binary and BCD signal into a mux, with SW[9] as select bit
3. Break up mux output into 3 4-bit signals, all of which are passed to a 7-segment decoder
4. The 7-segment decoders convert the value of the 4-bit signals into 8-bit signals that are passed to the 7-segment displays

Note:
1. BCD signal is obtained using a combinational process that implements the Double Dabble algorithm
2. The 7-segment decoder is implemented as a LUT
