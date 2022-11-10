module slt(a, b, out);
parameter N = 32;
input wire signed [N-1:0] a, b;
output logic out;

// Using only *structural* combinational logic, make a module that computes if a is less than b!
// Note: this assumes that the two inputs are signed: aka should be interpreted as two's complement.
logic signed [N-1:0] sum;
logic Cout;

adder_n #(.N(32)) ADDER(.a(a), .b(~b), .c_in(1'b1), .sum(sum), .c_out(Cout));
always_comb begin : compare_lt
    out <= ((a[N-1] ^ b[N-1]) & a[N-1]) | ((a[N-1] ~^ b[N-1]) & sum[N-1]);
end
// Copy any other modules you use into this folder and update the Makefile accordingly.

endmodule


