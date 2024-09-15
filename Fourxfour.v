module full_adder(a,b,cin,s,cout);
input a, b, cin;
output s, cout;
assign s = a^b^cin;
assign cout = ((a^b)&cin)|(a&b);
endmodule 

module half_adder(a,b,s,cout);
input a,b;
output s,cout;
assign s = a^b;
assign cout = a&b;
endmodule

module mult_3x3(a, b, p);
input [2:0]a; input [2:0]b;
output [5:0]p;
wire a0b0, a0b1, a0b2, a1b0, a1b1, a1b2, a2b0, a2b1, a2b2;
wire p0,p1,p2,p3,p4,p5;
wire s1,s2,c1,c2,c3,c4,c5;

and a1(p0, a[0], b[0]);
and a2(a0b1, a[0], b[1]);
and a3(a0b2, a[0], b[2]);
and a4(a1b0, a[1], b[0]);
and a5(a1b1, a[1], b[1]);
and a6(a1b2, a[1], b[2]);
and a7(a2b0, a[2], b[0]);
and a8(a2b1, a[2], b[1]);
and a9(a2b2, a[2], b[2]);
and a10(a0b0, a[0],b[0]);

full_adder fa11(a0b1,a1b0,1'b0,p1,c1);
full_adder fa12(a0b2,a1b1,a2b0, s1, c2);
full_adder fa21(s1,c1,1'b0,p2,c3);
full_adder fa22(a1b2,a2b1,c2,s2,c4);
full_adder fa31(c3,s2,1'b0,p3,c5);
full_adder fa32(a2b2,c4,c5,p4,p5);

assign p = {p5,p4,p3,p2,p1,p0};
endmodule

module mult_3x3_tb;
reg[2:0] a; reg[2:0] b;
wire[5:0] p;

mult_3x3 UUT(.a(a),.b(b),.p(p));
initial
begin
a = 3'b101;
b = 3'b110;
$finish;
end
endmodule

module mult_4x4(a,b,p);
input [3:0]a; input [3:0]b;
output [7:0]p;

wire p0,p1,p2,p3,p4,p5,p6,p7;
wire c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11;
wire s1,s2,s3,s4,s5,s6;
wire a0b0,a0b1,a0b2,a0b3,a1b0,a1b1,a1b2,a1b3,a2b0,a2b1,a2b2,a2b3,a3b0,a3b1,a3b2,a3b3;

and a1(a0b0, a[0], b[0]);
and a2(p0, a[0], b[0]);
and a3(a0b1, a[0], b[1]);
and a4(a0b2, a[0], b[2]);
and a5(a0b3, a[0], b[3]);
and a6(a1b0, a[1], b[0]);
and a7(a1b1, a[1], b[1]);
and a8(a1b2, a[1], b[2]);
and a9(a1b3, a[1], b[3]);
and a10(a2b0, a[2], b[0]);
and a11(a2b1, a[2], b[1]);
and a12(a2b2, a[2], b[2]);
and a13(a2b3, a[2], b[3]);
and a14(a3b0, a[3], b[0]);
and a15(a3b1, a[3], b[1]);
and a16(a3b2, a[3], b[2]);
and a17(a3b3, a[3], b[3]);

half_adder ha1(a1b0,a0b1,p1,c1);
full_adder fa1(a1b1,a2b0,c1,s1,c2);
full_adder fa2(a2b1,a3b0,c2,s2,c3);
half_adder ha2(a3b1,c3,s3,c4);
half_adder ha3(a0b2,s1,p2,c5);
full_adder fa3(s2,a1b2,c5,s4,c6);
full_adder fa4(c6,a2b2,s3,s5,c7);
full_adder fa5(c7,a3b2,c4,s6,c8);
half_adder ha4(a0b3,s4,p3,c9);
full_adder fa6(c9,s5,a1b3,p4,c10);
full_adder fa7(s6,c10,a2b3,p5,c11);
full_adder fa8(a3b3,c8,c11,p6,p7);

assign p = {p7,p6,p5,p4,p3,p2,p1,p0};

endmodule

module mult_4x4_tb;
reg[3:0] a; reg[3:0] b;
wire[7:0] p;

mult_4x4 UUT(.a(a),.b(b),.p(p));
initial
begin
a=4'b1010;
b=4'b1100;
$finish;
end
endmodule
