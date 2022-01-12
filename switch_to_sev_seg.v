/*
This project will read an 8-bit value from SW[7:0] to display that value in decimal or hex based on the value of SW[8]
*/


module switch_to_sev_seg
(
	input 	[9:0] SW,
	output 	[7:0] HEX0,
	output 	[7:0] HEX1,
	output 	[7:0] HEX2,
	output	[9:0] LEDR
);

	//bin to bcd output
	wire [11:0] w_bcd;
	
	//bcd or bin intermediate signal
	reg [11:0] r_data;
	
	//bcd to sev seg decoder outputs
	wire 	[7:0] w_HEX0;
	wire 	[7:0] w_HEX1;
	wire 	[7:0] w_HEX2;
	
	always @ (SW) begin
		case(SW[8])
			1'b0 : r_data <= {{4{1'b0}}, SW[7:0]};
			1'b1 : r_data <= w_bcd;			
		endcase
	end
	
	bin_to_bcd bcd_converter
	(
		.i_bin(SW[7:0]),
		.o_bcd(w_bcd)
	);
	
	sev_seg_decoder sev_seg_ins0
	(
		.i_bcd(r_data[3:0]),
		.o_sev_seg(w_HEX0)
	);

	sev_seg_decoder sev_seg_ins1
	(
		.i_bcd(r_data[7:4]),
		.o_sev_seg(w_HEX1)
	);
	
	sev_seg_decoder sev_seg_ins2
	(
		.i_bcd(r_data[11:8]),
		.o_sev_seg(w_HEX2)
	);
	
	assign LEDR = SW;
	assign HEX0 = w_HEX0;
	assign HEX1 = w_HEX1;	
	assign HEX2 = w_HEX2;
	
endmodule