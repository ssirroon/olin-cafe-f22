`timescale 1ns/1ps

module decoder_2_to_4(ena, in, out);

    input wire ena;
    input wire [1:0] in;
    output logic [3:0] out;
    wire [1:0] ena_wire;

    decoder_1_to_2 in_to_ena(
        .ena (ena),
        .in (in[1]),
        .out (ena_wire[1:0])
    );

    decoder_1_to_2 in_to_out0(
        .ena (ena_wire[0]),
        .in (in[0]),
        .out (out[1:0])
    );

    decoder_1_to_2 in_to_out1(
        .ena (ena_wire[1]),
        .in (in[0]),
        .out (out[3:2])
    );
endmodule