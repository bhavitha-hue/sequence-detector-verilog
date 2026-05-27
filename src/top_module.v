module top_module(
    input clk,
    input reset,
    input data_in,
    input [1:0] priority_select,

    output conflict,
    output [3:0] match_vector,
    output [3:0] selected_sequence,

    output [7:0] seq1_count,
    output [7:0] seq2_count,
    output [7:0] seq3_count,
    output [7:0] seq4_count
);

wire [3:0] shift_reg;

shift_register #(
    .WIDTH(4)
)
SR (
    .clk(clk),
    .reset(reset),
    .data_in(data_in),
    .shift_reg(shift_reg)
);

multi_detector MD (
    .shift_reg(shift_reg),
    .match_vector(match_vector)
);

conflict_detector CD (
    .match_vector(match_vector),
    .conflict(conflict)
);

priority_override PO (
    .match_vector(match_vector),
    .priority_select(priority_select),
    .selected_sequence(selected_sequence)
);

counter_module CM (
    .clk(clk),
    .reset(reset),
    .match_vector(match_vector),

    .seq1_count(seq1_count),
    .seq2_count(seq2_count),
    .seq3_count(seq3_count),
    .seq4_count(seq4_count)
);

endmodule