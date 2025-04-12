//Module describing a 32 bit Adder by using 8 4 bit Carry look ahead Adder

module thirtyTwoBitAdder(input [31:0]A,B, input Cin, output wire[31:0]S, output wire Cout,CinMSB);

wire [7:0]carry; //Wires to propagate carries from one 4 bit adder to the other

genvar i;
generate
    for(i=0; i<8; i=i+1)begin: generate_cla
        if (i==0)
            fourBitAdder add(.A(A[3:0]),.B(B[3:0]), .Cin(Cin), .S(S[3:0]), .Cout(carry[0]),.CinMSB());
        else if (i==7)
            fourBitAdder add(.A(A[(i*4+3):(i*4)]), .B(B[(i*4+3):(i*4)]), .Cin(carry[i-1]), .S(S[(i*4+3):(i*4)]), .Cout(Cout),.CinMSB(CinMSB));
        else
            fourBitAdder add(.A(A[(i*4+3):(i*4)]), .B(B[(i*4+3):(i*4)]), .Cin(carry[i-1]), .S(S[(i*4+3):(i*4)]), .Cout(carry[i]),.CinMSB());
    end
endgenerate


endmodule
