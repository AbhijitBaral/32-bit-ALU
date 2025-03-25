//Module for implementing Adder Subtractor using 

//D is the mode port that decides the operation
module addSub(input [31:0]A,B, input D, Cin, output wire [31:0]S, output Cout);

//32 bit wire to that connects xor of 32 bit wire B and D
wire [31:0] Bs;
assign Bs = B ^ {32{D}};
wire C;
assign C = Cin | D;

thirtyTwoBitAdder Adder(.A(A), .B(Bs), .Cin(D), .S(S), .Cout(Cout));

endmodule
