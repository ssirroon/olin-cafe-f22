def shift_left():
    for i in range(32):
        print(f"mux32 OUT_BLOCK_{i}(")
        counter = i
        for j in range(32):
            if counter >= 0:
                print(f".in{j:02d}(in[{counter}]),", end=" ")
            else:
                print(f".in{j:02d}(1'b0),", end=" ")
            counter = counter-1
        print(f".select(shamt), .out(out[{i}])\n);\n")


def shift_right():
    for i in range(32):
        print(f"mux32 OUT_BLOCK_{i}(")
        counter = i
        for j in reversed(range(32)):
            if counter <= 31:
                print(f".in{j:02d}(in[{counter}]),", end=" ")
            else:
                print(f".in{j:02d}(1'b0),", end=" ")
            counter = counter + 1
        print(f".select(shamt), .out(out[{i}])\n);\n")


def shift_right_a():
    for i in range(32):
        print(f"mux32 OUT_BLOCK_{i}(")
        counter = i
        for j in reversed(range(1,32)):
            if counter <= 31:
                print(f".in{j:02d}(in[{counter}]),", end=" ")
            else:
                print(f".in{j:02d}(1'b0),", end=" ")
            counter = counter + 1
        print(f".in00(in[0]), .select(shamt), .out(out[{i}])\n);\n")

if __name__ == "__main__":
    shift_left()
