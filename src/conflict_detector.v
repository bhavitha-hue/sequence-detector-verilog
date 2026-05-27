module conflict_detector(
    input [3:0] match_vector,
    output conflict
);

assign conflict = |(match_vector & (match_vector - 1));

endmodule