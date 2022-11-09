for i in range(32):
    print(f"mux32 OUT_BLOCK_{i}(\n")
    counter = i
    for j in reversed(range(32)):
        if counter <= 31:
            print(f".in{j:02d}(in[{counter}]),", end=" ")
        else:
            print(f".in{j:02d}(0),", end=" ")
        counter = counter + 1
    print(f".switch(shamt), .out(out[{i}])\n);\n")