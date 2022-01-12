//This module uses the double dabble algorithm to convert an n-bit binary value into a bcd signal
//process:
// 1. Shift the binary value bit by bit
// 2. After shifting a bit, check every decimal digit in the BCD signal and add 3 if the value exceeds 4

module bin_to_bcd
	#(
		parameter c_BIN_WIDTH = 8,
		parameter c_DEC_DIGITS = 3
	)
	(                                         
		input		[c_BIN_WIDTH-1:0] 		i_bin,
		output	[(c_DEC_DIGITS*4)-1:0]	o_bcd
	);
	
	//reg to store BCD value as bits are shifted from bin value
	reg [(c_DEC_DIGITS*4)-1:0] r_bcd;
	
	//reg to store bin index; hardcoded to max value of 7
	reg [3:0] r_bin_index;
	
	//reg to store dec index; hardcoded to max value of 3
	reg [2:0] r_dec_index;
	
	//reg to store current decimal value from BCD signal
	reg [3:0] r_dec_val;
	
	//when input bin value changes
	always @ (i_bin) begin
	
		//reset BCD signal
		r_bcd = 0;
		
		//loop to shift bits from bin signal to BCD signal
		for(r_bin_index = 0; r_bin_index < c_BIN_WIDTH; r_bin_index = r_bin_index + 1) begin
		
			//shift one bit over
			r_bcd = {r_bcd[11:0], i_bin[c_BIN_WIDTH-r_bin_index-1+:1]};
			
			//loop to check each if decimal digit in BCD signal is greater than 4; Don't check after last shift
			if(r_bin_index < c_BIN_WIDTH-1) begin
				for(r_dec_index = 0; r_dec_index < c_DEC_DIGITS; r_dec_index = r_dec_index + 1) begin
				
					r_dec_val = r_bcd[(r_dec_index*4)+:4];
					
					if(r_dec_val > 4) begin
						r_bcd[(r_dec_index*4)+:4] = r_dec_val + 3;
					end
				end
			end
		
		end
	end
	
	assign o_bcd = r_bcd;
	
endmodule