module shift_unit(
    input [31:0] b,   //32 bit input operand
    input A, R, L,    //shift operation controls (Arithmetic, Rotate and Logical)
    input drxn,       // shift/rotate directions 0->Left, 1-> Right
    output [31:0] B); //output operand

wire m32I1, //Input to I1 of 32nd mux for right shift/rotate
    m0I0;   //Input to I0 of 1st mux for left shift/rotate

assign m32I1 = ~L&((R&~A&b[0]) | (A&~R&b[31]));
assign m0I0 = b[31]&R;

genvar i;
generate
    for(i=0; i<32; i = i+1)begin: gen_block
        if(i == 0)
            mux2to1 mux(.sel(drxn), .I({b[1],m0I0}), .F(B[0]));
        else if(i ==31)
            mux2to1 mux(.sel(drxn), .I({m32I1, b[30]}), .F(B[31]));
        else
            mux2to1 mux(.sel(drxn), .I({b[i+1],b[i-1]}), .F(B[i]));
    end
endgenerate
endmodule
