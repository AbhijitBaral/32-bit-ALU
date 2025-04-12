//This module describes the 4 bit adder carry look ahead adder

module fourBitAdder(input [3:0]A,B, input Cin, output [3:0]S, output Cout,CinMSB);
wire [3:0] G,P,C;

carryGen carryGen(.G(G), .P(P), .Cin(Cin), .C(C), .Cout(Cout));

assign G[3:0]=A[3:0] & B[3:0];
assign P[3:0]=A[3:0] ^ B[3:0];

assign S[3:0]=P[3:0] ^ C[3:0];

//Exposing the Carry into MSB for access in the Adder Subtractor module
//This is necessary to identify Overflow in Signed arithmetic
assign CinMSB = C[3];

endmodule
