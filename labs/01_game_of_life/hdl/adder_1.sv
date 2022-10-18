`timescale 1ns/1ps
`default_nettype none
<<<<<<< HEAD

module adder_1(a, b, Cin, S, Cout);
    input wire a, b, Cin;
    output logic S, Cout;

    always_comb begin
        S = a ^ b ^ Cin;
        Cout = (a & b) | (a & Cin) | (b & Cin);
    end
=======
/*
  a 1 bit addder that we can daisy chain for 
  ripple carry adders
*/

module adder_1(a, b, c_in, sum, c_out);

input wire a, b, c_in;
output logic sum, c_out;

>>>>>>> 946925bdd048cb5eac3e173bf627fac5f4d5c730

endmodule
