// single bit 2 : 1 Multiplexer
module mux2to1(
    input sel,
    input [1:0]I,
    output reg F);

always @(*)begin
    case(sel)
        1'b0: F = I[0];
        1'b1: F = I[1];
    endcase
end
endmodule
