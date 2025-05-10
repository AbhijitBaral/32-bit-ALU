module logic_unit(input [31:0]A, B, input [1:0]sel, output [31:0]R);

wire [31:0] andout;
wire [31:0] orout;
wire [31:0] xorout;
wire [31:0] zero;

assign andout = A & B;
assign orout  = A | B;
assign xorout = A ^ B;
assign zero   = 32'd0;

//For 00->AND, 01->OR, 10->XOR
mux4to1 mux(.P(andout), .Q(orout), .R(xorout), .S(zero), .sel(sel), .y(R));

endmodule



// 4:1 32 bit multiplexer
module mux4to1(input[1:0] sel, input [31:0]P,Q,R,S, output reg [31:0]y);
always @(*)begin
    case(sel)
        2'b00 : y = P;
        2'b01 : y = Q;
        2'b10 : y = R;
        2'b11 : y = S;
    endcase
end
endmodule

