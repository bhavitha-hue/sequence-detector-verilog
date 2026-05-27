module shift_register #(
    parameter WIDTH = 8
)(
    input clk,
    input reset,
    input data_in,
    output reg [WIDTH-1:0] shift_reg
);

always @(posedge clk)
begin
    if(reset)
        shift_reg <= 0;

    else
        shift_reg <= {shift_reg[WIDTH-2:0], data_in};
end

endmodule