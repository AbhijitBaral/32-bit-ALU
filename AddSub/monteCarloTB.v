module tb_32bitAdder;
    reg [31:0] A, B;
    reg Cin;
    wire [31:0] S;
    wire Cout;
    
    integer i;
    
    // Instantiate the adder
    thirtyTwoBitAdder uut (.A(A), .B(B), .Cin(Cin), .S(S), .Cout(Cout));

    initial begin
        $dumpfile("cla32bit.vcd");
        $dumpvars(0, tb_32bitAdder);

        for (i = 0; i < 10000; i = i + 1) begin
            A = $random;  // Random 32-bit value
            B = $random;
            Cin = $random % 2; // Random carry-in (0 or 1)

            #10; // Wait for results
            
            // Check against expected value
            if ({Cout, S} !== (A + B + Cin)) begin
                $display("Mismatch at A=%h, B=%h, Cin=%b", A, B, Cin);
                $stop;
            end
        end

        $display("All tests passed!");
        $finish;
    end
endmodule

