module multi_detector(
    input [3:0] shift_reg,
    output [3:0] match_vector
);

assign match_vector[0] = (shift_reg == 4'b1011);
assign match_vector[1] = (shift_reg == 4'b1101);
assign match_vector[2] = (shift_reg == 4'b0110);
assign match_vector[3] = (shift_reg == 4'b1110);

endmodule