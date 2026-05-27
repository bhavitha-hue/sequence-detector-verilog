module display_controller(
    input conflict,
    input [3:0] selected_sequence,
    output [4:0] leds
);

assign leds[0] = selected_sequence[0];
assign leds[1] = selected_sequence[1];
assign leds[2] = selected_sequence[2];
assign leds[3] = selected_sequence[3];
assign leds[4] = conflict;

endmodule