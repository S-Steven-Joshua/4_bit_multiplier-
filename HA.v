module ha(A,B,sum,carry);
input A,B;
output sum,carry;
assign sum=A^B;
assign carry=A&B;
endmodule
