//Module for implementing Adder Subtractor using 

//D is the mode port that decides the operation
module addSub(input [31:0]A,B, input D, Cin,Si, output wire [31:0]S, output Cout,V,So);

//32 bit wire to that connects xor of 32 bit wire B and D
wire [31:0] Bs;
assign Bs = B ^ {32{D}};
wire C; 
assign C = Cin | D;
wire cinmsb;

thirtyTwoBitAdder Adder(.A(A), .B(Bs), .Cin(C), .S(S), .Cout(Cout),.CinMSB(cinmsb));

//For detection of overflow in case of signed arithmetic
assign V = cinmsb ^ Cout;

//Indicates the output binary number is signed or unsigned with reference to present
//arithmetic operation and operands
assign So = Si | (D&(~Cout));

endmodule
