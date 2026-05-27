module counter_module(
    input clk,
    input reset,
    input [3:0] match_vector,

    output reg [7:0] seq1_count,
    output reg [7:0] seq2_count,
    output reg [7:0] seq3_count,
    output reg [7:0] seq4_count
);

always @(posedge clk)
begin

    if(reset)
    begin
        seq1_count <= 0;
        seq2_count <= 0;
        seq3_count <= 0;
        seq4_count <= 0;
    end

    else
    begin

        if(match_vector[0])
            seq1_count <= seq1_count + 1;

        if(match_vector[1])
            seq2_count <= seq2_count + 1;

        if(match_vector[2])
            seq3_count <= seq3_count + 1;

        if(match_vector[3])
            seq4_count <= seq4_count + 1;

    end

end

endmodule