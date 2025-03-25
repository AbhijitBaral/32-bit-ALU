module tb32bitAdder();

reg [31:0]A,B;
reg Cin;

wire [31:0]S;
wire Cout;

thirtyTwoBitAdder uut (.A(A), .B(B), .Cin(Cin), .S(S), .Cout(Cout));

initial begin
$dumpfile("adder_var_dump.vcd");
$dumpvars(0, tb32bitAdder);
end

initial begin
    A=32'd0; B=32'd0; Cin=0; #10;
    A=32'd2; B=32'd5; Cin=1; #10;
    A=32'd15; B=32'd45; Cin=0; #10;
    A=32'd20; B=32'd13; Cin=1; #10;
    A=32'd6; B=32'd17; Cin=0; #10;
    A=32'd44; B=32'd99; Cin=0; #10;
    A=32'd500; B=32'd16335; Cin=0; #10;
    A=32'd40000; B=32'd429496; Cin=0; #10;
    A=32'd42949672; B=32'd5; Cin=1; #10;
    A=32'd46331; B=32'd30004; Cin=0; #10;
    A=32'd86113; B=32'd0; Cin=653; #10;
    A=32'd4294967295; B=32'd4294967295; Cin=0; #10;

    $finish;
end
endmodule
