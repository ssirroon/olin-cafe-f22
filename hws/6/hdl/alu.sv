`timescale 1ns/1ps
`default_nettype none

`include "hdl/alu_types.sv"

module alu(a, b, control, result, overflow, zero, equal);
parameter N = 32; // Don't need to support other numbers, just using this as a constant.

input wire [N-1:0] a, b; // Inputs to the ALU.
input alu_control_t control; // Sets the current operation.
output logic [N-1:0] result; // Result of the selected operation.

output logic overflow; // Is high if the result of an ADD or SUB wraps around the 32 bit boundary.
output logic zero;  // Is high if the result is ever all zeros.
output logic equal; // is high if a == b.

logic c_out; 
logic [N-1:0] add_result, sub_result, SLL_result, SRL_result, SRA_result;
logic LT_result, LTU_result;

//Add
adder_n #(.N(N)) ADD(.a(a), .b(b), .c_in(1'b0), .sum(add_result), .c_out(c_out));
//Subtract
adder_n #(.N(N)) SUBTRACT(.a(a), .b(~b), .c_in(1'b1), .sum(sub_result), .c_out(c_out));
//SLL
shift_left_logical #(.N(N)) SLL(.in(a), .shamt(b[$clog2(N)-1:0]), .out(SLL_result));
//SRL
shift_right_logical #(.N(N)) SRL(.in(a), .shamt(b[$clog2(N)-1:0]), .out(SRL_result));
//SRA
shift_right_arithmetic #(.N(N)) SRA(.in(a), .shamt(b[$clog2(N)-1:0]), .out(SRA_result));
//SLT
slt #(.N(32)) LT(.a(a), .b(b), .out(LT_result));
//SLTU
sltu #(.N(32)) LTU(.a(a), .b(b), .out(LTU_result));

always_comb begin : ALU
    case(control)
    ALU_AND: begin
        result = a & b;
    end
    ALU_OR: begin
        result = a | b;
    end
    ALU_XOR: begin 
        result = a ^ b;
    end
    ALU_SLL: begin
        result = SLL_result;
    end
    ALU_SRL: begin
        result = SRL_result;
    end
    ALU_SRA: begin
        result = SRA_result;
    end
    ALU_ADD: begin
        result = add_result;
    end
    ALU_SUB: begin
        result = sub_result;
    end
    ALU_SLT: begin
        result = {LT_result, 31'b0};
    end
    ALU_SLTU: begin
        result = {LTU_result, 31'b0};
    end
    default: result = 0;
    endcase

    equal = &(a ~^ b);
    zero = &(~result);
end

always_comb begin : V_ALU

    case(control)
    
    ALU_SLT, ALU_SLTU, ALU_SUB: begin
        overflow = sub_result[N-1] ^ ((a[N-1] ~^ b[N-1] ~^ 1'b0) & (a[N-1] ^ sub_result[N-1]) & 1'b1); 
    end

    ALU_ADD : begin
       overflow = add_result[N-1] ^ ((a[N-1] ~^ b[N-1] ~^ 1'b1) & (a[N-1] ^ add_result[N-1]) & 1'b0);  
    end
    default: overflow = 0;
    endcase
end

endmodule