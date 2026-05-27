`timescale 1ns/1ps

module top_module_tb;

reg clk;
reg reset;
reg data_in;
reg [1:0] priority_select;

wire conflict;
wire [3:0] match_vector;
wire [3:0] selected_sequence;

wire [7:0] seq1_count;
wire [7:0] seq2_count;
wire [7:0] seq3_count;
wire [7:0] seq4_count;

top_module DUT (
    .clk(clk),
    .reset(reset),
    .data_in(data_in),
    .priority_select(priority_select),

    .conflict(conflict),
    .match_vector(match_vector),
    .selected_sequence(selected_sequence),

    .seq1_count(seq1_count),
    .seq2_count(seq2_count),
    .seq3_count(seq3_count),
    .seq4_count(seq4_count)
);

always #5 clk = ~clk;

initial
begin
    $dumpfile("wave.vcd");
    $dumpvars(0, top_module_tb);
    clk = 0;
    reset = 1;
    data_in = 0;
    priority_select = 2'b00;

    #20;
    reset = 0;

    // Input Stream: 10110110

    data_in = 1; #10;
    data_in = 0; #10;
    data_in = 1; #10;
    data_in = 1; #10;
    data_in = 0; #10;
    data_in = 1; #10;
    data_in = 1; #10;
    data_in = 0; #10;

    // Change priority

    priority_select = 2'b01;

    #50;

    $stop;

end

endmodule