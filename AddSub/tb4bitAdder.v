module tb4bitAdder();

reg [3:0] A, B;
reg Cin;
wire [3:0] S;
wire Cout;

fourBitAdder uut(.A(A), .B(B), .Cin(Cin), .S(S), .Cout(Cout));

initial begin
    $dumpfile("adder_var_dump.vcd");
    $dumpvars(0,tb4bitAdder);
end

initial begin
    A=4'd0; B=4'd0; Cin=0;  #10;
    A=4'd0; B=4'd1; Cin=1;  #10;
    A=4'd0; B=4'd2; Cin=0;  #10;
    A=4'd2; B=4'd4; Cin=1;  #10;
    A=4'd3; B=4'd6; Cin=0;  #10;
    A=4'd4; B=4'd7; Cin=1;  #10;
    A=4'd9; B=4'd6; Cin=0;  #10;
    A=4'd15;B=4'd15;Cin=0;  #10;
    A=4'd15;B=4'd15;Cin=1;  #10;

    $finish;
end
endmodule


