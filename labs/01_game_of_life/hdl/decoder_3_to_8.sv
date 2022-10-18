`timescale 1ns/1ps
module decoder_3_to_8(ena, in, out);

<<<<<<< HEAD
    input wire ena;
    input wire [2:0] in;
    output logic [7:0] out;
    wire [1:0] internal_ena;

    decoder_1_to_2 in_to_ena(
        .ena (ena),
        .in (in[2]),
        .out (internal_ena[1:0])

    );

    decoder_2_to_4 in01_to_out0(
        .ena (internal_ena[0]),
        .in (in[1:0]),
        .out (out[3:0])
    );

    decoder_2_to_4 in01_to_out1(
        .ena (internal_ena[1]),
        .in (in[1:0]),
        .out (out[7:4])
    );
=======
  input wire ena;
  input wire [2:0] in;
  output logic [7:0] out;


>>>>>>> 946925bdd048cb5eac3e173bf627fac5f4d5c730
endmodule