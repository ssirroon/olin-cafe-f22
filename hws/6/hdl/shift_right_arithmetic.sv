`timescale 1ns/1ps
`default_nettype none
module shift_right_arithmetic(in,shamt,out);
parameter N = 32; // only used as a constant! Don't feel like you need to a shifter for arbitrary N.

//port definitions
input  wire [N-1:0] in;    // A 32 bit input
input  wire [$clog2(N)-1:0] shamt; // Shift ammount
output wire [N-1:0] out; // The same as SRL, but maintain the sign bit (MSB) after the shift! 
// It's similar to SRL, but instead of filling in the extra bits with zero, we
// fill them in with the sign bit.
// Remember the *repetition operator*: {n{bits}} will repeat bits n times.

mux32 OUT_BLOCK_0(
.in31(in[0]), .in30(in[1]), .in29(in[2]), .in28(in[3]), .in27(in[4]), .in26(in[5]), .in25(in[6]), .in24(in[7]), .in23(in[8]), .in22(in[9]), .in21(in[10]), .in20(in[11]), .in19(in[12]), .in18(in[13]), .in17(in[14]), .in16(in[15]), .in15(in[16]), .in14(in[17]), .in13(in[18]), .in12(in[19]), .in11(in[20]), .in10(in[21]), .in09(in[22]), .in08(in[23]), .in07(in[24]), .in06(in[25]), .in05(in[26]), .in04(in[27]), .in03(in[28]), .in02(in[29]), .in01(in[30]), .in00(in[0]), .select(shamt), .out(out[0])
);

mux32 OUT_BLOCK_1(
.in31(in[1]), .in30(in[2]), .in29(in[3]), .in28(in[4]), .in27(in[5]), .in26(in[6]), .in25(in[7]), .in24(in[8]), .in23(in[9]), .in22(in[10]), .in21(in[11]), .in20(in[12]), .in19(in[13]), .in18(in[14]), .in17(in[15]), .in16(in[16]), .in15(in[17]), .in14(in[18]), .in13(in[19]), .in12(in[20]), .in11(in[21]), .in10(in[22]), .in09(in[23]), .in08(in[24]), .in07(in[25]), .in06(in[26]), .in05(in[27]), .in04(in[28]), .in03(in[29]), .in02(in[30]), .in01(in[31]), .in00(in[0]), .select(shamt), .out(out[1])
);

