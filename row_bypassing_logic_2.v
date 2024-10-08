module fa(a,b,cin,s,cout);
input a, b, cin;
output s, cout;
assign s = a^b^cin;
assign cout = ((a^b)&cin)|(a&b);
endmodule 

module adder_5x5(a,b,y);
input [4:0]a,b;
output [5:0]y;
wire [3:0]ca;
fa a1(a[0],b[0],1'b0,y[0],ca[0]);
fa a2(a[1],b[1],ca[0],y[1],ca[1]);
fa a3(a[2],b[2],ca[1],y[2],ca[2]);
fa a4(a[3],b[3],ca[2],y[3],ca[3]);
fa a5(a[4],b[4],ca[3],y[4],y[5]);
endmodule

module mul_3x3(a,b,y);
input [2:0]a,b;
output [5:0]y;
wire [5:0] w1;
reg [4:0] r [0:2];
integer i;
always @ (*)
begin
for (i=0;i<3;i=i+1)
begin
r[i]=5'b00000;
r[i][i]=a[0]&b[i];
r[i][i+1]=a[1]&b[i];
r[i][i+2]=a[2]&b[i];
end
end
adder_5x5 add1(r[0],r[1],w1);
adder_5x5 add2(w1[4:0],r[2],y);
endmodule

module mul_3x3tb();
reg [2:0]a,b;
wire [5:0]y;
mul_3x3 mul (a,b,y);
initial 
begin
a=3'b111;
b=3'b111;
#50;
end
endmodule
