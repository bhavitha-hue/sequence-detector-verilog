module comparator #(
    parameter WIDTH = 8,
    parameter SEQUENCE = 8'b10110110
)(
    input [WIDTH-1:0] shift_reg,
    output detect
);

assign detect = (shift_reg == SEQUENCE);

endmodule