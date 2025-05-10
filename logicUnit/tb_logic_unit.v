module tb_logic_unit();

reg [31:0]A,B; 
reg [1:0] sel;

wire [31:0] f;

logic_unit uut(.A(A), .B(B), .sel(sel), .R(f));

initial begin
    $dumpfile("var_dump.vcd");
    $dumpvars(0, tb_logic_unit);
end

initial begin
    A = 32'hFFFFFFFF; B = 32'hFFFFFFFF;
    sel = 2'b00;
    #10;
    sel = 2'b01;
    #10;
    sel = 2'b10;


    #10;
    A = 32'hFFFFFAB; B = 32'hABCFFFAB;
    sel = 2'b00;
    #10;
    sel = 2'b01;
    #10;
    sel = 2'b10;

    #10;
    A = 32'hF3FFFAB; B = 32'hA5CFFFAB;
    sel = 2'b00;
    #10;
    sel = 2'b01;
    #10;
    sel = 2'b10;
    #10;

    $finish;
end
endmodule
    
