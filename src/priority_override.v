module priority_override(
    input [3:0] match_vector,
    input [1:0] priority_select,
    output reg [3:0] selected_sequence
);

always @(*)
begin
    selected_sequence = 4'b0000;

    case(priority_select)

        2'b00:
        begin
            if(match_vector[0])
                selected_sequence = 4'b0001;
        end

        2'b01:
        begin
            if(match_vector[1])
                selected_sequence = 4'b0010;
        end

        2'b10:
        begin
            if(match_vector[2])
                selected_sequence = 4'b0100;
        end

        2'b11:
        begin
            if(match_vector[3])
                selected_sequence = 4'b1000;
        end

    endcase
end

endmodule