mux32 OUT_BLOCK_2(
.in31(in[2]), .in30(in[3]), .in29(in[4]), .in28(in[5]), .in27(in[6]), .in26(in[7]), .in25(in[8]), .in24(in[9]), .in23(in[10]), .in22(in[11]), .in21(in[12]), .in20(in[13]), .in19(in[14]), .in18(in[15]), .in17(in[16]), .in16(in[17]), .in15(in[18]), .in14(in[19]), .in13(in[20]), .in12(in[21]), .in11(in[22]), .in10(in[23]), .in09(in[24]), .in08(in[25]), .in07(in[26]), .in06(in[27]), .in05(in[28]), .in04(in[29]), .in03(in[30]), .in02(in[31]), .in01(1'b0), .in00(in[0]), .select(shamt), .out(out[2])
);

mux32 OUT_BLOCK_3(
.in31(in[3]), .in30(in[4]), .in29(in[5]), .in28(in[6]), .in27(in[7]), .in26(in[8]), .in25(in[9]), .in24(in[10]), .in23(in[11]), .in22(in[12]), .in21(in[13]), .in20(in[14]), .in19(in[15]), .in18(in[16]), .in17(in[17]), .in16(in[18]), .in15(in[19]), .in14(in[20]), .in13(in[21]), .in12(in[22]), .in11(in[23]), .in10(in[24]), .in09(in[25]), .in08(in[26]), .in07(in[27]), .in06(in[28]), .in05(in[29]), .in04(in[30]), .in03(in[31]), .in02(1'b0), .in01(1'b0), .in00(in[0]), .select(shamt), .out(out[3])
);

mux32 OUT_BLOCK_4(
.in31(in[4]), .in30(in[5]), .in29(in[6]), .in28(in[7]), .in27(in[8]), .in26(in[9]), .in25(in[10]), .in24(in[11]), .in23(in[12]), .in22(in[13]), .in21(in[14]), .in20(in[15]), .in19(in[16]), .in18(in[17]), .in17(in[18]), .in16(in[19]), .in15(in[20]), .in14(in[21]), .in13(in[22]), .in12(in[23]), .in11(in[24]), .in10(in[25]), .in09(in[26]), .in08(in[27]), .in07(in[28]), .in06(in[29]), .in05(in[30]), .in04(in[31]), .in03(1'b0), .in02(1'b0), .in01(1'b0), .in00(in[0]), .select(shamt), .out(out[4])
);

mux32 OUT_BLOCK_5(
.in31(in[5]), .in30(in[6]), .in29(in[7]), .in28(in[8]), .in27(in[9]), .in26(in[10]), .in25(in[11]), .in24(in[12]), .in23(in[13]), .in22(in[14]), .in21(in[15]), .in20(in[16]), .in19(in[17]), .in18(in[18]), .in17(in[19]), .in16(in[20]), .in15(in[21]), .in14(in[22]), .in13(in[23]), .in12(in[24]), .in11(in[25]), .in10(in[26]), .in09(in[27]), .in08(in[28]), .in07(in[29]), .in06(in[30]), .in05(in[31]), .in04(1'b0), .in03(1'b0), .in02(1'b0), .in01(1'b0), .in00(in[0]), .select(shamt), .out(out[5])
);

mux32 OUT_BLOCK_6(
.in31(in[6]), .in30(in[7]), .in29(in[8]), .in28(in[9]), .in27(in[10]), .in26(in[11]), .in25(in[12]), .in24(in[13]), .in23(in[14]), .in22(in[15]), .in21(in[16]), .in20(in[17]), .in19(in[18]), .in18(in[19]), .in17(in[20]), .in16(in[21]), .in15(in[22]), .in14(in[23]), .in13(in[24]), .in12(in[25]), .in11(in[26]), .in10(in[27]), .in09(in[28]), .in08(in[29]), .in07(in[30]), .in06(in[31]), .in05(1'b0), .in04(1'b0), .in03(1'b0), .in02(1'b0), .in01(1'b0), .in00(in[0]), .select(shamt), .out(out[6])
);

mux32 OUT_BLOCK_7(
.in31(in[7]), .in30(in[8]), .in29(in[9]), .in28(in[10]), .in27(in[11]), .in26(in[12]), .in25(in[13]), .in24(in[14]), .in23(in[15]), .in22(in[16]), .in21(in[17]), .in20(in[18]), .in19(in[19]), .in18(in[20]), .in17(in[21]), .in16(in[22]), .in15(in[23]), .in14(in[24]), .in13(in[25]), .in12(in[26]), .in11(in[27]), .in10(in[28]), .in09(in[29]), .in08(in[30]), .in07(in[31]), .in06(1'b0), .in05(1'b0), .in04(1'b0), .in03(1'b0), .in02(1'b0), .in01(1'b0), .in00(in[0]), .select(shamt), .out(out[7])
);

mux32 OUT_BLOCK_8(
.in31(in[8]), .in30(in[9]), .in29(in[10]), .in28(in[11]), .in27(in[12]), .in26(in[13]), .in25(in[14]), .in24(in[15]), .in23(in[16]), .in22(in[17]), .in21(in[18]), .in20(in[19]), .in19(in[20]), .in18(in[21]), .in17(in[22]), .in16(in[23]), .in15(in[24]), .in14(in[25]), .in13(in[26]), .in12(in[27]), .in11(in[28]), .in10(in[29]), .in09(in[30]), .in08(in[31]), .in07(1'b0), .in06(1'b0), .in05(1'b0), .in04(1'b0), .in03(1'b0), .in02(1'b0), .in01(1'b0), .in00(in[0]), .select(shamt), .out(out[8])
);

mux32 OUT_BLOCK_9(
.in31(in[9]), .in30(in[10]), .in29(in[11]), .in28(in[12]), .in27(in[13]), .in26(in[14]), .in25(in[15]), .in24(in[16]), .in23(in[17]), .in22(in[18]), .in21(in[19]), .in20(in[20]), .in19(in[21]), .in18(in[22]), .in17(in[23]), .in16(in[24]), .in15(in[25]), .in14(in[26]), .in13(in[27]), .in12(in[28]), .in11(in[29]), .in10(in[30]), .in09(in[31]), .in08(1'b0), .in07(1'b0), .in06(1'b0), .in05(1'b0), .in04(1'b0), .in03(1'b0), .in02(1'b0), .in01(1'b0), .in00(in[0]), .select(shamt), .out(out[9])
);

mux32 OUT_BLOCK_10(
.in31(in[10]), .in30(in[11]), .in29(in[12]), .in28(in[13]), .in27(in[14]), .in26(in[15]), .in25(in[16]), .in24(in[17]), .in23(in[18]), .in22(in[19]), .in21(in[20]), .in20(in[21]), .in19(in[22]), .in18(in[23]), .in17(in[24]), .in16(in[25]), .in15(in[26]), .in14(in[27]), .in13(in[28]), .in12(in[29]), .in11(in[30]), .in10(in[31]), .in09(1'b0), .in08(1'b0), .in07(1'b0), .in06(1'b0), .in05(1'b0), .in04(1'b0), .in03(1'b0), .in02(1'b0), .in01(1'b0), .in00(in[0]), .select(shamt), .out(out[10])
);

mux32 OUT_BLOCK_11(
.in31(in[11]), .in30(in[12]), .in29(in[13]), .in28(in[14]), .in27(in[15]), .in26(in[16]), .in25(in[17]), .in24(in[18]), .in23(in[19]), .in22(in[20]), .in21(in[21]), .in20(in[22]), .in19(in[23]), .in18(in[24]), .in17(in[25]), .in16(in[26]), .in15(in[27]), .in14(in[28]), .in13(in[29]), .in12(in[30]), .in11(in[31]), .in10(1'b0), .in09(1'b0), .in08(1'b0), .in07(1'b0), .in06(1'b0), .in05(1'b0), .in04(1'b0), .in03(1'b0), .in02(1'b0), .in01(1'b0), .in00(in[0]), .select(shamt), .out(out[11])
);

mux32 OUT_BLOCK_12(
.in31(in[12]), .in30(in[13]), .in29(in[14]), .in28(in[15]), .in27(in[16]), .in26(in[17]), .in25(in[18]), .in24(in[19]), .in23(in[20]), .in22(in[21]), .in21(in[22]), .in20(in[23]), .in19(in[24]), .in18(in[25]), .in17(in[26]), .in16(in[27]), .in15(in[28]), .in14(in[29]), .in13(in[30]), .in12(in[31]), .in11(1'b0), .in10(1'b0), .in09(1'b0), .in08(1'b0), .in07(1'b0), .in06(1'b0), .in05(1'b0), .in04(1'b0), .in03(1'b0), .in02(1'b0), .in01(1'b0), .in00(in[0]), .select(shamt), .out(out[12])
);

mux32 OUT_BLOCK_13(
.in31(in[13]), .in30(in[14]), .in29(in[15]), .in28(in[16]), .in27(in[17]), .in26(in[18]), .in25(in[19]), .in24(in[20]), .in23(in[21]), .in22(in[22]), .in21(in[23]), .in20(in[24]), .in19(in[25]), .in18(in[26]), .in17(in[27]), .in16(in[28]), .in15(in[29]), .in14(in[30]), .in13(in[31]), .in12(1'b0), .in11(1'b0), .in10(1'b0), .in09(1'b0), .in08(1'b0), .in07(1'b0), .in06(1'b0), .in05(1'b0), .in04(1'b0), .in03(1'b0), .in02(1'b0), .in01(1'b0), .in00(in[0]), .select(shamt), .out(out[13])
);

mux32 OUT_BLOCK_14(
.in31(in[14]), .in30(in[15]), .in29(in[16]), .in28(in[17]), .in27(in[18]), .in26(in[19]), .in25(in[20]), .in24(in[21]), .in23(in[22]), .in22(in[23]), .in21(in[24]), .in20(in[25]), .in19(in[26]), .in18(in[27]), .in17(in[28]), .in16(in[29]), .in15(in[30]), .in14(in[31]), .in13(1'b0), .in12(1'b0), .in11(1'b0), .in10(1'b0), .in09(1'b0), .in08(1'b0), .in07(1'b0), .in06(1'b0), .in05(1'b0), .in04(1'b0), .in03(1'b0), .in02(1'b0), .in01(1'b0), .in00(in[0]), .select(shamt), .out(out[14])
);

mux32 OUT_BLOCK_15(
.in31(in[15]), .in30(in[16]), .in29(in[17]), .in28(in[18]), .in27(in[19]), .in26(in[20]), .in25(in[21]), .in24(in[22]), .in23(in[23]), .in22(in[24]), .in21(in[25]), .in20(in[26]), .in19(in[27]), .in18(in[28]), .in17(in[29]), .in16(in[30]), .in15(in[31]), .in14(1'b0), .in13(1'b0), .in12(1'b0), .in11(1'b0), .in10(1'b0), .in09(1'b0), .in08(1'b0), .in07(1'b0), .in06(1'b0), .in05(1'b0), .in04(1'b0), .in03(1'b0), .in02(1'b0), .in01(1'b0), .in00(in[0]), .select(shamt), .out(out[15])
);

mux32 OUT_BLOCK_16(
.in31(in[16]), .in30(in[17]), .in29(in[18]), .in28(in[19]), .in27(in[20]), .in26(in[21]), .in25(in[22]), .in24(in[23]), .in23(in[24]), .in22(in[25]), .in21(in[26]), .in20(in[27]), .in19(in[28]), .in18(in[29]), .in17(in[30]), .in16(in[31]), .in15(1'b0), .in14(1'b0), .in13(1'b0), .in12(1'b0), .in11(1'b0), .in10(1'b0), .in09(1'b0), .in08(1'b0), .in07(1'b0), .in06(1'b0), .in05(1'b0), .in04(1'b0), .in03(1'b0), .in02(1'b0), .in01(1'b0), .in00(in[0]), .select(shamt), .out(out[16])
);

mux32 OUT_BLOCK_17(
.in31(in[17]), .in30(in[18]), .in29(in[19]), .in28(in[20]), .in27(in[21]), .in26(in[22]), .in25(in[23]), .in24(in[24]), .in23(in[25]), .in22(in[26]), .in21(in[27]), .in20(in[28]), .in19(in[29]), .in18(in[30]), .in17(in[31]), .in16(1'b0), .in15(1'b0), .in14(1'b0), .in13(1'b0), .in12(1'b0), .in11(1'b0), .in10(1'b0), .in09(1'b0), .in08(1'b0), .in07(1'b0), .in06(1'b0), .in05(1'b0), .in04(1'b0), .in03(1'b0), .in02(1'b0), .in01(1'b0), .in00(in[0]), .select(shamt), .out(out[17])
);

mux32 OUT_BLOCK_18(
.in31(in[18]), .in30(in[19]), .in29(in[20]), .in28(in[21]), .in27(in[22]), .in26(in[23]), .in25(in[24]), .in24(in[25]), .in23(in[26]), .in22(in[27]), .in21(in[28]), .in20(in[29]), .in19(in[30]), .in18(in[31]), .in17(1'b0), .in16(1'b0), .in15(1'b0), .in14(1'b0), .in13(1'b0), .in12(1'b0), .in11(1'b0), .in10(1'b0), .in09(1'b0), .in08(1'b0), .in07(1'b0), .in06(1'b0), .in05(1'b0), .in04(1'b0), .in03(1'b0), .in02(1'b0), .in01(1'b0), .in00(in[0]), .select(shamt), .out(out[18])
);

mux32 OUT_BLOCK_19(
.in31(in[19]), .in30(in[20]), .in29(in[21]), .in28(in[22]), .in27(in[23]), .in26(in[24]), .in25(in[25]), .in24(in[26]), .in23(in[27]), .in22(in[28]), .in21(in[29]), .in20(in[30]), .in19(in[31]), .in18(1'b0), .in17(1'b0), .in16(1'b0), .in15(1'b0), .in14(1'b0), .in13(1'b0), .in12(1'b0), .in11(1'b0), .in10(1'b0), .in09(1'b0), .in08(1'b0), .in07(1'b0), .in06(1'b0), .in05(1'b0), .in04(1'b0), .in03(1'b0), .in02(1'b0), .in01(1'b0), .in00(in[0]), .select(shamt), .out(out[19])
);

mux32 OUT_BLOCK_20(
.in31(in[20]), .in30(in[21]), .in29(in[22]), .in28(in[23]), .in27(in[24]), .in26(in[25]), .in25(in[26]), .in24(in[27]), .in23(in[28]), .in22(in[29]), .in21(in[30]), .in20(in[31]), .in19(1'b0), .in18(1'b0), .in17(1'b0), .in16(1'b0), .in15(1'b0), .in14(1'b0), .in13(1'b0), .in12(1'b0), .in11(1'b0), .in10(1'b0), .in09(1'b0), .in08(1'b0), .in07(1'b0), .in06(1'b0), .in05(1'b0), .in04(1'b0), .in03(1'b0), .in02(1'b0), .in01(1'b0), .in00(in[0]), .select(shamt), .out(out[20])
);

mux32 OUT_BLOCK_21(
.in31(in[21]), .in30(in[22]), .in29(in[23]), .in28(in[24]), .in27(in[25]), .in26(in[26]), .in25(in[27]), .in24(in[28]), .in23(in[29]), .in22(in[30]), .in21(in[31]), .in20(1'b0), .in19(1'b0), .in18(1'b0), .in17(1'b0), .in16(1'b0), .in15(1'b0), .in14(1'b0), .in13(1'b0), .in12(1'b0), .in11(1'b0), .in10(1'b0), .in09(1'b0), .in08(1'b0), .in07(1'b0), .in06(1'b0), .in05(1'b0), .in04(1'b0), .in03(1'b0), .in02(1'b0), .in01(1'b0), .in00(in[0]), .select(shamt), .out(out[21])
);

mux32 OUT_BLOCK_22(
.in31(in[22]), .in30(in[23]), .in29(in[24]), .in28(in[25]), .in27(in[26]), .in26(in[27]), .in25(in[28]), .in24(in[29]), .in23(in[30]), .in22(in[31]), .in21(1'b0), .in20(1'b0), .in19(1'b0), .in18(1'b0), .in17(1'b0), .in16(1'b0), .in15(1'b0), .in14(1'b0), .in13(1'b0), .in12(1'b0), .in11(1'b0), .in10(1'b0), .in09(1'b0), .in08(1'b0), .in07(1'b0), .in06(1'b0), .in05(1'b0), .in04(1'b0), .in03(1'b0), .in02(1'b0), .in01(1'b0), .in00(in[0]), .select(shamt), .out(out[22])
);

mux32 OUT_BLOCK_23(
.in31(in[23]), .in30(in[24]), .in29(in[25]), .in28(in[26]), .in27(in[27]), .in26(in[28]), .in25(in[29]), .in24(in[30]), .in23(in[31]), .in22(1'b0), .in21(1'b0), .in20(1'b0), .in19(1'b0), .in18(1'b0), .in17(1'b0), .in16(1'b0), .in15(1'b0), .in14(1'b0), .in13(1'b0), .in12(1'b0), .in11(1'b0), .in10(1'b0), .in09(1'b0), .in08(1'b0), .in07(1'b0), .in06(1'b0), .in05(1'b0), .in04(1'b0), .in03(1'b0), .in02(1'b0), .in01(1'b0), .in00(in[0]), .select(shamt), .out(out[23])
);

mux32 OUT_BLOCK_24(
.in31(in[24]), .in30(in[25]), .in29(in[26]), .in28(in[27]), .in27(in[28]), .in26(in[29]), .in25(in[30]), .in24(in[31]), .in23(1'b0), .in22(1'b0), .in21(1'b0), .in20(1'b0), .in19(1'b0), .in18(1'b0), .in17(1'b0), .in16(1'b0), .in15(1'b0), .in14(1'b0), .in13(1'b0), .in12(1'b0), .in11(1'b0), .in10(1'b0), .in09(1'b0), .in08(1'b0), .in07(1'b0), .in06(1'b0), .in05(1'b0), .in04(1'b0), .in03(1'b0), .in02(1'b0), .in01(1'b0), .in00(in[0]), .select(shamt), .out(out[24])
);

mux32 OUT_BLOCK_25(
.in31(in[25]), .in30(in[26]), .in29(in[27]), .in28(in[28]), .in27(in[29]), .in26(in[30]), .in25(in[31]), .in24(1'b0), .in23(1'b0), .in22(1'b0), .in21(1'b0), .in20(1'b0), .in19(1'b0), .in18(1'b0), .in17(1'b0), .in16(1'b0), .in15(1'b0), .in14(1'b0), .in13(1'b0), .in12(1'b0), .in11(1'b0), .in10(1'b0), .in09(1'b0), .in08(1'b0), .in07(1'b0), .in06(1'b0), .in05(1'b0), .in04(1'b0), .in03(1'b0), .in02(1'b0), .in01(1'b0), .in00(in[0]), .select(shamt), .out(out[25])
);

mux32 OUT_BLOCK_26(
.in31(in[26]), .in30(in[27]), .in29(in[28]), .in28(in[29]), .in27(in[30]), .in26(in[31]), .in25(1'b0), .in24(1'b0), .in23(1'b0), .in22(1'b0), .in21(1'b0), .in20(1'b0), .in19(1'b0), .in18(1'b0), .in17(1'b0), .in16(1'b0), .in15(1'b0), .in14(1'b0), .in13(1'b0), .in12(1'b0), .in11(1'b0), .in10(1'b0), .in09(1'b0), .in08(1'b0), .in07(1'b0), .in06(1'b0), .in05(1'b0), .in04(1'b0), .in03(1'b0), .in02(1'b0), .in01(1'b0), .in00(in[0]), .select(shamt), .out(out[26])
);

mux32 OUT_BLOCK_27(
.in31(in[27]), .in30(in[28]), .in29(in[29]), .in28(in[30]), .in27(in[31]), .in26(1'b0), .in25(1'b0), .in24(1'b0), .in23(1'b0), .in22(1'b0), .in21(1'b0), .in20(1'b0), .in19(1'b0), .in18(1'b0), .in17(1'b0), .in16(1'b0), .in15(1'b0), .in14(1'b0), .in13(1'b0), .in12(1'b0), .in11(1'b0), .in10(1'b0), .in09(1'b0), .in08(1'b0), .in07(1'b0), .in06(1'b0), .in05(1'b0), .in04(1'b0), .in03(1'b0), .in02(1'b0), .in01(1'b0), .in00(in[0]), .select(shamt), .out(out[27])
);

mux32 OUT_BLOCK_28(
.in31(in[28]), .in30(in[29]), .in29(in[30]), .in28(in[31]), .in27(1'b0), .in26(1'b0), .in25(1'b0), .in24(1'b0), .in23(1'b0), .in22(1'b0), .in21(1'b0), .in20(1'b0), .in19(1'b0), .in18(1'b0), .in17(1'b0), .in16(1'b0), .in15(1'b0), .in14(1'b0), .in13(1'b0), .in12(1'b0), .in11(1'b0), .in10(1'b0), .in09(1'b0), .in08(1'b0), .in07(1'b0), .in06(1'b0), .in05(1'b0), .in04(1'b0), .in03(1'b0), .in02(1'b0), .in01(1'b0), .in00(in[0]), .select(shamt), .out(out[28])
);

mux32 OUT_BLOCK_29(
.in31(in[29]), .in30(in[30]), .in29(in[31]), .in28(1'b0), .in27(1'b0), .in26(1'b0), .in25(1'b0), .in24(1'b0), .in23(1'b0), .in22(1'b0), .in21(1'b0), .in20(1'b0), .in19(1'b0), .in18(1'b0), .in17(1'b0), .in16(1'b0), .in15(1'b0), .in14(1'b0), .in13(1'b0), .in12(1'b0), .in11(1'b0), .in10(1'b0), .in09(1'b0), .in08(1'b0), .in07(1'b0), .in06(1'b0), .in05(1'b0), .in04(1'b0), .in03(1'b0), .in02(1'b0), .in01(1'b0), .in00(in[0]), .select(shamt), .out(out[29])
);

mux32 OUT_BLOCK_30(
.in31(in[30]), .in30(in[31]), .in29(1'b0), .in28(1'b0), .in27(1'b0), .in26(1'b0), .in25(1'b0), .in24(1'b0), .in23(1'b0), .in22(1'b0), .in21(1'b0), .in20(1'b0), .in19(1'b0), .in18(1'b0), .in17(1'b0), .in16(1'b0), .in15(1'b0), .in14(1'b0), .in13(1'b0), .in12(1'b0), .in11(1'b0), .in10(1'b0), .in09(1'b0), .in08(1'b0), .in07(1'b0), .in06(1'b0), .in05(1'b0), .in04(1'b0), .in03(1'b0), .in02(1'b0), .in01(1'b0), .in00(in[0]), .select(shamt), .out(out[30])
);

mux32 OUT_BLOCK_31(
.in31(in[31]), .in30(1'b0), .in29(1'b0), .in28(1'b0), .in27(1'b0), .in26(1'b0), .in25(1'b0), .in24(1'b0), .in23(1'b0), .in22(1'b0), .in21(1'b0), .in20(1'b0), .in19(1'b0), .in18(1'b0), .in17(1'b0), .in16(1'b0), .in15(1'b0), .in14(1'b0), .in13(1'b0), .in12(1'b0), .in11(1'b0), .in10(1'b0), .in09(1'b0), .in08(1'b0), .in07(1'b0), .in06(1'b0), .in05(1'b0), .in04(1'b0), .in03(1'b0), .in02(1'b0), .in01(1'b0), .in00(in[0]), .select(shamt), .out(out[31])
);
endmodule
