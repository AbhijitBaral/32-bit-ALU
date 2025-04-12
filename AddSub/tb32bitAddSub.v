`timescale 1ns/1ps
module tb_32bitAddSub;

  reg [31:0] A, B;
  reg D;         // 0 = addition, 1 = subtraction
  reg Cin;       // Carry-in for addition
  reg Si;        // Operand nature
  wire [31:0] S;
  wire Cout;
  wire So;
  wire V;

  addSub uut (
    .Si(Si),  
    .A(A),
    .B(B),
    .D(D),
    .Cin(Cin),
    .S(S),
    .Cout(Cout),
    .So(So),
    .V(V)
  );

  initial begin
    $dumpfile("var_dump_addSub.vcd");
    $dumpvars(0, tb_32bitAddSub);
  end

  initial begin
   /* // Test for Unsigned Addition
    D = 0; Si=0;
    // Test Case 1: 5 + 3 +1(Cin)= 9
    A = 32'h00000005; B = 32'h00000003; 
    Cin = 1;      
    #10;

    // Test Case 2: 5001 + 3000 = 8001
    A = 32'd5001; B = 32'd3000; 
    Cin = 0;      
    #10;

    //Test case 3: 0 +0 = 0
    Cin=0;
    A=32'd0; B=32'd0;
    #10;

    // Test Case 2: Edge addition (e.g., 0xFFFFFFFF)
    A = 32'd4294967295; B = 32'd4294967295;
    Cin = 0;    
    #10;
    
    // Test Case 3: Edge addition with Cin (e.g., 0xFFFFFFFF +1)
    A = 32'd4294967295; B = 32'd4294967295;
    Cin = 1;    
    #10;


    
    // Test for Unsigned Subtraction
    D = 1; Si=0;
    //Test Case 1: 5 - 1= 4
    A = 32'h00000005; B = 32'h00000003; 
    #10;

    //Test Case 2: 5001 - 3000 = 2001
    A = 32'd5001; B = 32'd3000; 
    #10;

    //Test case 3: 15 - 0= 15
    A=32'd15; B=32'd0;
    #10;

    //Test case 4: 0 - 15= 0xFFFFFF1
    A=32'd0; B=32'd15;
    #10;

    //Test Case 5: High Edge (2^32 - 1)- 0= 0xFFFFFFFF
    A = 32'd4294967295; B = 32'd0;
    #10;    

    //Test Case 6: Low Edge 0 -(2^32 - 1) = 0x00000001
    A = 32'd0; B = 32'd4294967295;
    #10; */
   


   /* 
    // Test for Signed(2's Complement) Addition
    D = 0; Si=1;
    // Test Case 1: 5 + 3 +1(Cin)= 9
    A = 32'h00000005; B = 32'h00000003; 
    Cin = 1;      
    #10;

    // Test Case 2: 5001 + 3000 = 8001(0x00001389 + 0x00000BB8 = 0x00001F41)
    A = 32'h00001389; B = 32'h00000BB8; 
    Cin = 0;
    #10;

    //Test case 3: 5000 + (-2000) = 3000 (0x00001388 + 0xFFFFF830 = 0x00000BB8)
    Cin=0;
    A=32'h00001388; B=32'hFFFFF830;
    #10;

    // Test Case 4: (-5000) + 2000 = -3000 (0xFFFFEC78 + 0x000007D0 = 0xFFFFF448)
    A = 32'hFFFFEC78; B = 32'h000007D0;
    Cin = 0;    
    #10;
    
    // Test Case 5: (-10000) + (-10000)+ 1 = -19999 (0xFFFFD8F0 + 0xFFFFD8F0 +0x00000001= 0xFFFFB1E1)
    A = 32'hFFFFD8F0; B = 32'hFFFFD8F0;
    Cin = 1;    
    #10;

    // Test Case 6: Low edge case: 0 + (-2^31) = -2^31 (0x00000000 + 0x80000000 = 0x80000000) Overflow=0
    Cin = 0;    
    A = 32'h00000000; B = 32'h80000000;
    #10;

    //Test Case 7: Low edge case: -10 + (-2^31) = ? Overflow=1
    Cin = 0;    
    A = 32'hFFFFFFF6; B=32'h80000000;
    #10;

    //Test Case 8: High edge case: 2 + (2^31-3) = 2^31 -1 (0x00000002 + 0x7FFFFFFD = 0x7FFFFFFF)
    Cin = 0;    
    A = 32'h00000002; B=32'h7FFFFFFD;
    #10;

    //Test Case 9: High edge case: 5 + (2^31-1) = 2^31 +4 (0x00000004 + 0x7FFFFFFF = ?) Overflow=1
    Cin = 0;    
    A = 32'h00000004; B = 32'h7FFFFFFF;
    #10;
    $finish;
    */


    // Test for Signed(2's Complement)Subtraction 
    D = 1; Si=1;Cin=0;

    // Test Case 1: 5 - 3 = 2
    A = 32'h00000005; B = 32'h00000003; 
    #10;

    // Test Case 2: 5001 - (-3000) = 8001(0x00001389 - 0xFFFFF448 = 0x00001F41)
    A = 32'h00001389; B = 32'hFFFFF448; 
    #10;

    //Test case 3: 5000 - 2000 = 3000 (0x00001388 - 0x000007D0 = 0x00000BB8)
    A=32'h00001388; B=32'h000007D0;
    #10;

    // Test Case 4: -5000 - 2000 = -7000 (0xFFFFEC78 - 0x000007D0 = 0xFFFFE4A8)
    A = 32'hFFFFEC78; B = 32'h000007D0;
    #10;
    
    // Test Case 5: (-10000) - 10000 =  (0xFFFFD8F0 - 0x00002710 = 0xFFFFB1E0)
    A = 32'hFFFFD8F0; B = 32'h00002710;
    #10;

    // Test Case 6: Low edge case: -1 - (2^31 -1) = -2^31 (0xFFFFFFFF - 0x7FFFFFFF = 0x80000000) Overflow=0
    A = 32'hFFFFFFFF; B = 32'h7FFFFFFF;
    #10;

    //Test Case 7: Low edge case: -2 - (2^31-1) = -2^31 -1(0xFFFFFFFE - 0x7FFFFFFF)  Overflow=1
    A = 32'hFFFFFFFE; B=32'h7FFFFFFF;
    #10;

    //Test Case 8: High edge case: (2^31-3)- (-2) = 2^31 -1(0x7FFFFFFD - 0xFFFFFFFE = 0x7FFFFFFF)
    A = 32'h7FFFFFFD; B=32'hFFFFFFFE;
    #10;

    //Test Case 9: High edge case: (2^31-3)- (-3) = 2^31 (0x7FFFFFFD - 0xFFFFFFFD = 0x7FFFFFFF+1) Overflow=1
    A = 32'h7FFFFFFD; B = 32'hFFFFFFFD;
    #10;
    $finish;
  end

endmodule

