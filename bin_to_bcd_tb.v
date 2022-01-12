module bin_to_bcd_tb ();

	reg [7:0] r_sw;
	wire [11:0] w_bcd;

	bin_to_bcd DUT
	(
		.i_bin(r_sw),
		.o_bcd(w_bcd)
	);
	
	initial begin
			r_sw = 0;
		#5 	r_sw = 1;
		#5 r_sw = 255;
		#5 r_sw = 233;
		#5 r_sw = 13;
		#5 r_sw = 50;
		#5 r_sw = 7;
		#5 r_sw = 0;
		#5 $finish;
	end
	
endmodule