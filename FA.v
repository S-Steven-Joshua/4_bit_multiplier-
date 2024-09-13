module fa(A,B,C,sum,carry);
input A,B,C;
output sum,carry;
wire w1,w2,w3;
ha h1(A,B,w1,w2);
ha h2(w1,C,sum,w3);
assign carry=w2|w3; 
endmodule
