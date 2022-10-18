`timescale 1ns/1ps
`default_nettype none

// You may find it useful to have a way to build an n-bit adder, 
// or you can manually create them. 

// This module shows how to use a generate statement to connect
// n 1-bit adders with carries to make a ripple carry adder.
<<<<<<< HEAD

module adder_n(a, b, Cin, S, Cout);

parameter N = 32;

input  wire [N-1:0] a, b;
input wire Cin;
output logic [N-1:0] S;
output wire Cout;

wire [N:0] carries;
assign carries[0] = Cin;
assign Cout = carries[N];
=======
module adder_n(a, b, c_in, sum, c_out);

parameter N = 2;

input  wire [N-1:0] a, b;
input wire c_in;
output logic [N-1:0] sum;
output wire c_out;

wire [N:0] carries;
assign carries[0] = c_in;
assign c_out = carries[N];
>>>>>>> 946925bdd048cb5eac3e173bf627fac5f4d5c730
generate
  genvar i;
  for(i = 0; i < N; i++) begin : ripple_carry
    adder_1 ADDER (
      .a(a[i]),
      .b(b[i]),
<<<<<<< HEAD
      .Cin(carries[i]),
      .S(S[i]),
      .Cout(carries[i+1])
=======
      .c_in(carries[i]),
      .sum(sum[i]),
      .c_out(carries[i+1])
>>>>>>> 946925bdd048cb5eac3e173bf627fac5f4d5c730
    );
  end
endgenerate

endmodule
<<<<<<< HEAD
=======
// to instantiate
// adder_n #(.N(32)) adder_32bit_a ( port list );
>>>>>>> 946925bdd048cb5eac3e173bf627fac5f4d5c730
