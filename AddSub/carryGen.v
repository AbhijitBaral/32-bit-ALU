// This module generates the carries of 4 bit binary additions simultaneously

module carryGen(input [3:0]G,P, input Cin, output wire [3:0]C, output wire Cout);

assign C[0] = Cin;
assign C[1] = G[0] | (Cin  & P[0]);
assign C[2] = G[1] | G[0]&P[1] | Cin &P[0]&P[1];
assign C[3] = G[2] | G[1]&P[2] | G[0]&P[1]&P[2] | Cin&P[0]&P[1]&P[2];
assign Cout = G[3] | G[2]&P[3] | G[1]&P[2]&P[3] | G[0]&P[1]&P[2]&P[3] | Cin&P[0]&P[1]&P[2]&P[3];

endmodule
