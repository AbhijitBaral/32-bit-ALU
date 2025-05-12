module tb_shift_unit();

reg[31:0] b;
reg A,R,L, drxn;
wire [31:0] B;

shift_unit uut(.b(b), .B(B), .A(A), .R(R), .L(L), .drxn(drxn));

initial begin
    $dumpfile("var_dump.vcd");
    $dumpvars(0, tb_shift_unit);
end

initial begin
    b = 32'hFFFFA780;
    A=1; R=0; L=0;
    drxn=1'b1;
    #10;

    drxn=1'b0;
    #10;


    A=0; R=0; L=1;
    drxn=1'b1;
    #10;

    drxn=1'b0;
    #10;


    A=0; R=1; L=0;
    drxn=1'b1;
    #10;

    drxn=1'b0;
    #10;
end
endmodule
