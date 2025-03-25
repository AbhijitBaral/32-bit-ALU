`timescale 1ns/1ps
module tb_32bitAddSub;

  reg [31:0] A, B;
  reg D;         // 0 = addition, 1 = subtraction
  reg Cin;       // Carry-in for addition

  wire [31:0] S;
  wire Cout;

  addSub uut (
    .A(A),
    .B(B),
    .D(D),
    .Cin(Cin),
    .S(S),
    .Cout(Cout)
  );

  initial begin
    $dumpfile("addSub_var_dump.vcd");
    $dumpvars(0, tb_32bitAddSub);
  end

  initial begin
    // ------------------------
    // Addition tests (D = 0)
    // ------------------------
    D = 0;
    Cin  = 0;      // Use Cin for addition

    // Test Case 1: 5 + 3 = 8
    A = 32'h00000005; B = 32'h00000003; 
    #10;
    
    // Test Case 2: Edge addition with carry in (e.g., 0xFFFFFFFF + 1)
    A = 32'hFFFFFFFF; B = 32'h00000001;
    Cin = 1; // Example: force a carry-in
    #10;
    
    // ------------------------
    // Subtraction tests (mode = 1)
    // ------------------------
    D = 1;
    Cin = 0;     // Cin not used in subtraction

    // Test Case 3: 5 - 3 = 2
    A = 32'h00000005; B = 32'h00000003;
    #10;
    
    // Test Case 4: Subtraction with negative result (e.g., 1 - 5)
    A = 32'h00000001; B = 32'h00000005;
    #10;
    
    // Test Case 5: Larger numbers
    A = 32'h80000000; B = 32'h00000001;
    #10;
    
    $finish;
  end

endmodule

