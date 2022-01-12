module sev_seg_decoder
(
	input 	[3:0] i_bcd,
	output 	[7:0] o_sev_seg
);

	reg [7:0] r_sev_seg;
	
	always @ (i_bcd) begin
		case(i_bcd)
			4'b0000 : r_sev_seg <= 8'b11000000;
			4'b0001 : r_sev_seg <= 8'b11111001;
			4'b0010 : r_sev_seg <= 8'b10100100;			//active low
			4'b0011 : r_sev_seg <= 8'b10110000;			// --0--    
			4'b0100 : r_sev_seg <= 8'b10011001;			//|     |
			4'b0101 : r_sev_seg <= 8'b10010010;			//5     1  
			4'b0110 : r_sev_seg <= 8'b10000010;			//|     |   
			4'b0111 : r_sev_seg <= 8'b11111000;			// --6--   
			4'b1000 : r_sev_seg <= 8'b10000000;			//|     |  
			4'b1001 : r_sev_seg <= 8'b10010000;			//4     2
			4'b1010 : r_sev_seg <= 8'b10001000;			//|     |
			4'b1011 : r_sev_seg <= 8'b10000000;			// --3--  .7
			4'b1100 : r_sev_seg <= 8'b11000110;			
			4'b1101 : r_sev_seg <= 8'b11000000;
			4'b1110 : r_sev_seg <= 8'b10000110;
			4'b1111 : r_sev_seg <= 8'b10001110;
		endcase
	end
	
	assign o_sev_seg = r_sev_seg;
	
endmodule